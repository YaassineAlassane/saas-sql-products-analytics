
# SaaS Product Analytics - SQL Case Study

## 🎯 Business Context
This project focuses on analyzing customer behavior and financial performance for a B2B SaaS platform. As an Analytics Engineer, I transformed raw application data into a structured Analytics Layer to provide actionable insights for Marketing, Sales, and Finance teams.

## 🚀 Objectives
- Master SQL for complex business logic in Google BigQuery.
- Identify Churn Risk: Segment users based on engagement levels ("Quasi-Ghosts").
- Documentation: Establish a professional Data Dictionary and Business Logic repository.
- Version Control: Follow industry-standard Git Flow (Feature Branching & Pull Requests).

## 🛠 Tech Stack
- **Data Warehouse:** Google BigQuery  
- **Language:** SQL (Standard SQL)  
- **Version Control:** Git & GitHub (Squash & Merge workflow)  

## 📂 Project Structure
- `/scripts`: SQL models including the `fct_user_engagement` table.  
- `/docs`:  
  - `business_logic.md`: Definition of the 6-event engagement threshold.  
  - `data_dictionary.md`: Technical metadata and schema definitions for the `analytics_layer` dataset.  

## 📊 Key Insights & Business Impact
- **12% of users** are identified as "Quasi-Ghosts" (fewer than 6 total interactions), representing a segment with low product adoption and high churn risk.  
- **$250 of MRR** is at risk, corresponding to this low-engagement segment and highlighting a measurable revenue exposure.  
- **Behavioral insight:** Early engagement is a strong leading indicator of retention; users with fewer than 6 interactions are significantly more likely to churn.  
- **Operational output:** A prioritized list of at-risk users was generated for the Customer Success team to launch targeted re-engagement campaigns, aiming to reduce churn and recover potential revenue.  

## 📣 Business Logic & Insights

### Marketing Logic
**User Acquisition Audit (March 2026)**  
- Total Unique Users: 100  
- Primary Markets: Canada (29), USA (25), UK (23)  
- Insight: English-speaking markets dominate the initial installed base (77% of total).

### Finance Logic
**Financial Health Audit (March 2026)**  
- Total Revenue: $1,490  
- Global ARPU: $14.9 per user  
- Metric Definition: ARPU is calculated as `SUM(revenue) / COUNT(DISTINCT user_id)` to ensure per-user accuracy.  
- Business interpretation: ARPU being lower than the minimum plan price ($20) highlights a mix of non-paying or churned users, emphasizing the importance of engagement-based retention strategies.

### Engagement & Product Logic
**User Activity Audit (March 2026)**  
- Total Events: ~1,000  
- Most Used Feature: feature_B  
- Least Used Feature: feature_A  
- Observation: User logins account for ~25% of activity, which is standard for a healthy daily usage pattern.

**"Quasi-Ghost" Accounts Audit (April 2026)**  
- **Definition:** Any user with `total_events < 6`.  
- **Business rationale:** Users with minimal activity are at high risk of churn, representing a potential threat to recurring revenue and overall product health.  
- **Fact Table:** `fct_user_engagement` consolidates user activity and revenue, serving as a single source of truth for engagement-driven insights.  
- **Key Columns:** `nb_login`, `nb_feature`, `total_events`, `revenue`, `first_active_date`, `last_active_date`.  
- **Time Tracking:** Tracks first and last user activity to identify engagement patterns and inform reactivation strategies.  

## 📈 Business Impact & Recommendations
- **Quasi-Ghost segment** represents 12% of the user base and $250 of MRR at risk.  
- **Early engagement (<6 events)** is strongly predictive of churn; prioritizing onboarding and reactivation campaigns for this segment can improve retention and revenue.  
- **Recommended actions:**  
  1. Implement guided onboarding to ensure new users reach 6+ interactions in the first week.  
  2. Trigger automated re-engagement emails for users with low activity in the first 7 days.  
  3. Focus Customer Success outreach on high-risk segments to reduce churn and recover potential revenue.
