package com.ming800.hsc.WeChat.Model;

public class RespImageMessage {
    private String touser;
	private String msgtype;
	private Articles news;

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    public String getMsgtype() {
        return msgtype;
    }

    public void setMsgtype(String msgtype) {
        this.msgtype = msgtype;
    }

    public Articles getNews() {
        return news;
    }

    public void setNews(Articles news) {
        this.news = news;
    }

    public RespImageMessage() {
        super();
    }

    //多图文构造函数
    public RespImageMessage(String touser, Articles news) {
        super();
        this.touser = touser;
        this.msgtype = "news";
        this.news = news;
    }
}