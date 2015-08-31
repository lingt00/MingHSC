package com.ming800.hsc.Control;

import com.ming800.hsc.BaseUtil.HttpUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MainController {
    @RequestMapping(value = "/main.do",method = RequestMethod.GET)
    public String main() {
        return "redirect:student/weChat.do";
    }
    @RequestMapping(value = "/redirect.do",method = RequestMethod.GET)
    public Object redirect(HttpServletRequest request,ModelMap modelMap) {
        String qm = request.getParameter("qm");
        String studentId = request.getParameter("studentId");
        String studentUserId = request.getParameter("studentUserId");
        if (qm==null){
            modelMap.put("message", "访问地址出错啦!!");
            return new ModelAndView("/basis/messageShow", modelMap);
        }

        return new ModelAndView("redirect:"+ HttpUtil.getWebServiceUrl(qm)+"?studentId="+studentId+"&studentUserId="+studentUserId);
    }

}