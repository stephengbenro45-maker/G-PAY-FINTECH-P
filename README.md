 🏦 GPay Nigeria — Fintech Transaction Analytics Project

> *Disclaimer:** GPay Nigeria is a fictional fintech company created purely for portfolio and analytical demonstration purposes. The dataset, business problems and insights are designed to reflect real-world Nigerian fintech scenarios.

-----

 📌 Project Overview

This is a complete end-to-end data analytics project where I played the role of a **Data Analyst at GPay Nigeria** — a fast-growing fictional fintech company processing millions in transactions across 10 Nigerian cities.

The goal was simple — turn raw transaction data into decisions that a real fintech board could act on.

The full analyst workflow:

```
Business Problem → Data Generation → SQL Analysis → Power BI Visualization → Business Insights
```

-----

# 🗂️ Dataset

Synthetic dataset generated in Python with realistic Nigerian fintech patterns.

|Table         |Records|Description                            |
|--------------|-------|---------------------------------------|
|users_s       |3,000  |User profiles across 10 Nigerian cities|
|transactions_s|15,000 |Transaction records for FY 2024        |
|fraud_flags   |15,000 |Fraud status for every transaction     |

*Cities covered:*
Lagos · Abuja · Kano · Ibadan · Port Harcourt · Enugu · Kaduna · Benin City · Owerri · Uyo

**Transaction Types:**
Transfer · Airtime · Bills · POS · Withdrawal · Deposit

**Merchant Categories:**
Telecom · Retail · Food · Transport · Utilities · Entertainment · Finance · Health · Education · Real Estate

-----

# ❓ Business Problems Solved

# 💰 Problem 1 — Revenue & Volume Intelligence

> “Before we finalize the 2026 budget I need to understand how 2024 actually went. Month by month. Where were we strong? Where did we fall off?”

#🚨 Problem 2 — Fraud Intelligence

> “Fraud is happening on this platform and it’s costing us real money. Show me the damage in naira and tell me exactly where it’s coming from.”

# 👤 Problem 3 — User Behaviour & Segmentation

> “Who are our power users? Who is barely active? Does device type affect how much people spend?”

# 📉 Problem 4 — Churn Risk

> “How many users signed up and never came back? Which signup months produced the most ghost users?”

# 🏪 Problem 5 — Merchant Category Performance

> “Which merchant categories should we invest in for 2026? I need volume, revenue and fraud rate before we make any decisions.”

-----

# 💻 SQL Analysis

**23 queries** written in MySQL across 5 difficulty levels covering aggregations, JOINs, CTEs, subqueries, window functions and CASE WHEN logic.

Full SQL file available in the repository.

-----

 📊 Power BI Dashboard

3-page interactive dashboard built on an emerald green and black theme designed to reflect fintech excellence.

# Page 1 — Revenue & Volume Intelligence

- Total Revenue · Total Transactions · Active Users · Avg Transaction Value
- Monthly Revenue Trend 2024
- Revenue by City
- Transactions by Type
- Revenue by Merchant Category
- Users by Device Type

# Page 2 — Fraud Intelligence

- Total Fraud Cases · Total Fraud Loss · Fraud Rate % · Highest Risk City
- Fraud Rate by Merchant Category
- Fraud by City
- Monthly Fraud Trend
- Fraud by Transaction Type
- Fraud vs Clean Split
- High Risk User Segments

# Page 3 — User & Merchant Performance

- Total Active Users · Inactive Users · One-Time Users · Top Merchant Category
- Top 10 Users by Total Spend
- Churn Risk by Signup Month
- Merchant Category Scorecard
- Avg Spend by City

-----

 🔍 Key Findings

# Revenue & Volume

- **October** was the strongest month — highest revenue and highest transaction count in FY 2024
- **March** came in second — an unexplained spike worth investigating and replicating
- **Uyo** topped all 10 cities in total revenue AND active users — outperforming Lagos and Abuja completely
- **Lagos** is severely underperforming relative to its population size — the data exposes a massive untapped opportunity
- **Entertainment** leads all merchant categories by both revenue and transaction volume
- **Benin City** quietly leads average spend per transaction — an underinvested market hiding in plain sight

 Fraud Intelligence

