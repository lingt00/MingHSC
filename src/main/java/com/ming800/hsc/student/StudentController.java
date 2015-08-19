package com.ming800.hsc.student;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by IntelliJ IDEA
 * User: lingTao on 2015/6/23 10:46.
 * function:
 */

@Controller
@RequestMapping("/stu")
public class StudentController {
    @RequestMapping(value = "/stu.do",method = RequestMethod.GET)
    public String main() {
        return "student/studentIndex";
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
