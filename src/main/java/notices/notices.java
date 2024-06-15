package notices;
import java.util.Date;

public class notices {
    private String title;
    private String content;
    private Date date;
    private String author;
    private int id;

    public notices(int id,String title, String content, Date date, String author) {
    	this.id=id;
        this.title = title;
        this.content = content;
        this.date = date;
        this.author = author;
    }

    public int getId() {
    	return id;
    }
    
    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public Date getDate() {
        return date;
    }

    public String getAuthor() {
        return author;
    }

}
