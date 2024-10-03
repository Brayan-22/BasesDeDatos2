package com.bd2;
import com.bd2.persistence.Conexion;
import dnl.utils.text.table.TextTable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Main {
    private static final Conexion conexion = new Conexion();
    public static void main(String[] args) {
        var numColumns = 0;
        var nameProcedure = args[0];
        List<String> params = new ArrayList<>();
        for(int i = 1; i < args.length;i++){
            if (args[i].equalsIgnoreCase("-s")){
                numColumns = Integer.parseInt(args[i+1]);
                break;
            }else{
                params.add(args[i]);
            }
        }
        printProcedure(numColumns, nameProcedure,params.toArray(String[]::new));
    }
    public static void printProcedure(int maxRows,String procedure, String... params){
        StringBuilder stringBuilder = new StringBuilder("CALL ");
        stringBuilder.append(procedure+ "(?");
        for(String param : params){
            stringBuilder.append(",?");
        }
        stringBuilder.append(")");
        var callProcedure = stringBuilder.toString();
        System.out.println(callProcedure);
        try {
            if(conexion.getConnection().isEmpty()) return;
            var con = conexion.getConnection().get();
            con.setAutoCommit(false);
            CallableStatement callableStatement = con.prepareCall(callProcedure);
            callableStatement.registerOutParameter(1, Types.OTHER);
            for(int i = 2 ;i< params.length+2;i++){
                System.out.println(i);
                callableStatement.setObject(
                        i,params[i-2],Types.OTHER
                );
            }

            callableStatement.execute();
            ResultSet resultSet = (ResultSet)callableStatement.getObject(1);
            var cn = resultSet.getMetaData().getColumnCount();
            String[] columnNames = new String[cn];
            for (int i = 1; i <= cn; i++) {
                columnNames[i-1] = resultSet.getMetaData().getColumnName(i);
            }
            Object[][] data = new Object[maxRows][cn];
            var i = 0;
            var rowResults = 0;
            while (resultSet.next() && i<maxRows) {
                for (int j = 1; j <= columnNames.length; j++) {
                    data[i][j-1] = resultSet.getObject(j);
                }
                i++;
                rowResults++;
            }
            TextTable table = new TextTable(columnNames,data);
            table.setAddRowNumbering(true);
            table.printTable();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
