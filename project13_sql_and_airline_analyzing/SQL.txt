SELECT
    EXTRACT (week from flights.arrival_time :: date) AS week_number,
    COUNT (ticket_no),
    subq.festival_week,
    subq.festival_name
FROM
    ticket_flights
    INNER JOIN flights ON ticket_flights.flight_id = flights.flight_id
    LEFT JOIN (SELECT
                    festival_name,
                    EXTRACT (week from festival_date :: date) AS festival_week
                FROM
                    festivals
                WHERE
                     festival_city = 'Москва' AND festival_date :: date BETWEEN '2018-07-23' AND '2018-09-30') AS subq ON subq.festival_week = EXTRACT(week FROM flights.arrival_time :: date)
WHERE
    flights.arrival_airport IN (
        SELECT
            DISTINCT (airport_code)
        FROM
            airports
        WHERE
            city = 'Москва') AND flights.arrival_time :: date BETWEEN '2018-07-23' AND '2018-09-30'
GROUP BY 
    week_number,
    festival_week,
    festival_name