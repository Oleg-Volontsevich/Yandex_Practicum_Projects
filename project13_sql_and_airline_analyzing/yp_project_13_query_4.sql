SELECT
    festival_name,
    EXTRACT (week from festival_date :: date) AS festival_week
FROM
    festivals
WHERE
     festival_city = 'Москва' AND festival_date :: date BETWEEN '2018-07-23' AND '2018-09-30' 