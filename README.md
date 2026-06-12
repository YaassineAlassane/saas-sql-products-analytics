# SaaS Revenue Operations & Product Analytics Pipeline

*End-to-End Analytics Engineering Project using Google BigQuery, dbt Core, and Modern Data Modeling Practices*

---

## Overview

This project demonstrates how raw SaaS application data can be transformed into reliable business metrics through a modern Analytics Engineering workflow.

The objective is to provide a trusted reporting layer for Revenue Operations, Customer Success, and Product teams by transforming operational application data into analytics-ready models.

The project follows a complete transformation lifecycle:

```text
Raw Application Data
        ↓
Staging Models
        ↓
Intermediate Business Logic
        ↓
Analytics Marts
        ↓
BI & Business Reporting
```

The implementation leverages Google BigQuery and dbt Core to deliver a scalable, tested, and documented analytics platform.

---

## Business Problems Addressed

### Revenue Analytics

The project enables stakeholders to answer questions such as:

* How is Monthly Recurring Revenue (MRR) evolving over time?
* What is the Average Revenue Per User (ARPU)?
* Which countries generate the most revenue?
* How many active subscriptions exist each month?
* How does revenue change across different customer segments?

### Customer Success Analytics

The project identifies engagement risks by answering:

* Which users show signs of low activity?
* How much recurring revenue is exposed to churn risk?
* Which customer segments require proactive intervention?
* What percentage of the customer base is considered at-risk?

### Product Analytics

The project supports product usage analysis through:

* User engagement monitoring
* Feature adoption tracking
* Activity-based customer segmentation
* Correlation analysis between engagement and revenue

---

## Analytics Engineering Journey

The repository illustrates the evolution from exploratory SQL analysis to a production-style dbt architecture.

### Phase 1 — Exploratory Analysis

Initial business audits were performed through standalone SQL queries to understand:

* User acquisition patterns
* Geographic distribution
* Subscription activity
* Revenue composition
* Product engagement behavior

Location:

```text
/scripts/01_exploration/
```

---

### Phase 2 — Business Logic Prototyping

Business metrics were consolidated into analytical prototype tables.

Examples:

* User engagement metrics
* Revenue attribution
* Churn-risk segmentation
* Customer activity scoring

Location:

```text
/scripts/02_business_metrics/
```

A prototype fact table was built to consolidate user activity and revenue information, allowing early validation of business assumptions before industrialization.

---

### Phase 3 — dbt Industrialization

Business logic was migrated into a layered dbt architecture designed for maintainability, testing, documentation, and scalability.

```text
models/
│
├── staging/
│   ├── stg_users.sql
│   └── stg_subscriptions.sql
│
├── intermediate/
│   └── int_subscription_users.sql
│
└── marts/
    ├── dim_month.sql
    └── fct_mrr.sql
```

This transition introduced:

* Centralized business logic
* Reusable transformations
* Automated testing
* Version-controlled development
* Data lineage documentation

---

## Data Architecture

```text
              ┌───────────────────┐
              │   STAGING LAYER   │
              └─────────┬─────────┘
                        │
                        ▼
              ┌───────────────────┐
              │ INTERMEDIATE LAYER│
              └─────────┬─────────┘
                        │
                        ▼
              ┌───────────────────┐
              │    MARTS LAYER    │
              └───────────────────┘
```

### Staging Layer

Purpose:

* Standardize raw source data
* Rename technical fields
* Apply type casting
* Clean source inconsistencies
* Create consistent naming conventions

Models:

* `stg_users`
* `stg_subscriptions`

---

### Intermediate Layer

Purpose:

* Apply business rules
* Create reusable transformation logic
* Join operational entities
* Prepare analytical datasets

Model:

* `int_subscription_users`

This model combines:

* User demographic information
* Subscription lifecycle data
* Revenue attributes

It serves as the foundation for downstream marts.

---

### Marts Layer

Purpose:

* Deliver analytics-ready tables
* Expose trusted business metrics
* Provide stable reporting grains

#### dim_month

Centralized calendar dimension used for all time-series analysis.

Characteristics:

* Historical anchor date
* Future forecasting horizon
* Independent from transactional tables
* Reusable across analytical domains

#### fct_mrr

Core financial fact table.

**Grain**

