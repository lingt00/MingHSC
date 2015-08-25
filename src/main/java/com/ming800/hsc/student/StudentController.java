package com.ming800.hsc.student;

import com.ming800.hsc.BaseModel.ResultMsgJson;
import com.ming800.hsc.BaseModel.UserInfo;
import com.ming800.hsc.BaseUtil.HttpUtil;
import com.ming800.hsc.WeChat.Utils.MessageUtil;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA
 * User: lingTao on 2015/6/23 10:46.
 * function:
 */

@Controller
@RequestMapping("/student")
public class StudentController {

    @RequestMapping(value = "/weChat.do",method = RequestMethod.GET)
    public ModelAndView studentLogin(HttpServletRequest request,ModelMap modelMap){
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        session.setAttribute("studentValCode",code);
        String branchName = request.getParameter("branchName");
        Map<String, String> map = MessageUtil.getAccessToken(code);
        String openid = map.get("openid");
        //测试用
//        branchName = "twwt";
        openid = "ohfJbuJsHcJE5oy6DLeitt7NLTcY";
        if (StringUtils.isEmpty(openid)) {
            modelMap.put("message", "未授权或授权失效!");
            return new ModelAndView("/basis/messageShow", modelMap);
        }

        Map<String,String> params = new HashMap<>();
        params.put("branchName",branchName==null?"":branchName);
        params.put("username",openid);
        ResultMsgJson resultMsgJson = HttpUtil.doPostByKeyToObject("student.login",params);
        if (ResultMsgJson.CODE_200.equals(resultMsgJson.getCode()) && resultMsgJson.getUserInfoList()!=null && resultMsgJson.getUserInfoList().size()>0){
            JSONArray array = JSONArray.fromObject(resultMsgJson.getUserInfoList());
            List<UserInfo> userInfoList = JSONArray.toList(array,UserInfo.class);
//            if (userInfoList.size()==1){
//                modelMap.put("student",userInfoList.get(0));
//                return new ModelAndView("student/studentIndex",modelMap);
//            }else {
//
//                modelMap.put("objectList",userInfoList);
//                return new ModelAndView("student/studentList",modelMap);
//            }
            modelMap.put("length",userInfoList.size());
            modelMap.put("objectList",userInfoList);
            return new ModelAndView("student/studentIndex",modelMap);
        }else if (ResultMsgJson.CODE_204.equals(resultMsgJson.getCode())){
            return new ModelAndView("redirect:"+HttpUtil.getWebServiceUrl("student.formBind"));
        }else{
            modelMap.put("message", "服务器连接错误,暂停服务!");
            return new ModelAndView("/basis/messageShow", modelMap);
        }
    }
    @RequestMapping(value = "/jb/student.do",method = RequestMethod.GET)
    public ModelAndView student(HttpServletRequest request,ModelMap modelMap) {
        UserInfo userInfo = new UserInfo();
        userInfo.setStudentId(request.getParameter("studentId"));
        userInfo.setStudentUserId(request.getParameter("studentUserId"));
        userInfo.setWeChatId(request.getParameter("weChatId"));
        modelMap.put("student",userInfo);
        return new ModelAndView("student/studentIndex",modelMap);
    }


    @RequestMapping(value = "/jb/MsgDetail.do",method = RequestMethod.GET)
    public ModelAndView stuMsgDetail(HttpServletRequest request,ModelMap modelMap) {
        modelMap.put("p",request.getParameter("p"));
        return new ModelAndView("student/studentMsgDetail",modelMap);
    }
    @RequestMapping(value = "/jb/msgList",method = RequestMethod.GET)
    public String stuMsgList() {
        return "student/studentMsgList";
    }


    @RequestMapping(value = "/jb/List.do",method = RequestMethod.GET)
    public String List() {
        return "main/list";
    }

    @RequestMapping(value = "/jb/stuWorkLogList.do",method = RequestMethod.GET)
    public  ModelAndView stuWorkLogList(){
        return new ModelAndView("student/studentWorkLogList");
    }
}
