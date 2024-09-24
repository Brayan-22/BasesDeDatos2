package com.bd2;
import com.bd2.persistence.Conexion;
import dnl.utils.text.table.TextTable;
import java.sql.*;
public class Main {
    private static final Conexion conexion = new Conexion();
    public static void main(String[] args) {
        if (args.length == 2) {
            var procedure = args[0];
            var maxRows = 2000;
            try{
                maxRows = Integer.parseInt(args[1]);
            }catch(NumberFormatException e){
            }
            printProcedure(procedure, maxRows);
        }
    }
    public static void printProcedure(String procedure,int maxRows){
        var callProcedure = String.format("CALL %s(?)", procedure);
        try {
            if(conexion.getConnection().isEmpty()) return;
            var con = conexion.getConnection().get();
            con.setAutoCommit(false);
            CallableStatement callableStatement = con.prepareCall(callProcedure);
            callableStatement.registerOutParameter(1, Types.OTHER);
            callableStatement.execute();
            ResultSet resultSet = (ResultSet)callableStatement.getObject(1);
            var cn = resultSet.getMetaData().getColumnCount();

            String[] columnNames = new String[cn];
            for (int i = 1; i <= cn; i++) {
                columnNames[i-1] = resultSet.getMetaData().getColumnName(i);
            }
            Object[][] data = new Object[maxRows][cn];
            var i = 0;
            while (resultSet.next() && i<maxRows-1) {
                for (int j = 1; j <= columnNames.length; j++) {
                    data[i][j-1] = resultSet.getObject(j);
                }
                i++;
            }
            TextTable table = new TextTable(columnNames,data);
            table.setAddRowNumbering(true);
            table.printTable();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
