package com.ahtcm.service.admin.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.AuditCode;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.domain.*;
import com.ahtcm.mapper.CommunityAdminMapper;
import com.ahtcm.mapper.RoleMapper;
import com.ahtcm.mapper.UserMapper;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.mapper.ResidentMapper;
import com.ahtcm.service.admin.AdminApplyService;
import com.ahtcm.util.ShiroUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class AdminApplyServiceImpl implements AdminApplyService {

    @Autowired
    ResidentMapper residentMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    private CommunityAdminMapper communityAdminMapper;

    @Override
    public PageListResult getApplyAccountList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        List<Resident> residents = residentMapper.selectApplyList();
        User user = ShiroUtil.getActiveUser();
        Role role = roleMapper.getRoleByUserAccount(user.getAccount());
        if("社区管理员".equals(role.getRname())){
            CommunityAdmin communityAdmin = communityAdminMapper.selectByAccount(user.getAccount());
            Community community = communityAdmin.getCommunity();
            residents = residents.stream().filter(resident -> {
                Community residentCommunity = resident.getResidentCommunity();
                if(residentCommunity==null){
                    return true;
                }else {
                    String communityName = residentCommunity.getCommunityName();
                    return communityName == null || communityName.equals(community.getCommunityName());
                }
            }).collect(Collectors.toList());
        }
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        pageListResult.setRows(residents);
        return pageListResult;
    }

    @Override
    public AjaxRes setAuditPass(Long id) {
        Resident resident = residentMapper.selectByPrimaryKey(id);
        //查询是否有相同账号
        List<User> users = userMapper.selectUsersByAccount(resident.getResidentAccount());
        if(users.size()>0){
            return AuditCode.SAME_ACCOUNT;
        }
        try{
            residentMapper.updateAuditPass(id);
            //获取社区居民角色id
            Role role = roleMapper.selectResidentRole();
            //建立该用户与角色之间的关系
            userMapper.insertUserRoleRel(id,role.getRid(),resident.getResidentAccount(),resident.getResidentPassword());
            return AuditCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public AjaxRes setAuditNoPass(Long id) {
        try{
            residentMapper.updateAuditNoPass(id);
            return AuditCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }
}
