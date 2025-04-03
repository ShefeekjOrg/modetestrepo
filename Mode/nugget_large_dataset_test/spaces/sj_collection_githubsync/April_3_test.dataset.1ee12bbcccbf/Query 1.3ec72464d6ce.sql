SELECT * FROM (VALUES
    (1, 2, 'Manager'),
    (1, 3, 'Manager'),
    (2, 4, 'Mentor'),
    (3, 5, 'Teammate'),
    (4, 6, 'Manager')
) AS graph(from_employee, to_employee, relation)
LIMIT 100