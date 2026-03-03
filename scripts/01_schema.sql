-- SCRIPT 01: Estructura Base
CREATE TYPE user_status AS ENUM ('active', 'inactive', 'suspended');

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE films (
    film_id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES categories(category_id), -- Añadido para analítica por categoría
    title VARCHAR(255) NOT NULL,
    rental_rate NUMERIC(4,2) DEFAULT 4.99,
    -- ... resto de columnas
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    status user_status DEFAULT 'active'
);

CREATE TABLE rentals (
    rental_id SERIAL PRIMARY KEY,
    rental_date TIMESTAMP NOT NULL,
    customer_id INTEGER REFERENCES customers(customer_id),
    film_id INTEGER REFERENCES films(film_id), -- Para los Joins
    return_date TIMESTAMP
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    rental_id INTEGER REFERENCES rentals(rental_id),
    amount NUMERIC(10,2) NOT NULL
);