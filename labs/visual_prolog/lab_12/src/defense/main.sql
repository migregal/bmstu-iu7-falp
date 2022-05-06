CREATE DATABASE owners;

CREATE TABLE addresses (
    id          SERIAL          PRIMARY KEY
    , city      VARCHAR
    , street    VARCHAR
    , house     INTEGER
    , flat      INTEGER
);

CREATE TABLE persons (
    id          SERIAL          PRIMARY KEY
    , surname   VARCHAR
    , phone     VARCHAR
    , addr_id   SERIAL          NOT NULL
    , FOREIGN KEY (addr_id) REFERENCES addresses(id) ON DELETE CASCADE
);

CREATE TABLE cars (
    id          SERIAL          PRIMARY KEY
    , mark      VARCHAR
    , color     VARCHAR
    , price     DECIMAL
    , owner_id  SERIAL          NOT NUll
    , FOREIGN KEY (owner_id) REFERENCES persons(id) ON DELETE CASCADE
);

CREATE TABLE bank_depositors (
    id              SERIAL      PRIMARY KEY
    , bank          VARCHAR
    , account_id    INTEGER
    , amount        DECIMAL
    , investor_id   SERIAL      NOT NULL
    , FOREIGN KEY (investor_id) REFERENCES persons(id) ON DELETE CASCADE
);

INSERT INTO addresses(city, street, house, flat)
VALUES
        ('Moscow', 'Lesnaya', 12, 2),
        ('Moscow', 'Lesnaya', 13, 87),
        ('Ekaterinburg', 'Kamennaya', 13, 87),
        ('Moscow', 'Hospital`naya', 123, 87);

INSERT INTO persons(surname, phone, addr_id)
VALUES
        ('Andreev', '+79999999999', 1),
        ('Borisov', '+71111111111', 2),
        ('Dmitriev', '+73333333333', 3),
        ('Fedorov', '+66666666666', 4);

INSERT INTO cars(mark, color, price, owner_id)
VALUES
        ('bmw', 'green', 1000, 1),
        ('volkswagen', 'red', 10000, 1),
        ('lada', 'black', 20000, 3),
        ('lada', 'black', 20000, 4),
        ('opel', 'white', 10, 4);

INSERT INTO bank_depositors(bank, account_id, amount, investor_id)
VALUES
        ('Sber', 22, 1000, 1),
        ('Sber', 33, 10000, 2),
        ('Alfa', 44, 20000, 3),
        ('Sber', 238, 10, 4),
        ('Maze', 1, 10000, 2);

CREATE OR REPLACE VIEW full_repson_info
AS
SELECT mark, color, surname, city, phone, bank, price FROM persons p
JOIN (SELECT * FROM addresses) a
ON p.addr_id = a.id
JOIN (SELECT * FROM cars) c
ON p.id = c.owner_id
JOIN (SELECT * FROM bank_depositors) b
ON p.id = b.investor_id;

-- only_mark_by_phone
SELECT mark FROM (
    SELECT mark, phone FROM persons p
    JOIN (SELECT * FROM addresses) a
    ON p.addr_id = a.id
    JOIN (SELECT * FROM cars) c
    ON p.id = c.owner_id
    JOIN (SELECT * FROM bank_depositors) b
    ON p.id = b.investor_id
) c
WHERE c.phone = '+79999999999';

-- man_by_car

SELECT * FROM full_repson_info
WHERE mark = 'bmw' AND color = 'green';
