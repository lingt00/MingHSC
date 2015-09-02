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
//        openid = "ohfJbuJsHcJE5oy6DLeitt7NLTcY";
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
            return new ModelAndView("redirect:"+HttpUtil.getWebServiceUrl("student.formBind")+"?fromUserName="+openid+"&branchName="+(branchName==null?"":branchName));
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
        String id = request.getParameter("id");
        Map<String,String> params = new HashMap<>();
        params.put("id",id);
        Map<?,?> object = HttpUtil.doPostByKeyToMap("student.newPostInfo",params);
        if (object!=null){
            modelMap.put("object",object);
            modelMap.put("p",request.getParameter("p"));
            modelMap.put("studentId",request.getParameter("studentId"));
            modelMap.put("studentUserId",request.getParameter("studentUserId"));
            return new ModelAndView("student/studentMsgDetail",modelMap);
        }else {
            modelMap.put("message", "您访问的地址已经过期啦!");
            return new ModelAndView("/basis/messageShow", modelMap);
        }

    }
    @RequestMapping(value = "/jb/msgList.do",method = RequestMethod.GET)
    public String stuMsgList(HttpServletRequest request,ModelMap modelMap) {
        String studentId = request.getParameter("studentId");
        String studentUserId = request.getParameter("studentUserId");
        Map<String,String> params = new HashMap<>();
        params.put("studentId",studentId);
        params.put("studentUserId",studentUserId);
        params.put("currentPage","1");
        params.put("pageSize","10");
        List jsonList = HttpUtil.doPostByKeyToList("student.postList",params);
        modelMap.put("object",jsonList);

        modelMap.put("studentId",studentId);
        modelMap.put("studentUserId",studentUserId);
        return "student/studentMsgList";
    }

    @RequestMapping(value = "/jb/attendanceList.do",method = RequestMethod.GET)
    public String attendanceList(HttpServletRequest request,ModelMap modelMap) {
        String studentId = request.getParameter("studentId");
        String studentUserId = request.getParameter("studentUserId");
        Map<String,String> params = new HashMap<>();
        params.put("studentId",studentId);
        params.put("studentUserId",studentUserId);
        params.put("currentPage","1");
        params.put("pageSize","10");
        List jsonList = HttpUtil.doPostByKeyToList("student.attendanceList",params);
        modelMap.put("object",jsonList);

        modelMap.put("studentId",studentId);
        modelMap.put("studentUserId",studentUserId);
        return "student/studentAttendanceList";
    }

    @RequestMapping(value = "/jb/newsDetail.do",method = RequestMethod.GET)
    public ModelAndView newsDetail(HttpServletRequest request,ModelMap modelMap) {
        String id = request.getParameter("id");
        Map<String,String> params = new HashMap<>();
        params.put("id",id);
        Map<?,?> object = HttpUtil.doPostByKeyToMap("student.newsInfo",params);
        if (object!=null){
            modelMap.put("object",object);
            modelMap.put("p",request.getParameter("p"));
            modelMap.put("studentId",request.getParameter("studentId"));
            modelMap.put("studentUserId",request.getParameter("studentUserId"));
            return new ModelAndView("student/studentNewsDetail",modelMap);
        }else {
            modelMap.put("message", "您访问的地址已经过期啦!");
            return new ModelAndView("/basis/messageShow", modelMap);
        }

    }

    @RequestMapping(value = "/jb/newsList.do",method = RequestMethod.GET)
    public String newsList(HttpServletRequest request,ModelMap modelMap) {
        String studentId = request.getParameter("studentId");
        String studentUserId = request.getParameter("studentUserId");
        Map<String,String> params = new HashMap<>();
        params.put("studentId",studentId);
        params.put("studentUserId",studentUserId);
        params.put("currentPage","1");
        params.put("pageSize","5");
        List jsonList = HttpUtil.doPostByKeyToList("student.newsList",params);
        modelMap.put("object",jsonList);

        modelMap.put("studentId",studentId);
        modelMap.put("studentUserId",studentUserId);
        return "student/studentNewsList";
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
