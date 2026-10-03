# Customer Support Quality Analysis - Set B
**Student:** Devanshi Kanthariya | **Student ID:** 8409 | **Assigned set:** Set B
Red & White Skill Education - Final Practical Exam, Data Analysis

## Business objective
Which support team should improve resolution performance, and how does service quality vary by channel?
1. Which team has the highest SLA breach rate?
2. Which channels breach the SLA most often?

## Data
- `data/raw/tickets.csv`: 13 rows including 1 duplicate (12 unique)
- `data/raw/teams.csv`: 4 rows

| Column | Type | Meaning |
|---|---|---|
| ticket_id | integer | Ticket number |
| month | text | Jan, Feb or Mar |
| team_id | text | Key linking to teams |
| channel | text | Email, Chat or Phone |
| resolution_hours | number | Hours taken to resolve |
| satisfaction | number | Customer rating 1-5 |
| team, department | text | Team name and its department |

## Cleaning and definitions
- The exact duplicate (ticket 12) was removed in every tool, leaving 12 rows.
- `breach_flag = 1` when resolution_hours > 24, otherwise 0. Exactly 24 hours meets the SLA.
- SLA breach rate = breached tickets / all tickets, shown as a percentage.

## Tools and versions
- Excel work done in Google Sheets (Excel activation failed on my laptop) and exported to .xlsx
- Power BI Desktop: **FILL version**
- SQL: MySQL **FILL version** (from `mysql --version`)
- Python **FILL version** with pandas and matplotlib

## Folder structure
```
data/raw/        tickets.csv, teams.csv
excel/           analysis.xlsx
sql/             setup.sql, queries.sql
python/          analysis.ipynb
powerbi/         dashboard.pbix
outputs/         clean_data.csv, python_summary.csv, python_chart.png, powerbi_dashboard.png
```

## How to run
**SQL:** open MySQL from the repo root, run `source sql/setup.sql` first, then `source sql/queries.sql`.

**Python:** `pip install pandas matplotlib`, then open `python/analysis.ipynb` and choose Restart & Run All. The first cell moves to the repo root so paths work.

**Excel sheets:** Raw (13 original rows), Lookup (4 teams), Clean (12 rows, XLOOKUP department, breach_flag), Summary (COUNTIFS table, PivotTable, chart).

**Power BI refresh:** the data source path was **FILL your full path to data\raw**. After cloning, go to Home → Transform data → Data source settings → Change Source, and point to your own `data/raw` folder. Then click Refresh.

## Findings
1. The Technical department has a 50.00% breach rate (3 of 6 tickets), higher than Service at 33.33% (2 of 6).
2. AppSupport and BillingHelp tie for the highest team breach rate: 66.67% each (2 of 3 tickets). Chat has the most breached tickets (3), then Phone (2).

**Recommendation:** focus improvement on AppSupport and BillingHelp, and review Chat handling first, since it has the most breaches.

**Limitation:** only 12 tickets, so each team has 3, and one ticket changes a rate by 33 points.

## Cross-tool reconciliation
Overall SLA breach: **5 breached out of 12 tickets = 41.67%**
- Excel: COUNTIFS results add up to 5 (Chat 3 + Phone 2 + Email 0)
- SQL: S2c channel counts add up to 5 (Chat 3 + Phone 2)
- Python: `breach_flag.sum()` = 5
- Power BI: SLA Breach Rate card shows 41.67%

No rounding differences.

Excel Google Sheets backup link: **FILL link**

## Video
URL:(https://drive.google.com/file/d/1TloOEiEN5AgvWs6VVAQ2uf86CusGr6i9/view?usp=sharing)
