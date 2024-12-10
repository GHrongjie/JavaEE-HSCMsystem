package HSCM.Classes;

import DataClass.ClassMember;
import HSCM.JDBC.CommonJdbcDao;

import java.util.List;

public class ChatMemberService {
    public static List<?> getClassChatMember(String className,String creator,String userID,String identity){
        String sql;
        if(identity.equals("家长")){
            sql="select memberID,identity from classmember join users on classmember.memberID = users.username " +
                    "where className=? and creator=? and identity='教师' and memberID!=?";
        }else {
            sql="select memberID,identity from classmember join users on classmember.memberID = users.username " +
                    "where className=? and creator=? and memberID!=?";
        }


        List<ClassMember> res=CommonJdbcDao.fetchlist(ClassMember.class,sql,className,creator,userID);
        return res;
    }
}
