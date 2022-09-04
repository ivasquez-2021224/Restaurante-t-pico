Drop database if exists CafeteriaAntojitos;
Create database CafeteriaAntojitos;

use CafeteriaAntojitos;

Create table Clientes(
	codigoCliente int not null auto_increment,
    DPICliente varchar(13) not null,
    nombresCliente varchar(200) not null,
    direccionCliente varchar(150) not null,
    telefonoCliente varchar(10) not null,
    primary key PK_codigoCliente (codigoCliente)
);

Create table Categorias(
	codigoCategoria int not null auto_increment,
    nombreCategoria varchar(150) not null,
    descripcionCategoria varchar(200) not null,
    primary key PK_codigoCategoria (codigoCategoria)
);

Create table Proveedores(
	codigoProveedor int not null auto_increment,
    nombresProveedor varchar(150) not null,
    direccion varchar(150) not null,
    telefono varchar(10) not null,
    primary key PK_codigoProveedor (codigoProveedor)
);

Create table cargo(
	codigoCargo int not null auto_increment,
    tipoCargo varchar(100) not null,
    primary key PK_codigoCargo (codigoCargo)
);

Create table Sucursal(
	codigoSucursal int not null auto_increment,
    nombreSucursal varchar(150) not null,
    direccion varchar(150) not null,
    primary key PK_codigoSucursal (codigoSucursal)
);

Create table Marcas(
	codigoMarca int not null auto_increment,
    nombreMarca varchar(200),
    codigoProveedor int not null,
    primary key PK_codigoMarca (codigoMarca),
	constraint FK_Marcas_Proveedores foreign key (codigoProveedor)
		references Proveedores(codigoProveedor)    
);

Create table Productos(
	codigoProducto int not null auto_increment,
	nombreProdcuto varchar(200) not null,
    precio double not null,
    stock int not null,
    codigoMarca int not null,
    codigoCategoria int not null,
    primary key PK_codigoProducto (codigoProducto),
    constraint FK_Productos_Marcas foreign key (codigoMarca)
		references Marcas(codigoMarca),
	constraint FK_Productos_Categorias foreign key (codigoCategoria)
		references Categorias(codigoCategoria)
);

Create table Empleados(
	codigoEmpleado int not null auto_increment,
    DPIEmpleado varchar(13) not null,
    nombresEmpleado varchar(200) not null,
    telefonoEmpleado varchar(10) not null,
    usuario varchar(100),
    codigoCargo int not null,
    codigoSucursal int not null,
    primary key PK_codigoEmpleado (codigoEmpleado),
    constraint FK_Empleados_Cargo foreign key (codigoCargo)
		references Cargo(codigoCargo),
	constraint FK_Empleados_Sucursal foreign key (codigoSucursal)
		references Sucursal(codigoSucursal)
);

Create table Ventas(
	codigoVenta int not null auto_increment,
    fecha date not null,
    monto double not null,
    numeroSerie varchar(15),
    codigoCliente int not null,
    codigoEmpleado int not null,
    primary key PK_codigoVenta (codigoVenta),
    constraint FK_Ventas_Clientes foreign key (codigoCliente)
		references Clientes(codigoCliente),
	constraint FK_codigoVenta_Empleados foreign key (codigoEmpleado)
		references Empleados(codigoEmpleado)
);

Create table DetalleVenta(
	codigoDetalleVenta int not null auto_increment,
    cantidad int not null,
    precio double not null,
    codigoProducto int not null,
    codigoVenta int not null,
    primary key PK_codigoDetalleVenta (codigoDetalleVenta),
    constraint FK_DetalleVenta_Productos foreign key (codigoProducto)
		references Productos(codigoProducto),
	constraint FK_DetalleVenta_Ventas foreign key (codigoVenta)
		references Ventas(codigoVenta)
);

insert into Clientes (DPICliente, nombresCliente, direccionCliente, telefonoCliente) 
	values ('5854758589523', 'Pedro Armas', '3ra av 11-05 zona 4 Guatemala', '85787896');
