package com.smart.dao;

import com.smart.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UserDao {
    private JdbcTemplate jdbcTemplate;
    private  final static String MATCH_COUNT_SQL = " SELECT count(*) FROM t_user  " +
            " WHERE user_name =? and password=? ";
    private  final static String SEARCH_USER_SQL = " SELECT * FROM t_user  " ;
    private  final static String EXIST_COUNT_SQL = " SELECT count(*) FROM t_user  " +
            " WHERE user_name =?";
    private  final static String UPDATE_LOGIN_INFO_SQL = " UPDATE t_user SET " +
            " last_visit=?,last_ip=?,credits=?  WHERE user_id =? ";
    private  final static String UPDATE_PERMISSIONS_SQL = " UPDATE t_user SET " +
            " permissions=?  WHERE user_id =? ";
    private  final static String UPDATE_PASSWORD_SQL = " UPDATE t_user SET " +
            " password=?  WHERE user_id =? ";
    private final static String REGISTER_SQL = " insert into t_user (user_name, password, email) value (?, ?, ?) ";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<User> getUsers(){
        return jdbcTemplate.query(SEARCH_USER_SQL, new Object[]{}, new UserMapper());
    }

    public int getMatchCount(String userName, String password){
        return jdbcTemplate.queryForObject(MATCH_COUNT_SQL, new Object[]{userName,
                password}, Integer.class);
    }

    public void register(String userName, String password, String email){
        jdbcTemplate.update(REGISTER_SQL, new Object[]{userName,
                password, email});
    }

    public int isUserExist(String userName){
        return jdbcTemplate.queryForObject(EXIST_COUNT_SQL, new Object[]{ userName }, Integer.class);
    }

    public void modifyUserPermissions(int permissions, int uerId){
        jdbcTemplate.update(UPDATE_PERMISSIONS_SQL, new Object[] { permissions, uerId });
    }

    public void modifyUserPassword(String password, int uerId){
        jdbcTemplate.update(UPDATE_PASSWORD_SQL, new Object[] { password, uerId });
    }

    public User findUserByUserName(final String userName) {
        String sqlStr = " SELECT user_id,permissions, roles, password, last_visit, email"
                + " FROM t_user WHERE user_name =? ";
        final User user = new User();
        jdbcTemplate.query(sqlStr, new Object[] { userName },
                new RowCallbackHandler() {
                    public void processRow(ResultSet rs) throws SQLException {
                        user.setUserId(rs.getInt("user_id"));
                        user.setRoles(rs.getString("roles"));
                        user.setUserName(userName);
                        user.setPermissions(rs.getInt("permissions"));
                        user.setPassword(rs.getString("password"));
                        user.setLastVisit(rs.getTimestamp("last_visit"));
                        user.setEmail(rs.getString("email"));
                    }
                });
        return user;
    }

    public void updateLoginInfo(User user) {
        jdbcTemplate.update(UPDATE_LOGIN_INFO_SQL, new Object[] { user.getLastVisit(),
                user.getLastIp(),user.getCredits(),user.getUserId()});
    }

    protected class UserMapper implements RowMapper {
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User s = new User(rs.getInt("user_id"),
                    rs.getString("user_name"),
                    rs.getInt("permissions"),
                    rs.getString("roles"),
                    rs.getInt("credits"),
                    rs.getTimestamp("last_visit"),
                    rs.getString("email")
            );
            return s;
        }
    }
}

