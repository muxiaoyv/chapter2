package com.smart.web;

import com.smart.domain.Message;
import com.smart.domain.User;
import com.smart.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class MessageController {
    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "/message/{id}/{keyWord}", method = RequestMethod.GET)
    public @ResponseBody List<Message> getResponses(@PathVariable("id") int id, @PathVariable("keyWord") String keyWord) {
        try {
            byte[] tmp = keyWord.getBytes("ISO8859_1");
            keyWord = new String(tmp, "UTF-8");
        } catch (Exception e) {
            System.out.println(e);
        }
        return messageService.getMessages(id,keyWord);
    }

    @RequestMapping(value = "/message/{id}", method = RequestMethod.GET)
    public @ResponseBody List<Message> getResponses(@PathVariable("id") int id) {
        return messageService.getMessages(id,"");
    }

    @RequestMapping(value = "/message", method = RequestMethod.GET)
    public @ResponseBody List<Message> getMessages() {
        return messageService.getMessages();
    }

    @RequestMapping(value = "/message", method = RequestMethod.POST)
    public void insertMessage(@RequestBody MessageModel message, HttpServletRequest request){
        messageService.insertMessage(message.getParentId(), message.getContent(), message.getTitle(), ((User)request.getSession().getAttribute("user")).getUserId(), message.getToUser());
    }

    @RequestMapping(value = "/message/{id}", method = RequestMethod.DELETE)
    public void deleteMessage(@PathVariable int id){
        messageService.deleteMessage(id);
    }

    @RequestMapping(value = "/message/up/{id}", method = RequestMethod.GET)
    public void upCount(@PathVariable int id){
        messageService.upCount(id);
    }

}
