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
    public List<UserInfo> userInfoList ;

    public ResultMsgJson(String code) {
        this.code = code;
    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<UserInfo> getUserInfoList() {
        return userInfoList;
    }

    public void setUserInfoList(List<UserInfo> userInfoList) {
        this.userInfoList = userInfoList;
    }

    public ResultMsgJson() {
    }
}