- GPay lost **₦526,487,168** to fraud in FY 2024
- **1,074 transactions** were fraudulent — a 7.16% overall fraud rate
- **Transport** carries the highest merchant fraud rate at 7.93%  fraudsters deliberately hiding in small frequent payments
- **Uyo** leads fraud cases  the best revenue city is simultaneously the highest risk city
- **POS transactions** have the highest fraud rate by transaction type at 7.62%
- High risk users with 100% fraud rates were identified across multiple cities including Enugu, Owerri and Abuja

 User Behaviour & Churn

- **2,993 out of 3,000** users are active exceptional activation rate showing strong onboarding
- **105 users** made exactly one transaction and never returned  recoverable revenue sitting idle
- **September** signup cohort produced the most inactive users  a specific campaign failed to attract the right audience
- **USR02983 from Uyo* is the top spender  ₦7,490,303 in total transactions alone
- Top 10 users are responsible for a disproportionate share of GPay’s total revenue

 Merchant Performance

- **Entertainment** leads in transactions and revenue GPay’s users spend most here
- **Education** comes second — suggesting a younger, educated and digitally active user base
- Average transaction size is remarkably consistent across categories between ₦492K and ₦505K
- Every merchant category processed over 1,500 transactions  no dead categories in the portfolio

-----

 📋 Business Decisions Recommended

|Decision                                                    |Reasoning                                                                              |
|------------------------------------------------------------|-------------------------------------------------------------------------
Double down on Uyo immediately                              |Leads every revenue metric — protect, expand and reward loyalty                       
Launch aggressive Lagos activation strategy                 |Massive population, underperforming spend — single biggest growth opportunity in 2026  |
Invest in Benin City infrastructure                         |Highest average spend per transaction, completely underinvested relative to performance|
Invest in Owerri — emerging market                          |Third highest fraud count but also strong revenue signals worth developing             |
Introduce OTP for transport transactions in Uyo above ₦5,000|Highest fraud rate category in highest risk city — protect the best market             |
Add mandatory fraud checks for all POS transactions         |7.62% fraud rate is unacceptable for the most common payment type                      |
Investigate and block high risk users with 100% fraud rates |Multiple users identified across Enugu, Owerri and Abuja — immediate action required   |
Build a Q4 marketing calendar                               |October peak is predictable — run biggest campaigns in September to maximize it        |
Investigate the March revenue spike                         |Something drove unusual activity — identify it and engineer it to happen again         |
Re-engage the 105 one-time users with cashback incentives   |Reactivating existing users costs a fraction of acquiring new ones                     |
|Eliminate September acquisition campaigns entirely          |Data proves they consistently attract users who never transact — wasted budget         |
|Partner aggressively with entertainment merchants           |Highest revenue and transaction category — meet users where they actually spend        |
Negotiate exclusive education merchant partnerships         |Second highest category with a loyal, high-value demographic worth locking in          |
|Build a VIP retention program for top 10 spenders           |USR02983 alone moved ₦7.49M — losing one VIP costs more than losing 50 regular users   |
|Prioritize Web and Android product experience               |Dominant device types — any friction on these platforms directly costs revenue         |
|Replicate Uyo’s success model in Kano and Kaduna            |Northern cities are underperforming — apply Uyo strategy to unlock new markets         |

 🛠️ Tools Used

|Tool            |Purpose                                   |
|----------------|------------------------------------------|
|MySQL           |SQL analysis — 23 queries                 |
|MySQL Workbench |Query environment                         |
|Power BI Desktop|Dashboard and visualization               |
|DAX             |Calculated measures and columns           |
|LinkedIn        |Public documentation of analytical journey|



🔍 Key Skills Demonstrated

- Data generation and preparation
- Relational database querying — SQL joins, aggregations, CTEs, window functions
- Business problem framing and analytical thinking
- DAX measure creation in Power BI
- Dashboard design and data storytelling
- Translating data insights into actionable business decisions
- Nigerian fintech domain knowledge



 👤 Author

**Stephen**
Aspiring Data Analyst · Nigerian Fintech Enthusiast

Connect on LinkedIn → linkedin.com/in/gbenro-stephen-adeola

-----

⭐ If this project gave you value leave a star and follow for more
