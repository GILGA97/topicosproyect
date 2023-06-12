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

CREATE TABLE Clases(
	PK_Clases SERIAL PRIMARY KEY,
	Nombre VARCHAR,
	Hora_Inicio TIME,
	Hora_Salida TIME,
	Tipo_Clase	clase,
	FK_Maestro INT,
	FOREIGN KEY (FK_Maestro) REFERENCES Maestros (PK_Maestros)
);

CREATE TABLE MaestrosPresentaciones(
	FK_Maestros INT,
	FK_Presentaciones INT,
	Fecha_Asist	DATE,
	FOREIGN KEY (FK_Maestros) REFERENCES Maestros (PK_Maestros),
	FOREIGN KEY (FK_Presentaciones) REFERENCES Presentaciones (PK_Present)
);

CREATE TABLE AlumnosPresentaciones(
	FK_Mutantes INT,
	FK_Presentaciones INT,
	Fecha_Asist DATE,
	FOREIGN KEY (FK_Mutantes) REFERENCES Mutantes (PK_Alumno),
	FOREIGN KEY (FK_Presentaciones) REFERENCES Presentaciones (PK_Present)
);

CREATE TABLE AlumnoClases(
	FK_Mutantes INT,
	FK_Clases INT,
	FOREIGN KEY (FK_Mutantes) REFERENCES Mutantes (PK_Alumno),
	FOREIGN KEY (FK_Clases) REFERENCES Clases (PK_Clases)
);

