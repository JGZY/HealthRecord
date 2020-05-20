package com.ahtcm.service.admin.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.ajaxResponse.impl.ResidentCode;
import com.ahtcm.domain.*;
import com.ahtcm.mapper.*;
import com.ahtcm.service.admin.AdminResidentService;
import com.ahtcm.util.ObjectAttribute;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.util.ShiroUtil;
import com.ahtcm.util.validate.impl.ResidentValidateUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
//所有的验证均在业务层完成
public class AdminResidentServiceImpl implements AdminResidentService {

    @Autowired
    private ResidentMapper residentMapper;

    @Autowired
    private CommunityMapper communityMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private CommunityAdminMapper communityAdminMapper;

    @Autowired
    private ConsultantMapper consultantMapper;

    @Override
    public PageListResult getResidentList(QueryVo vo) {
        //分页
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        User user = ShiroUtil.getActiveUser();
        Role role = roleMapper.getRoleByUserAccount(user.getAccount());
        Long cid = null;
        if("社区管理员".equals(role.getRname())){
            CommunityAdmin communityAdmin = communityAdminMapper.selectByAccount(user.getAccount());
            cid= communityAdmin.getCommunity().getId();
        }
        if("社区医师".equals(role.getRname())){
            Consultant consultant =consultantMapper.selectByAccount(user.getAccount());
            cid= consultant.getCommunity().getId();
        }
        List<Resident> residents = residentMapper.selectAll(vo.getKeyword(),cid);
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        pageListResult.setRows(residents);
        return pageListResult;
    }

    @Override
    public List<Community> getCommunityList() {
       return communityMapper.selectAll();
    }

    @Override
    public AjaxRes updateResident(Resident resident) {

        Resident resident2 = this.getResidentById(resident.getId());
        //判断表单数据是否被修改
        boolean flag = ObjectAttribute.attributeIsChange(resident, resident2);
        if(!flag){
            return CommonCode.NOTEDITFORM;
        }
        //对表单数据进行验证
        ResidentValidateUtil validateUtil = ResidentValidateUtil.getInstance();
        AjaxRes ajaxRes = validateUtil.validateObj(resident);
        if(ajaxRes!=null){
            return ajaxRes;
        }
        //同名账号验证
        List<Resident> residents = this.getSameAccountResident(resident.getResidentAccount(),resident.getId());
        if(residents.size()>0){
            return ResidentCode.SAMEACCOUNT_ERROR;
        }
        try{
            residentMapper.updateByPrimaryKey(resident);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public Resident getResidentById(Long id) {
        return residentMapper.selectByPrimaryKey(id);
    }

    @Override
    public AjaxRes deleteResidentById(Long id) {
        try{
            residentMapper.deleteByPrimaryKey(id);
            //删除用户与角色之间的关系
            Role role = roleMapper.selectResidentRole();
            userMapper.deleteUserRoleRel(id,role.getRid());
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public List<Resident> getSameAccountResident(String residentAccount,Long id) {
        return residentMapper.selectSameAccountResident(residentAccount,id);
    }
}
