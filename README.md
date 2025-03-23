# Digital Wallet Usage Analysis

### Table of Contents

- [Project Overview](#project-overview)
- [Data Set](#data-set)
- [Key Features in Dataset](#key-features-in-dataset)
- [Project Goals and Key Insights](#project-goals-and-key-insights)
- [Tools and Technologies](#tools-and-technologies)
- [Data Analysis and Visualizations](#data-analysis-and-visulizations)
- [Key Findings and Next Steps](#key-findings-and-next-steps)
- [License](#license)

### Project Overview
This project explores 5,000+ digital wallet transactions to uncover insights into payment success rates, seasonal spending trends, and product category behaviors. 
The analysis was performed using PostgreSQL for data querying and transformation, and Tableau for visualization and storytelling.

### Dataset
Source: Kaggle

Description: This dataset contains synthetic financial transactions from a digital wallet platform, capturing transaction details like payment methods, product categories, transaction statuses, and more.

### Key Features in the Dataset:
- transaction_id - Unique identifier for each transaction

- user_id - Unique identifier for each user

- transaction_date - Date and time of the transaction

- product_category - Category of the product or service

- product_amount - Transaction amount

- payment_method - Method used for payment

- transaction_status - Status (Successful, Failed, Pending)

- device_type - Type of device used for the transaction

- location - Broad location category
 
### Project Goals & Key Insights
- Investigating Payment Success Rates:

Analyzed the relationship between payment methods and transaction success rates.

Found that certain payment methods fail more frequently than others.

- Exploring Seasonal Trends in Digital Wallet Usage:

Discovered a consistent drop in transactions every August (2023 & 2024) across all factors.

Analyzed user behavior and possible external factors.

- Analyzing Spending Patterns Across Product Categories:

Identified high-spending and low-spending product categories.

Compared transaction volumes and amounts across categories.

### Tools & Technologies Used
PostgreSQL – Used for data storage, querying, and transformation.

Tableau – Created interactive dashboards for data visualization.


### Data Analysis & Visualizations
- Optimized Queries in PostgreSQL

Created views and indexes to reduce query time from 121s to 81s (33% improvement).

- Tableau Dashboards

Built interactive dashboards showing transaction trends, seasonal variations, and success rates.

Designed a pie chart for transaction status distribution and a trend line chart for payment methods over time.

### Key Findings & Next Steps
- August consistently experiences a drop in transactions—fewer users transact during this month.
- Certain payment methods have higher failure rates—requiring further investigation.
- Spending behavior varies across categories—some categories are more seasonal than others.

 #### Next Steps:

- Compare findings with real-world industry data.

- Investigate user behavior & retention strategies.

- Explore fraud detection using transaction patterns.

### License
This project is for educational purposes only. The dataset is publicly available on Kaggle.
