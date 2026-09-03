-- ============================================================
-- DATA SEEDER - E-Shop Backend
-- ============================================================
-- Contrasenas hasheadas con BCrypt (cost factor 10).
--   admin123  -> admin@eshop.com
--   user123   -> todos los demas usuarios
-- ============================================================

-- ======================== USERS =============================
INSERT INTO users (name, email, password, role, active) VALUES
('Admin Principal',  'admin@eshop.com',    '$2a$10$GZq05pkRXsVT.okT.qn/g.fK3L/wK9e/LWJydXVWMFjvsmY47Ue3G', 'ADMIN',  true),
('Maria Lopez',      'maria@eshop.com',    '$2a$10$YNeAv03h11mEmHtvT1FaSuFPyVkvGGkAMDNEedCm3bTRL/Bw0.gF6', 'USER',   true),
('Carlos Garcia',    'carlos@eshop.com',   '$2a$10$.Ostn7mGjrg4UkFgN9V59OnngB4eDHLPAoiYX.C1X3mF/kok9MWr2', 'USER',   true),
('Ana Martinez',     'ana@eshop.com',      '$2a$10$Tu8jqvRNGmbDwJSR3Q2MIe/xiKQmFVBB24ygdfreHPrIpQ5WFbF/O', 'USER',   true),
('Pedro Sanchez',    'pedro@eshop.com',    '$2a$10$lKjWjVhSlvZeyfCvsrwUfuw09qwUCJh6lX1Tf0drQPoh/IvtB/k1K', 'USER',   true),
('Laura Fernandez',  'laura@eshop.com',    '$2a$10$v5WwzEAu.bR7cTKowHpMQu6vWxcam2rfzYdmFmWXZuYhzvNfALCKy', 'USER',   true),
('Jorge Ramirez',    'jorge@eshop.com',    '$2a$10$YNeAv03h11mEmHtvT1FaSuFPyVkvGGkAMDNEedCm3bTRL/Bw0.gF6', 'USER',   true),
('Sofia Torres',     'sofia@eshop.com',    '$2a$10$.Ostn7mGjrg4UkFgN9V59OnngB4eDHLPAoiYX.C1X3mF/kok9MWr2', 'USER',   true),
('Diego Morales',    'diego@eshop.com',    '$2a$10$Tu8jqvRNGmbDwJSR3Q2MIe/xiKQmFVBB24ygdfreHPrIpQ5WFbF/O', 'USER',   true),
('Valentina Rojas',  'valentina@eshop.com','$2a$10$lKjWjVhSlvZeyfCvsrwUfuw09qwUCJh6lX1Tf0drQPoh/IvtB/k1K', 'USER',   true),
('Mateo Castro',     'mateo@eshop.com',    '$2a$10$v5WwzEAu.bR7cTKowHpMQu6vWxcam2rfzYdmFmWXZuYhzvNfALCKy', 'USER',   true),
('Isabella Vargas',  'isabella@eshop.com', '$2a$10$YNeAv03h11mEmHtvT1FaSuFPyVkvGGkAMDNEedCm3bTRL/Bw0.gF6', 'USER',   true),
('Felipe Mendoza',   'felipe@eshop.com',   '$2a$10$.Ostn7mGjrg4UkFgN9V59OnngB4eDHLPAoiYX.C1X3mF/kok9MWr2', 'USER',   true),
('Camila Silva',     'camila@eshop.com',   '$2a$10$Tu8jqvRNGmbDwJSR3Q2MIe/xiKQmFVBB24ygdfreHPrIpQ5WFbF/O', 'USER',   true),
('Nicolas Herrera',  'nicolas@eshop.com',  '$2a$10$lKjWjVhSlvZeyfCvsrwUfuw09qwUCJh6lX1Tf0drQPoh/IvtB/k1K', 'USER',   false);

-- ====================== CATEGORIES ==========================
INSERT INTO categories (name, active) VALUES
('Electronica',      true),
('Celulares',        true),
('Laptops',          true),
('Audio',            true),
('Ropa',             true),
('Deportes',         true),
('Hogar',            true),
('Juguetes',         false),
('Libros',           true),
('Accesorios',       true);

-- ======================== MARKS ==============================
INSERT INTO marks (name, active) VALUES
('Samsung',          true),
('Apple',            true),
('Sony',             true),
('Nike',             true),
('LG',               true),
('Lenovo',           true),
('Xiaomi',           true),
('Bose',             true),
('Adidas',           true),
('Philips',          true),
('Generico',         false);

