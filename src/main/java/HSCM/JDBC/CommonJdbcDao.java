package HSCM.JDBC;

import org.apache.commons.beanutils.BeanUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

public class CommonJdbcDao {
    public static int upDate(String sql,Object ...params){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet rs=null;
        int result=0;
        try {
            connection= JdbcTools.getConnection();
            connection.setAutoCommit(false);
            preparedStatement=connection.prepareStatement(sql);
            for(int i=0;i<params.length;i++){
                preparedStatement.setObject(i+1,params[i]);
            }
            preparedStatement.executeUpdate();
            connection.commit();
        }catch (Exception e){
            e.printStackTrace();
            try {
                if(connection!=null)
                    connection.rollback();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }finally {
            JdbcTools.releaseResourse(rs,preparedStatement,connection);
        }
        return result;
    }

    public static <T> List<T> fetchlist(Class<T> tClass,String sql, Object ...params){
        List<T> result = new ArrayList<T>();
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet rs=null;
        try {
            connection=JdbcTools.getConnection();
            preparedStatement=connection.prepareStatement(sql);
            if(params!=null){
                for(int i=0;i<params.length;i++){
                    preparedStatement.setObject(i+1,params[i]);
                }
            }
            rs=preparedStatement.executeQuery();
            ResultSetMetaData rsmd=rs.getMetaData();
            int columnCount=rsmd.getColumnCount();

            while (rs.next()){
                T t=tClass.newInstance();
                for(int i=1;i<=columnCount;i++){
                    String lable=rsmd.getColumnLabel(i);
                    Object value=rs.getObject(i);
                    BeanUtils.setProperty(t,lable,value);
                }
                result.add(t);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcTools.releaseResourse(rs,preparedStatement,connection);
        }

        return result;
    }
}
