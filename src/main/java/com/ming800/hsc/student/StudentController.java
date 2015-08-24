package com.ming800.hsc.student;

import com.ming800.hsc.BaseModel.ResultMsgJson;
import com.ming800.hsc.BaseUtil.HttpUtil;
import com.ming800.hsc.WeChat.Utils.MessageUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
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
        String branchName = request.getParameter("branchName");
        Map<String, String> map = MessageUtil.getAccessToken(code);
        String openid = map.get("openid");
        //测试用
        branchName = "twwt";
        openid = "ohfJbuJsHcJE5oy6DLeitt7NLTcY";
        if (StringUtils.isEmpty(openid)) {
            modelMap.put("message", "未授权或授权失效!");
            return new ModelAndView("/basis/messageShow", modelMap);
        }

        Map<String,String> params = new HashMap<>();
        params.put("branchName",branchName);
        params.put("username",openid);
        ResultMsgJson resultMsgJson = HttpUtil.doPostByKey("student.login",params);
        if (ResultMsgJson.CODE_200.equals(resultMsgJson.getCode())){
            return new ModelAndView("student/studentIndex",modelMap);
        }else if (ResultMsgJson.CODE_204.equals(resultMsgJson.getCode())){
            return new ModelAndView("redirect:"+HttpUtil.getWebServiceUrl("student.formBind"));
        }else{
            modelMap.put("message", "服务器连接错误,暂停服务!");
            return new ModelAndView("/basis/messageShow", modelMap);
        }
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
