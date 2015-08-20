package com.ming800.hsc.BaseUtil;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public class ConfigUtil {
	private static ConfigUtil instance = null;
	
	private String appid;
	private String appsecret;
	private String webService;

	public String getWebService() {
		if (webService==null || webService.trim().length()<1){
			initServer();
		}
		return webService;
	}

	public void setWebService(String webService) {
		this.webService = webService;
	}

	public String getAppid() {
		if (appid==null || appid.trim().length()<1){
			initServer();
		}
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getAppsecret() {
		if (appsecret==null || appsecret.trim().length()<1){
			initServer();
		}
		return appsecret;
	}

	public void setAppsecret(String appsecret) {
		this.appsecret = appsecret;
	}

	private ConfigUtil() {
	}

	public static ConfigUtil getInstance() {
		if (instance == null)
			instance = new ConfigUtil();
		return instance;
	}


	public void initServer(){
		ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		XMLUtils xml = new XMLUtils();
		try {
			Resource[] reSources = resolver.getResources("/config.xml");
			Resource xmlFile = reSources[0];
			xml.load(xmlFile.getFile());

			appid = xml.getParameters("appid");
			appsecret = xml.getParameters("appsecret");
			webService = xml.getParameters("webservice");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	class XMLUtils {
		Document document;

		public void load(File xmlFile) throws FileNotFoundException {
			SAXReader reader = new SAXReader();
			try {
				document = reader.read(xmlFile);
			} catch (DocumentException e) {
				e.printStackTrace();
			}
		}
		public String getParameters(String key) {
			Element root = document.getRootElement();
			List list = root.selectNodes("//Parameters");
			for (Object j : list) {
				Element e = (Element) j;
				if (key.equals(e.selectSingleNode("Key").getText().trim())) {
					return e.selectSingleNode("Value").getText();
				}
			}
			return null;

		}
	}


	public static void main(String[] args) {
		System.out.println(	ConfigUtil.getInstance().getWebService());
	}
}