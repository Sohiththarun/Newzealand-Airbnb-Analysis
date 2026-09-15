DATA201/422 Data Wrangling Project.

New Zealand Airbnb Analysis:

Project Overview

The New Zealand Airbnb Analysis project explores Airbnb listing data from across New Zealand to uncover meaningful trends in the short-term rental market. Using R and modern data analysis libraries, this project demonstrates the complete data analytics workflow—from data cleaning and preprocessing to exploratory data analysis (EDA), visualization, and insight generation.

The analysis focuses on understanding how factors such as location, room type, pricing, availability, host characteristics, and customer reviews influence Airbnb listings. Through interactive visualizations and statistical summaries, the project provides valuable insights that can help hosts optimize pricing strategies, assist travelers in making informed booking decisions, and support data-driven business decisions.

Objectives

- Clean and preprocess raw Airbnb listing data.
- Perform exploratory data analysis (EDA).
- Analyze pricing patterns across different regions.
- Compare room types and accommodation availability.
- Study host activity and customer review trends.
- Create informative visualizations to communicate insights.
- Generate actionable recommendations based on the findings.


Technologies Used

- R
- RStudio

Key Analyses

- Distribution of Airbnb listing prices
- Room type popularity
- Regional comparison of Airbnb listings
- Availability throughout the year
- Host activity and listing counts
- Review score analysis
- Correlation between price and other listing features
- Data visualization using charts and graphs

### Meaning of key columns:

| Column                           | Meaning                                                                                               |
| -------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `id`                             | A unique identifier assigned to each Airbnb listing.                                                  |
| `host_id`                        | A unique identifier assigned to the host of the listing.                                              |
| `host_name`                      | The name of the Airbnb host.                                                                          |
| `neighbourhood_group`            | The larger administrative region or grouping in which the property is located.                        |
| `neighbourhood`                  | The suburb, city, or local area in which the property is located.                                     |
| `latitude`                       | The property's latitude coordinate, used to identify its north-south position on the Earth's surface. |
| `longitude`                      | The property's longitude coordinate, used to identify its east-west position on the Earth's surface.  |
| `room_type`                      | The type of accommodation offered.                                                                    |
| `price`                          | The advertised nightly rental price of the listing.                                                   |
| `minimum_nights`                 | The minimum number of nights a guest must book to stay at the property.                               |
| `number_of_reviews`              | The total number of reviews the listing has received from guests.                                     |
| `last_review`                    | The date on which the listing most recently received a guest review.                                  |
| `reviews_per_month`              | The average number of reviews the listing receives each month.                                        |
| `calculated_host_listings_count` | The number of listings the host has in the current dataset.                                           |
| `availability_365`               | The number of days the property is available for booking over the next 365 days.                      |
| `number_of_reviews_ltm`          | The number of reviews the listing has received in the last 12 months.                                 |
| `license`                        | The property's registration or licence number.                                                        |



# Deliverable 4
## Tenancy Services Rental Bond Data

The rental bond dataset was obtained from Tenancy Services and is the **Detailed quarterly report, 2020–2026**. The dataset contains information about rental bonds, dwelling characteristics and rental-price statistics.

| Column                      | Meaning                                                                                                                                                    |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **TimeFrame**               | The quarter/time period represented by the rental bond data. The value identifies the starting date of the relevant quarterly period.                      |
| **Location Id**             | A numerical identifier representing the geographic area associated with the rental bond record. The detailed dataset uses geographic location identifiers. |
| **Dwelling Type**           | The type/category of dwelling associated with the rental bond record. `ALL` represents all dwelling types combined.                                        |
| **Number Of Beds**          | The number of bedrooms/beds associated with the dwelling. `ALL` represents all bedroom categories combined.                                                |
| **Total Bonds**             | The total number of rental bonds recorded for the relevant location, dwelling type, bedroom category and timeframe.                                        |
| **Active Bonds**            | The number of rental bonds that were active for the relevant location, dwelling type, bedroom category and timeframe.                                      |
| **Closed Bonds**            | The number of rental bonds that were closed for the relevant location, dwelling type, bedroom category and timeframe.                                      |
| **Median Rent**             | The median weekly rent. This is the middle rental value when the relevant rental values are ordered from lowest to highest.                                |
| **Geometric Mean Rent**     | The geometric mean of weekly rent values for the relevant group.                                                                                           |
| **Upper Quartile Rent**     | The upper quartile of weekly rent. It represents the rent value below which approximately 75% of the relevant rental observations fall.                    |
| **Lower Quartile Rent**     | The lower quartile of weekly rent. It represents the rent value below which approximately 25% of the relevant rental observations fall.                    |
| **Log Std Dev Weekly Rent** | The logarithmic standard deviation of weekly rent, describing the dispersion/variation of weekly rental values on the log scale.                           |

