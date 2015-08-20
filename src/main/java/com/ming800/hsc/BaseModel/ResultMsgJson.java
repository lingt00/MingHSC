package com.ming800.hsc.BaseModel;

import java.util.List;

/**
 * Created by Administrator on 2015/8/20.
 */
public class ResultMsgJson {
    public static final String CODE_200 = "200";
    public static final String CODE_204 = "204";//用户未绑定
    public static final String CODE_205 = "205";//未知错误
    public static final String CODE_404 = "404";//访问地址错误
    /**
     * 200 正常访问
     * 204 用户未绑定
     */
    public String code ;
    public List<ResultMsg> results ;
    public String studentId;
    public String studentUserId;

    public ResultMsgJson() {
    }

    public ResultMsgJson(String code) {
        this.code = code;
    }

    public ResultMsgJson(String code, List<ResultMsg> results) {
        this.code = code;
        this.results = results;
    }

    public ResultMsgJson(String code, List<ResultMsg> results, String studentId, String studentUserId) {
        this.code = code;
        this.results = results;
        this.studentId = studentId;
        this.studentUserId = studentUserId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

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
}
