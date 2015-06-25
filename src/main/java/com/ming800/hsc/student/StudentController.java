package com.ming800.hsc.student;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    public String stuMsgDetail() {
        return "student/stuMsgDetail";
    }
    @RequestMapping(value = "/stujb/msgList",method = RequestMethod.GET)
    public String stuMsgList() {
        return "student/stuMsgList";
    }


    @RequestMapping(value = "/stujb/List",method = RequestMethod.GET)
    public String List() {
        return "main/list";
    }
}
