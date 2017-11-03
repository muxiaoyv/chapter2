package com.smart.service;

import com.smart.dao.MessagesDao;
import com.smart.domain.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {
    private MessagesDao messagesDao;

    @Secured({"ROLE_ADMIN","ROLE_CAN_WRITE"})
    public List<Message> getMessages(int parentId, String keyWord){
        return messagesDao.getMessages(parentId, keyWord);
    }

    @Secured({"ROLE_ADMIN","ROLE_CAN_READ"})
    public List<Message> getMessages(){
        return messagesDao.getMessages(0, "");
    }

    @Secured({"ROLE_ADMIN","ROLE_CAN_WRITE"})
    public void insertMessage(int parentId, String content, String title, int userId, String toUser){
        messagesDao.insertMessage(parentId, content, title, userId, toUser);
    }

    @Secured({"ROLE_ADMIN","ROLE_CAN_WRITE"})
    public void upCount(int messageId){
        messagesDao.upCount(messageId);
    }

    @Secured({"ROLE_ADMIN","ROLE_CAN_DELETE"})
    public void deleteMessage(int messageId){
        messagesDao.deleteMessage(messageId);
    }

    @Autowired
    public void setUserDao(MessagesDao messagesDao) {
        this.messagesDao = messagesDao;
    }
}
