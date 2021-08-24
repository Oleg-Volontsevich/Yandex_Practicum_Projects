SELECT 
    model,
    count (*) AS flights_amount 
FROM
    aircrafts
    INNER JOIN flights ON aircrafts.aircraft_code = flights.aircraft_code 
WHERE    
    EXTRACT(MONTH FROM flights.departure_time) = 09
GROUP BY 
    model;