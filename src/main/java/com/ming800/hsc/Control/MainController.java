package com.ming800.hsc.Control;

import com.ming800.hsc.WeChat.Utils.MessageUtil;
import com.ming800.hsc.util.ConfigUtil;
import com.ming800.hsc.util.HttpUtil;
import com.ming800.hsc.util.WebServiceUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {
    @RequestMapping(value = "/main.do",method = RequestMethod.GET)
    public String main() {
        String url = ConfigUtil.getInstance().getAppid()+ WebServiceUtil.getInstance().getValue("student.login");
        Map<String, String> params = new HashMap<>();
        params.put("username","ohfJbuJsHcJE5oy6DLeitt7NLTcY");
        params.put("branchName","twwt");
        HttpUtil.doPost(url,params);

        return "redirect:stu/stu.do";
    }

    @RequestMapping(value = "/studentLog.do",method = RequestMethod.GET)
    public ModelAndView studentLogin(HttpServletRequest request,ModelMap modelMap){
        String code = request.getParameter("code");
        String branchName = request.getParameter("branchName");
        Map<String, String> map = MessageUtil.getAccessToken(code);
        String openid = map.get("openid");
        if (StringUtils.isEmpty(openid)) {
            modelMap.put("message", "未授权或授权已失效");
            return new ModelAndView("/basis/messageShow", modelMap);
        }
        //访问学校系统获取用户信息

        return new ModelAndView();
    }
}