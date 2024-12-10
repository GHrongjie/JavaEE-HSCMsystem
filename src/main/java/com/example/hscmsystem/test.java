package com.example.hscmsystem;

import DataClass.ChatData;
import DataClass.ClassMember;
import DataClass.ClassNotification;
import DataClass.SearchParameter;
import HSCM.JDBC.CommonJdbcDao;
import HSCM.JDBC.JdbcTools;

import java.sql.Connection;
import java.util.List;

import static HSCM.Classes.searchMessageService.searchMessage;

public class test {
    public static void main(String[] args) throws Exception{
        SearchParameter searchParameter=new SearchParameter();

        searchParameter.setNoticeType("班级通知");
        searchParameter.setMessageType("群聊");

        searchParameter.setClassName("");
        searchParameter.setClassCreator("");
        searchParameter.setFromdate("2024-11-22");
        searchParameter.setTodate("");
        searchParameter.setContent("");
        searchParameter.setWho("");
        List<ClassNotification> res= (List<ClassNotification>) searchMessage("hua",searchParameter);
        System.out.println(res);
        //System.out.println(res);
    }
}
