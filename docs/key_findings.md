# Key Findings: E-commerce Delivery Reliability Analysis

## Scope

This analysis uses delivered orders from the Olist Brazilian e-commerce dataset.
An order is classified as late when its recorded customer-delivery timestamp is
after its estimated delivery date.

The analysis includes 96,470 delivered orders with a recorded customer-delivery
date.

## Overall delivery reliability

- 7,826 delivered orders were late, a late-delivery rate of **8.1%**.
- Median delivery time was **10.22 days**.
- The median order arrived **11.95 days before** its estimated delivery date.

## Geographic delivery risk

Late-delivery rates varied across customer states. To avoid overinterpreting
very small samples, the state comparison focused on states with at least 1,000
delivered orders.

- Ceará (CE) had the highest late-delivery rate among these states: **15.3%**.
- Bahia (BA) and Rio de Janeiro (RJ) followed at **14.0%** and **13.5%**.
- São Paulo (SP), the largest customer-state sample, had a late-delivery rate
  of **5.9%**.

These differences describe the dataset and do not establish why a state had a
higher or lower delivery risk.

## Order value and product categories

Late-delivery risk increased gradually across order-value bands:

- Lowest-value quarter of orders: **7.2%** late.
- Highest-value quarter of orders: **9.0%** late.

Product-category comparisons also showed variation. Electronics, baby products,
and office furniture were among the categories with relatively high
late-delivery rates in the filtered category analysis. Category results are
descriptive because product mix, destination, seller location, and other
factors may differ across categories.

## Timing patterns

Delivery risk changed over time. Among months with at least 1,000 delivered
orders, late-delivery rates peaked at:

- **14.3%** in November 2017;
- **16.0%** in February 2018;
- **21.4%** in March 2018.

These spikes may reflect changes in operational conditions, demand, or other
unobserved factors. The analysis does not identify a causal explanation.

## Customer reviews

Customer satisfaction was strongly associated with delivery reliability.

- On-time or early orders had an average review score of **4.29 out of 5**.
- Late orders had an average review score of **2.57 out of 5**.
- **54.0%** of late orders received a low review score (1 or 2), compared with
  **9.2%** of on-time or early orders.
- For orders arriving eight or more days late, the average score fell to
  **1.73 out of 5**, and **78.3%** received a low score.

These patterns show association, not proof that delivery timing alone caused
review outcomes.

## Seller-customer geography

For single-seller orders, cross-state deliveries were slower and more likely
to arrive late than same-state deliveries.

- Same-state orders: **6.1%** late; median delivery time **6.59 days**.
- Different-state orders: **9.4%** late; median delivery time **12.84 days**.

State geography is only a broad proxy for logistics complexity; it is not an
exact measure of shipping distance.

## Limitations

- The dataset records a historical sample of Brazilian e-commerce activity,
  not every e-commerce transaction.
- The analysis uses estimated delivery dates as the benchmark for lateness.
- Associations should not be interpreted as causal effects.
- Customer review scores can reflect product quality, support, expectations,
  and other factors in addition to delivery experience.
- Seller-customer state comparisons exclude multi-seller orders because a
  single seller location cannot be assigned meaningfully to those orders.