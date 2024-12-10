package HSCM.Classes;

import DataClass.ClassData;
import HSCM.JDBC.CommonJdbcDao;

import java.util.List;

public class ClassDataService {
    public static List<?> getUserClasses(String userID)//获取班级信息
    {
        String sql="select className,creator from classmember where memberID=?";

        List<ClassData> res= CommonJdbcDao.fetchlist(ClassData.class,sql,userID);

        return res;
    }
}
