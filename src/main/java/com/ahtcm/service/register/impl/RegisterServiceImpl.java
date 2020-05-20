package com.ahtcm.service.register.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.ajaxResponse.impl.RegisterCode;
import com.ahtcm.ajaxResponse.impl.ResidentCode;
import com.ahtcm.domain.Community;
import com.ahtcm.domain.CommunityAdmin;
import com.ahtcm.domain.Resident;
import com.ahtcm.domain.User;
import com.ahtcm.mapper.*;
import com.ahtcm.service.register.RegisterService;
import com.ahtcm.util.EncryptionUtil;
import com.ahtcm.util.ResidentHandlerUtil;
import com.ahtcm.util.validate.impl.ResidentValidateUtil;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Transactional
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    CommunityMapper communityMapper;
    @Autowired
    ResidentMapper residentMapper;
    @Autowired
    RoleMapper roleMapper;
    @Autowired
    CommunityAdminMapper communityAdminMapper;
    @Autowired
    UserMapper userMapper;


    @Override
    public List<Community> getCommunityList() {
        return communityMapper.selectAll();
    }

    //注册
    @Override
    public AjaxRes register(Resident resident) {
        ResidentValidateUtil util = ResidentValidateUtil.getInstance();
        AjaxRes res = util.validateName(resident);
        if(res!=null){
            return res;
        }
        AjaxRes ajaxRes = util.validatePhone(resident);
        if(ajaxRes!=null){
            return ajaxRes;
        }
        resident = new ResidentHandlerUtil().convertStrField(resident);
        //对密码加密
        String password = EncryptionUtil.encryption(resident.getResidentAccount(),resident.getResidentPassword());
        resident.setResidentPassword(password);
        Set<Object> set = new HashSet<>();
        set.add(resident.getResidentName());
        set.add(resident.getResidentAccount());
        set.add(resident.getResidentPassword());
        set.add(resident.getResidentPhone());
        set.add(resident.getResidentCommunity());
        if(set.size()<5){
            return RegisterCode.HAS_NULL_FIELD;
        }
        //查询是否相同账号
        List<User> users = userMapper.selectUsersByAccount(resident.getResidentAccount());
        if(users.size()>0){
            return RegisterCode.HAS_SAME_ACCOUNT;
        }

        try{
            residentMapper.insert(resident);
            //给社区管理员发送信息
            /*Long id = resident.getResidentCommunity().getId();
            List<CommunityAdmin> communityAdmins = communityAdminMapper.selectAdminByCid(id);//查询对应的社区管理员*/
            return CommonCode.SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return CommonCode.FAIL;
        }
    }
}
