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


## Meaning of Key Airbnb Columns

| Column                           | Meaning 
|----------------------------------|------------------------------------------------------------------------------|
| `id`                             | A unique identifier assigned to each Airbnb listing. |
| `host_id`                        | A unique identifier assigned to the host of the listing. |
| `host_name`                      | The name of the Airbnb host. |
| `neighbourhood_group`            | A larger geographical or administrative grouping associated with the listing. |
| `neighbourhood`                  | The suburb, city, or local area in which the property is located. |
| `latitude`                       | The latitude coordinate of the property. |
| `longitude`                      | The longitude coordinate of the property. |
| `room_type`                      | The type of accommodation offered by the listing. |
| `price`                          | The advertised nightly rental price of the listing. |
| `minimum_nights`                 | The minimum number of nights a guest must book to stay at the property. |
| `number_of_reviews`              | The total number of reviews received by the listing. |
| `last_review`                    | The date on which the listing most recently received a guest review. |
| `reviews_per_month`              | The average number of reviews received by the listing per month. |
| `calculated_host_listings_count` | The number of listings associated with the host. |
| `availability_365`               | The number of days the property is available for booking over the next 365 days. |
| `number_of_reviews_ltm`          | The number of reviews received by the listing during the last 12 months. |
| `license`                        | The property's registration or licence number, where provided. |


## Tenancy Services Rental Bond Dataset

### Source

The tenancy dataset was obtained from **Tenancy Services**, which provides rental bond data for New Zealand. The data comes from the Tenancy Services bond database and records new private-sector rental bonds lodged with Tenancy Services.

The dataset used in this project is the **Detailed Quarterly Tenancy Report, January 2020 to April 2026**.

Source: [Tenancy Services Rental Bond Data](https://www.tenancy.govt.nz/about-tenancy-services/data-and-statistics/rental-bond-data/)

The data is organised by tenancy start date and uses the **SA2-2019 geographic area definitions** from Statistics New Zealand. Privacy protections are applied through rounding and suppression of small counts. Recent data may be provisional and may be revised as more bond information is recorded.

### Dataset Columns

| Column                    | Meaning 
|---------------------------|------------------------------------------------------------------------------------------------------|
| `TimeFrame`               | The quarter or time period in which the tenancy began. |
| `Location Id`             | The geographic area identifier for the location of the tenancy. |
| `Dwelling Type`           | The type of rental property, such as a house, apartment, flat, or room. |
| `Number Of Beds`          | The number of bedrooms in the rental property. |
| `Total Bonds`             | The total number of rental bonds recorded for the selected time period and location. |
| `Active Bonds`            | The number of bonds that were still active for the selected time period and location. |
| `Closed Bonds`            | The number of bonds that had been closed for the selected time period and location. |
| `Median Rent`             | The median weekly rent. Half of the recorded rents are below this value and half are above it. |
| `Geometric Mean Rent`     | The geometric mean weekly rent, calculated from the recorded rental values. |
| `Upper Quartile Rent`     | The 75th percentile of weekly rent. Approximately 25% of recorded rents are higher than this value. |
| `Lower Quartile Rent`     | The 25th percentile of weekly rent. Approximately 25% of recorded rents are lower than this value. |
| `Log Std Dev Weekly Rent` | The standard deviation of the logarithm of weekly rent, showing the spread or variation of rental prices. |

### Important Data Limitations

The dataset represents private rental bonds lodged with Tenancy Services and does not represent every rental property in New Zealand.

The rent values relate to newly acquired rentals where bonds were lodged.

The data may contain rounding or suppressed values to protect privacy. Recent figures may be provisional or subject to revision as additional bond information is recorded and processed.

Therefore, comparisons between recent and older periods should be made carefully, particularly where recent data may be incomplete or provisional.







