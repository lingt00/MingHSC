package com.ming800.hsc.BaseModel;

import java.util.List;

/**
 * Created by Administrator on 2015/8/20.
 */
public class ResultJson {
    public static final String CODE_200 = "200";//返回正常
    public static final String CODE_204 = "204";//用户未绑定
    public static final String CODE_205 = "205";//返回未知结果
    public static final String CODE_404 = "404";//发送请求失败
    /**
     * 200 正常访问
     * 204 用户未绑定
     */
    public String code ;
    public List<Result> results ;
    public String studentId;
    public String studentUserId;

    public ResultJson() {
    }

    public ResultJson(String code) {
        this.code = code;
    }

    public ResultJson(String code, List<Result> results) {
        this.code = code;
        this.results = results;
    }

    public ResultJson(String code, List<Result> results, String studentId, String studentUserId) {
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

    public List<Result> getResults() {
        return results;
    }

    public void setResults(List<Result> results) {
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
