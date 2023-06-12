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
	Tipo_Clase	clase
);
