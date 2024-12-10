package HSCM.Applications;

import DataClass.*;
import HSCM.JDBC.CommonJdbcDao;

import java.util.List;

import static HSCM.Classes.ClassDataService.getUserClasses;

public class CreateApplicationService {
    public static void createTeacherApplication(String username,String reason){//创建教师申请
        String sql="select * from teacherapplications where username=?";
        List<TeacherApply> res=CommonJdbcDao.fetchlist(TeacherApply.class,sql,username);
        if(res.isEmpty()){
            sql="insert into teacherapplications(id, username, reason) VALUES (0,?,?)";
            CommonJdbcDao.upDate(sql,username,reason);
        }
    }

    public static boolean createClassApplication(String username,String className){//创建班级申请
        String sql="select className,creator from classmember where className=? and creator=?";
        List<ClassData> res= CommonJdbcDao.fetchlist(ClassData.class,sql,className,username);
        sql="select * from classapplications where className=? and creator=?";
        List<ClassApply> ifmakeClassApply=CommonJdbcDao.fetchlist(ClassApply.class,sql,className,username);
        if(res.isEmpty()&&ifmakeClassApply.isEmpty()){//班级不存在就新建申请
            sql="insert into classapplications(id, creator, className) VALUES (0,?,?)";
            CommonJdbcDao.upDate(sql,username,className);
            return true;
        }
        return false;
    }

    public static boolean createJoinApplication(String username,String identity,String className,String creator){
        //创建加入班级申请
        String sql="select memberID from classmember where className=? and creator=? and memberID=?";
        List<ClassMember> res=CommonJdbcDao.fetchlist(ClassMember.class,sql,className,creator,username);
        sql="select className,creator from classes where className=? and creator=?";
        List<ClassData> checkClass= CommonJdbcDao.fetchlist(ClassData.class,sql,className,creator);
        sql="select * from joinapplications where className=? and creator=? and member=?";
        List<JoinApply> ifmakeJoinApply =CommonJdbcDao.fetchlist(JoinApply.class,sql,className,creator,username);
        if(res.isEmpty()&&!checkClass.isEmpty()&&ifmakeJoinApply.isEmpty()){//用户不在该班级且班级存在就新建申请
            sql="insert into joinapplications(id, member, identity, className, creator) VALUES (0,?,?,?,?)";
            CommonJdbcDao.upDate(sql,username,identity,className,creator);
            return true;
        }
        return false;

    }
}
