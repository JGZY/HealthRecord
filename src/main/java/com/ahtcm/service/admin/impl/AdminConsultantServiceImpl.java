package com.ahtcm.service.admin.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.ajaxResponse.impl.ConsultantCode;
import com.ahtcm.domain.*;
import com.ahtcm.mapper.*;
import com.ahtcm.service.admin.AdminConsultantService;
import com.ahtcm.util.EncryptionUtil;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.util.ShiroUtil;
import com.ahtcm.util.validate.impl.ConsultantValidateUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class AdminConsultantServiceImpl implements AdminConsultantService {

    @Autowired
    private ConsultantMapper consultantMapper;

    @Autowired
    private CommunityMapper communityMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private CommunityAdminMapper communityAdminMapper;

    @Override
    public PageListResult getConsultantList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        User user = ShiroUtil.getActiveUser();
        Role role = roleMapper.getRoleByUserAccount(user.getAccount());
        Long cid = null;
        if("社区管理员".equals(role.getRname())){
            CommunityAdmin communityAdmin = communityAdminMapper.selectByAccount(user.getAccount());
            cid= communityAdmin.getCommunity().getId();
        }
        List<Consultant> consultants = consultantMapper.selectAll(vo.getKeyword(),cid);
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        pageListResult.setRows(consultants);
        return pageListResult;

    }

    @Override
    public List<Community> getCommunityList() {
        return communityMapper.selectAll();
    }

    @Override
    public AjaxRes addConsultant(Consultant consultant) {
        AjaxRes ajaxRes = ConsultantValidateUtil.getInstance().validatePhone(consultant);
        if(ajaxRes!=null){
            return ajaxRes;
        }
        List<User> users = userMapper.selectUsersByAccount(consultant.getConsultantAccount());
        if(users.size()>0){
            return ConsultantCode.HAS_SAME_ACCOUNT;
        }
        try{
            String consultantPassword = consultant.getConsultantPassword();
            consultantPassword = EncryptionUtil.encryption(consultant.getConsultantAccount(), consultantPassword);
            consultant.setConsultantPassword(consultantPassword);
            consultantMapper.insert(consultant);
            Role role = roleMapper.selectConsultantRole();
            //建立用户和角色的关系
            userMapper.insertUserRoleRel(consultant.getId(),role.getRid(),consultant.getConsultantAccount(),consultantPassword);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return CommonCode.FAIL;
        }
    }

    @Override
    public AjaxRes editConsultant(Consultant consultant) {
        AjaxRes ajaxRes = ConsultantValidateUtil.getInstance().validatePhone(consultant);
        if(ajaxRes!=null){
            return ajaxRes;
        }
        List<Consultant> consultants = consultantMapper.selectOtherByAccount(consultant.getConsultantAccount(),consultant.getId());
        if(consultants.size()>0){
            return ConsultantCode.HAS_SAME_ACCOUNT;
        }
        try{
            consultantMapper.updateByPrimaryKey(consultant);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public AjaxRes deleteConsultantById(Long id) {
        try{
            consultantMapper.deleteByPrimaryKey(id);
            Role role = roleMapper.selectConsultantRole();
            userMapper.deleteUserRoleRel(id,role.getRid());
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }
}
