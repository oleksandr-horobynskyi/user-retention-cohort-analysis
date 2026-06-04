# User Retention Rate & Cohort Analysis

## Project Overview
Full-cycle data analysis project measuring user retention rates and evaluating acquisition quality using cohort analysis methodology. Compares performance of Promo vs Organic user segments.

**Status:** Completed ✅ | **Period:** Dec 2025 – Jan 2026

## Key Objectives
- Analyze user behavior patterns to identify retention trends
- Compare Promo vs Organic user performance
- Evaluate acquisition quality by channel
- Provide actionable recommendations for improving customer engagement strategies

## Key Findings

### 📊 Cohort Performance Summary
| Cohort Month | Month 0 | Month 1 | Month 2 | Month 3 | Month 4 | Month 5 |
|--------------|---------|---------|---------|---------|---------|---------|
| 01.01.2025 | 100% | 76% | 68% | 53% | 47% | 40% |
| 01.02.2025 | 100% | 67% | 63% | 60% | 49% | - |
| 01.03.2025 | 100% | 72% | 74% | 63% | - | - |
| 01.04.2025 | 100% | 70% | 58% | - | - | - |
| 01.05.2025 | 100% | 70% | - | - | - | - |
| 01.06.2025 | 100% | - | - | - | - | - |

### 🎯 Retention Insights

#### Channel Comparison: Promo vs Organic
- **Promo Users (0 flag):** Show higher immediate engagement but steeper drop-off
  - Month 0-1 drop: 24% retention loss
  - Month 1-2: Further decline to 68%
  - Long-term retention stabilizes around 40-47%

- **Organic Users (1 flag):** More stable retention patterns
  - Month 0-1: 76% retention (better than Promo)
  - Slower decline trajectory
  - Better long-term engagement signals

#### Key Drop-off Points
- **Biggest drop:** Month 0 → Month 1 (9-24% loss)
  - Critical period for user engagement
  - Onboarding friction likely culprit
  
- **Secondary stabilization:** After Month 3
  - Users remaining past Month 3 show more stable patterns
  - Possible indicator of "engaged core"

### 💡 Recommendations

#### Urgent (High Priority)
1. **Optimize Promo user onboarding**
   - 24% drop in Month 1 is concerning
   - Implement better first-week engagement campaigns
   - A/B test onboarding flow with Promo users

2. **Investigate Month 0-1 churn drivers**
   - Survey churned users about experience
   - Analyze feature adoption in Week 1
   - Reduce friction in signup → activation path

#### High Priority
3. **Leverage Organic channel insights**
   - Promo channels are effective for acquisition
   - Organic channels show better retention quality
   - Balance acquisition strategy to include more organic growth

4. **Create Month 3+ retention programs**
   - Users surviving to Month 3 are "sticky"
   - Design loyalty/engagement programs for established user base
   - Focus retention efforts on pre-Month-3 period

#### Medium Priority
5. **Optimize promo-channel messaging**
   - Promo users effective for short-term growth
   - Refine expectations to reduce Month 1 churn
   - Consider different onboarding for Promo vs Organic

## Technical Implementation

### Data Sources
- **Raw Data:** User signup dates, activity tracking, channel attribution
- **Date Range:** January 2025 – June 2025
- **Cohorts:** Monthly cohorts based on signup date
- **Channels:** Promo (paid ads) vs Organic (direct/unpaid)

### Methodology

#### Cohort Analysis Approach
1. **Cohort Definition:** Group users by signup month
2. **Month Offset:** Track users from Month 0 (signup) through Month 5
3. **Retention Calculation:** (Active users in Month N) / (Total users in cohort)
4. **Segmentation:** Separate analysis by acquisition channel (Promo=0, Organic=1)

#### Tools Used
- **Google Sheets** — Data aggregation and Pivot Tables
- **SQL** — Data extraction and cohort calculation (CTEs, Window Functions)
- **Tableau** — Interactive dashboard visualization
- **PostgreSQL** — Source database

### Data Processing Steps
```sql
-- 1. Extract user signup dates and channel attribution
-- 2. Calculate month offset from signup
-- 3. Identify active users each month
-- 4. Calculate retention ratios
-- 5. Segment by promo_signup_flag (0=Promo, 1=Organic)
-- 6. Build cohort table with retention %
```

## Visualizations

### Tableau Dashboard Components
1. **Cohort Retention Heatmap**
   - X-axis: Month offset (0-5)
   - Y-axis: Cohort month
   - Color intensity: Retention percentage
   - Separate views for Promo vs Organic

2. **Retention Trend Lines**
   - Overlaid retention curves by cohort
   - Promo vs Organic comparison
   - Identifies stabilization points

3. **Acquisition Quality Scorecard**
   - Month 1 retention by channel
   - Month 3 retention by channel
   - Average lifetime retention

4. **Channel Performance Comparison**
   - Side-by-side Promo vs Organic metrics
   - Month-by-month comparison
   - Statistical significance indicators

## Key Metrics Tracked

### Primary Metrics
- **Retention Rate:** % of users active in Month N
- **Month 1 Retention:** Early engagement indicator
- **Month 3 Retention:** Indicator of product-market fit
- **Cohort Lifetime Retention:** Long-term engagement

### Secondary Metrics
- **Drop-off Rate:** % users lost month-to-month
- **Stabilization Point:** Month where retention plateaus
- **Channel Attribution:** Promo vs Organic performance
- **Cohort Quality Score:** Overall acquisition quality

## Business Impact

### Acquisition Quality Insights
- **Promo Channel:** Quick acquisition, higher churn, lower LTV
- **Organic Channel:** Slower growth, better retention, higher LTV
- **Implication:** Balance portfolio to include more organic growth

### Engagement Strategy Implications
- Critical period: Month 0-1
- Need for improved onboarding
- Sticky user base exists after Month 3
- Channel-specific engagement strategies required

## Next Steps

1. **Implement Month 1 engagement campaign**
   - Focus on Promo user activation
   - Reduce onboarding friction
   - Measure impact on next cohort

2. **Deep dive into churned users**
   - Survey analysis
   - Feature adoption tracking
   - Competitive substitute analysis

3. **Organic growth optimization**
   - Expand organic channel investments
   - Leverage lower churn characteristics
   - Build referral program

4. **Continuous monitoring**
   - Monthly cohort updates
   - Tracking Month 1 improvements
   - Channel performance dashboards

## Tech Stack
- **SQL** — PostgreSQL, CTEs, Window Functions, date calculations
- **Data Processing** — Google Sheets, Pivot Tables
- **Visualization** — Tableau Public
- **Analysis** — Cohort analysis methodology, retention metrics

## Author
Oleksandr Horobynskyi — Data Analyst  
LinkedIn: [linkedin.com/in/oleksandr-horobynskyi  ](https://www.linkedin.com/in/oleksandr-horobynskyi/)
GitHub: [github.com/oleksandr-horobinskyi](https://github.com/oleksandr-horobynskyi)
