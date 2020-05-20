package com.ahtcm.realm;

import com.ahtcm.domain.User;
import com.ahtcm.mapper.UserMapper;
import com.ahtcm.service.admin.AdminRoleService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class HealthRealm extends AuthorizingRealm {

    @Autowired
    UserMapper userMapper;

    @Autowired
    AdminRoleService adminRoleService;

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        User user = (User)SecurityUtils.getSubject().getPrincipal();
        List<String> roles = new ArrayList<>();
        List<String> permissions = new ArrayList<>();
        roles = adminRoleService.getRolesByAccount(user.getAccount());
        String adminStr = "admin";
        if(adminStr.equals(user.getAccount())){
            permissions.add("*:*");
        }else{
            permissions = adminRoleService.getPermissionByAccount(user.getAccount());
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(roles);
        info.addStringPermissions(permissions);
        return info;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String account = (String)token.getPrincipal();
        User user = userMapper.selectUserByAccount(account);
        SimpleAuthenticationInfo info ;
        if(user == null){
            return null;
        }
        ByteSource bytes = ByteSource.Util.bytes(user.getAccount());
        info = new SimpleAuthenticationInfo(user, user.getPassword(),bytes, this.getName());
        return info;
    }
}
