package com.smart.domain;

import java.util.Date;

public class Message {
    private int messageId;
    private String userName;
    private String toUserName;
    private String content;
    private String title;
    private int count;
    private int upCount;
    private int parentId;
    private Date date;

    public Message(String userName, String content, String  title, int count, int upCount, int parentId, Date date, String toUserName, int messageId) {
        this.messageId = messageId;
        this.userName = userName;
        this.content = content;
        this.title = title;
        this.count = count;
        this.upCount = upCount;
        this.parentId = parentId;
        this.date = date;
        this.toUserName = toUserName;
    }

    public Message() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getUpCount() {
        return upCount;
    }

    public void setUpCount(int upCount) {
        this.upCount = upCount;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getToUserName() {
        return toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }
}
