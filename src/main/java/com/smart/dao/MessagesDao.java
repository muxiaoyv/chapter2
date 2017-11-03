package com.smart.dao;

import com.smart.domain.Message;
import com.smart.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class MessagesDao {
    private JdbcTemplate jdbcTemplate;
    private final static String SEARCH_MESSAGES_SQL = " SELECT user_name, datetime, content, title, up_count, parent_id, count, user_name, to_user, message_id FROM t_message as m " +
            " left join t_user as u on m.user_id = u.user_id WHERE m.parent_id=? or message_id=? order by message_id";
    private final static String SEARCH_MESSAGES_KEYWORD__SQL = " SELECT user_name, datetime, content, title, up_count, parent_id, count, user_name, to_user, message_id FROM t_message as m " +
            " left join t_user as u on m.user_id = u.user_id WHERE (m.parent_id=? or message_id=?) and (content like ? or title like ?) order by message_id";
    private final static String INSERTE_MESSAGE_SQL = " insert into t_message (parent_id, content, title, user_id, to_user, datetime) value (?, ?, ?, ?, ?, now()) ";
    private final static String DELETE_MESSAGE_SQL = " delete from t_message where message_id=? or parent_id=?";
    private final static String UPDATE_COUNT_SQL = "update t_message set count=count+? where message_id=?";
    private final static String UPDATE_UPCOUNT_SQL = "update t_message set up_count=up_count+1 where message_id=?";
    private final static String GET_PARENT_SQL = "select parent_id from t_message where message_id=?";
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Message> getMessages(int parentId, String keyWord){
        if(keyWord == ""){
            String sql = parentId == 0?SEARCH_MESSAGES_SQL+" desc":SEARCH_MESSAGES_SQL;
            List<Message> messages = jdbcTemplate.query(sql, new Object[] { parentId, parentId },
                    new MessageMapper());
            return messages;
        }else{
            String sql = parentId == 0?SEARCH_MESSAGES_KEYWORD__SQL+" desc":SEARCH_MESSAGES_KEYWORD__SQL;
            keyWord = "%"+keyWord+"%";
            List<Message> messages = jdbcTemplate.query(sql, new Object[] { parentId, parentId, keyWord, keyWord },
                    new MessageMapper());
            return messages;
        }
    }
    public void upCount(int messageId){
        jdbcTemplate.update(UPDATE_UPCOUNT_SQL, new Object[]{messageId});
    }

    public void insertMessage(int parentId, String content, String title, int userId, String toUser){
        jdbcTemplate.update(INSERTE_MESSAGE_SQL, new Object[]{parentId, content, title, userId, toUser});
        if(parentId!=0) {
            jdbcTemplate.update(UPDATE_COUNT_SQL, new Object[]{1, parentId});
        }
    }

    public void deleteMessage(int messageId){
        int parentId = jdbcTemplate.queryForObject(GET_PARENT_SQL, new Object[]{messageId}, Integer.class);
        jdbcTemplate.update(DELETE_MESSAGE_SQL, new Object[]{messageId, messageId});
        if(parentId!=0) {
            jdbcTemplate.update(UPDATE_COUNT_SQL, new Object[]{-1, parentId});
        }
    }

    protected class MessageMapper implements RowMapper {
        public Message mapRow(ResultSet rs, int rowNum) throws SQLException {
            Message s = new Message(rs.getString("user_name"),
                    rs.getString("content"),
                    rs.getString("title"),
                    rs.getInt("count"),
                    rs.getInt("up_count"),
                    rs.getInt("parent_id"),
                    rs.getTimestamp("datetime"),
                    rs.getString("to_user"),
                    rs.getInt("message_id")
                    );
            return s;
        }
    }
}