insert into Clientes (DPICliente, nombresCliente, direccionCliente, telefonoCliente) 
	values ('8547574858565', 'Alexander Alessandro', '5ta av 12-10 zona 14 Guatemala', '85685475');
insert into Clientes (DPICliente, nombresCliente, direccionCliente, telefonoCliente) 
	values ('5857856896585', 'Pablo Diaz', '7ma av 18-02 zona 6 Tecpan', '58965845');
insert into Clientes (DPICliente, nombresCliente, direccionCliente, telefonoCliente) 
	values ('2547858965856', 'Estuardo Gomez', '2da av 20-45 zona 2 Amatitlan', '54214585');
insert into Clientes (DPICliente, nombresCliente, direccionCliente, telefonoCliente) 
	values ('5232415214520', 'Antonio Garcia', '4ta av 15-20 zona 5Villanueva', '85696325');

select * from Clientes;

insert into Categorias (nombreCategoria, descripcionCategoria) 
	values ('Desayunos', 'Huevos con Frijoles acompañado de Platanos con crema y Tocino.');
insert into Categorias (nombreCategoria, descripcionCategoria) 
	values ('Almuerzo', 'Pollo asado con arroz y ensalada.');
insert into Categorias (nombreCategoria, descripcionCategoria) 
	values ('Cena', 'Huevos con frijoles volteados y 3/4 de puyaso');
insert into Categorias (nombreCategoria, descripcionCategoria) 
	values ('Postres', 'Pastelitos, Donas, Empanadas y Panitos dulces');
insert into Categorias (nombreCategoria, descripcionCategoria) 
	values ('Bebidas', 'Cocacola, Sprit, Cafe frio, Capuchino, Cafe con leche y Agua');
    
select * from Categorias;
    
insert into Proveedores (nombresProveedor, direccion, telefono) 
	values ('Sarita', '30av 9-90 zona 12 Pamplona Guatemala', '54534354');
insert into Proveedores (nombresProveedor, direccion, telefono) 
	values ('Cocacola', 'Zona 7 col landivar Guatemala', '65879547');
insert into Proveedores (nombresProveedor, direccion, telefono) 
	values ('Granja Azul', 'Camino Aldea Las Trojes, Amatitlán', '85475412');
insert into Proveedores (nombresProveedor, direccion, telefono) 
	values ('Patsy', 'Av la Reforma 2da calle Guatemala', '85689854');
insert into Proveedores (nombresProveedor, direccion, telefono) 
	values ('Starbucks', 'Zona 9 Guatemala', '45878547');
    
select * from Proveedores;
    
insert into Cargo (tipoCargo) 
	values ('Gerente');
insert into Cargo (tipoCargo) 
	values ('Mesero');
insert into Cargo (tipoCargo) 
	values ('Cajero');
insert into Cargo (tipoCargo) 
	values ('Cocinero');
insert into Cargo (tipoCargo) 
	values ('Repartidor');
    
select * from Cargo;
    
insert into Sucursal (nombreSucursal, direccion) 
	values ('Cafeteria Antojitos Landivar', 'Zona 7 3ra Calle 12-05');
insert into Sucursal (nombreSucursal, direccion) 
	values ('Cafeteria Antojitos Amatitlam', 'Zona 5 2da Calle 05-12');
insert into Sucursal (nombreSucursal, direccion) 
	values ('Cafeteria Antojitos Kinal', 'Zona 7 Guatemala');
insert into Sucursal (nombreSucursal, direccion) 
	values ('Cafeteria Antojitos La Reforma', 'Zona 7 8va Calle 22-30');
insert into Sucursal (nombreSucursal, direccion) 
	values ('Cafeteria Antojitos Villa nueva', 'Zona 18 9na Calle 14-90');
    
select * from Sucursal;

insert into Marcas (nombreMarca, codigoProveedor) 
	values ('Pops', '1');
insert into Marcas (nombreMarca, codigoProveedor) 
	values ('Doña Lupe', '2');
