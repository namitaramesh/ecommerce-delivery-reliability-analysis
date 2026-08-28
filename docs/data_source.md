# Data source

- **Source:** Kaggle
- **Dataset:** Brazilian E-Commerce Public Dataset by Olist
- **Dataset page:** https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
- **Records:** Approximately 100,000 anonymised e-commerce orders
- **Time period:** 2016 to 2018
- **Format:** Nine related CSV files
- **Downloaded on:** 2026-08-27

## Tables used

The dataset includes orders, order items, customers, sellers, products, payments,
reviews, geolocation information, and a product-category translation table.

## Data handling

The original downloaded CSV files are stored locally in `data/raw` and are
excluded from this GitHub repository. Processed analysis tables created during
the project will be saved in `data/processed`.

## Project limitation

This project uses historical, anonymised data from one Brazilian e-commerce
marketplace. Findings describe patterns in this dataset and should not be
generalised to every e-commerce company or country.