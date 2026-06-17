# Business Logic & Metric Definitions

## 💰 Revenue Operations & Financial Rules

### 1. Monthly Average Revenue Per User (ARPU)

* **Business Concept:** Measures the average monthly monetization efficiency per paying customer.
* **Strict Data Formula:** To ensure temporal accuracy and avoid mixing historical periods, the metric is computed at the monthly grain (`financial_month`).

```text
ARPU = SUM(mrr) / COUNT(DISTINCT user_id)
Note: Calculated only for users where MRR > 0 within the active month.

2. Active Customers Definition
Data Rule: An "Active Customer" is strictly defined as a unique user generating a Monthly Recurring Revenue strictly greater than zero (MRR > 0) during the analyzed financial_month.

SQL Logic Equivalent:
COUNT(DISTINCT CASE WHEN mrr > 0 THEN user_id END)

3. Revenue Segmentation & Guardrails
Geographic Breakdown: Total MRR is aggregated by user_country to isolate driving markets (Canada, USA, India, UK).

Subscription Tiering: Revenue splits are strictly mapped against the current active plan (Basic vs Pro).

⚠️ Data Quality & Audit Observations
Zero-Revenue Anomalies: During initial profiling, records were identified with missing or zero-value revenue fields for historically signed users.

Pipeline Enforcement: Instead of assuming these are free trials (not supported by the current raw schema), the dbt staging layer isolates these anomalies to ensure the final Power BI dashboard only reflects active, paying financial cohorts.