insert into Marcas (nombreMarca, codigoProveedor) 
	values ('Sonrisas', '3');
insert into Marcas (nombreMarca, codigoProveedor) 
	values ('Delipostres', '4');
insert into Marcas (nombreMarca, codigoProveedor) 
	values ('La granja', '5');
    
select * from Marcas;
    
insert into Productos (nombreProdcuto, precio, stock, codigoMarca, codigoCategoria) 
	values ('Huevos Rancheros', '900.00', '30', '1', '1');
insert into Productos (nombreProdcuto, precio, stock, codigoMarca, codigoCategoria) 
	values ('Divorciados', '500.00', '20', '2', '2');
insert into Productos (nombreProdcuto, precio, stock, codigoMarca, codigoCategoria) 
	values ('Pollo en Crema', '450.00', '30', '3', '3');
insert into Productos (nombreProdcuto, precio, stock, codigoMarca, codigoCategoria) 
	values ('Costilla', '1500.00', '25', '4', '4');
insert into Productos (nombreProdcuto, precio, stock, codigoMarca, codigoCategoria) 
	values ('Pastelitos', '500.00', '50', '5', '5');
    
select * from Productos;

insert into Empleados (DPIEmpleado, nombresEmpleado, telefonoEmpleado, usuario, codigoCargo, codigoSucursal) 
	values ('2547856589589', 'Angel Villanueva', '54747858', 'avillanueva', '1', '1');
insert into Empleados (DPIEmpleado, nombresEmpleado, telefonoEmpleado, usuario, codigoCargo, codigoSucursal) 
	values ('5889658568965', 'Patrick Villatoro', '58547478', 'pvillatoro', '2', '2');
insert into Empleados (DPIEmpleado, nombresEmpleado, telefonoEmpleado, usuario, codigoCargo, codigoSucursal) 
	values ('4585896589658', 'Marcelino vasquez', '54747859', 'mvasquez', '3', '3');
insert into Empleados (DPIEmpleado, nombresEmpleado, telefonoEmpleado, usuario, codigoCargo, codigoSucursal) 
	values ('1254785545856', 'Eduardo Salazar', '54789652', 'dsalazar', '4', '4');
insert into Empleados (DPIEmpleado, nombresEmpleado, telefonoEmpleado, usuario, codigoCargo, codigoSucursal) 
	values ('3256589658658', 'Allan Xiquin', '45748547', 'axiquin', '5', '5');
    
select * from Empleados;
    
insert into Ventas (fecha, monto, numeroSerie, codigoCliente, codigoEmpleado) 
	values ('2022-09-02', '80.00', '011', '1', '1');
insert into Ventas (fecha, monto, numeroSerie, codigoCliente, codigoEmpleado) 
	values ('2022-09-01', '80.00', '012', '2', '2');
insert into Ventas (fecha, monto, numeroSerie, codigoCliente, codigoEmpleado) 
	values ('2022-07-03', '90.00', '013', '3', '3');
insert into Ventas (fecha, monto, numeroSerie, codigoCliente, codigoEmpleado) 
	values ('2022-08-04', '100.00', '014', '4', '4');
insert into Ventas (fecha, monto, numeroSerie, codigoCliente, codigoEmpleado) 
	values ('2022-08-05', '50.00', '015', '5', '5');
    
select * from Ventas;

insert into DetalleVenta (cantidad, precio, codigoProducto, codigoVenta) 
	values ('40', '30.00', '1', '1');
insert into DetalleVenta (cantidad, precio, codigoProducto, codigoVenta) 
	values ('30', '30.00', '2', '2');
insert into DetalleVenta (cantidad, precio, codigoProducto, codigoVenta) 
	values ('20', '25.00', '3', '3');
insert into DetalleVenta (cantidad, precio, codigoProducto, codigoVenta) 
	values ('25', '40.00', '4', '4');
insert into DetalleVenta (cantidad, precio, codigoProducto, codigoVenta) 
	values ('40', '10.00', '5', '5');

select * from DetalleVenta;