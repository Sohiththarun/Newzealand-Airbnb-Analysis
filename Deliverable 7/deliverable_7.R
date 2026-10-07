# DATA 201/422 - Deliverable 7
# Automated Airbnb data-wrangling pipeline
#
# Run the whole pipeline with one function call:
#     run_pipeline()
#
# Or from the project root:
#     Rscript "Deliverable 7/run_deliverable7.R"

library(tidyverse)
library(lubridate)

# ------------------------------------------------------------
# Helper: identify the month represented by a raw Airbnb file
# ------------------------------------------------------------
get_month_label <- function(path) {
  file_name <- basename(path)

  # New July/August files: listings_YYYYMMDD.csv
  date_match <- stringr::str_match(file_name, "listings_(\\d{8})\\.csv$")
  if (!is.na(date_match[1, 2])) {
    snapshot_date <- as.Date(date_match[1, 2], format = "%Y%m%d")
    return(format(snapshot_date, "%B %Y"))
  }

  # Existing files: October_2025.csv, June 2026.csv, etc.
  cleaned_name <- tools::file_path_sans_ext(file_name)
  cleaned_name <- stringr::str_replace_all(cleaned_name, "_", " ")
  parsed <- suppressWarnings(lubridate::parse_date_time(
    cleaned_name,
    orders = c("B Y", "b Y"),
    quiet = TRUE
  ))

  if (is.na(parsed)) {
    stop("Could not identify month/year from file: ", file_name)
  }

  format(as.Date(parsed), "%B %Y")
}

