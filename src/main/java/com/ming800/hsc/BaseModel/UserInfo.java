package com.ming800.hsc.BaseModel;

import java.util.List;

/**
 * Created by Administrator on 2015/8/21.
 */
public class UserInfo {
    private List<ResultMsg> results ;
    private String studentId;
    private String studentUserId;
    private String studentName;
    private String weChatId;

    private String phone;
    private String contactMan;
    private String phone2;
    private String contactMan2;
    private Integer sex;            //1男   2女
    private String birth;

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

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getWeChatId() {
        return weChatId;
    }

    public void setWeChatId(String weChatId) {
        this.weChatId = weChatId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContactMan() {
        return contactMan;
    }

    public void setContactMan(String contactMan) {
        this.contactMan = contactMan;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getContactMan2() {
        return contactMan2;
    }

    public void setContactMan2(String contactMan2) {
        this.contactMan2 = contactMan2;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public UserInfo() {
    }

}
