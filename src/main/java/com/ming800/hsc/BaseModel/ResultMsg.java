package com.ming800.hsc.BaseModel;

import java.util.List;

/**
 * Created by Administrator on 2015/8/20.
 */
public class ResultMsg {
    public String id ;
    public String type ;
    public Object head ;
    public List<Object> body ;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Object getHead() {
        return head;
    }

    public void setHead(Object head) {
        this.head = head;
    }

    public List<Object> getBody() {
        return body;
    }

    public void setBody(List<Object> body) {
        this.body = body;
    }

    public ResultMsg() {
    }
}
