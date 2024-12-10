package HSCM.Applications;

import DataClass.ClassApply;
import DataClass.JoinApply;
import DataClass.TeacherApply;
import HSCM.JDBC.CommonJdbcDao;

import java.util.List;

public class ApplicationsService {
    public static List<?> getTeacherApplications(){//获取教师申请
        String sql="select * from teacherapplications";
        List<TeacherApply> res=CommonJdbcDao.fetchlist(TeacherApply.class,sql,null);
        return res;
    }

    public static List<?> getClassApplications(){////获取班级申请
        String sql="select * from classapplications";
        List<ClassApply> res=CommonJdbcDao.fetchlist(ClassApply.class,sql,null);
        return res;
    }

    public static List<?> getJoinClassApplications(String userID){//获取班级加入申请
        String sql="select * from joinapplications where creator=?";
        List<JoinApply> res=CommonJdbcDao.fetchlist(JoinApply.class,sql,userID);
        return res;
    }
}
