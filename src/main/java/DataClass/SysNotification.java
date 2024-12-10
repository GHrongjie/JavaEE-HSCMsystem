package DataClass;

import java.sql.Timestamp;
import java.util.Date;

public class SysNotification {
    private String id;
    private String notifierID;
    private String date;
    private String content;

    public void setNotifierID(String notifierID) {
        this.notifierID = notifierID;
    }

    public String getNotifierID() {
        return notifierID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getid() {
        return id;
    }

    public void setid(String id) {
        this.id = id;
    }
}
