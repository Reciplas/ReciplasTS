-- base de datos siguiendo el enfoque "personas". Este enfoque sale un poco de lo convencional, de la teoria, ya que no se permitiran eliminar entidades fuertes si hay registros apuntando a la entidad dicha. Esto permitirá llevar un mejor seguimiento de las facturas, pedidos, etc. 
-- Ejemplo de porque conviene en este Caso:
-- Si eliminamos un cliente, segun la teoria, deberiamos eliminar las entidades debiles que apunten a la misma pero esto borraria de todos los registros y no dejaria un seguimiento de los pedidos, ventas, etc  de este cliente. Esto afectaria a los balances contable, seguimiento de stock, etc. 

CREATE TABLE Organizacion (
    id INTEGER AUTO_INCREMENT, 
    nombre VARCHAR(200),
    estado VARCHAR(20)  DEFAULT 'habilitado',
    createdAt DATE,
    updatedAt DATE,
    PRIMARY KEY (id)
);

CREATE TABLE Persona (
    id INTEGER AUTO_INCREMENT,
    nombre VARCHAR(80),
    celular INTEGER,
    celular_alt INTEGER,
    email VARCHAR(60),
    createdAt DATE,
    updatedAt DATE,
    estado VARCHAR(20)  DEFAULT 'habilitado',
    PRIMARY KEY (id)
);

CREATE TABLE Relaciones (
    organizacion_id INTEGER,
    persona_id INTEGER,
    tipo VARCHAR(30),
    desde DATE,
    hasta DATE,
    estado VARCHAR(20)  DEFAULT 'habilitado',
    createdAt DATE,
    updatedAt DATE,
    PRIMARY KEY(organizacion_id, persona_id),
    FOREIGN KEY (organizacion_id) REFERENCES Organizacion(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (persona_id) REFERENCES Persona(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
CREATE TABLE Provincia(
    id INTEGER AUTO_INCREMENT, 
    nombre VARCHAR(200),
    cod VARCHAR(10),
    createdAt DATE,
    updatedAt DATE,
    estado VARCHAR(20)  DEFAULT 'habilitado',
    PRIMARY KEY (id)
);


CREATE TABLE Localidad (
    cod_postal INTEGER, 
    provincia_id INTEGER NOT NULL,
    nombre VARCHAR(200),
    createdAt DATE,
    updatedAt DATE,
    estado VARCHAR(20)  DEFAULT 'habilitado',
    PRIMARY KEY (cod_postal),
    FOREIGN KEY (provincia_id) REFERENCES Provincia(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE TABLE Direccion (
    id INTEGER AUTO_INCREMENT, 
    localidad_id INTEGER NOT NULL, 
    persona_id INTEGER NOT NULL,
    tipo VARCHAR(30),
    barrio VARCHAR(50),
    calle VARCHAR(50),
    numero INTEGER, 
    piso INTEGER, 
    depto INTEGER, 
    telefono INTEGER,
    telefono_alt INTEGER,
    createdAt DATE,
    updatedAt DATE,
    estado VARCHAR(20)  DEFAULT 'habilitado',
    PRIMARY KEY (id),
    FOREIGN KEY (localidad_id) REFERENCES Localidad(cod_postal)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (persona_id) REFERENCES Persona(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);


CREATE TABLE Empleado (
    id INTEGER AUTO_INCREMENT,
    persona_id INTEGER NOT NULL, 
    salario DECIMAL(10, 2),
    area VARCHAR(255),
    cargo VARCHAR(100),
    fec_nac DATE,
    createdAt DATE,
    updatedAt DATE,
    estado VARCHAR(20)  DEFAULT 'habilitado',
    PRIMARY KEY (id),
    FOREIGN KEY (persona_id) REFERENCES Persona(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE TABLE Proveedor (
    id INTEGER AUTO_INCREMENT,
    persona_id INTEGER NOT NULL, 
    razon_social VARCHAR(255),
    nombre_fantasia VARCHAR(100),
    cuit INTEGER,
    createdAt DATE,
    updatedAt DATE,
    estado VARCHAR(20)  DEFAULT 'habilitado',
    PRIMARY KEY (id),
    FOREIGN KEY (persona_id) REFERENCES Persona(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE TABLE Cliente (
    id INTEGER AUTO_INCREMENT,
    persona_id INTEGER NOT NULL, 
    razon_social VARCHAR(255),
    cuit INTEGER,
    fec_nac DATE,
    createdAt DATE,
    updatedAt DATE,
    estado VARCHAR(20)  DEFAULT 'habilitado',
    PRIMARY KEY (id),
    FOREIGN KEY (persona_id) REFERENCES Persona(id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

CREATE TABLE pedido (
    id INTEGER AUTO_INCREMENT,
    cliente_id INTEGER,
    empleado_id INTEGER,
    direccion_id INTEGER,
    -- estado del pedido, el traking, no si esta habilitado o deshabilitado
    total FLOAT,
    estado VARCHAR(50),
    observacion VARCHAR(255),
    createdAt DATE,
    updatedAt DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (empleado_id) REFERENCES Empleado(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (direccion_id) REFERENCES Direccion(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
CREATE TABLE Linea_pedido (
    id INTEGER AUTO_INCREMENT,
    pedido_id INTEGER NOT NULL,
    cantidad INTEGER,
    producto_id INTEGER,
    precio_unit FLOAT,
    PRIMARY KEY (id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE Factura (
    id INTEGER AUTO_INCREMENT,
    cliente_id INTEGER NOT NULL,
    tipo_iva VARCHAR(20),
    total_iva FLOAT,
    total FLOAT,
    createdAt DATE,
    updatedAt DATE,
    -- estado del pedido, el traking, no si esta habilitado o deshabilitado
    estado VARCHAR(50),
    observacion VARCHAR(255),
    
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);


CREATE TABLE Producto (
  id INTEGER AUTO_INCREMENT,
  nombre VARCHAR(100),
  descripcion VARCHAR(150),
  presentacion VARCHAR(100),
  stock INTEGER,
  stock_inf INTEGER,
  precio FLOAT,
  PRIMARY KEY (id)
);
CREATE TABLE Provee (
  proveedor_id INTEGER,
  producto_id INTEGER,
  PRIMARY KEY (proveedor_id, producto_id ),
  FOREIGN KEY (proveedor_id) REFERENCES Proveedor(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
  FOREIGN KEY (producto_id) REFERENCES Producto(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

