package HSCM.LoginRegister;

import DataClass.Manager;
import DataClass.User;
import HSCM.JDBC.CommonJdbcDao;

import java.util.List;

public class LoginRegisterService {
    //type 0:用户 1:管理员
    public static int checkInfo(String username,String password,int type){
        if(type==0)
        {
            List<User> user= (List<User>) searchInfo(username,type);
            if(user.isEmpty())
                return 0;//未找到用户
            else{
                if(!user.get(0).getPassword().equals(password))
                    return 1;//密码错误
                else
                    return 2;//信息正确
            }
        }else{
            List<Manager> user= (List<Manager>) searchInfo(username,type);
            if(user.isEmpty())
                return 0;
            else{
                if(!user.get(0).getPassword().equals(password))
                    return 1;
                else
                    return 2;
            }
        }


    }

    public static int addInfo(String username,String password){
        List<User> user= (List<User>) searchInfo(username,0);
        if(user.isEmpty()){//
            String sql="insert into users(userName,password,identity) values(?,?,?)";
            CommonJdbcDao.upDate(sql,username,password,"家长");
            return 0;//注册成功
        }else
            return 1;//失败
    }

    public static List<?> searchInfo(String username,int type){//查找用户
        String sql=null;
        if(type==0)
        {
            sql="select username,password,identity from users where username=?";
            return CommonJdbcDao.fetchlist(User.class,sql,username);
        }else{
            sql="select accountNumber,password from managers where accountNumber=?";
            return CommonJdbcDao.fetchlist(Manager.class,sql,username);
        }
    }
}