# ------------------------------------------------------------
# Main pipeline
# ------------------------------------------------------------
run_pipeline <- function() {

  project_root <- normalizePath(getwd())

  old_raw_dir <- file.path(
    project_root,
    "Deliverable 4",
    "Data",
    "Raw"
  )

  new_raw_dir <- file.path(
    project_root,
    "Deliverable 7",
    "Data",
    "Raw"
  )

  output_dir <- file.path(
    project_root,
    "Deliverable 7",
    "Output"
  )

  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

  # The original project already contains October 2025-June 2026.
  # Deliverable 7 adds the two new monthly files here.
  old_files <- list.files(
    old_raw_dir,
    pattern = "\\.csv$",
    full.names = TRUE
  )

  new_files <- list.files(
    new_raw_dir,
    pattern = "\\.csv$",
    full.names = TRUE
  )

  files <- c(old_files, new_files)

  if (length(files) == 0) {
    stop("No Airbnb CSV files were found.")
  }

  message("Files found: ", length(files))

  # Identify all snapshot months before cleaning.
  detected_months <- purrr::map_chr(files, get_month_label)

  # Read, filter to Christchurch, and add month/year.
  christchurch_all <- purrr::map_dfr(files, function(file) {

    month_label <- get_month_label(file)

    readr::read_csv(
      file,
      show_col_types = FALSE
    ) %>%
      filter(neighbourhood_group == "Christchurch City") %>%
      mutate(
        month_year = month_label,
        last_review = as.Date(last_review)
      )
  })

  # ----------------------------------------------------------
  # Preserve the cleaning rules used in Deliverable 4:
  # - price is required
  # - prices above $10,000 are treated as extreme data errors
  # - minimum_nights is required
  # - license is dropped because it was entirely missing
  # - latitude/longitude are retained
  # ----------------------------------------------------------
  cleaned <- christchurch_all %>%
    filter(
      !is.na(price),
      price <= 10000,
      !is.na(minimum_nights)
    ) %>%
    select(-any_of("license"))

  # Create an ordered month variable for analysis.
  month_levels <- c(
    "October 2025",
    "November 2025",
    "December 2025",
    "January 2026",
    "February 2026",
    "March 2026",
    "April 2026",
    "May 2026",
    "June 2026",
    "July 2026",
    "August 2026"
  )

  cleaned <- cleaned %>%
    mutate(
      month_year = factor(
        month_year,
        levels = month_levels,
        ordered = TRUE
      ),

      # Use the first day of the snapshot month for consistency
      # with the previous Deliverable 3 analysis.
      month_year_date = as.Date(
        paste0(as.character(month_year), " 01"),
        format = "%B %Y %d"
      ),

      days_since_latest_review =
        as.numeric(month_year_date - last_review)
    )

  # ----------------------------------------------------------
  # Validation / sanity checks
  # ----------------------------------------------------------
  month_check <- cleaned %>%
    count(month_year, .drop = FALSE)

  print(month_check)

  expected_months <- c(
    "October 2025", "November 2025", "December 2025",
    "January 2026", "February 2026", "March 2026",
    "April 2026", "May 2026", "June 2026",
    "July 2026", "August 2026"
  )

  if (!all(expected_months %in% detected_months)) {
    warning(
      "One or more expected months are missing from the raw input files."
    )
  }

  if (any(is.na(cleaned$latitude)) || any(is.na(cleaned$longitude))) {
    warning("Some latitude/longitude values are missing.")
  }

  # ----------------------------------------------------------
  # Updated analysis 1: average Airbnb price by month
  # ----------------------------------------------------------
  monthly_price <- cleaned %>%
    group_by(month_year, .drop = FALSE) %>%
    summarise(
      average_price = mean(price, na.rm = TRUE),
      median_price = median(price, na.rm = TRUE),
      number_of_listings = n(),
      .groups = "drop"
    )

  write_csv(
    monthly_price,
    file.path(output_dir, "monthly_price_summary.csv")
  )

  price_plot <- ggplot(
    monthly_price,
    aes(x = month_year, y = average_price, group = 1)
  ) +
    geom_line() +
    geom_point() +
    labs(
      x = "Month",
      y = "Average Price (NZD)",
      title = "Average Airbnb Price in Christchurch: October 2025-August 2026"
    ) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1)
    )

  ggsave(
    file.path(output_dir, "average_price_by_month.png"),
    price_plot,
    width = 10,
    height = 6,
    dpi = 300
  )

  # ----------------------------------------------------------
  # Updated analysis 2: price distribution
  # ----------------------------------------------------------
  price_plot_distribution <- cleaned %>%
    filter(price <= 1000) %>%
    ggplot(aes(x = price)) +
    geom_histogram(bins = 30) +
    labs(
      x = "Price (NZD)",
      y = "Frequency",
      title = "Christchurch Airbnb Price Distribution (Prices <= $1000)"
    ) +
    theme_minimal()

  ggsave(
    file.path(output_dir, "christchurch_price_distribution.png"),
    price_plot_distribution,
    width = 9,
    height = 6,
    dpi = 300
  )

  # ----------------------------------------------------------
  # Updated analysis 3: days since latest review
  # ----------------------------------------------------------
  review_plot <- cleaned %>%
    filter(
      !is.na(days_since_latest_review),
      days_since_latest_review >= 0,
      days_since_latest_review <= 1000
    ) %>%
    ggplot(aes(x = days_since_latest_review)) +
    geom_histogram(bins = 50) +
    labs(
      x = "Days Since Latest Review",
      y = "Number of Listings",
      title = "Days Since Latest Review: Christchurch Airbnb Listings"
    ) +
    theme_minimal()

  ggsave(
    file.path(output_dir, "days_since_latest_review.png"),
    review_plot,
    width = 9,
    height = 6,
    dpi = 300
  )

  # ----------------------------------------------------------
  # Updated summary tables
  # ----------------------------------------------------------
  numeric_summary <- cleaned %>%
    select(where(is.numeric)) %>%
    summarise(
      across(
        everything(),
        list(
          count = ~ sum(!is.na(.)),
          mean = ~ mean(., na.rm = TRUE),
          sd = ~ sd(., na.rm = TRUE),
          min = ~ min(., na.rm = TRUE),
          median = ~ median(., na.rm = TRUE),
          max = ~ max(., na.rm = TRUE)
        )
      )
    )

  missing_summary <- tibble(
    column = names(cleaned),
    missing_count = purrr::map_int(
      cleaned,
      ~ sum(is.na(.))
    ),
    missing_percentage = purrr::map_dbl(
      cleaned,
      ~ round(mean(is.na(.)) * 100, 2)
    )
  )

  write_csv(
    numeric_summary,
    file.path(output_dir, "numeric_summary.csv")
  )

  write_csv(
    missing_summary,
    file.path(output_dir, "missing_summary.csv")
  )

  # Save the complete cleaned dataset.
  write_csv(
    cleaned,
    file.path(
      output_dir,
      "Christchurch_listings_Oct2025_Aug2026_clean.csv"
    )
  )

  message("")
  message("Deliverable 7 pipeline completed successfully.")
  message("Output folder: ", output_dir)
  message("Raw snapshot months detected: ", length(unique(detected_months)))
  message("Months with usable cleaned price data: ", sum(monthly_price$number_of_listings > 0))
  message("Final cleaned rows: ", nrow(cleaned))

  invisible(cleaned)
}
