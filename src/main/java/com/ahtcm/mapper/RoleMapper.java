package com.ahtcm.mapper;

import com.ahtcm.domain.Role;
import com.ahtcm.util.QueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Long rid);

    int insert(Role record);

    Role selectByPrimaryKey(Long rid);

    List<Role> selectAll(QueryVo vo);

    int updateByPrimaryKey(Role record);

    void insertRoleAndPermissionRel(@Param("rid") Long rid, @Param("pid") Long pid);

    void deletePermissionRel(Long rid);

    Role selectResidentRole();

    Role selectConsultantRole();

    Role selectCommunityAdminRole();

    List<Role> getRoles();

    List<String> getRolesByAccount(String account);

    List<String> getPermissionByAccount(String account);

    Role getRoleByUserAccount(String account);
}