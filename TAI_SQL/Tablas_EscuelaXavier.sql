CREATE TABLE Mutantes(
	PK_Alumno SERIAL PRIMARY KEY,
	Nombre VARCHAR,
	Edad INT,
	Poderes VARCHAR,
	Genero VARCHAR,
	Fecha_Ingreso DATE
);

CREATE TABLE Presentaciones(
	PK_Present SERIAL PRIMARY KEY,
	Nombre VARCHAR,
	Fecha_Org DATE,
	Cantidad INTEGER
);
CREATE TYPE clase AS ENUM (
	'Privada',
	'Grupo'
);

CREATE TABLE Clases(
	PK_Clases SERIAL PRIMARY KEY,
	Nombre VARCHAR,
	Hora_Inicio TIME,
	Hora_Salida TIME,
	Tipo_Clase clase
);

CREATE TABLE Maestros(
	PK_Maestros SERIAL PRIMARY KEY,
	Nombre VARCHAR,
	Edad INT,
	Estudios VARCHAR
);

CREATE TABLE MedioTiempo(
	Pago INT,
	Hora_Entrada TIME,
	Hora_Salida TIME
)INHERITS (Maestros);

CREATE TABLE TiempoCompleto(
	Pago_Fijo INT,
	Fecha_Inicio TIMESTAMP
)INHERITS (Maestros);
