package com.ming800.hsc.util;

import com.ming800.hsc.BaseModel.ResultJson;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.httpclient.util.URIUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.IOException;
import java.util.Map;

/** 
* HTTP工具箱 
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
        public static ResultJson doGet(String url, String queryString) {
                ResultJson resultJson = new ResultJson(ResultJson.CODE_404);
                HttpClient httpClient = new HttpClient();
                HttpMethod postMethod = new GetMethod(url);
                try { 
                        if (StringUtils.isNotBlank(queryString)) 
                                //对get请求参数做了http请求默认编码，好像没有任何问题，汉字编码后，就成为%式样的字符串 
                                postMethod.setQueryString(URIUtil.encodeQuery(queryString));
                        httpClient.executeMethod(postMethod);
                        if (postMethod.getStatusCode() == HttpStatus.SC_OK) {
                                String json =  postMethod.getResponseBodyAsString();

                        } 
                } catch (URIException e) { 
                        log.error("执行HTTP Get请求时，编码查询字符串“" + queryString + "”发生异常！", e); 
                } catch (IOException e) { 
                        log.error("执行HTTP Get请求" + url + "时，发生异常！", e); 
                } finally { 
                        postMethod.releaseConnection();
                } 
                return resultJson;
        } 

        /** 
         * 执行一个HTTP POST请求，返回请求响应的HTML 
         * 
         * @param url         请求的URL地址 
         * @param params    请求的查询参数,可以为null 
         * @return 返回请求响应的HTML
         */ 
        public static ResultJson doPost(String url, Map<String, String> params) {
                ResultJson resultJson = new ResultJson(ResultJson.CODE_404);

                HttpClient httpClient = new HttpClient();
                HttpMethod postMethod = new PostMethod(url);
                //设置Http Post数据
                if (params != null) {
                        HttpMethodParams p = new HttpMethodParams();
                        for (Map.Entry<String, String> entry : params.entrySet()) { 
                                p.setParameter(entry.getKey(), entry.getValue()); 
                        } 
                        postMethod.setParams(p);
                }
                try {
                        httpClient.executeMethod(postMethod);
                        if (postMethod.getStatusCode() == HttpStatus.SC_OK) {
                             String json =  postMethod.getResponseBodyAsString();
                             resultJson = JsonUtil.parseJsonStringToObect(json);
                        } 
                } catch (IOException e) { 
                        log.error("执行HTTP Post请求" + url + "时，发生异常！", e); 
                } finally { 
                        postMethod.releaseConnection();
                } 
                return resultJson;
        } 

        public static void main(String[] args) {

        }
}