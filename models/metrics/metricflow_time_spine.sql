-- metricflow_time_spine.sql
--for BQ adapters use "DATE('01/01/2000','mm/dd/yyyy')"
WITH days AS (
  {{ dbt_utils.date_spine(
      'day',
      "PARSE_DATE('%Y-%m-%d', '2000-01-01')",
      "PARSE_DATE('%Y-%m-%d', '2027-01-01')"
  ) }}
),

final AS (
  SELECT CAST(date_day AS DATE) AS date_day
  FROM days
)

SELECT *
FROM final
