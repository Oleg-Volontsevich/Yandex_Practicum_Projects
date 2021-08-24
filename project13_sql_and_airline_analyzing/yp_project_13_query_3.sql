SELECT
    subq.city,
    AVG (subq.flight_count) AS average_flights
FROM
    (SELECT
        COUNT(flights.flight_id) AS flight_count,
        airports.city,
        EXTRACT (day from flights.arrival_time :: date) AS day
    FROM
        flights
        INNER JOIN airports ON airports.airport_code = flights.arrival_airport
    WHERE
        EXTRACT(MONTH FROM flights.arrival_time) = 08
    GROUP BY
        airports.city,
        day) AS subq
GROUP BY
    subq.city;