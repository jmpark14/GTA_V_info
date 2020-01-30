package vo;

public class gtaBoard {
    private String brdno;
    private String title;
    private String userid;
    private String views;
    private String thumbs;
    private String tags;
    private String regdate;
    private String contents;

    public gtaBoard() {}

    public void setBrdno(String brdno) {
        this.brdno = brdno;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setViews(String views) {
        this.views = views;
    }

    public void setThumbs(String thumbs) {
        this.thumbs = thumbs;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getBrdno() {
        return brdno;
    }

    public String getTitle() {
        return title;
    }

    public String getUserid() {
        return userid;
    }

    public String getViews() {
        return views;
    }

    public String getThumbs() {
        return thumbs;
    }

    public String getTags() {
        return tags;
    }

    public String getRegdate() {
        return regdate;
    }

    public String getContents() {
        return contents;
    }
}
