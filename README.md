# 📊 Marketing Analytics Business Case — ProGear Hub

An end-to-end marketing analytics project analyzing customer engagement, conversion rates, and social media performance for **ProGear Hub**, an online sports equipment retail business. Built using **Power BI**, **SQL Server**, and **Python**.

---

## 🧩 Business Problem

ProGear Hub is facing reduced customer engagement and declining conversion rates despite launching several new online marketing campaigns. They needed a detailed analysis to identify areas for improvement across their marketing strategies.

**Key challenges:**
- Reduced customer interactions and engagement with site and marketing content
- Fewer site visitors converting into paying customers
- Significant marketing spend not yielding expected returns
- Lack of structured analysis of customer feedback

---

## 🎯 Goals

| Goal | Description |
|------|-------------|
| **Increase Conversion Rates** | Identify factors impacting conversion and highlight drop-off stages in the funnel |
| **Enhance Customer Engagement** | Determine which content types drive the highest engagement |
| **Improve Customer Feedback Scores** | Understand common themes in reviews and provide actionable insights |

---

## 📐 Key Performance Indicators (KPIs)

- **Conversion Rate** — Percentage of website visitors who make a purchase
- **Customer Engagement Rate** — Level of interaction with marketing content (clicks, likes, comments)
- **Average Order Value (AOV)** — Average amount spent per transaction
- **Customer Feedback Score** — Average rating from customer reviews

---

## 📊 Dashboards

The Power BI report consists of four pages:

### 1. Overview
High-level summary across all three analysis areas:
- Overall conversion rate: **9.6%**
- Total social media views: **9,079,276** | Clicks: **1,785,010** | Likes: **414,122**
- Average customer rating: **3.69**
- Trend lines by month and breakdown by product

### 2. Conversion Details
- Overall conversion rate for 2024: **8.5%**
- Customer journey funnel: View → Click (97%) → Drop-off (82%) → Purchase (45%)
- Monthly conversion trends and per-product conversion rates
- Top converting products: **Ski Boots (20.7%)**, **Kayak (17.9%)**, **Surfboard (13.9%)**

### 3. Social Media Details
- Total views: **2,982,369** | Clicks: **458,345** | Likes: **73,618**
- Monthly trends for clicks, likes, and views
- Content type performance: Blog, Social Media, Video
- Top products by views: **Ice Skates**, **Cycling Helmet**, **Basketball**

### 4. Customer Review Details
- Average rating: **3.67**
- Sentiment breakdown: Positive (275), Negative (82), Mixed Positive (60), Mixed Negative (21), Neutral (8)
- Review trends by month and sentiment
- Detailed review table with CustomerID, ReviewText, and SentimentCategory

---

## 🛠️ Tools & Technologies

| Tool | Usage |
|------|-------|
| **Power BI** | Interactive dashboards and data visualization |
| **SQL Server** | Data extraction and transformation |
| **Python** | Data cleaning, sentiment analysis, and preprocessing |

---

## ![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white) Python — Sentiment Analysis

Customer reviews were processed using **VADER (Valence Aware Dictionary and sEntiment Reasoner)** from the `nltk` library to classify sentiment at scale.

### Libraries Used
```
pandas, nltk, pyodbc, sqlalchemy
```

### How It Works

1. **Data Extraction** — Reviews are pulled directly from the SQL Server database (`fact_customer_reviews` table) using `pyodbc`
2. **Sentiment Scoring** — Each review's text is scored using VADER's `compound` score (range: -1 to +1)
3. **Sentiment Categorization** — Scores are combined with the star rating to assign a category:

| Sentiment Score | Rating | Category       |
|-----------------|--------|----------------|
| > 0.05          | ≥ 4    | Positive       |
| > 0.05          | = 3    | Mixed Positive |
| > 0.05          | ≤ 2    | Mixed Negative |
| < -0.05         | ≤ 2    | Negative       |
| < -0.05         | = 3    | Mixed Negative |
| < -0.05         | ≥ 4    | Mixed Positive |
| Neutral         | ≥ 4    | Positive       |
| Neutral         | ≤ 2    | Negative       |
| Neutral         | = 3    | Neutral        |

4. **Sentiment Bucketing** — Scores are also grouped into ranges (`0.5 to 1.0`, `0.0 to 0.49`, `-0.49 to 0.0`, `-1.0 to -0.5`) for aggregation in Power BI
5. **Output** — Enriched data saved to `fact_customer_reviews_with_sentiment.csv` and loaded into Power BI

---

## 📁 Project Structure

```
marketing-analytics-business-case/
│
├── data/                   # Raw and processed datasets
├── sql/                    # SQL queries for data extraction
├── python/                 # Python scripts for data processing & NLP
│   └── sentiment_analysis.py
├── powerbi/                # Power BI report file (.pbix)
├── presentation/           # Business case slides (.pptx)
└── README.md
```

---

## 🔍 Key Insights

- **Conversion funnel has a significant drop-off** — 82% of visitors drop off before purchasing, suggesting UX or pricing friction
- **Social media views are declining** month-over-month through H2 2024, indicating campaign fatigue
- **Customer sentiment skews positive** but a notable share of negative/mixed reviews points to product instruction and value-for-money concerns
- **Ski Boots and Kayak** are standout performers in conversion; **Ice Skates and Cycling Helmet** lead in social media engagement

---

## 👤 Author

**Anusha Jaganath Poojary**  
Data Analyst | Power BI • SQL • Python
