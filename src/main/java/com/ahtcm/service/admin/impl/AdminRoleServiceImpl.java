package com.ahtcm.service.admin.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.domain.Permission;
import com.ahtcm.domain.Role;
import com.ahtcm.mapper.PermissionMapper;
import com.ahtcm.mapper.RoleMapper;
import com.ahtcm.service.admin.AdminRoleService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminRoleServiceImpl implements AdminRoleService{

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    PermissionMapper permissionMapper;

    @Override
    public PageListResult getRoleList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        List<Role> roles = roleMapper.selectAll(vo);
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        pageListResult.setRows(roles);
        return pageListResult;
    }

    @Override
    public List<Role> getRoles() {
        return roleMapper.getRoles();
    }

    @Override
    public List<Permission> getPermissionList() {
        return permissionMapper.selectAll();
    }

    @Override
    public AjaxRes saveRole(Role role) {
        try{
            //保存角色
            roleMapper.insert(role);
            //保存角色-权限之间的关系
            for(Permission permission:role.getPermissions()){
                roleMapper.insertRoleAndPermissionRel(role.getRid(),permission.getPid());
            }
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public List<Permission> getPermissionByRid(Long rid) {
        return permissionMapper.selectPermissionByRid(rid);
    }

    @Override
    public AjaxRes updateRole(Role role) {
        try{
            //打破角色和权限之间的关系   （重要!!!!!!!!!!!!!!!!!!!）
            roleMapper.deletePermissionRel(role.getRid());
            //更新角色
            roleMapper.updateByPrimaryKey(role);
            //重新建立角色与权限之间的关系
            for(Permission permission:role.getPermissions()){
                roleMapper.insertRoleAndPermissionRel(role.getRid(),permission.getPid());
            }
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public AjaxRes deleteRole(Long rid) {
        try{
            roleMapper.deletePermissionRel(rid);
            roleMapper.deleteByPrimaryKey(rid);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public List<String> getRolesByAccount(String account) {
        return roleMapper.getRolesByAccount(account);
    }

    @Override
    public List<String> getPermissionByAccount(String account) {
        return roleMapper.getPermissionByAccount(account);
    }

    @Override
    public AjaxRes addPermission(Permission permission) {
        try{
            permissionMapper.insert(permission);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
        }
        return CommonCode.FAIL;
    }
}
