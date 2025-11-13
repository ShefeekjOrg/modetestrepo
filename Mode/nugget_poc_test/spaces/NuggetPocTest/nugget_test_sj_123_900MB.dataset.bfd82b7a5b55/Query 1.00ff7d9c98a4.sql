SELECT
    id,
    repeat('0123456789', 1024 * 10) AS large_string
FROM
    generate_series(1, 9216) AS id;