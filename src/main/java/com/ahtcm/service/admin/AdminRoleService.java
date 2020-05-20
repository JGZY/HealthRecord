package com.ahtcm.service.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Permission;
import com.ahtcm.domain.Role;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;

import java.util.List;

public interface AdminRoleService {
    PageListResult getRoleList(QueryVo vo);

    List<Role> getRoles();

    List<Permission> getPermissionList();

    AjaxRes saveRole(Role role);

    List<Permission> getPermissionByRid(Long rid);

    AjaxRes updateRole(Role role);

    AjaxRes deleteRole(Long rid);

    List<String> getRolesByAccount(String account);

    List<String> getPermissionByAccount(String account);

    AjaxRes addPermission(Permission permission);
}
