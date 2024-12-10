package HSCM.Classes;

import DataClass.ChatData;
import HSCM.JDBC.CommonJdbcDao;

import java.util.List;

public class ChatService {
    public static List<?> getClassChatHistory(String className, String creator){//获取班级聊天历史
        String sql="select speaker,content from classchatdata where className=? and creator=? order by date";
        List<ChatData> res=CommonJdbcDao.fetchlist(ChatData.class,sql,className,creator);
        return res;
    }

    public static List<?> getMemberChatHistory(String userID,String tarMember,String className, String creator){//获取私人聊天历史
        String sql="select speaker,reciver,content from classmemberchatdata where " +
                "((speaker=? and reciver=?)or (speaker=? and reciver=?)) " +
                "and className=? and creator=? order by date";
        List<ChatData> res=CommonJdbcDao.fetchlist(ChatData.class,sql,userID,tarMember,tarMember,userID,className,creator);
        return res;
    }

    public static void sendMessage(
            String chatType,String speaker,String reciver, String content,String className,String creator){
        String sql;
        if(chatType.equals("1")){
            sql="insert into classchatdata(date, content, speaker, className, creator) VALUES (now(),?,?,?,?)";
            CommonJdbcDao.upDate(sql,content,speaker,className,creator);
        }else{
            sql="insert into classmemberchatdata(date, content, speaker, reciver, className, creator) VALUES (now(),?,?,?,?,?)";
            CommonJdbcDao.upDate(sql,content,speaker,reciver,className,creator);
        }
    }
}
