--Paquete para poblar la BD
USE rastreo_embarques;

-- Insertar clientes
INSERT INTO clientes (id, nombre, correo, telefono, direccion) VALUES
(1, 'Carlos Pérez', 'carlos.perez@email.com', '555-1234', 'Seattle, WA'),
(2, 'Ana Torres', 'ana.torres@email.com', '555-5678', 'Nueva York, NY'),
(3, 'Luis Ramírez', 'luis.ramirez@email.com', '555-9876', 'Los Ángeles, CA'),
(4, 'María González', 'maria.gonzalez@email.com', '555-4321', 'San Francisco, CA'),
(5, 'José Herrera', 'jose.herrera@email.com', '555-8765', 'Miami, FL');

-- Insertar productos
INSERT INTO productos (id, nombre, imagen_url) VALUES
(1, 'Vino Tinto', 'https://example.com/vino_tinto.jpg'),
(2, 'Whisky', 'https://cde.gestion2.e3.pe/ima/0/0/1/3/7/137314.jpg'),
(3, 'Tequila', 'https://example.com/tequila.jpg'),
(4, 'Ron', 'https://example.com/ron.jpg'),
(5, 'Cerveza Artesanal', 'https://example.com/cerveza.jpg');

-- Insertar envíos (Página Home)
INSERT INTO envios (id, cliente_id, producto_id, cantidad, fecha_envio, destino) VALUES
(1, 1, 1, 10, '2025-03-20 10:00:00', 'Seattle, WA'),
(2, 2, 3, 15, '2025-03-21 12:30:00', 'Nueva York, NY'),
(3, 3, 2, 20, '2025-03-22 15:45:00', 'Los Ángeles, CA'),
(4, 4, 4, 30, '2025-03-23 09:00:00', 'San Francisco, CA'),
(5, 5, 5, 25, '2025-03-24 14:15:00', 'Miami, FL');

-- Insertar estado de envíos (Página Status)
INSERT INTO status_envio (id, envio_id, status, fecha_estimada_llegada, hora_estimada_llegada, modo_transporte) VALUES
(1, 1, 'En tránsito', '2025-03-25', '14:30', 'Avión'),
(2, 2, 'En preparación', '2025-03-26', '16:00', 'Avión'),
(3, 3, 'Entregado', '2025-03-24', '18:00', 'Avión'),
(4, 4, 'En aduana', '2025-03-27', '08:45', 'Barco'),
(5, 5, 'Despachado', '2025-03-28', '12:10', 'Camión');

-- Insertar checkpoints para el historial (Página Historial)
INSERT INTO checkpoints (envio_id, nombre, status, hora, destino) VALUES
-- Envío 1
(1, 'Entrega al aeropuerto', 'Completado', '10:30 AM', 'Aeropuerto JFK'),
(1, 'Despegue', 'Completado', '11:00 AM', 'En vuelo hacia Seattle'),
(1, 'En vuelo', 'Completado', '11:30 AM', 'En vuelo hacia Seattle'),
(1, 'Aterrizando', 'N/I', NULL, 'Aeropuerto SeaTac'),
(1, 'Entregado al cliente', 'N/I', NULL, 'Dirección del cliente'),

-- Envío 2
(2, 'Entrega al aeropuerto', 'Completado', '12:00 PM', 'Aeropuerto LAX'),
(2, 'Despegue', 'Pendiente', NULL, 'Próximo vuelo a Nueva York'),
(2, 'En vuelo', 'N/I', NULL, 'N/I'),
(2, 'Aterrizando', 'N/I', NULL, 'N/I'),
(2, 'Entregado al cliente', 'N/I', NULL, 'N/I'),

-- Envío 3
(3, 'Entrega al aeropuerto', 'Completado', '03:00 PM', 'Aeropuerto CDMX'),
(3, 'Despegue', 'Completado', '03:45 PM', 'En vuelo a Los Ángeles'),
(3, 'En vuelo', 'Completado', '04:30 PM', 'En vuelo a Los Ángeles'),
(3, 'Aterrizando', 'Completado', '05:15 PM', 'Aeropuerto LAX'),
(3, 'Entregado al cliente', 'Completado', '06:00 PM', 'Dirección del cliente'),

-- Envío 4
(4, 'Entrega al puerto', 'Completado', '07:00 AM', 'Puerto de Veracruz'),
(4, 'Embarcado', 'Completado', '08:15 AM', 'En barco hacia San Francisco'),
(4, 'En tránsito', 'En curso', '10:00 AM', 'Océano Pacífico'),
(4, 'Descargando', 'N/I', NULL, 'Puerto de San Francisco'),
(4, 'Entregado al cliente', 'N/I', NULL, 'Dirección del cliente'),

-- Envío 5
(5, 'Despacho desde bodega', 'Completado', '09:30 AM', 'Bodega Central'),
(5, 'Carga en camión', 'Completado', '10:00 AM', 'Ruta a Miami'),
(5, 'En tránsito', 'En curso', '12:30 PM', 'Carretera a Miami'),
(5, 'Descargando', 'N/I', NULL, 'Centro de distribución'),
(5, 'Entregado al cliente', 'N/I', NULL, 'Dirección del cliente');
