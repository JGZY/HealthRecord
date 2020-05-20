package com.ahtcm.mapper;

import com.ahtcm.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int insert(User record);

    User selectByPrimaryKey(Long uid);

    List<User> selectAll();

    void insertUserRoleRel(@Param("uid") Long uid, @Param("rid") Long rid,@Param("account") String account,@Param("password") String password);

    void deleteUserRoleRel(@Param("uid")Long uid, @Param("rid")Long rid);

    List<User> selectUsersByAccount(String account);

    List<User> selectOtherUsersByAccount(@Param("account") String account,@Param("uid") Long uid,@Param("rid") Long rid);

    User selectUserByAccount(String account);
}