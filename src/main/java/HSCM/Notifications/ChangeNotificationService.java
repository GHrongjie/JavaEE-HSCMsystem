package HSCM.Notifications;

import HSCM.JDBC.CommonJdbcDao;

public class ChangeNotificationService {
    public static void createSysNotification(String notifierID,String content){//发布系统通知
        String sql = "insert into managernotices(id, notifierID, date, content) values (0,?,now(),?);";
        CommonJdbcDao.upDate(sql,notifierID,content);
    }

    public static void createClassNotification(String notifierID,String content,String className,String creator){//发布班级通知
        String sql="insert into classnotices(id, notifierId, date, content, className, creator) VALUES (0,?,now(),?,?,?)";
        CommonJdbcDao.upDate(sql,notifierID,content,className,creator);
    }

    public static void delSelfNotifications(String noteID){//删除系统通知
        String sql ="delete from managernotices where id=?";
        CommonJdbcDao.upDate(sql,noteID);
    }

    public static void delSelfClassNotifications(String noteID){//删除班级通知
        String sql ="delete from classnotices where id=?";
        CommonJdbcDao.upDate(sql,noteID);
    }
}
