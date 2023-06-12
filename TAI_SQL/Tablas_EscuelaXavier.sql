CREATE TABLE Mutantes(
	PK_Alumno SERIAL PRIMARY KEY,
	Nombre VARCHAR,
	Edad INT,
	Poderes VARCHAR,
	Genero VARCHAR,
	Fecha_Ingreo DATE
);

CREATE TABLE Presentaciones(
	PK_Present SERIAL PRIMARY KEY,
	Nombre VARCHAR,
	Fecha_Org DATE,
	Cantidad INTEGER
);