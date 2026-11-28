CREATE DATABASE a1crm;

CREATE TABLE IF NOT EXISTS customers (
    customer_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
    phone VARCHAR(20),
    customer_address TEXT,
    birith_date DATE
);

CREATE IF NOT EXISTS invoices (
    invoice_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    invoice_date DATE NOT NULL,
    total_amount NUMERIC(15, 2) NOT NULL,
    invoice_status TEXT,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS payments (
    payments_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    invoice_id BIGINT NOT NULL,
    mount_payment BIGINT NOT NULL,
    payment_date DATE,
    payment_method TEXT NOT NULL,

    FOREIGN KEY (invoice_id)
        REFERENCES invoices(invoice_id)
);

CREATE TABLE IF NOT EXISTS checks (
    check_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    invoice_id BIGINT NOT NULL,
    check_number BIGINT NOT NULL,
    check_amount BIGINT NOT NULL,
    check_status TEXT NOT NULL,

    FOREIGN KEY (invoice_id)
        REFERENCES invoices(invoice_id)
);

CREATE TABLE IF NOT EXISTS users (
    user_id BIGINT ALWAYS AS IDENTITY PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    user_password VARCHAR(100) NOT NULL,
    user_permision INT NOT NULL
);