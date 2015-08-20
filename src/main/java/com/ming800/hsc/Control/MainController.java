package com.ming800.hsc.Control;

import com.ming800.hsc.WeChat.Utils.MessageUtil;
import com.ming800.hsc.util.ConfigUtil;
import com.ming800.hsc.util.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class MainController {
    @RequestMapping(value = "/main.do",method = RequestMethod.GET)
    public String main() {
        return "redirect:stu/stu.do";
    }

    @RequestMapping(value = "/studentLog.do",method = RequestMethod.GET)
    public ModelAndView studentLogin(HttpServletRequest request,ModelMap modelMap){
        String code = request.getParameter("code");
        String branchName = request.getParameter("branchName");
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token" +
                "?appid=" + ConfigUtil.getInstance().getAppid() + "&secret=" + ConfigUtil.getInstance().getAppsecret() + "&code=" + code + "&grant_type=authorization_code";

        String message = MessageUtil.sendMessage(url, null);
        Map<String, String> map = (Map<String, String>) JsonUtil.parseJsonStringToMap(message);
        String access_token = map.get("access_token");
        String openid = map.get("openid");
        if (StringUtils.isEmpty(openid)) {
            modelMap.put("message", "未授权或授权已失效");
            return new ModelAndView("/basis/messageShow", modelMap);
        }
        return new ModelAndView();
    }
}