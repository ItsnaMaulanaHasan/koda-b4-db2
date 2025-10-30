CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id),
    no_id_card VARCHAR(50) NOT NULL,
    image TEXT,
    phone_number VARCHAR(20) NOT NULL,
    address VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TYPE status AS ENUM ('acticve', 'inactive', 'banned', 'locked');

CREATE TABLE wallets (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id),
    balance NUMERIC(12, 2) DEFAULT 0,
    status status,
    pin CHAR(6),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TYPE statusTransaction AS ENUM ('success', 'failed', 'on progress');

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id),
    transaction_type VARCHAR(50),
    recipient VARCHAR(100),
    transaction_date TIMESTAMP,
    amount NUMERIC(12, 2),
    note TEXT,
    status statusTransaction,
    payment_method_id INT REFERENCES payment_methods (id),
    service_id INT REFERENCES services (id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE payment_methods (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY name VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
)

CREATE TABLE service_category (
    id SERIAL PRIMARY KEY,
    service_id INT REFERENCES services (id),
    category_id INT REFERENCES categories (id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
)