package HSCM.Notifications;

import DataClass.ClassNotification;
import DataClass.SysNotification;
import HSCM.JDBC.CommonJdbcDao;

import java.util.List;

public class NotificationsService {
    public static List<?> getAllNotifications(){//获取所有系统通知
        String sql="select * from managernotices order by date desc";
        List<SysNotification> res= CommonJdbcDao.fetchlist(SysNotification.class,sql, null);
        return res;
    }

    public static List<?> getSelfNotifications(String managerID){//获取用户自己发布的系统通知
        String sql="select * from managernotices where notifierID=? order by date desc";
        List<SysNotification> res=CommonJdbcDao.fetchlist(SysNotification.class,sql,managerID);
        return res;
    }

    public static List<?> getAllClassNotifications(String className,String creator){//获取班级内所有的班级通知
        String sql="select id, notifierId, date, content from classnotices where className=? and creator=?";
        List<ClassNotification> res=CommonJdbcDao.fetchlist(ClassNotification.class,sql,className,creator);
        return res;
    }

    public static List<?> getSelfClassNotifications(String username,String className,String creator){//获取班级内用户自己发布的班级通知
        String sql="select id, notifierId, date, content from classnotices where className=? and creator=? and notifierId=?";
        List<ClassNotification> res=CommonJdbcDao.fetchlist(ClassNotification.class,sql,className,creator,username);
        return res;
    }
}
