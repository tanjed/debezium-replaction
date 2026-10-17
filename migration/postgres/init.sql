CREATE TABLE IF NOT EXISTS public.customers (
    id BIGINT PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.orders (
    id BIGINT PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES public.customers(id),
    order_number TEXT NOT NULL UNIQUE,
    amount NUMERIC(12,2) NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO public.customers (id, full_name, email)
VALUES
    (1, 'Alice Carter', 'alice@example.com'),
    (2, 'Bob Miller', 'bob@example.com')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.orders (id, customer_id, order_number, amount, status)
VALUES
    (1001, 1, 'ORD-1001', 125.50, 'created'),
    (1002, 2, 'ORD-1002', 89.90, 'created')
ON CONFLICT (id) DO NOTHING;

-- Additional change event to verify CDC updates.
UPDATE public.orders
SET status = 'paid', updated_at = NOW()
WHERE id = 1001;
