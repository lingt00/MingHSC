package com.ming800.hsc.BaseUtil;

import com.ming800.hsc.BaseModel.ResultMsgJson;
import net.sf.json.JSONArray;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.util.URIUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

/** 
* HTTP������ 
* 
* @author leizhimin 2009-6-19 16:36:18 
*/ 
public final class HttpUtil {
        public static final String CHARSET_GBK = "GBK";
        public static final String CHARSET_UTF8 = "UTF-8";

        private static Log log = LogFactory.getLog(HttpUtil.class);

        /**
         * 执行一个HTTP GET请求，返回请求响应的HTML
         *
         * @param url                 请求的URL地址
         * @param queryString 请求的查询参数,可以为null
         * @return 返回请求响应的HTML
         */
        public static String doGet(String url, String queryString) {
                String result = ResultMsgJson.CODE_404 ;
                HttpClient httpClient = new HttpClient();
                GetMethod postMethod = new GetMethod(url);
                try { 
                        if (StringUtils.isNotBlank(queryString))
                                //对get请求参数做了http请求默认编码，好像没有任何问题，汉字编码后，就成为%式样的字符串
                                postMethod.setQueryString(URIUtil.encodeQuery(queryString));
                        httpClient.executeMethod(postMethod);
                        if (postMethod.getStatusCode() == HttpStatus.SC_OK) {
                                result =  postMethod.getResponseBodyAsString();
                        }
                } catch (URIException e) {
                        log.error("执行HTTP Get请求时，编码查询字符串“" + queryString + "”发生异常！", e);
                } catch (IOException e) {
                        log.error("执行HTTP Get请求" + url + "时，发生异常！", e);
                } finally { 
                        postMethod.releaseConnection();
                } 
                return result;
        }

        /**
         * 执行一个HTTP POST请求，返回请求响应的HTML
         *
         * @param url         请求的URL地址
         * @param params    请求的查询参数,可以为null
         * @return 返回请求响应的HTML
         */
        public static String doPost(String url, Map<String, String> params) {
                String resultJson = ResultMsgJson.CODE_404 ;
                HttpClient httpClient = new HttpClient();
                PostMethod postMethod = new PostMethod(url);
                //设置Http Post数据
                if (params != null) {
                        for (Map.Entry<String, String> entry : params.entrySet()) {
                                postMethod.addParameter(entry.getKey(),entry.getValue());
                        }
                }
                try {
                        httpClient.executeMethod(postMethod);
                        if (postMethod.getStatusCode() == HttpStatus.SC_OK) {
                             resultJson =  postMethod.getResponseBodyAsString();
                        }
                } catch (IOException e) {
                        log.error("执行HTTP Post请求" + url + "时，发生异常！", e);
                } finally { 
                        postMethod.releaseConnection();
                }
                return resultJson;
        }

        public static String getWebServiceUrl(String action){
                return ConfigUtil.getInstance().getWebService()+WebServiceUtil.getInstance().getValue(action);
        }

        public static ResultMsgJson doPostByKeyToObject(String urlKey,Map<String, String> params){
                String json = doPostByKeyToString(urlKey, params);
                ResultMsgJson resultMsgJson = new ResultMsgJson(ResultMsgJson.CODE_404);
                if (!ResultMsgJson.CODE_404.equals(json)){
                        resultMsgJson = JsonUtil.parseJsonStringToObject(json);
                }
                return resultMsgJson;
        }
        public static Map<?,?> doPostByKeyToMap(String urlKey,Map<String, String> params){
                String json = doPostByKeyToString(urlKey, params);
                if (!ResultMsgJson.CODE_504.equals(json)){
                      return JsonUtil.parseJsonStringToMap(json);
                }else {
                      return null ;
                }
        }
        public static List doPostByKeyToList(String urlKey,Map<String, String> params){
                String json = doPostByKeyToString(urlKey, params);
                if (!ResultMsgJson.CODE_504.equals(json)){
                        JSONArray jsonArray = JSONArray.fromObject(json);
                      return jsonArray;
                }else {
                      return null ;
                }
        }
        public static String doPostByKeyToString(String urlKey,Map<String, String> params){
                String url = getWebServiceUrl(urlKey);
                return doPost(url, params);
        }
        public static String getDateTime(){
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                return format.format(Calendar.getInstance().getTime());
        }
//        public static void main(String[] args) {
//                String url = getWebServiceUrl("student.login");
//                Map<String, String> params = new HashMap<>();
//                params.put("username","ohfJbuJsHcJE5oy6DLeitt7NLTcY");
//                params.put("branchName","twwt");
//                HttpUtil.doPost(url, params);
//        }
}