-- ====================== PRODUCTS =============================
-- Electronica
INSERT INTO products (mark_id, name, description, stock, weight, "priceCost", "priceSale", "imagePath") VALUES
(1, 'Samsung Galaxy S24',       'Smartphone Samsung Galaxy S24 128GB',            25, 0.17, 650.00, 899.99, NULL),
(1, 'Samsung Galaxy S24 Ultra', 'Smartphone Samsung Galaxy S24 Ultra 256GB',      15, 0.20, 900.00, 1299.99, NULL),
(2, 'iPhone 15 Pro',            'Apple iPhone 15 Pro 256GB Titanio',              20, 0.19, 850.00, 1199.99, NULL),
(2, 'iPhone 15',                'Apple iPhone 15 128GB',                          30, 0.17, 550.00, 799.99, NULL),
(7, 'Xiaomi Redmi Note 13',     'Xiaomi Redmi Note 13 128GB',                     40, 0.18, 180.00, 299.99, NULL);

-- Laptops
INSERT INTO products (mark_id, name, description, stock, weight, "priceCost", "priceSale", "imagePath") VALUES
(2, 'MacBook Air M2',           'Apple MacBook Air M2 13 pulgadas 256GB',         10, 1.24, 850.00, 1199.99, NULL),
(6, 'Lenovo IdeaPad 3',         'Lenovo IdeaPad 3 Intel i5 8GB RAM 256GB SSD',    18, 1.65, 400.00, 599.99, NULL),
(5, 'LG Gram 17',               'LG Gram 17 pulgadas Intel i7 16GB RAM',           8, 1.35, 900.00, 1399.99, NULL);

-- Audio
INSERT INTO products (mark_id, name, description, stock, weight, "priceCost", "priceSale", "imagePath") VALUES
(3, 'Sony WH-1000XM5',         'Audifonos Sony WH-1000XM5 Noise Cancelling',     22, 0.25, 250.00, 349.99, NULL),
(8, 'Bose QuietComfort 45',    'Audifonos Bose QuietComfort 45',                  12, 0.24, 220.00, 329.99, NULL),
(3, 'Sony SRS-XB100',          'Parlante Bluetooth Sony portatil',                35, 0.27, 35.00,  59.99,  NULL),
(10, 'Philips SHP9500',         'Audifonos Philips gaming abierto',                18, 0.32, 50.00,  89.99,  NULL);

-- Ropa / Deportes
INSERT INTO products (mark_id, name, description, stock, weight, "priceCost", "priceSale", "imagePath") VALUES
(4, 'Nike Air Max 90',          'Zapatillas Nike Air Max 90 original',             30, 0.80, 60.00,  129.99, NULL),
(9, 'Adidas Ultraboost',        'Zapatillas Adidas Ultraboost running',            25, 0.75, 70.00,  159.99, NULL),
(4, 'Nike Dri-FIT Camiseta',    'Camiseta deportiva Nike Dri-FIT',                 50, 0.20, 12.00,  34.99,  NULL),
(9, 'Adidas Classic Logo',      'Polera Adidas con logo clasico',                 45, 0.18, 10.00,  29.99,  NULL),
(4, 'Nike Tech Fleece Jogger',  'Pantalon Nike Tech Fleece',                       20, 0.40, 35.00,  79.99,  NULL);

-- Hogar
INSERT INTO products (mark_id, name, description, stock, weight, "priceCost", "priceSale", "imagePath") VALUES
(10, 'Philips Hue Starter Kit',  'Kit inicial Philips Hue 3 luces inteligentes',   15, 0.60, 80.00,  139.99, NULL),
(5, 'LG Smart TV 55"',          'Televisor LG Smart TV 55 pulgadas 4K',            6, 14.50, 350.00, 549.99, NULL),
(10, 'Philips Airfryer XXL',    'Freidora de aire Philips XXL',                    10, 7.50, 120.00, 199.99, NULL);

-- Accesorios
INSERT INTO products (mark_id, name, description, stock, weight, "priceCost", "priceSale", "imagePath") VALUES
(1, 'Cargador Samsung 25W',     'Cargador rapido Samsung 25W USB-C',              60, 0.05, 8.00,   19.99,  NULL),
(2, 'AirPods Pro 2',            'Apple AirPods Pro 2 con cancelacion de ruido',   18, 0.04, 150.00, 249.99, NULL),
(7, 'Xiaomi Mi Band 8',         'Pulsera inteligente Xiaomi Mi Band 8',           35, 0.03, 20.00,  39.99,  NULL),
(3, 'Sony DualSense PS5',       'Mando inalambrico Sony DualSense para PS5',      22, 0.28, 40.00,  69.99,  NULL),
(10, 'Philips Electric Toothbrush', 'Cepillo electrico Philips Sonicare',          28, 0.30, 25.00,  49.99,  NULL);

