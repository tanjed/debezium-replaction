CREATE DATABASE IF NOT EXISTS destination_db;

CREATE TABLE IF NOT EXISTS destination_db.customers (
    id Int64,
    full_name String,
    email String,
    created_at DateTime64(3),
    updated_at DateTime64(3),
    __version    Int64
)
ENGINE = ReplacingMergeTree(__version)
ORDER BY email;

CREATE TABLE IF NOT EXISTS destination_db.orders (
    id Int64,
    customer_id Int64,
    order_number String,
    amount       Decimal(12, 2),
    status       String,
    created_at   DateTime64(3),
    updated_at   DateTime64(3),
    __version      Int64
)
ENGINE = ReplacingMergeTree(__version)
ORDER BY customer_id;
