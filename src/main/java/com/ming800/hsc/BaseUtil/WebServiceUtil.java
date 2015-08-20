package com.ming800.hsc.BaseUtil;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by 凌涛 on 2014/11/13 18:04.
 * function:
 *
 */
public class WebServiceUtil {
    private static WebServiceUtil instance = null;

    private Properties properties;
    private InputStream inputFile;

    public static String filePath = "webService.properties";

    public WebServiceUtil(){
        if (properties==null){
            initService();
        }
    }
    public String getValue(String key){
        if(properties.containsKey(key)){
            return properties.getProperty(key);//得到某一属性的值
        }else {
            initService();
            if(properties.containsKey(key)){
                return properties.getProperty(key);//得到某一属性的值
            }
            return "";
        }
    }
    public static WebServiceUtil getInstance() {
        if (instance == null)
            instance = new WebServiceUtil();
        return instance;
    }

    private void initService(){
        try {
            ClassLoader loader=Thread.currentThread().getContextClassLoader();
            properties = new Properties();
            inputFile =  loader.getResourceAsStream(filePath);
            properties.load(inputFile);
            inputFile.close();
        } catch (FileNotFoundException e) {
            System.out.println("读取属性文件--->失败！- 原因：文件路径错误或者文件不存在");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("装载文件--->失败!");
            e.printStackTrace();
        }
    }
}
