package com.ming800.hsc.WeChat.Model;

/**
 * 文本消息
 * @author GUOHF
 *
 */
public class ReqTextMessage extends ReqBaseMessage {
	// 消息内容
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}