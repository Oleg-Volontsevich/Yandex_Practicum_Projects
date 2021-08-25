SELECT
    COUNT(flights.flight_id) AS flights_amount,
    CASE WHEN model LIKE 'Airbus%' THEN 'Airbus'
         WHEN model LIKE 'Boeing%' THEN 'Boeing'
         ELSE 'other'
         END AS model
FROM
    aircrafts
    INNER JOIN flights ON aircrafts.aircraft_code = flights.aircraft_code
WHERE
    EXTRACT(MONTH FROM flights.departure_time) = 09
GROUP BY
    CASE WHEN model LIKE 'Airbus%' THEN 'Airbus'
         WHEN model LIKE 'Boeing%' THEN 'Boeing'
         ELSE 'other'
         END