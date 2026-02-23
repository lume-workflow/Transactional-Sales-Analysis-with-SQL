-- =====================================
-- CUSTOMERS
-- =====================================

CREATE TABLE customers (
    id BIGSERIAL PRIMARY KEY,

    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20),

    address VARCHAR(150),
    address_number VARCHAR(10),
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code VARCHAR(20)
);



-- =====================================
-- PRODUCTS
-- =====================================

CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    category VARCHAR(100),
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);



-- =====================================
-- ORDERS
-- =====================================

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,

    customer_id BIGINT NOT NULL,

    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    paid_at TIMESTAMP,
    status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'paid', 'cancelled')),
    discount_amount DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (discount_amount >= 0),
    
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(id)
        ON DELETE RESTRICT
);



-- =====================================
-- ORDER_ITEMS
-- =====================================

CREATE TABLE order_items (
    id BIGSERIAL PRIMARY KEY,

    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,

    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),

    CONSTRAINT fk_order_items_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_order_items_products
        FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_order_product
        UNIQUE (order_id, product_id)
);


