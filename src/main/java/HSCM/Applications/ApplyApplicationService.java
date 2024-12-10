package HSCM.Applications;

import HSCM.JDBC.CommonJdbcDao;

public class ApplyApplicationService {
    public static void changeIdentity(String applicationsID,String username,String ifpass){//是否修改用户身份为教师
        if(ifpass.equals("1")){//同意
            String sql="update users set identity='教师' where username=?";
            CommonJdbcDao.upDate(sql,username);//将用户身份更改为教师
            sql="delete from teacherapplications where id=?";
            CommonJdbcDao.upDate(sql,applicationsID);//删除该申请记录
        }else{//拒绝
            String sql="delete from teacherapplications where id=?";
            CommonJdbcDao.upDate(sql,applicationsID);//删除该申请记录
        }
    }

    public static void addClass(String applicationsID,String username,String classname,String ifpass){
        //是否添加班级
        if(ifpass.equals("1")){//同意
            String sql="insert into classes(className,creator) values (?,?)";
            CommonJdbcDao.upDate(sql,classname,username);//创建班级
            sql="insert into classmember(className,creator,memberID) values (?,?,?)";
            CommonJdbcDao.upDate(sql,classname,username,username);//将创建人加入班级
            sql="delete from classapplications where id=?";
            CommonJdbcDao.upDate(sql,applicationsID);//删除该申请记录
        }else{//拒绝
            String sql="delete from classapplications where id=?";
            CommonJdbcDao.upDate(sql,applicationsID);//删除该申请记录
        }
    }

    public static void addMember(String applicationsID,String username,String classname,String classCreator,String ifpass){//是否添加班级成员
        if(ifpass.equals("1")){//同意
            String sql="insert into classmember(className, creator, memberID) VALUES (?,?,?)";
            CommonJdbcDao.upDate(sql,classname,classCreator,username);//将申请人加入班级
            sql="delete from joinapplications where id=?";
            CommonJdbcDao.upDate(sql,applicationsID);//删除该申请记录
        }else{//拒绝
            String sql="delete from joinapplications where id=?";
            CommonJdbcDao.upDate(sql,applicationsID);//删除该申请记录
        }
    }
}
