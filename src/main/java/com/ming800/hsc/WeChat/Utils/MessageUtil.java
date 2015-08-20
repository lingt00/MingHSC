package com.ming800.hsc.WeChat.Utils;


import com.ming800.hsc.WeChat.Model.*;
import com.ming800.hsc.BaseUtil.ConfigUtil;
import com.ming800.hsc.BaseUtil.JsonUtil;
import com.ming800.hsc.BaseUtil.StringUtil;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.lang3.StringUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;

/**
 * 消息工具类
 * @author GUOHF
 *
 */
public class MessageUtil {

	/**
	 * 返回消息类型：文本
	 */
	public static final String RESP_MESSAGE_TYPE_TEXT = "text";

	/**
	 * 返回消息类型：音乐
	 */
	public static final String RESP_MESSAGE_TYPE_MUSIC = "music";

	/**
	 * 返回消息类型：图文
	 */
	public static final String RESP_MESSAGE_TYPE_NEWS = "news";

	/**
	 * 请求消息类型：文本
	 */
	public static final String REQ_MESSAGE_TYPE_TEXT = "text";

	/**
	 * 请求消息类型：图片
	 */
	public static final String REQ_MESSAGE_TYPE_IMAGE = "image";

	/**
	 * 请求消息类型：链接
	 */
	public static final String REQ_MESSAGE_TYPE_LINK = "link";

	/**
	 * 请求消息类型：地理位置
	 */
	public static final String REQ_MESSAGE_TYPE_LOCATION = "location";

	/**
	 * 请求消息类型：音频
	 */
	public static final String REQ_MESSAGE_TYPE_VOICE = "voice";

	/**
	 * 请求消息类型：推送
	 */
	public static final String REQ_MESSAGE_TYPE_EVENT = "event";

	/**
	 * 事件类型：subscribe(订阅)
	 */
	public static final String EVENT_TYPE_SUBSCRIBE = "subscribe";

	/**
	 * 事件类型：unsubscribe(取消订阅)
	 */
	public static final String EVENT_TYPE_UNSUBSCRIBE = "unsubscribe";

	/**
	 * 事件类型：CLICK(自定义菜单点击事件)
	 */
	public static final String EVENT_TYPE_CLICK = "CLICK";

    /**
     * 事件类型：多客服消息
     */
    public static final String EVENT_TYPE_TRANSFER = "transfer_customer_service";

	/**
	 * 解析微信发来的请求（XML）
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> parseXml(HttpServletRequest request) throws Exception {
		// 将解析结果存储在HashMap中
		Map<String, String> map = new HashMap<String, String>();

		// 从request中取得输入流
		InputStream inputStream = request.getInputStream();
		// 读取输入流
		SAXReader reader = new SAXReader();
		Document document = reader.read(inputStream);
		// 得到xml根元素
		Element root = document.getRootElement();
		// 得到根元素的所有子节点
		List<Element> elementList = root.elements();

		// 遍历所有子节点
		for (Element e : elementList)
			map.put(e.getName(), e.getText());

		// 释放资源
		inputStream.close();
		inputStream = null;

		return map;
	}

    /**
     * 消息基类对象转换成xml
     *
     * @param baseMessage 音乐消息对象
     * @return xml
     */
    public static String baseMessageToXml(RespBaseMessage baseMessage) {
        xstream.alias("xml", baseMessage.getClass());
        return xstream.toXML(baseMessage);
    }

	/**
	 * 文本消息对象转换成xml
	 * 
	 * @param textMessage 文本消息对象
	 * @return xml
	 */
	public static String textMessageToXml(RespTextMessage textMessage) {
		xstream.alias("xml", textMessage.getClass());
		return xstream.toXML(textMessage);
	}

	/**
	 * 图文消息对象转换成xml
	 * 
	 * @param newsMessage 图文消息对象
	 * @return xml
	 */
	public static String newsMessageToXml(RespNewsMessage newsMessage) {
		xstream.alias("xml", newsMessage.getClass());
		xstream.alias("item", new Article().getClass());
		return xstream.toXML(newsMessage);
	}

