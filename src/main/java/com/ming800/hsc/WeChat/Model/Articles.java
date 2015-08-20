package com.ming800.hsc.WeChat.Model;

import java.util.ArrayList;
import java.util.List;

public class Articles {

    private List<Article> articles;

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		if(articles.size()>8) //数据太多推送不到前台（微信不支持）
			articles  = new ArrayList<Article>(articles.subList(0, 8));
		this.articles = articles;
	}

}