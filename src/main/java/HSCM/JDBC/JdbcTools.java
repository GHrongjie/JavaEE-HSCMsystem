package HSCM.JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JdbcTools {
    //获取链接
    public static Connection getConnection() throws Exception {
        String driverClass = "com.mysql.cj.jdbc.Driver";
        String jdbcUrl = "jdbc:mysql://localhost:3306/javaeeproject?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String user="root";
        String password="123456";

        Class.forName(driverClass);
        Connection connection=DriverManager.getConnection(jdbcUrl,user,password);
        //System.out.println(connection);
        return connection;
    }

    //释放资源
    public static void releaseResourse(ResultSet rs,PreparedStatement statement,Connection connection){
        try {
            if(rs!=null)
                rs.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        try {
            if(statement!=null)
                statement.close();
        }catch (Exception e1){
            e1.printStackTrace();
        }
        try{
            if(connection!=null)
                connection.close();
        }catch (Exception e2){
            e2.printStackTrace();
        }
    }
}