-- =================== PRODUCT_CATEGORIES =====================
-- Samsung Galaxy S24 (id=1) -> Electronica(1), Celulares(2)
INSERT INTO product_categories (product_id, category_id) VALUES (1, 1), (1, 2);
-- Samsung Galaxy S24 Ultra (id=2) -> Electronica(1), Celulares(2)
INSERT INTO product_categories (product_id, category_id) VALUES (2, 1), (2, 2);
-- iPhone 15 Pro (id=3) -> Electronica(1), Celulares(2), Accesorios(10)
INSERT INTO product_categories (product_id, category_id) VALUES (3, 1), (3, 2), (3, 10);
-- iPhone 15 (id=4) -> Electronica(1), Celulares(2)
INSERT INTO product_categories (product_id, category_id) VALUES (4, 1), (4, 2);
-- Xiaomi Redmi Note 13 (id=5) -> Electronica(1), Celulares(2)
INSERT INTO product_categories (product_id, category_id) VALUES (5, 1), (5, 2);
-- MacBook Air M2 (id=6) -> Electronica(1), Laptops(3)
INSERT INTO product_categories (product_id, category_id) VALUES (6, 1), (6, 3);
-- Lenovo IdeaPad 3 (id=7) -> Electronica(1), Laptops(3)
INSERT INTO product_categories (product_id, category_id) VALUES (7, 1), (7, 3);
-- LG Gram 17 (id=8) -> Electronica(1), Laptops(3)
INSERT INTO product_categories (product_id, category_id) VALUES (8, 1), (8, 3);
-- Sony WH-1000XM5 (id=9) -> Electronica(1), Audio(4)
INSERT INTO product_categories (product_id, category_id) VALUES (9, 1), (9, 4);
-- Bose QC45 (id=10) -> Electronica(1), Audio(4)
INSERT INTO product_categories (product_id, category_id) VALUES (10, 1), (10, 4);
-- Sony SRS-XB100 (id=11) -> Electronica(1), Audio(4)
INSERT INTO product_categories (product_id, category_id) VALUES (11, 1), (11, 4);
-- Philips SHP9500 (id=12) -> Electronica(1), Audio(4)
INSERT INTO product_categories (product_id, category_id) VALUES (12, 1), (12, 4);
-- Nike Air Max 90 (id=13) -> Ropa(5), Deportes(6)
INSERT INTO product_categories (product_id, category_id) VALUES (13, 5), (13, 6);
-- Adidas Ultraboost (id=14) -> Ropa(5), Deportes(6)
INSERT INTO product_categories (product_id, category_id) VALUES (14, 5), (14, 6);
-- Nike Dri-FIT (id=15) -> Ropa(5), Deportes(6)
INSERT INTO product_categories (product_id, category_id) VALUES (15, 5), (15, 6);
-- Adidas Classic (id=16) -> Ropa(5)
INSERT INTO product_categories (product_id, category_id) VALUES (16, 5);
-- Nike Tech Fleece (id=17) -> Ropa(5), Deportes(6)
INSERT INTO product_categories (product_id, category_id) VALUES (17, 5), (17, 6);
-- Philips Hue (id=18) -> Hogar(7), Electronica(1)
INSERT INTO product_categories (product_id, category_id) VALUES (18, 7), (18, 1);
-- LG Smart TV (id=19) -> Hogar(7), Electronica(1)
INSERT INTO product_categories (product_id, category_id) VALUES (19, 7), (19, 1);
-- Philips Airfryer (id=20) -> Hogar(7)
INSERT INTO product_categories (product_id, category_id) VALUES (20, 7);
-- Cargador Samsung (id=21) -> Accesorios(10), Electronica(1)
INSERT INTO product_categories (product_id, category_id) VALUES (21, 10), (21, 1);
-- AirPods Pro 2 (id=22) -> Accesorios(10), Audio(4), Electronica(1)
INSERT INTO product_categories (product_id, category_id) VALUES (22, 10), (22, 4), (22, 1);
-- Xiaomi Mi Band 8 (id=23) -> Accesorios(10), Electronica(1)
INSERT INTO product_categories (product_id, category_id) VALUES (23, 10), (23, 1);
-- Sony DualSense (id=24) -> Accesorios(10), Electronica(1)
INSERT INTO product_categories (product_id, category_id) VALUES (24, 10), (24, 1);
-- Philips Toothbrush (id=25) -> Hogar(7)
INSERT INTO product_categories (product_id, category_id) VALUES (25, 7);

-- ========================= CARTS =============================
-- Carrito de Maria (user_id=2)
INSERT INTO carts (creation_date, "subTotal") VALUES
('2025-08-01 10:30:00', 2149.98);
-- Carrito de Carlos (user_id=3)
INSERT INTO carts (creation_date, "subTotal") VALUES
('2025-08-02 14:15:00', 599.99);
-- Carrito de Ana (user_id=4)
INSERT INTO carts (creation_date, "subTotal") VALUES
('2025-08-03 09:00:00', 0.00);

-- ====================== CART_ITEMS ===========================
-- Carrito 1 (Maria): 2x iPhone 15 Pro + 1x AirPods Pro 2
INSERT INTO cart_items (cart_id, product_id, cant, "subTotal") VALUES
(1, 3,  2, 2399.98),
(1, 22, 1, 249.99);
-- Carrito 2 (Carlos): 1x Lenovo IdeaPad 3
INSERT INTO cart_items (cart_id, product_id, cant, "subTotal") VALUES
(2, 7, 1, 599.99);
-- Carrito 3 (Ana): vacio
