package com.bd2.persistence;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Optional;
import java.util.Properties;

public class Conexion {
    private final Properties properties;
    private Connection connection = null;
    private static final String URL = "jdbc:postgresql://localhost:5432/postgres";
    public Conexion(){
        this.properties = new Properties();
        try(InputStream input = this.getClass().getClassLoader().getResourceAsStream("postgres.properties")){
            properties.load(input);
            //properties.setProperty("escapeSyntaxCallMode", "call");
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
    }
    public Optional<Connection> getConnection(){
        try{
            connection = DriverManager.getConnection(URL,properties);
            return Optional.of(connection);
        }catch (SQLException e){
            System.err.println(e.getMessage());
        }
        return Optional.empty();
    }
    public void closeConnection() throws SQLException{
        if(connection != null && !connection.isClosed()){
            connection.close();
        }
    }
}