```text
One Row = One User × One Month
```

Key metrics include:

* Monthly Recurring Revenue (MRR)
* Active subscriptions
* Revenue history
* Customer-level monthly revenue

This model powers revenue reporting and serves as the primary source for SaaS financial analytics.

---

## Business Questions Answered

### Revenue Analytics

* What is the monthly MRR trend?
* What is the overall ARPU?
* Which countries contribute the most revenue?
* How many paying customers are active each month?

### Customer Success Analytics

* Which customers are considered low-engagement?
* What revenue is currently exposed to churn risk?
* Which user segments require proactive follow-up?

### Product Analytics

* How active are users across the platform?
* Which engagement levels correlate with higher revenue?
* How can users be segmented according to activity patterns?

---

## Technology Stack

| Component                | Technology      |
| ------------------------ | --------------- |
| Data Warehouse           | Google BigQuery |
| Transformation Framework | dbt Core        |
| Package Management       | dbt_utils       |
| Version Control          | Git             |
| Repository Hosting       | GitHub          |

---

## Data Quality Framework

Reliable analytics require reliable data.

The project implements automated validation through dbt tests.

### Source Validation

Ensures source-level integrity through:

* `unique`
* `not_null`

---

### Referential Integrity

Relationship tests protect joins and prevent orphan records across transformation layers.

Examples:

* Users must exist before subscriptions can be linked
* Revenue records must map to valid customers

---

### Grain Protection

The financial mart operates at the following analytical grain:

```text
User × Month
```

To prevent duplicate revenue records, composite key validation is enforced using:

```yaml
dbt_utils.unique_combination_of_columns
```

Validated columns:

* `user_id`
* `financial_month`

This guarantees that each customer appears only once per reporting month.

---

## Running the Project

### Install Dependencies

```bash
dbt deps
```

### Build All Models

```bash
dbt run
```

### Execute Tests

```bash
dbt test
```

### Build Selected Models

```bash
dbt run --select dim_month fct_mrr
```

### Run Selected Tests

```bash
dbt test --select dim_month fct_mrr
```

---

## Documentation & Lineage

dbt documentation is fully integrated into the project using model descriptions, schema metadata, and markdown documentation blocks.

Generate documentation:

```bash
dbt docs generate
```

Serve documentation locally:

```bash
dbt docs serve
```

The documentation portal provides:

* Data dictionaries
* Model descriptions
* Column definitions
* Dependency mapping
* End-to-end lineage visualization

---

## Example Analytical Outputs

The project enables the generation of insights such as:

* Revenue trends over time
* ARPU monitoring
* Revenue by country
* Customer engagement segmentation
* Identification of low-activity users
* Revenue exposure associated with engagement risk

These outputs support both operational and strategic decision-making.

---

## Future Enhancements

Planned improvements include:

### Analytics

* Cohort analysis
* Retention analytics
* Churn measurement
* Customer Lifetime Value (LTV)

### Analytics Engineering

* Incremental model materializations
* Subscription history snapshots
* Enhanced test coverage
* Data freshness monitoring

### Reporting

* Power BI dashboard layer
* Executive revenue dashboards
* Customer Success monitoring dashboards
* Product engagement dashboards

### Platform Engineering

* GitHub Actions CI/CD pipeline
* Automated dbt run and test execution
* Pull Request validation workflow

---

## Key Skills Demonstrated

* Analytics Engineering
* dbt Core
* Google BigQuery
* Advanced SQL
* Dimensional Modeling
* SaaS Metrics (MRR, ARPU, Churn Risk)
* Data Quality Testing
* Git & Version Control
* Documentation & Data Lineage
* Business-Oriented Data Modeling

---

## Repository Structure

```text
project/
│
├── scripts/
│   ├── 01_exploration/
│   └── 02_business_metrics/
│
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
│
├── tests/
├── macros/
├── seeds/
├── snapshots/
└── analyses/
```

---

## Conclusion

This project demonstrates the transition from exploratory SQL analysis to a structured Analytics Engineering workflow.

By combining BigQuery, dbt Core, testing, documentation, and dimensional modeling practices, the repository showcases how operational SaaS data can be transformed into a reliable and scalable analytics platform capable of supporting Revenue Operations, Customer Success, and Product decision-making.
