package com.ahtcm.service.admin.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.ajaxResponse.impl.CommunityAdminCode;
import com.ahtcm.domain.CommunityAdmin;
import com.ahtcm.domain.Role;
import com.ahtcm.mapper.CommunityAdminMapper;
import com.ahtcm.mapper.RoleMapper;
import com.ahtcm.mapper.UserMapper;
import com.ahtcm.service.admin.AdminCommunityAdminService;
import com.ahtcm.util.EncryptionUtil;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.util.validate.impl.CommunityAdminValidateUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminCommunityAdminServiceImpl  implements AdminCommunityAdminService {

    @Autowired
    CommunityAdminMapper communityAdminMapper;

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    UserMapper userMapper;

    private CommunityAdminValidateUtil validateUtil = CommunityAdminValidateUtil.getInstance();

    @Override
    public PageListResult getCommunityAdminList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        List<CommunityAdmin> communityAdmin = communityAdminMapper.selectAll(vo);
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        pageListResult.setRows(communityAdmin);
        return pageListResult;
    }

    @Override
    public AjaxRes addCommunityAdmin(CommunityAdmin communityAdmin) {
        //校验
        AjaxRes ajaxRes = validateUtil.validateObj(communityAdmin);
        if(ajaxRes!=null){
            return ajaxRes;
        }
        CommunityAdmin admin = communityAdminMapper.selectByAccount(communityAdmin.getAccount());
        if(admin!=null){
            return CommunityAdminCode.SAME_ACCOUNT;
        }
        try{
            String password = EncryptionUtil.encryption(communityAdmin.getAccount(),communityAdmin.getPassword());
            communityAdmin.setPassword(password);
            communityAdminMapper.insert(communityAdmin);
            //建立角色与用户之间的关系
            Role role = roleMapper.selectCommunityAdminRole();
            userMapper.insertUserRoleRel(communityAdmin.getId(),role.getRid(),communityAdmin.getAccount(),communityAdmin.getPassword());
            return CommonCode.SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return CommonCode.FAIL;
        }
    }

    @Override
    public AjaxRes editCommunityAdmin(CommunityAdmin communityAdmin) {
        //校验
        AjaxRes ajaxRes = validateUtil.validateObj(communityAdmin);
        if(ajaxRes!=null){
            return ajaxRes;
        }
        try{
            communityAdminMapper.updateByPrimaryKey(communityAdmin);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return CommonCode.FAIL;
        }
    }

    @Override
    public AjaxRes deleteCommunityAdminById(Long id) {
        try{
            //打破角色与用户的关系
            Role role = roleMapper.selectCommunityAdminRole();
            userMapper.deleteUserRoleRel(id,role.getRid());
            communityAdminMapper.deleteByPrimaryKey(id);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return CommonCode.FAIL;
        }
    }
}
