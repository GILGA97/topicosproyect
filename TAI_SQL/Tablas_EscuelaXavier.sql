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
	Nombre VARCHAR,
	Edad INT,
	Estudios VARCHAR
);

CREATE TABLE MedioTiempo(
	PK_Maestros SERIAL PRIMARY KEY,
	Pago INT,
	Hora_Entrada TIME,
	Hora_Salida TIME
)INHERITS (Maestros);

CREATE TABLE TiempoCompleto(
	PK_Maestros SERIAL PRIMARY KEY,
	Pago_Fijo INT,
	Fecha_Inicio TIMESTAMP
)INHERITS (Maestros);

CREATE TABLE Clases(
	PK_Clases SERIAL PRIMARY KEY,
	Nombre VARCHAR,
	Hora_Inicio TIME,
	Hora_Salida TIME,
	Tipo_Clase	clase,
	FK_Maestro_Medio INT,
	FK_Maestro_Compl INT,
	FOREIGN KEY (FK_Maestro_Medio) REFERENCES MedioTiempo (PK_Maestros),
	FOREIGN KEY (FK_Maestro_Compl) REFERENCES TiempoCompleto (PK_Maestros)
);

CREATE TABLE MaestrosPresentaciones(
	FK_Maestro_Medio INT,
	FK_Maestro_Compl INT,
	FK_Presentaciones INT,
	Fecha_Asist	DATE,
	FOREIGN KEY (FK_Maestro_Medio) REFERENCES MedioTiempo (PK_Maestros),
	FOREIGN KEY (FK_Maestro_Compl) REFERENCES TiempoCompleto (PK_Maestros),
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


