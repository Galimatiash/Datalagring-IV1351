------------------------------------------------------- Show the numbers of instruments .... ------------------------------------------------------------------------------------------------
------- Task 3, bullet 1

SELECT * FROM(
SELECT 'January' as month, 'every instrument' as instrument, COUNT (*) from rented_instrument where
((lease_start <= '2020-01-01' AND lease_end >= '2020-02-01') OR -- begin before, end after
(lease_start <= '2020-01-01' AND (lease_end BETWEEN '2020-01-01' and '2020-02-01')) OR -- begin before, end during
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND lease_end >= '2020-02-01')) OR -- begin during, end after
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND (lease_end BETWEEN '2020-01-01' and '2020-02-01')) -- begin during, end during (termination case)
UNION ALL
SELECT 'February' as month, 'every instrument' as instrument, COUNT (*) from rented_instrument where
((lease_start <= '2020-02-01' AND lease_end >= '2020-03-01') OR
(lease_start <= '2020-02-01' AND (lease_end BETWEEN '2020-02-01' and '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND lease_end >= '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND (lease_end BETWEEN '2020-02-01' and '2020-03-01'))
UNION ALL
SELECT 'March' as month, 'every instrument' as instrument, COUNT (*) from rented_instrument where
((lease_start <= '2020-03-01' AND lease_end >= '2020-04-01') OR
(lease_start <= '2020-03-01' AND (lease_end BETWEEN '2020-03-01' and '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND lease_end >= '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND (lease_end BETWEEN '2020-03-01' and '2020-04-01'))
UNION ALL
SELECT 'April' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-04-01' AND lease_end >= '2020-05-01') OR
(lease_start <= '2020-04-01' AND (lease_end BETWEEN '2020-04-01' and '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND lease_end >= '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND (lease_end BETWEEN '2020-04-01' and '2020-05-01'))
UNION ALL
SELECT 'May' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-05-01' AND lease_end >= '2020-06-01') OR
(lease_start <= '2020-05-01' AND (lease_end BETWEEN '2020-05-01' and '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND lease_end >= '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND (lease_end BETWEEN '2020-05-01' and '2020-06-01'))
UNION ALL
SELECT 'June' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-06-01' AND lease_end >= '2020-07-01') OR
(lease_start <= '2020-06-01' AND (lease_end BETWEEN '2020-06-01' and '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND lease_end >= '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND (lease_end BETWEEN '2020-06-01' and '2020-07-01'))
UNION ALL
SELECT 'July' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-07-01' AND lease_end >= '2020-08-01') OR
(lease_start <= '2020-07-01' AND (lease_end BETWEEN '2020-07-01' and '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND lease_end >= '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND (lease_end BETWEEN '2020-07-01' and '2020-08-01'))
UNION ALL
SELECT 'August' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-08-01' AND lease_end >= '2020-09-01') OR
(lease_start <= '2020-08-01' AND (lease_end BETWEEN '2020-08-01' and '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND lease_end >= '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND (lease_end BETWEEN '2020-08-01' and '2020-09-01'))
UNION ALL
SELECT 'September' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-09-01' AND lease_end >= '2020-10-01') OR
(lease_start <= '2020-09-01' AND (lease_end BETWEEN '2020-09-01' and '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND lease_end >= '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND (lease_end BETWEEN '2020-09-01' and '2020-10-01'))
UNION ALL
SELECT 'October' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-10-01' AND lease_end >= '2020-11-01') OR
(lease_start <= '2020-10-01' AND (lease_end BETWEEN '2020-10-01' and '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND lease_end >= '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND (lease_end BETWEEN '2020-10-01' and '2020-11-01'))
UNION ALL
SELECT 'November' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-11-01' AND lease_end >= '2020-12-01') OR
(lease_start <= '2020-11-01' AND (lease_end BETWEEN '2020-11-01' and '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND lease_end >= '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND (lease_end BETWEEN '2020-11-01' and '2020-12-01'))
UNION ALL
SELECT 'December' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-12-01' AND lease_end >= '2021-01-01') OR
(lease_start <= '2020-12-01' AND (lease_end BETWEEN '2020-12-01' and '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND lease_end >= '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND (lease_end BETWEEN '2020-12-01' and '2021-01-01'))
) as k
UNION ALL


SELECT * FROM(
SELECT 'January' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-01-01' AND lease_end >= '2020-02-01') OR
(lease_start <= '2020-01-01' AND (lease_end BETWEEN '2020-01-01' and '2020-02-01')) OR
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND lease_end >= '2020-02-01')) OR
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND (lease_end BETWEEN '2020-01-01' and '2020-02-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'February' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-02-01' AND lease_end >= '2020-03-01') OR
(lease_start <= '2020-02-01' AND (lease_end BETWEEN '2020-02-01' and '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND lease_end >= '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND (lease_end BETWEEN '2020-02-01' and '2020-03-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'March' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-03-01' AND lease_end >= '2020-04-01') OR
(lease_start <= '2020-03-01' AND (lease_end BETWEEN '2020-03-01' and '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND lease_end >= '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND (lease_end BETWEEN '2020-03-01' and '2020-04-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'April' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-04-01' AND lease_end >= '2020-05-01') OR
(lease_start <= '2020-04-01' AND (lease_end BETWEEN '2020-04-01' and '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND lease_end >= '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND (lease_end BETWEEN '2020-04-01' and '2020-05-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'May' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-05-01' AND lease_end >= '2020-06-01') OR
(lease_start <= '2020-05-01' AND (lease_end BETWEEN '2020-05-01' and '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND lease_end >= '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND (lease_end BETWEEN '2020-05-01' and '2020-06-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'June' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-06-01' AND lease_end >= '2020-07-01') OR
(lease_start <= '2020-06-01' AND (lease_end BETWEEN '2020-06-01' and '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND lease_end >= '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND (lease_end BETWEEN '2020-06-01' and '2020-07-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'July' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-07-01' AND lease_end >= '2020-08-01') OR
(lease_start <= '2020-07-01' AND (lease_end BETWEEN '2020-07-01' and '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND lease_end >= '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND (lease_end BETWEEN '2020-07-01' and '2020-08-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'August' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-08-01' AND lease_end >= '2020-09-01') OR
(lease_start <= '2020-08-01' AND (lease_end BETWEEN '2020-08-01' and '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND lease_end >= '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND (lease_end BETWEEN '2020-08-01' and '2020-09-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'September' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-09-01' AND lease_end >= '2020-10-01') OR
(lease_start <= '2020-09-01' AND (lease_end BETWEEN '2020-09-01' and '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND lease_end >= '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND (lease_end BETWEEN '2020-09-01' and '2020-10-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'October' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-10-01' AND lease_end >= '2020-11-01') OR
(lease_start <= '2020-10-01' AND (lease_end BETWEEN '2020-10-01' and '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND lease_end >= '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND (lease_end BETWEEN '2020-10-01' and '2020-11-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'November' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-11-01' AND lease_end >= '2020-12-01') OR
(lease_start <= '2020-11-01' AND (lease_end BETWEEN '2020-11-01' and '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND lease_end >= '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND (lease_end BETWEEN '2020-11-01' and '2020-12-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'December' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-12-01' AND lease_end >= '2021-01-01') OR
(lease_start <= '2020-12-01' AND (lease_end BETWEEN '2020-12-01' and '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND lease_end >= '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND (lease_end BETWEEN '2020-12-01' and '2021-01-01'))
GROUP BY(s.instrument) ORDER BY count DESC
) as y

----------------------------------------------------------- The same as above, but retrieve the average number of rentals ... --------------------------------------------------------------------------------------------
----Task 3, bullet 2

SELECT * FROM(
SELECT 'every instrument' as instrument, AVG(count) as average FROM(
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-01-01' AND lease_end >= '2020-02-01') OR
(lease_start <= '2020-01-01' AND (lease_end BETWEEN '2020-01-01' and '2020-02-01')) OR
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND lease_end >= '2020-02-01')) OR
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND (lease_end BETWEEN '2020-01-01' and '2020-02-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-02-01' AND lease_end >= '2020-03-01') OR
(lease_start <= '2020-02-01' AND (lease_end BETWEEN '2020-02-01' and '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND lease_end >= '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND (lease_end BETWEEN '2020-02-01' and '2020-03-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-03-01' AND lease_end >= '2020-04-01') OR
(lease_start <= '2020-03-01' AND (lease_end BETWEEN '2020-03-01' and '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND lease_end >= '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND (lease_end BETWEEN '2020-03-01' and '2020-04-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-04-01' AND lease_end >= '2020-05-01') OR
(lease_start <= '2020-04-01' AND (lease_end BETWEEN '2020-04-01' and '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND lease_end >= '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND (lease_end BETWEEN '2020-04-01' and '2020-05-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-05-01' AND lease_end >= '2020-06-01') OR
(lease_start <= '2020-05-01' AND (lease_end BETWEEN '2020-05-01' and '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND lease_end >= '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND (lease_end BETWEEN '2020-05-01' and '2020-06-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-06-01' AND lease_end >= '2020-07-01') OR
(lease_start <= '2020-06-01' AND (lease_end BETWEEN '2020-06-01' and '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND lease_end >= '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND (lease_end BETWEEN '2020-06-01' and '2020-07-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-07-01' AND lease_end >= '2020-08-01') OR
(lease_start <= '2020-07-01' AND (lease_end BETWEEN '2020-07-01' and '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND lease_end >= '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND (lease_end BETWEEN '2020-07-01' and '2020-08-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-08-01' AND lease_end >= '2020-09-01') OR
(lease_start <= '2020-08-01' AND (lease_end BETWEEN '2020-08-01' and '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND lease_end >= '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND (lease_end BETWEEN '2020-08-01' and '2020-09-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-09-01' AND lease_end >= '2020-10-01') OR
(lease_start <= '2020-09-01' AND (lease_end BETWEEN '2020-09-01' and '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND lease_end >= '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND (lease_end BETWEEN '2020-09-01' and '2020-10-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-10-01' AND lease_end >= '2020-11-01') OR
(lease_start <= '2020-10-01' AND (lease_end BETWEEN '2020-10-01' and '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND lease_end >= '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND (lease_end BETWEEN '2020-10-01' and '2020-11-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-11-01' AND lease_end >= '2020-12-01') OR
(lease_start <= '2020-11-01' AND (lease_end BETWEEN '2020-11-01' and '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND lease_end >= '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND (lease_end BETWEEN '2020-11-01' and '2020-12-01'))
UNION ALL
SELECT COUNT (*) from rented_instrument where
((lease_start <= '2020-12-01' AND lease_end >= '2021-01-01') OR
(lease_start <= '2020-12-01' AND (lease_end BETWEEN '2020-12-01' and '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND lease_end >= '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND (lease_end BETWEEN '2020-12-01' and '2021-01-01'))
) as k
) as y
UNION ALL


SELECT k.instrument, cast(SUM(k.count) as decimal)/12 as average FROM(
SELECT 'January' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-01-01' AND lease_end >= '2020-02-01') OR
(lease_start <= '2020-01-01' AND (lease_end BETWEEN '2020-01-01' and '2020-02-01')) OR
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND lease_end >= '2020-02-01') OR
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND (lease_end BETWEEN '2020-01-01' and '2020-02-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'February' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-02-01' AND lease_end >= '2020-03-01') OR
(lease_start <= '2020-02-01' AND (lease_end BETWEEN '2020-02-01' and '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND lease_end >= '2020-03-01') OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND (lease_end BETWEEN '2020-02-01' and '2020-03-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'March' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-03-01' AND lease_end >= '2020-04-01') OR
(lease_start <= '2020-03-01' AND (lease_end BETWEEN '2020-03-01' and '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-03-01') AND lease_end >= '2020-04-01') OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND (lease_end BETWEEN '2020-03-01' and '2020-04-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'April' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-04-01' AND lease_end >= '2020-05-01') OR
(lease_start <= '2020-04-01' AND (lease_end BETWEEN '2020-04-01' and '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND lease_end >= '2020-05-01') OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND (lease_end BETWEEN '2020-04-01' and '2020-05-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'May' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-05-01' AND lease_end >= '2020-06-01') OR
(lease_start <= '2020-05-01' AND (lease_end BETWEEN '2020-05-01' and '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND lease_end >= '2020-06-01') OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND (lease_end BETWEEN '2020-05-01' and '2020-06-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'June' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-06-01' AND lease_end >= '2020-07-01') OR
(lease_start <= '2020-06-01' AND (lease_end BETWEEN '2020-06-01' and '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND lease_end >= '2020-07-01') OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND (lease_end BETWEEN '2020-06-01' and '2020-07-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'Juli' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-07-01' AND lease_end >= '2020-08-01') OR
(lease_start <= '2020-07-01' AND (lease_end BETWEEN '2020-07-01' and '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND lease_end >= '2020-08-01') OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND (lease_end BETWEEN '2020-07-01' and '2020-08-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'August' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-08-01' AND lease_end >= '2020-09-01') OR
(lease_start <= '2020-08-01' AND (lease_end BETWEEN '2020-08-01' and '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND lease_end >= '2020-09-01') OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND (lease_end BETWEEN '2020-08-01' and '2020-09-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'September' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-09-01' AND lease_end >= '2020-10-01') OR
(lease_start <= '2020-09-01' AND (lease_end BETWEEN '2020-09-01' and '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND lease_end >= '2020-10-01') OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND (lease_end BETWEEN '2020-09-01' and '2020-10-01'))
GROUP BY s.instrument
UNION ALL

SELECT 'October' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-10-01' AND lease_end >= '2020-11-01') OR
(lease_start <= '2020-10-01' AND (lease_end BETWEEN '2020-10-01' and '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND lease_end >= '2020-11-01') OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND (lease_end BETWEEN '2020-10-01' and '2020-11-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'November' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-11-01' AND lease_end >= '2020-12-01') OR
(lease_start <= '2020-11-01' AND (lease_end BETWEEN '2020-11-01' and '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-11-01') AND lease_end >= '2020-12-01') OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND (lease_end BETWEEN '2020-11-01' and '2020-12-01'))
GROUP BY s.instrument
UNION ALL
SELECT 'December' as month, s.instrument, COUNT (*)
FROM rented_instrument as r INNER JOIN instrument_stock AS s
ON r.instrument_stock_id = s.id
WHERE (lease_start <= '2020-12-01' AND lease_end >= '2021-01-01') OR
(lease_start <= '2020-12-01' AND (lease_end BETWEEN '2020-12-01' and '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND lease_end >= '2021-01-01') OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND (lease_end BETWEEN '2020-12-01' and '2021-01-01'))
GROUP BY s.instrument
) as k
GROUP BY k.instrument

------------------------------------------------------- Show the number of lessons given per month during a specified year... ------------------------------------------------------------------------------------------------
--- Task 3, bullet 3

SELECT k.month, k.lesson, SUM(count) FROM (
SELECT 'January' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-01-01' and time_start < '2020-02-01')
UNION ALL
SELECT 'January' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-01-01' and time_start < '2020-02-01')
UNION ALL

SELECT 'February' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-02-02' and time_start < '2020-03-01')
UNION ALL
SELECT 'February' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-02-01' and time_start < '2020-03-01')
UNION ALL

SELECT 'March' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-03-02' and time_start < '2020-04-01')
UNION ALL
SELECT 'March' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-03-01' and time_start < '2020-04-01')
UNION ALL

SELECT 'April' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-04-02' and time_start < '2020-05-01')
UNION ALL
SELECT 'April' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-04-01' and time_start < '2020-05-01')
UNION ALL

SELECT 'May' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-05-02' and time_start < '2020-06-01')
UNION ALL
SELECT 'May' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-05-01' and time_start < '2020-06-01')
UNION ALL

SELECT 'June' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-06-02' and time_start < '2020-07-01')
UNION ALL
SELECT 'June' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-06-01' and time_start < '2020-07-01')
UNION ALL

SELECT 'July' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-07-02' and time_start < '2020-08-01')
UNION ALL
SELECT 'July' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-07-01' and time_start < '2020-08-01')
UNION ALL

SELECT 'August' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-08-02' and time_start < '2020-09-01')
UNION ALL
SELECT 'August' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-08-01' and time_start < '2020-09-01')
UNION ALL

SELECT 'September' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-09-02' and time_start < '2020-10-01')
UNION ALL
SELECT 'September' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-09-01' and time_start < '2020-10-01')
UNION ALL

SELECT 'October' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-10-02' and time_start < '2020-11-01')
UNION ALL
SELECT 'October' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-10-01' and time_start < '2020-11-01')
UNION ALL

SELECT 'November' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-11-02' and time_start < '2020-12-01')
UNION ALL
SELECT 'November' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-11-01' and time_start < '2020-12-01')
UNION ALL

SELECT 'December' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-12-02' and time_start < '2021-01-01')
UNION ALL
SELECT 'December' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-12-01' and time_start < '2021-01-01')
) as k
GROUP BY k.month, k.lesson

UNION ALL
SELECT 'January' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-01-01' and time_start < '2020-02-01')
UNION ALL
Select 'January' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-01-01' and time_start < '2020-02-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'January' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-01-01' and time_start < '2020-02-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'Feburary' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01')
UNION ALL
Select 'Feburary' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'February' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'March' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-03-01' and time_start < '2020-04-01')
UNION ALL
Select 'March' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-03-01' and time_start < '2020-04-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'March' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-03-01' and time_start < '2020-04-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'April' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-04-01' and time_start < '2020-05-01')
UNION ALL
Select 'April' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-04-01' and time_start < '2020-05-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'April' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-04-01' and time_start < '2020-05-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'May' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-05-01' and time_start < '2020-06-01')
UNION ALL
Select 'May' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-05-01' and time_start < '2020-06-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'May' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-05-01' and time_start < '2020-06-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'June' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-06-01' and time_start < '2020-07-01')
UNION ALL
Select 'June' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-06-01' and time_start < '2020-07-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'June' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-06-01' and time_start < '2020-07-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'Juli' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-07-01' and time_start < '2020-08-01')
UNION ALL
Select 'Juli' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-07-01' and time_start < '2020-08-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'Juli' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-07-01' and time_start < '2020-08-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'August' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-08-01' and time_start < '2020-09-01')
UNION ALL
Select 'August' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-08-01' and time_start < '2020-09-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'August' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-08-01' and time_start < '2020-09-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'September' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-09-01' and time_start < '2020-10-01')
UNION ALL
Select 'September' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-09-01' and time_start < '2020-10-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'September' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-09-01' and time_start < '2020-10-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'Oktober' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-10-01' and time_start < '2020-11-01')
UNION ALL
Select 'October' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-10-01' and time_start < '2020-11-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'October' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-10-01' and time_start < '2020-11-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'November' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-11-01' and time_start < '2020-12-01')
UNION ALL
Select 'November' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-11-01' and time_start < '2020-12-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'November' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-11-01' and time_start < '2020-12-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'December' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-12-01' and time_start < '2021-01-01')
UNION ALL
Select 'December' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-12-01' and time_start < '2021-01-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'December' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-12-01' and time_start < '2021-01-01') and lesson_type.is_ensamble = '0'

----------------------------------------------------------The same as above, but retrieve the average number of lessons per month... ------------------------------------------------------------------------------------------------------------
--- Task 3, bullet 4

SELECT 'all lessons' as lesson_type, cast(SUM(k.count) as decimal)/12 as average_per_month FROM(
SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-01-01' and time_start < '2020-02-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-01-01' and time_start < '2020-02-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-02-01' and time_start < '2020-03-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-02-01' and time_start < '2020-03-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-03-01' and time_start < '2020-04-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-03-01' and time_start < '2020-04-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-04-01' and time_start < '2020-05-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-04-01' and time_start < '2020-05-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-05-01' and time_start < '2020-06-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-05-01' and time_start < '2020-06-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-06-01' and time_start < '2020-07-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-06-01' and time_start < '2020-07-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-07-01' and time_start < '2020-08-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-07-01' and time_start < '2020-08-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-08-01' and time_start < '2020-09-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-08-01' and time_start < '2020-09-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-09-01' and time_start < '2020-10-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-09-01' and time_start < '2020-10-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-10-01' and time_start < '2020-11-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-10-01' and time_start < '2020-11-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-11-01' and time_start < '2020-12-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-11-01' and time_start < '2020-12-01')
UNION ALL

SELECT COUNT (*) from individual_lesson where
(time_start >= '2020-12-01' and time_start < '2021-01-01')
UNION ALL
SELECT COUNT (*) from common_lesson where
(time_start >= '2020-12-01' and time_start < '2021-01-01')
) as k
UNION ALL


SELECT k.type, cast(SUM(k.count) as decimal)/12 as average FROM(
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-01-01' and time_start < '2020-02-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-03-01' and time_start < '2020-04-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-04-01' and time_start < '2020-05-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-05-01' and time_start < '2020-06-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-07-01' and time_start < '2020-08-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-08-01' and time_start < '2020-09-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-09-01' and time_start < '2020-10-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-10-01' and time_start < '2020-11-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-11-01' and time_start < '2020-12-01')
UNION ALL
SELECT 'individual lesson' as type, COUNT (*)
FROM individual_lesson as i
WHERE (time_start >= '2020-12-01' and time_start < '2021-01-01')
UNION ALL

SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-01-01' and time_start < '2020-02-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-03-01' and time_start < '2020-04-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-04-01' and time_start < '2020-05-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-05-01' and time_start < '2020-06-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-06-01' and time_start < '2020-07-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-07-01' and time_start < '2020-08-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-08-01' and time_start < '2020-09-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-09-01' and time_start < '2020-10-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-10-01' and time_start < '2020-11-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-11-01' and time_start < '2020-12-01') and l.is_ensamble = '0'
UNION ALL
SELECT 'common lesson' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-12-01' and time_start < '2021-01-01') and l.is_ensamble = '0'
UNION ALL

SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-01-01' and time_start < '2020-02-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-03-01' and time_start < '2020-04-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-04-01' and time_start < '2020-05-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-05-01' and time_start < '2020-06-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-06-01' and time_start < '2020-07-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-07-01' and time_start < '2020-08-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-08-01' and time_start < '2020-09-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-09-01' and time_start < '2020-10-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-10-01' and time_start < '2020-11-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-11-01' and time_start < '2020-12-01') and l.is_ensamble = '1'
UNION ALL
SELECT 'ensemble' as type, COUNT (*)
FROM common_lesson as c INNER JOIN lesson_type as l
ON c.lesson_type_id = l.id
WHERE (time_start >= '2020-12-01' and time_start < '2021-01-01') and l.is_ensamble = '1'
) as k
GROUP BY k.type

----------------------------------------------- List all instructors who has given more than a specific number of lessons ...--------------------------------------------------------------------------------------------------
--- Task 3, bullet 5

SELECT * FROM(
SELECT cast(i.id AS VARCHAR) as instructor_over_k_amount_this_month, SUM(count) as lessons
FROM(
SELECT i.id, COUNT(*)
FROM instructor as i INNER JOIN individual_lesson as l
ON i.id = l.instructor_id
WHERE(DATE_PART('month', l.time_start) = DATE_PART('month', CURRENT_DATE))
AND (DATE_PART('year', l.time_start) = DATE_PART('year', CURRENT_DATE))
AND(l.time_start <= CURRENT_DATE)
GROUP BY i.id
UNION ALL
SELECT i.id, COUNT(*)
FROM instructor as i INNER JOIN common_lesson as c
ON i.id = c.instructor_id
WHERE(DATE_PART('month', c.time_start) = DATE_PART('month', CURRENT_DATE))
AND (DATE_PART('year', c.time_start) = DATE_PART('year', CURRENT_DATE))
AND(l.time_start <= CURRENT_DATE)
GROUP BY i.id
) as i
GROUP BY i.id
ORDER BY lessons DESC
) as x
WHERE (lessons >= 1) -- modify to change lower limit for showing up in table
UNION ALL

SELECT 'top three last month' as instructor_over_k_amount_this_month, '0' as lessons

UNION ALL
SELECT * FROM(
SELECT cast(i.id as VARCHAR) as instructor, SUM(count)
FROM(
SELECT i.id, COUNT(*)
FROM instructor as i INNER JOIN individual_lesson as l
ON i.id = l.instructor_id
WHERE(DATE_PART('month', l.time_start) = DATE_PART('month', CURRENT_DATE - interval '1 month'))
AND (DATE_PART('year', l.time_start) = DATE_PART('year', CURRENT_DATE - interval '1 month'))
GROUP BY i.id
UNION ALL
SELECT i.id, COUNT(*)
FROM instructor as i INNER JOIN common_lesson as c
ON i.id = c.instructor_id
WHERE(DATE_PART('month', c.time_start) = DATE_PART('month', CURRENT_DATE - interval '1 month'))
AND (DATE_PART('year', c.time_start) = DATE_PART('year', CURRENT_DATE - interval '1 month'))
GROUP BY i.id
) as i
GROUP BY i.id
ORDER BY sum DESC
LIMIT 3 -- modify to change how many we display
) as x
WHERE (sum > 0) -- modify to change lower limit for showing up in table

-------------------------------------------------- List all ensembles held during next week, sorted by music... -----------------------------------------------------------
--- Task 3, bullet 6

-- no rows?

SELECT k.id as id, k.time, k.type as genre, weekday as weekday,
CASE
WHEN k.attendees > 0 AND k.attendees <= 2 THEN k.max_attendees - k.attendees
WHEN k.attendees = 0 THEN k.max_attendees - k.attendees
WHEN k.attendees > 0 THEN k.max_attendees - k.attendees
END seats
FROM(

SELECT cl.id as id, extract(isodow from cl.time_start) as weekday, cl.max_attendees as max_attendees,
type.type as type, cl.time_start as time, COUNT(cls.student_id) as attendees

FROM common_lesson AS cl
INNER JOIN lesson_type AS type ON cl.lesson_type_id = type.id
LEFT JOIN common_lesson_student AS cls ON cls.common_lesson_id = cl.id

WHERE type.is_ensamble = '1' AND
cl.time_start >= cast(current_date + make_interval(days => cast(7-extract(isodow from current_date) as int) + 1) as DATE) AND
cl.time_start <= cast(current_date + make_interval(days => cast(7-extract(isodow from current_date) as int) + 7) as DATE)
GROUP BY (cl.id, type.type)
ORDER BY(extract(isodow from cl.time_start), type.type)
) as k

------------------------------------------------------- List the three instruments with the lowest monthly rental fee... -------------------------------------------------
--- Task 3, bullet 7

SELECT instrument, price, available, rented, MIN(upcoming)
FROM(

SELECT ins.instrument, ins.rental_fee as price, ins.available_amount as available,
COUNT(DISTINCT rei.id) as rented,

CASE
 WHEN cl.time_start > NOW() THEN cl.time_start
 ELSE NULL
END upcoming


FROM instrument_stock AS ins
INNER JOIN lesson_type AS type
ON type.type = ins.instrument
INNER JOIN rented_instrument AS rei
ON rei.instrument_stock_id = ins.id
LEFT JOIN common_lesson AS cl
ON cl.lesson_type_id = type.id

GROUP BY ins.id, cl.time_start
ORDER BY rental_fee ASC
) as k
GROUP BY k.instrument, k.price, k.available, k.rented

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
