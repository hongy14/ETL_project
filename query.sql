-- Create tables for raw data to be loaded into
CREATE TABLE final_hc_company ("Ticker symbol" varchar primary key,
							   "Security" varchar,
							   "GICS Sector" varchar);

CREATE TABLE financials_final ("Ticker symbol" varchar primary key, "Period Ending" date,
							   "Net Cash Flow" float, "Total Assets" float, 
							   "Total Equity" float, "Total Liabilities" float,
							   "Total Revenue" float, "Earnings Per Share" float);

CREATE TABLE avg_prices_2016 ("Ticker symbol" varchar primary key, "Avg_prices_2016" float);

CREATE TABLE avg_prices_2019 ("Ticker symbol" varchar primary key, "Avg_prices_2019" float);

-- Query tables to check if properly uploaded
SELECT * FROM final_hc_company;

SELECT * FROM financials_final;

SELECT * FROM avg_prices_2016;

SELECT * FROM avg_prices_2019;

-- Joins tables
SELECT "Security", "GICS Sector", "Avg_prices_2016", "Avg_prices_2019", financials_final.*
	FROM financials_final
		JOIN final_hc_company
		ON financials_final."Ticker symbol" = final_hc_company."Ticker symbol"
				Join avg_prices_2016
				ON avg_prices_2016."Ticker symbol" = final_hc_company."Ticker symbol"
					Join avg_prices_2019
					ON avg_prices_2019."Ticker symbol" = final_hc_company."Ticker symbol";

