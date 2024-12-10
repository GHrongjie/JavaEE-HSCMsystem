package HSCM.Classes;

import DataClass.ChatData;
import DataClass.ClassNotification;
import DataClass.SearchParameter;
import HSCM.JDBC.CommonJdbcDao;

import java.util.ArrayList;
import java.util.List;

public class searchMessageService {
    public static List<?> searchMessage(String userID, SearchParameter searchParameter){
        String sql="select";
        ArrayList<String> params=new ArrayList<>();//存放 ? 所需参数
        params.add(userID);

        if(searchParameter.getNoticeType().equals("班级通知")){
            sql+=" notifierId,date,content from classnotices where className in(select className from classmember where memberID=?)";
        }else{
            if(searchParameter.getMessageType().equals("群聊")){
                sql+=" content,speaker from classchatdata where className in(select className from classmember where memberID=?)";
                if(!searchParameter.getWho().isEmpty()){
                    sql+=" and speaker=?";
                    params.add(searchParameter.getWho());
                }
            }else{
                sql+=" content,speaker,reciver from classmemberchatdata where className in(select className from classmember where memberID=?)";
                if(!searchParameter.getWho().isEmpty()){
                    if(searchParameter.getWho().equals(userID)) {
                        sql+=" and speaker=?";
                        params.add(userID);
                    }else{
                        sql+=" and speaker=? and reciver=?";
                        params.add(searchParameter.getWho());
                        params.add(userID);
                    }
                }else{
                    sql+=" and (speaker=? or reciver=?)";
                    params.add(userID);
                    params.add(userID);
                }
            }

        }

        if(!searchParameter.getClassName().isEmpty()){
            sql+=" and className=?";
            params.add(searchParameter.getClassName());
        }

        if(!searchParameter.getClassCreator().isEmpty()){
            sql+=" and creator=?";
            params.add(searchParameter.getClassCreator());
        }

        if(!searchParameter.getFromdate().isEmpty()){
            sql+=" and date>=?";
            params.add(searchParameter.getFromdate());
        }

        if(!searchParameter.getTodate().isEmpty()){
            sql+=" and date<=?";
            params.add(searchParameter.getTodate());
        }

        if(!searchParameter.getContent().isEmpty()){
            sql+=" and content like ?";
            params.add("%"+searchParameter.getContent()+"%");
        }

        sql+=" order by date";

        String[] p=new String[params.size()];
        for(int i=0;i<params.size();i++){
            p[i]=params.get(i);
        }

        if(searchParameter.getNoticeType().equals("班级通知")){
            return CommonJdbcDao.fetchlist(ClassNotification.class,sql, (Object[]) p);
        }else{
            return CommonJdbcDao.fetchlist(ChatData.class,sql,(Object[]) p);
        }
    }
}
