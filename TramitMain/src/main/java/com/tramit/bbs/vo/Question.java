package com.tramit.bbs.vo;

import java.sql.Timestamp;

public class Question {

    private int id;
    private String title;
    private String writer;
    private String content;
    private String password;
    private Timestamp regDate;
    private int readCount;

    public Question() { }

    public Question(int id, String title, String writer, String content,
                    String password, Timestamp regDate, int readCount) {
        this.id = id;
        this.title = title;
        this.writer = writer;
        this.content = content;
        this.password = password;
        this.regDate = regDate;
        this.readCount = readCount;
    }

    public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getRegDate() {
        return regDate;
    }
    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }
}
