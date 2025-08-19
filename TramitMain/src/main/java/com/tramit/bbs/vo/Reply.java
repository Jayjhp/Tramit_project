package com.tramit.bbs.vo;

import java.sql.Timestamp;

public class Reply {
	private int no;
	private int reviewBno;
	private String replyContent;
	private String replyWriter;
	private Timestamp regDate;
	
	public Reply() { }
	public Reply(int reviewBno, String replyContent, String replyWriter) {
		this.reviewBno = reviewBno;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
	}	
	public Reply(int no, int reviewBno, String replyContent, 
			String replyWriter, Timestamp regDate) {
		
		this.no = no;
		this.reviewBno = reviewBno;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.regDate = regDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getReviewBno() {
		return reviewBno;
	}
	public void setReviewBno(int reviewBno) {
		this.reviewBno = reviewBno;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}			
}
