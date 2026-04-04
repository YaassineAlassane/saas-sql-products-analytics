# Business Logic & Insights

## 📣 Marketing Logic
### User Acquisition Audit (March 2026)
- **Total Unique Users**: 100.
- **Primary Markets**: Canada (29), USA (25), UK (23).
- **Insight**: English-speaking markets dominate the initial installed base (77% of total).
## 💰 Finance Logic
### Financial Health Audit (March 2026)
- **Total Revenue**: 1490.
- **Global ARPU**: 14.9.
- **Metric Definition**: ARPU is calculated as  to ensure per-user accuracy.
- **Audit Observation**: The average revenue (4.9) is lower than the minimum plan price (0), indicating the presence of non-paying or churned users in the raw dataset.


## 💰 Finance Logic
### Financial Health Audit (March 2026)
- **Total Revenue**: 1490.
- **Global ARPU**: 14.9.
- **Metric Definition**: ARPU is calculated as `SUM(revenue) / COUNT(DISTINCT user_id)` to ensure per-user accuracy.
- **Audit Observation**: The average revenue ($14.9) is lower than the minimum plan price ($20), indicating the presence of non-paying or churned users in the raw dataset.

## 🖱️ Engagement Logic
### User Activity Audit (March 2026)
- **Total Events**: 1000 (approx).
- **Most Used Feature**: feature_B.
- **Least Used Feature**: feature_A.
- **Observation**: User logins account for ~25% of activity, which is standard for a healthy daily usage pattern.


## Product & Retention Logic (April 2026)
### "Quasi-Ghost" Accounts Audit

- **Engagement Threshold**:
    - Definition of a "Quasi-Ghost": Any user with `total_events < 6`.
    - Rationale: Initial audits showed no accounts with zero activity. The primary risk lies with paying users who rarely interact with the product.

- **Fact Table: fct_user_engagement**
    - Source of truth aggregating activity by `user_id`.
    - Key Columns: `nb_login`, `nb_feature`, `total_events`.
    - Time Tracking: `first_active_date` and `last_active_date`.



