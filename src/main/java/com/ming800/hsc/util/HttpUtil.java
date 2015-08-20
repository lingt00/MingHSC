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
* HTTP������ 
* 
* @author leizhimin 2009-6-19 16:36:18 
*/ 
public final class HttpUtil {
        public static final String CHARSET_GBK = "GBK";
        public static final String CHARSET_UTF8 = "UTF-8";

        private static Log log = LogFactory.getLog(HttpUtil.class);

        /** 
         * ִ��һ��HTTP GET���󣬷���������Ӧ��HTML 
         * 
         * @param url                 �����URL��ַ 
         * @param queryString ����Ĳ�ѯ����,����Ϊnull 
         * @return ����������Ӧ��HTML
         */ 
        public static ResultJson doGet(String url, String queryString) {
                ResultJson resultJson = new ResultJson(ResultJson.CODE_404);
                HttpClient httpClient = new HttpClient();
                HttpMethod postMethod = new GetMethod(url);
                try { 
                        if (StringUtils.isNotBlank(queryString)) 
                                //��get�����������http����Ĭ�ϱ��룬����û���κ����⣬���ֱ���󣬾ͳ�Ϊ%ʽ�����ַ��� 
                                postMethod.setQueryString(URIUtil.encodeQuery(queryString));
                        httpClient.executeMethod(postMethod);
                        if (postMethod.getStatusCode() == HttpStatus.SC_OK) {
                                String json =  postMethod.getResponseBodyAsString();

                        } 
                } catch (URIException e) { 
                        log.error("ִ��HTTP Get����ʱ�������ѯ�ַ�����" + queryString + "�������쳣��", e); 
                } catch (IOException e) { 
                        log.error("ִ��HTTP Get����" + url + "ʱ�������쳣��", e); 
                } finally { 
                        postMethod.releaseConnection();
                } 
                return resultJson;
        } 

        /** 
         * ִ��һ��HTTP POST���󣬷���������Ӧ��HTML 
         * 
         * @param url         �����URL��ַ 
         * @param params    ����Ĳ�ѯ����,����Ϊnull 
         * @return ����������Ӧ��HTML
         */ 
        public static ResultJson doPost(String url, Map<String, String> params) {
                ResultJson resultJson = new ResultJson(ResultJson.CODE_404);

                HttpClient httpClient = new HttpClient();
                HttpMethod postMethod = new PostMethod(url);
                //����Http Post����
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
                        log.error("ִ��HTTP Post����" + url + "ʱ�������쳣��", e); 
                } finally { 
                        postMethod.releaseConnection();
                } 
                return resultJson;
        } 

        public static void main(String[] args) {

        }
}