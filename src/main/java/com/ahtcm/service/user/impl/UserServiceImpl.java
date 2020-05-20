package com.ahtcm.service.user.impl;

import com.ahtcm.domain.*;
import com.ahtcm.mapper.*;
import com.ahtcm.service.user.UserService;
import com.ahtcm.util.ShiroUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired ResidentMapper residentMapper;

    @Autowired ConsultantMapper consultantMapper;

    @Autowired AdminMapper adminMapper;

    @Autowired CommunityAdminMapper communityAdminMapper;

    @Autowired
    RoleMapper roleMapper;

    @Override
    public String getUserName() {
        User user = ShiroUtil.getActiveUser();
        Long rid = user.getRid();
        Long uid = user.getUid();
        String username = null;
        List<Role> roles = roleMapper.getRoles();
        Map<Long,String> roleMap = new HashMap<>();
        roles.forEach(role-> roleMap.put(role.getRid(),role.getRname()));
        String roleName = roleMap.get(rid);
        switch (roleName) {
            case "社区居民":
                Resident resident = residentMapper.selectByPrimaryKey(uid);
                username = resident.getResidentName();
                break;
            case "社区医师":
                Consultant consultant = consultantMapper.selectByPrimaryKey(uid);
                username = consultant.getConsultantName();
                break;
            case "超级管理员":
                Admin admin = adminMapper.selectByPrimaryKey(uid);
                username = admin.getName();
                break;
            default:
                CommunityAdmin communityAdmin = communityAdminMapper.selectByPrimaryKey(uid);
                username = communityAdmin.getName();
                break;
        }
        return username;
    }
}
