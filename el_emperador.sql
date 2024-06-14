create database el_emperador;

CREATE TABLE Usuarios (
id_usuario INT auto_increment Primary Key,
nombre VARCHAR (100),
correo_electronico VARCHAR (100) UNIQUE,
contraseña VARCHAR (255),
rol ENUM ('empleado', 'administrador')
);

CREATE TABLE Mesas (
id_mesa INT auto_increment primary key,
numero_mesa INT,
estado ENUM ('libre', 'ocupada', 'fuera de servicio')
);

CREATE TABLE Menu (
id_menu INT auto_increment primary Key,
nombre VARCHAR (100),
descripcion TEXT,
precio DECIMAL (10,2),
categoria ENUM ('Desayuno/Meriendas', 'Cafeteria', 'Acompañamiento', 'Bebudas', 'Picadas', 'Pizzas/Empanadas'),
disponibilidad BOOLEAN
);

CREATE TABLE Pedidos (
id_pedido INT auto_increment primary key,
id_mesa INT,
fecha_hora DATETIME,
estado ENUM ('Pendiente', 'En Preparacion', 'Servido', 'Cancelado'),
foreign key (id_mesa) REFERENCES Mesas(id_mesa)
);

CREATE TABLE Detalle_pedido (
id_detalle_pedido INT auto_increment primary key,
id_pedido INT,
id_menu INT,
cantidad INT,
foreign key (id_pedido) REFERENCES Pedidos (id_pedido),
foreign key (id_menu) REFERENCES Menu(id_menu)
);

CREATE TABLE Adicional (
    id_adicional INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Pedido_Adicional (
    id_pedido INT,
    id_adicional INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_pedido, id_adicional),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_adicional) REFERENCES Adicional(id_adicional)
);