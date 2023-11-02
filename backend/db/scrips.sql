CREATE TABLE Cliente (
  id INTEGER AUTO_INCREMENT,
  nombres VARCHAR(80),
  apellido VARCHAR(60),
  dni INTEGER,
  fec_nac DATE,
  celular INTEGER,
  celular_alt INTEGER,
  email VARCHAR(60),
  direccion VARCHAR(150),
  fecha_creacion DATE DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATE,
  estado VARCHAR(20)  DEFAULT 'True',
  PRIMARY KEY (id)
);
CREATE TABLE Proveedor (
  id INTEGER AUTO_INCREMENT,
  razon_social VARCHAR(255),
  nombre_fantasia VARCHAR(100),
  cuit INTEGER,
  celular INTEGER,
  celular_alt INTEGER,
  email VARCHAR(60),
  direccion VARCHAR(150),
  fecha_creacion DATE DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATE,
  estado VARCHAR(20)  DEFAULT 'True',
  PRIMARY KEY (id)
);
CREATE TABLE Empleado (
  id INTEGER AUTO_INCREMENT,
  nombre VARCHAR(80),
  apellido VARCHAR(60),
  dni INTEGER,
  fec_nac DATE,
  celular INTEGER,
  celular_alt INTEGER,
  email VARCHAR(60),
  direccion VARCHAR(150),
  salario DECIMAL(10,2),
  area VARCHAR(255),
  cargo VARCHAR(100),
  desde DATE,
  hasta DATE,
  fecha_creacion DATE DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATE,
  estado VARCHAR(20)  DEFAULT 'True',
  PRIMARY KEY (id)
);

CREATE TABLE MateriaPrima (
  id INTEGER AUTO_INCREMENT,
  plastico VARCHAR(100),
  descripcion VARCHAR(150),
  presentacion VARCHAR(100),
  stock_act INTEGER,
  stock_inf INTEGER,
  precio DECIMAL(12, 2),
  fecha_creacion DATE DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATE,
  PRIMARY KEY (id)
);

CREATE TABLE Proveen (
  proveedor_id INTEGER,
  materia_prima_id INTEGER,
  PRIMARY KEY(proveedor_id, materia_prima_id),
  FOREIGN KEY (proveedor_id) REFERENCES Proveedor(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (materia_prima_id) REFERENCES MateriaPrima(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Ingresos (
  id INTEGER AUTO_INCREMENT,
  fecha DATE,
  total DECIMAL(12, 2),
  fecha_creacion DATE DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATE,
  estado VARCHAR(10),
  PRIMARY KEY(id)
);

CREATE TABLE Ingresan (
  ingreso_id INTEGER,
  materia_prima_id INTEGER,
  cantidad INTEGER,
  precio DECIMAL(12, 2),
  descripcion VARCHAR(150),
  PRIMARY KEY (ingreso_id, materia_prima_id),
  FOREIGN KEY (ingreso_id) REFERENCES Ingresos(id)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  FOREIGN KEY (materia_prima_id) REFERENCES MateriaPrima(id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE Producto (
  id INTEGER AUTO_INCREMENT,
  nombre VARCHAR(100),
  descripcion VARCHAR(150),
  presentacion VARCHAR(100),
  lote INTEGER,
  stock_act INTEGER,
  stock_inf INTEGER,
  precio DECIMAL(12, 2),
  fecha_produccion DATE,
  fecha_creacion DATE DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATE,
  estado VARCHAR(20)  DEFAULT 'True',
  PRIMARY KEY (id)
);

CREATE TABLE Producen (
  empleado_id INTEGER,
  producto_id INTEGER,
  cantidad INTEGER,
  precio DECIMAL(12, 2),
  descripcion VARCHAR(150),
  PRIMARY KEY (empleado_id, producto_id),
  FOREIGN KEY (empleado_id) REFERENCES Empleado(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (producto_id) REFERENCES Producto(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Compra (
  id INTEGER AUTO_INCREMENT,
  cliente_id INTEGER NOT NULL,
  empleado_id INTEGER NOT NULL,
  total DECIMAL(12, 2),
  observacion VARCHAR(255),
  fecha_creacion DATE DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATE,
  -- estado del pedido, el traking, no si esta True o desTrue
  estado VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (empleado_id) REFERENCES Empleado(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

CREATE TABLE Registra (
  empleado_id INTEGER,
  compra_id INTEGER,
  PRIMARY KEY(empleado_id, compra_id),
  FOREIGN KEY (empleado_id) REFERENCES Empleado(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (compra_id) REFERENCES Compra(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
CREATE TABLE Pedido (
  id INTEGER AUTO_INCREMENT,
  compra_id INTEGER NOT NULL,
  observacion VARCHAR(255),
  fecha_creacion DATE DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATE,
  -- estado del pedido, el traking, no si esta True o desTrue
  estado VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (compra_id) REFERENCES Compra(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE LineaDetalle (
  pedido_id INTEGER NOT NULL,
  producto_id INTEGER NOT NULL,
  cantidad INTEGER,
  precio DECIMAL(12, 2),
  PRIMARY KEY (pedido_id,producto_id),
  FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (producto_id) REFERENCES Producto(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);





