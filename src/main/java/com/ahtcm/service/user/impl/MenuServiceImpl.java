package com.ahtcm.service.user.impl;

import com.ahtcm.domain.*;
import com.ahtcm.mapper.*;
import com.ahtcm.service.user.MenuService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    MenuMapper menuMapper;

    @Autowired
    PermissionMapper permissionMapper;

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    ConsultantMapper consultantMapper;

    @Autowired
    CommunityAdminMapper communityAdminMapper;


    @Override
    public List<Menu> getTreeData() {
        List<Menu> menus = menuMapper.getTreeData();
        Subject subject = SecurityUtils.getSubject();
        User user = (User)subject.getPrincipal();
        Role role = roleMapper.getRoleByUserAccount(user.getAccount());
        if("communityAdmin".equals(role.getRnum())){
            menus.forEach(menu->{
                if(menu.getText().equals("管理员菜单")){
                    CommunityAdmin communityAdmin = communityAdminMapper.selectByPrimaryKey(user.getUid());
                    menu.setText("社区管理员菜单"+"("+communityAdmin.getCommunity().getCommunityName()+")");
                }
            });
        }
        if("consultant".equals(role.getRnum())){
            menus.forEach(menu->{
                if(menu.getText().equals("社区医师菜单")){
                    Consultant consultant = consultantMapper.selectByPrimaryKey(user.getUid());
                    menu.setText("社区医师菜单"+"("+consultant.getCommunity().getCommunityName()+")");
                }
            });
        }
        this.checkPermission(menus,user);
        return menus;
    }

    private void checkPermission(List<Menu> menus,User user){
        Subject subject = SecurityUtils.getSubject();
        //遍历所有菜单及其子菜单
        Iterator<Menu> iterator = menus.iterator();
        while(iterator.hasNext()){
            Menu menu = iterator.next();
            Permission permission = menu.getPermission();
            if(permission!=null){
                /*判断当前是否有权限对象
                 * 如果没有，就从集合中移除
                 * */
                Long pid = permission.getPid();
                List<Permission> permissions = permissionMapper.selectPermissionByRid(user.getRid());
                List<Long> pidCollect = permissions.stream().map(Permission::getPid).collect(Collectors.toList());
                if(!pidCollect.contains(pid)){
                    iterator.remove();
                    continue;
                }
            }
            /*判断是否有子菜单 ，子菜单也要做权限校验*/
            if(menu.getChildren().size()>0){  /*递归调用 当size<=0，跳出递归*/
                checkPermission(menu.getChildren(),user);
            }
        }

    }
}
