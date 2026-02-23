-- =================
-- CUSTOMERS INSERTS
-- =================

INSERT INTO customers (first_name, last_name, email, phone_number, address, address_number, city, state, postal_code) VALUES
('Lucas', 'Silva', 'lucas.silva@email.com', '11988887777', 'Rua das Flores', '123', 'São Paulo', 'SP', '01000-000'),
('Mariana', 'Souza', 'mariana.souza@email.com', '21999998888', 'Av. Atlântica', '456', 'Rio de Janeiro', 'RJ', '22000-000'),
('Carlos', 'Oliveira', 'carlos.oliveira@email.com', '31977776666', 'Rua Minas Gerais', '78', 'Belo Horizonte', 'MG', '30000-000'),
('Ana', 'Costa', 'ana.costa@email.com', '41966665555', 'Rua XV de Novembro', '910', 'Curitiba', 'PR', '80000-000'),
('Pedro', 'Almeida', 'pedro.almeida@email.com', '51955554444', 'Av. Ipiranga', '321', 'Porto Alegre', 'RS', '90000-000'),
('Juliana', 'Pereira', 'juliana.pereira@email.com', '61944443333', 'SQS 308', '12', 'Brasília', 'DF', '70000-000'),
('Rafael', 'Gomes', 'rafael.gomes@email.com', '71933332222', 'Rua Bahia', '654', 'Salvador', 'BA', '40000-000'),
('Fernanda', 'Martins', 'fernanda.martins@email.com', '85922221111', 'Av. Beira Mar', '87', 'Fortaleza', 'CE', '60000-000'),
('Bruno', 'Rodrigues', 'bruno.rodrigues@email.com', '27911110000', 'Rua Vitória', '55', 'Vitória', 'ES', '29000-000'),
('Camila', 'Barbosa', 'camila.barbosa@email.com', '62900009999', 'Av. Goiás', '777', 'Goiânia', 'GO', '74000-000');


-- =================
-- ORDERS INSERTS
-- =================

INSERT INTO orders (customer_id, order_date, paid_at, status, discount_amount) VALUES
-- Janeiro
(1, '2024-01-05', '2024-01-05', 'paid', 50.00),
(2, '2024-01-10', '2024-01-10', 'paid', 0.00),
(3, '2024-01-15', NULL, 'pending', 0.00),
(4, '2024-01-20', NULL, 'cancelled', 0.00),

-- Fevereiro
(1, '2024-02-02', '2024-02-02', 'paid', 100.00),
(5, '2024-02-08', '2024-02-08', 'paid', 0.00),
(2, '2024-02-15', NULL, 'pending', 0.00),

-- Março
(3, '2024-03-03', '2024-03-03', 'paid', 20.00),
(4, '2024-03-10', '2024-03-10', 'paid', 0.00),
(5, '2024-03-18', NULL, 'cancelled', 0.00);



-- =================
-- PRODUCTS INSERTS
-- =================

INSERT INTO products (name, description, price, category)
VALUES
('Notebook Pro 14', 'Laptop 14 polegadas para uso profissional', 500.00, 'Electronics'),
('Mouse Wireless', 'Mouse sem fio ergonômico', 100.00, 'Electronics'),
('Monitor 24"', 'Monitor LED 24 polegadas Full HD', 300.00, 'Electronics'),
('Teclado Mecânico', 'Teclado mecânico com iluminação RGB', 150.00, 'Electronics'),
('Cadeira Escritório', 'Cadeira ergonômica para escritório', 400.00, 'Furniture'),
('Smartphone X', 'Smartphone 128GB com câmera avançada', 800.00, 'Electronics');


-- =================
-- ORDER_ITEMS INSERTS
-- =================
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES

-- Pedido 1 (Customer 1)
(1, 1, 1, 500.00),
(1, 2, 2, 100.00),

-- Pedido 2 (Customer 2)
(2, 3, 1, 300.00),

-- Pedido 3 (Pending)
(3, 1, 1, 500.00),

-- Pedido 4 (Cancelled)
(4, 4, 2, 150.00),

-- Pedido 5 (Customer 1)
(5, 2, 3, 100.00),
(5, 5, 1, 400.00),

-- Pedido 6 (Customer 5)
(6, 6, 1, 800.00),

-- Pedido 7 (Pending)
(7, 3, 2, 300.00),

-- Pedido 8 (Customer 3)
(8, 1, 1, 500.00),

-- Pedido 9 (Customer 4)
(9, 4, 1, 150.00),
(9, 2, 1, 100.00),

-- Pedido 10 (Cancelled)
(10, 5, 1, 400.00);
