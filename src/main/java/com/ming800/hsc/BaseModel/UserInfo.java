package com.ming800.hsc.BaseModel;

import java.util.List;

/**
 * Created by Administrator on 2015/8/21.
 */
public class UserInfo {
    private List<ResultMsg> results ;
    private String studentId;
    private String studentUserId;

    public List<ResultMsg> getResults() {
        return results;
    }

    public void setResults(List<ResultMsg> results) {
        this.results = results;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentUserId() {
        return studentUserId;
    }

    public void setStudentUserId(String studentUserId) {
        this.studentUserId = studentUserId;
    }

    public UserInfo() {
    }
}
