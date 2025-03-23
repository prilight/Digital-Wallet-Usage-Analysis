-- ============================================
-- Digital Wallet Usage Analysis using PostgreSQL
-- Author: Joshua Precious
-- Date: [11-03-2025]
/* Description: 
   This script sets up a PostgreSQL database for analyzing 
   digital wallet transactions, including data ingestion, 
   exploratory analysis, and key insights.*/
-- ============================================

Create a table for the transactions dataset
CREATE TABLE digital_wallet_transactions (
    idx SERIAL PRIMARY KEY,  -- Unique index for each transaction
    transaction_id UUID NOT NULL,  -- Unique transaction ID
    user_id VARCHAR(50) NOT NULL,  -- Unique identifier for each user
    transaction_date TIMESTAMP NOT NULL,  -- Date and time of the transaction
    product_category VARCHAR(100),  -- Category of the purchased item
    product_name VARCHAR(255),  -- Specific product name
    merchant_name VARCHAR(255),  -- Merchant or service provider name
    product_amount DECIMAL(10,2),  -- Amount spent in local currency
    transaction_fee DECIMAL(10,2),  -- Fee for processing the transaction
    cashback DECIMAL(10,2),  -- Cashback received for this transaction
    loyalty_points INT,  -- Loyalty points earned
    payment_method VARCHAR(50),  -- Payment method used
    transaction_status VARCHAR(50),  -- Transaction status (Success, Failed, Pending)
    merchant_id VARCHAR(50),  -- Unique identifier for merchants
    device_type VARCHAR(50),  -- Device type used for transaction
    location VARCHAR(100)  -- General location of transaction
);

-- Loading data from CSV into PostgreSQL
copy digital_transaction
from 'C:\Program Files\PostgreSQL\17\Projects\digital_wallet_transactions\digital_transactions.csv' delimiter ',' csv header;

-- Verify that the data has been loaded correctly
SELECT * FROM digital_wallet_transactions LIMIT 10;

-- ============================================
-- Exploratory Data Analysis (EDA)
-- ============================================

-- Counting total transactions
SELECT COUNT(*) AS total_transactions FROM digital_wallet_transactions;

-- Counting transactions by status (Successful, Failed, Pending)
SELECT 
    transaction_status, 
    COUNT(*) AS transaction_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM digital_wallet_transactions), 2) AS percentage
FROM digital_wallet_transactions
GROUP BY transaction_status;

-- Query to analyze Payment Method vs. Success Rate
SELECT 
    payment_method, 
    COUNT(transaction_id) AS total_transactions,
    SUM(CASE WHEN transaction_status = 'Successful' THEN 1 ELSE 0 END) AS successful_transactions,
    ROUND( (SUM(CASE WHEN transaction_status = 'Successful' THEN 1 ELSE 0 END) * 100.0) / COUNT(transaction_id), 2 ) AS success_rate
FROM digital_wallet_transactions
GROUP BY payment_method
ORDER BY success_rate DESC;

-- Query to Find the top 5 product categories by revenue
SELECT 
    product_category, 
    SUM(product_amount) AS total_revenue,
    COUNT(transaction_id) AS transaction_count
FROM digital_wallet_transactions
GROUP BY product_category
ORDER BY total_revenue DESC
LIMIT 5;

-- Query to Find the Monthly Transaction Trends
SELECT DATE_TRUNC('month', TO_TIMESTAMP(transaction_date, 'YYYY-MM-DD HH24:MI:SS')) AS transaction_month, 
       COUNT(*) AS total_transactions,
       SUM(product_amount) AS total_spent
FROM digital_transaction
GROUP BY transaction_month
ORDER BY transaction_month desc;

-- ============================================
-- Creating Views for Repeated Analysis
-- ============================================

-- View: Payment Method Success Rates
CREATE VIEW success_rate_per_payment AS
SELECT 
    payment_method, 
    COUNT(transaction_id) AS total_transactions,
    SUM(CASE WHEN transaction_status = 'Successful' THEN 1 ELSE 0 END) AS successful_transactions,
    ROUND( (SUM(CASE WHEN transaction_status = 'Successful' THEN 1 ELSE 0 END) * 100.0) / COUNT(transaction_id), 2 ) AS success_rate
FROM digital_wallet_transactions
GROUP BY payment_method;

-- Now, this view can be checked anytime by uncommenting and running the code below:
-- SELECT * FROM success_rate_per_payment;

-- ============================================
-- Performance Optimization
-- ============================================

-- Adding an index on transaction_status to speed up queries
CREATE INDEX idx_transaction_status ON digital_wallet_transactions(transaction_status);

-- Adding an index on payment_method for better filtering
CREATE INDEX idx_payment_method ON digital_wallet_transactions(payment_method);

-- ============================================
-- THE END
-- ============================================