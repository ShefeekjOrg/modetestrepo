SELECT
    id,
    repeat('0123456789', 1024) AS large_string
FROM
    generate_series(1, 100000) AS id;