	/**
	 * 扩展xstream，使其支持CDATA块
	 * 
	 * @date 2013-05-19
	 */
	private static XStream xstream = new XStream(new XppDriver() {
		public HierarchicalStreamWriter createWriter(Writer out) {
			return new PrettyPrintWriter(out) {
				// 对所有xml节点的转换都增加CDATA标记
				boolean cdata = true;

				@SuppressWarnings("unchecked")
				public void startNode(String name, Class clazz) {
					super.startNode(name, clazz);
				}

				protected void writeText(QuickWriter writer, String text) {
					if (cdata) {
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					} else {
						writer.write(text);
					}
				}
			};
		}
	});

    public static String getTextMessage(Map<String, String> requestMap,String respContent) {
        RespTextMessage textMessage = new RespTextMessage();
        textMessage.setToUserName(requestMap.get("FromUserName"));
        textMessage.setFromUserName(requestMap.get("ToUserName"));
        textMessage.setCreateTime(new Date().getTime());
        textMessage.setMsgType(MessageUtil.REQ_MESSAGE_TYPE_TEXT);
        textMessage.setFuncFlag(0);
        textMessage.setContent(respContent);
        String respMessage = MessageUtil.textMessageToXml(textMessage);
        return respMessage;
    }

    public static String getNewsMessage(Map<String, String> requestMap,String title, List<Article> articleList) {
        RespNewsMessage newsMessage = new RespNewsMessage();
        newsMessage.setToUserName(requestMap.get("FromUserName"));
        newsMessage.setFromUserName(requestMap.get("ToUserName"));
        newsMessage.setCreateTime(new Date().getTime());
        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
        newsMessage.setFuncFlag(0);
        int size = articleList == null ? 0 : articleList.size();
        newsMessage.setArticleCount(size);
        newsMessage.setArticles(articleList);
        String respMessage = MessageUtil.newsMessageToXml(newsMessage);
        return respMessage;
    }

    /***
     *
     * @author
     * @创建时间：2015-4-13 上午09:57:34
     * <H3>作用:发送多图文消息（客服服务接口）</H3>
     * @param p_accessToken
     * @param p_touser
     * @param p_articles
     * @return
     */
    public static void sendMultPic(String p_accessToken,String p_touser,List<Article> p_articles){
        String url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token="+p_accessToken;
        HttpClient client=new HttpClient();
        PostMethod pm = new PostMethod(url);
        pm.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        pm.addRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0");

        Articles news = new Articles();
        news.setArticles(p_articles);

        RespImageMessage kft=new RespImageMessage(p_touser, news);
        String params= JsonUtil.getJsonString(kft);
        pm.setRequestBody(params);
        try {
            client.executeMethod(pm);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    /**
     * 向某个地址发送消息
     * @param url
     * @param content
     * @return
     */
    public static String sendMessage(String url, String content) {
        String message = "";
        HttpsURLConnection conn = null;
        try {
            conn = (HttpsURLConnection) new URL(url).openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-type", "application/json");
            conn.setDoOutput(true);
            OutputStream ou = conn.getOutputStream();
            if (StringUtils.isNotEmpty(content)) {
                ou.write(content.getBytes("utf8"));
            }
            ou.flush();
            if (conn.getResponseCode() == 200) {
                message = StringUtil.inputStream2String(conn.getInputStream());
            }else {
                message = "连接异常";
            }
            ou.close();
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (conn != null)
                conn.disconnect();
        }
        return message;
    }

    /**
     * 根据用户code 获取用户信息
     * @param code
     * @return
     */
    public static  Map<String ,String> getAccessToken(String code){
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token" +
                "?appid=" + ConfigUtil.getInstance().getAppid() + "&secret=" + ConfigUtil.getInstance().getAppsecret() + "&code=" + code + "&grant_type=authorization_code";

        String message = sendMessage(url, null);
        Map<String, String> map = (Map<String, String>) JsonUtil.parseJsonStringToMap(message);
        return map;
    }

    public static void main(String []args){

    }
}