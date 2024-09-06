
INSERT INTO departamento (iddepartamento, nombre, coddep) VALUES 
(1, 'Amazonas', 91),
(2, 'Antioquia', 05),
(3, 'Arauca', 81),
(4, 'Atlántico', 08),
(5, 'Bolívar', 13),
(6, 'Boyacá', 15),
(7, 'Caldas', 17),
(8, 'Caquetá', 18),
(9, 'Casanare', 85),
(10, 'Cauca', 19),
(11, 'Cesar', 20),
(12, 'Chocó', 27),
(13, 'Córdoba', 23),
(14, 'Cundinamarca', 25),
(15, 'Guainía', 94),
(16, 'Guaviare', 95),
(17, 'Huila', 41),
(18, 'La Guajira', 44),
(19, 'Magdalena', 47),
(20, 'Meta', 50),
(21, 'Nariño', 52),
(22, 'Norte de Santander', 54),
(23, 'Putumayo', 86),
(24, 'Quindío', 63),
(25, 'Risaralda', 66),
(26, 'San Andrés y Providencia', 88),
(27, 'Santander', 68),
(28, 'Sucre', 70),
(29, 'Tolima', 73),
(30, 'Valle del Cauca', 76),
(31, 'Vaupés', 97),
(32, 'Vichada', 99);

INSERT INTO ciudad (idciudad, iddepartamento, nombre, codciudad) VALUES 
(1, 5, 'Medellín', 05001),        -- Antioquia
(2, 5, 'Bello', 05088),           -- Antioquia
(3, 5, 'Itagüí', 05360),          -- Antioquia
(4, 8, 'Barranquilla', 08001),    -- Atlántico
(5, 8, 'Soledad', 08758),         -- Atlántico
(6, 13, 'Cartagena', 13001),      -- Bolívar
(7, 15, 'Tunja', 15001),          -- Boyacá
(8, 15, 'Duitama', 15087),        -- Boyacá
(9, 11, 'Valledupar', 20001),     -- Cesar
(10, 25, 'Bogotá', 11001),        -- Cundinamarca (Distrito Capital)
(11, 27, 'Quibdó', 27001);       -- Chocó

INSERT INTO cliente (idcliente, idciudad, nombre, apellido) VALUES 
(1, 1, 'Juan', 'Pérez'),        -- Medellín
(2, 4, 'Ana', 'Gómez'),         -- Barranquilla
(3, 6, 'Carlos', 'Rodríguez'),  -- Cartagena
(4, 7, 'Luisa', 'Martínez'),    -- Tunja
(5, 10, 'Andrés', 'López');     -- Bogotá


INSERT INTO categoria (idCategoria, nombre, impuesto) VALUES 
(1, 'Electrónica', 19.0),
(2, 'Alimentos', 5.0),
(3, 'Ropa', 12.0),
(4, 'Bebidas', 16.0),
(5, 'Medicamentos', 0.0),
(6, 'Juguetes', 8.0),
(7, 'Libros', 0.0),
(8, 'Muebles', 18.0),
(9, 'Automóviles', 19.0),
(10, 'Productos de Belleza', 15.0);


INSERT INTO producto (idProducto, idCategoria, nombre, precio) VALUES 
(1, 1, 'Smartphone', 1200.0),      -- Electrónica
(2, 1, 'Laptop', 2500.0),          -- Electrónica
(3, 2, 'Arroz', 2.5),              -- Alimentos
(4, 2, 'Leche', 1.2),              -- Alimentos
(5, 3, 'Camiseta', 15.0),          -- Ropa
(6, 3, 'Pantalón', 25.0),          -- Ropa
(7, 4, 'Cerveza', 1.8),            -- Bebidas
(8, 4, 'Jugo de Naranja', 2.0),    -- Bebidas
(9, 5, 'Aspirina', 3.0),           -- Medicamentos
(10, 6, 'Muñeca', 20.0);           -- Juguetes



INSERT INTO venta (idVenta, idCliente, fechaventa) VALUES 
(1, 1, '2024-08-01'),  -- Cliente Juan Pérez
(2, 2, '2024-08-02'),  -- Cliente Ana Gómez
(3, 3, '2024-08-03'),  -- Cliente Carlos Rodríguez
(4, 4, '2024-08-04'),  -- Cliente Luisa Martínez
(5, 5, '2024-08-05');  -- Cliente Andrés López

INSERT INTO venta_producto (idproducto, idventa, cantidad) VALUES 
(1, 1, 2),   -- 2 Smartphones en la venta 1
(2, 1, 1),   -- 1 Laptop en la venta 1
(3, 2, 10),  -- 10 Arroz en la venta 2
(4, 2, 5),   -- 5 Leche en la venta 2
(5, 3, 3),   -- 3 Camisetas en la venta 3
(6, 4, 2),   -- 2 Pantalones en la venta 4
(7, 5, 24);  -- 24 Cerveza en la venta 5