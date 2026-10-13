-- PORTAFOLIO: ANALISTA DE BASE DE DATOS
-- Proyecto 1: Simulación bancaria

CREATE DATABASE IF NOT EXISTS portafolio_banca;

USE portafolio_banca;

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    fecha_registro DATE,
    estado VARCHAR(20)
);

INSERT INTO clientes
    (nombre, ciudad, fecha_registro, estado)
VALUES
    ('Ana Torres', 'Lima', '2026-01-15', 'Activo'),
    ('Luis Perez', 'Arequipa', '2026-02-10', 'Activo'),
    ('Maria Rojas', 'Lima', '2026-03-05', 'Inactivo'),
    ('Jose Flores', 'Trujillo', '2026-04-20', 'Activo'),
    ('Rosa Diaz', 'Lima', '2026-05-12', 'Activo');

SELECT * FROM clientes;

use portafolio_banca;

CREATE TABLE cuentas (
    cuenta_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,           -- Aquí estaba el error: decía cliente_id
    tipo_cuenta VARCHAR(30),
    saldo DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)  -- Y aquí también
);

INSERT INTO cuentas (cliente_id, tipo_cuenta, saldo) VALUES
(1, 'Ahorros', 1500.50),
(2, 'Corriente', 3200.00),
(3, 'Ahorros', 800.25),
(4, 'Corriente', 5100.75),
(5, 'Ahorros', 2200.00);

SELECT c.nombre, c.ciudad, cu.tipo_cuenta, cu.saldo
FROM clientes c
JOIN cuentas cu ON c.cliente_id = cu.cliente_id;