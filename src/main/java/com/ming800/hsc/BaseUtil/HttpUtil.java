package com.ming800.hsc.BaseUtil;

import com.ming800.hsc.BaseModel.ResultMsgJson;
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
import java.util.HashMap;
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
        public static ResultMsgJson doGet(String url, String queryString) {
                ResultMsgJson resultJson = new ResultMsgJson(ResultMsgJson.CODE_404);
                HttpClient httpClient = new HttpClient();
                GetMethod postMethod = new GetMethod(url);
                try { 
                        if (StringUtils.isNotBlank(queryString)) 
                                //��get�����������http����Ĭ�ϱ��룬����û���κ����⣬���ֱ���󣬾ͳ�Ϊ%ʽ�����ַ��� 
                                postMethod.setQueryString(URIUtil.encodeQuery(queryString));
                        httpClient.executeMethod(postMethod);
                        if (postMethod.getStatusCode() == HttpStatus.SC_OK) {
                                String json =  postMethod.getResponseBodyAsString();
                                resultJson = JsonUtil.parseJsonStringToObject(json);
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
        public static ResultMsgJson doPost(String url, Map<String, String> params) {
                ResultMsgJson resultJson = new ResultMsgJson(ResultMsgJson.CODE_404);

                HttpClient httpClient = new HttpClient();
                PostMethod postMethod = new PostMethod(url);
                //����Http Post����
                if (params != null) {
                        for (Map.Entry<String, String> entry : params.entrySet()) {
                                postMethod.addParameter(entry.getKey(),entry.getValue());
                        }
                }
                try {
                        httpClient.executeMethod(postMethod);
                        if (postMethod.getStatusCode() == HttpStatus.SC_OK) {
                             String json =  postMethod.getResponseBodyAsString();
                             resultJson = JsonUtil.parseJsonStringToObject(json);
                        } 
                } catch (IOException e) { 
                        log.error("ִ��HTTP Post����" + url + "ʱ�������쳣��", e); 
                } finally { 
                        postMethod.releaseConnection();
                } 
                return resultJson;
        } 

        public static void main(String[] args) {
                String url = ConfigUtil.getInstance().getWebService()+ WebServiceUtil.getInstance().getValue("student.login");
                Map<String, String> params = new HashMap<>();
                params.put("username","ohfJbuJsHcJE5oy6DLeitt7NLTcY");
                params.put("branchName","twwt");
                HttpUtil.doPost(url, params);
        }
}