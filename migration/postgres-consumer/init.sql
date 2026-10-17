CREATE TABLE IF NOT EXISTS public.customers (
    id BIGINT PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    __version BIGINT
);

CREATE TABLE IF NOT EXISTS public.orders (
    id BIGINT PRIMARY KEY,
    customer_id BIGINT,
    order_number TEXT NOT NULL UNIQUE,
    amount NUMERIC(12,2),
    status TEXT,
    created_at TIMESTAMPTZ NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    __version BIGINT
);
