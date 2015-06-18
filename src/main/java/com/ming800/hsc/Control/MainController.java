package com.ming800.hsc.Control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String main() {
        return "/main/index";
    }


    @RequestMapping(value = "/jb/hssmsg",method = RequestMethod.GET)
    public String hSSMsg() {
        return "/main/hSSMsg";
    }

}