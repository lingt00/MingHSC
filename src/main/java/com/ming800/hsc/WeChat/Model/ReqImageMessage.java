package com.ming800.hsc.WeChat.Model;

/**
 * 图片消息
 * @author GUOHF
 *
 */
public class ReqImageMessage extends ReqBaseMessage {
	// 图片链接
	private String PicUrl;

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
}