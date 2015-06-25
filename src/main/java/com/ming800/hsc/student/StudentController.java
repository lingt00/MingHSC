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
public class StudentController {
    @RequestMapping(value = "/stu",method = RequestMethod.GET)
    public String main() {
        return "student/stuIndex";
    }


    @RequestMapping(value = "/stujb/hssmsg",method = RequestMethod.GET)
    public ModelAndView stuMsgDetail(HttpServletRequest request,ModelMap modelMap) {
        modelMap.put("p",request.getParameter("p"));
        return new ModelAndView("student/stuMsgDetail",modelMap);
    }
    @RequestMapping(value = "/stujb/msgList",method = RequestMethod.GET)
    public String stuMsgList() {
        return "student/stuMsgList";
    }


    @RequestMapping(value = "/stujb/List",method = RequestMethod.GET)
    public String List() {
        return "main/list";
    }

    @RequestMapping(value = "/stujb/stuWrokLogList",method = RequestMethod.GET)
    public  ModelAndView stuWrokLogList(){
        return new ModelAndView("student/stuWrokLogList");
    }
}
