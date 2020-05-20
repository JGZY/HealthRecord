package com.ahtcm.web.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Permission;
import com.ahtcm.domain.Role;
import com.ahtcm.service.admin.AdminRoleService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin/role")
public class AdminRoleController {

    @Autowired
    AdminRoleService adminRoleService;

    @RequestMapping("/addPermission")
    public AjaxRes addPermission(Permission permission){
        return adminRoleService.addPermission(permission);
    }

    @RequestMapping("/getRoleList")
    public PageListResult getRoleList(QueryVo vo){
        return adminRoleService.getRoleList(vo);
    }

    @RequestMapping("/getPermissionList")
    public List<Permission> getPermissionList(){
        return adminRoleService.getPermissionList();
    }

    @RequestMapping("/saveRole")
    public AjaxRes saveRole(Role role){
        return adminRoleService.saveRole(role);
    }

    @RequestMapping("/getPermissionByRid/{rid}")
    public List<Permission> getPermissionByRid(@PathVariable("rid") Long rid){
        return adminRoleService.getPermissionByRid(rid);
    }

    @RequestMapping("/updateRole")
    public AjaxRes updateRole(Role role){
        return adminRoleService.updateRole(role);
    }

    @RequestMapping("/deleteRole/{rid}")
    public AjaxRes deleteRole(@PathVariable("rid") Long rid){
        return adminRoleService.deleteRole(rid);
    };
}
