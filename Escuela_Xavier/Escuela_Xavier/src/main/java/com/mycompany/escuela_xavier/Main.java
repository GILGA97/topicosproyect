package com.mycompany.escuela_xavier;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {
    public static void main (String[] args) {
        
        MiBD conexion =  new MiBD();
        
        ResultSet result;
        
        int id, edad;
        String nombre, poderes, genero;
        Date Fecha_Ingreso;
       
        result = conexion.getQuery("select * from mutantes");
        try {
            while(result.next()) {
                id = result.getInt("pk_alumno");
                nombre = result.getString("nombre");
                edad = result.getInt("edad");
                poderes = result.getString("poderes");
                genero = result.getString("genero");
                Fecha_Ingreso = result.getDate("fecha_ingreso");

                System.out.println ("\nID PK_Alumno: " + id);
                System.out.println("Nombre Alumno: " +  nombre);
                System.out.println("Edad: " + edad);
                System.out.println("Poder: " + poderes);
                System.out.println("Genero: " + genero);
                System.out.println("Fecha_Ingreo: " + Fecha_Ingreso);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

    }
}