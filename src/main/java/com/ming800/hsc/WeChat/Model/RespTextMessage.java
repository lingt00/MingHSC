package com.ming800.hsc.WeChat.Model;

/**
 * 文本消息
 * @author GUOHF
 *
 */
public class RespTextMessage extends RespBaseMessage {
	// 回复的消息内容
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}