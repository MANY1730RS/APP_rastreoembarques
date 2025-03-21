-- Tabla de clientes (propietarios de envíos)
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion TEXT
);

-- Tabla de productos (tipo de licor enviado)
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    imagen_url TEXT
);

-- Tabla de envíos
CREATE TABLE envios (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    destino VARCHAR(255) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Crear los tipos ENUM para status y modo de transporte
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'status_envio_enum') THEN
        CREATE TYPE status_envio_enum AS ENUM ('En preparación', 'En tránsito', 'Entregado');
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'modo_transporte_enum') THEN
        CREATE TYPE modo_transporte_enum AS ENUM ('Avión', 'Barco', 'Camión');
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'status_checkpoint_enum') THEN
        CREATE TYPE status_checkpoint_enum AS ENUM ('Completado', 'Pendiente', 'N/I');
    END IF;
END $$;

-- Tabla de status de envíos
CREATE TABLE status_envio (
    id SERIAL PRIMARY KEY,
    envio_id INT,
    status status_envio_enum NOT NULL,
    fecha_estimada_llegada DATE,
    hora_estimada_llegada TIME,
    modo_transporte modo_transporte_enum NOT NULL,
    FOREIGN KEY (envio_id) REFERENCES envios(id)
);

-- Tabla de checkpoints para el historial de cada envío
CREATE TABLE checkpoints (
    id SERIAL PRIMARY KEY,
    envio_id INT,
    nombre VARCHAR(100) NOT NULL,
    status status_checkpoint_enum DEFAULT 'Pendiente',
    hora TIME DEFAULT NULL,
    destino VARCHAR(255),
    FOREIGN KEY (envio_id) REFERENCES envios(id)
);