package com.ahtcm.util.validate.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommunityAdminCode;
import com.ahtcm.domain.CommunityAdmin;
import com.ahtcm.util.validate.CommunityAdminValidate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CommunityAdminValidateUtil implements CommunityAdminValidate {

    private CommunityAdminValidateUtil(){}

    private static CommunityAdminValidateUtil communityAdminValidateUtil = null;

    //DCL双重检查锁定单例
    public static CommunityAdminValidateUtil getInstance(){
        if(communityAdminValidateUtil == null){
            synchronized( CommunityAdminValidateUtil.class ){
                if( communityAdminValidateUtil == null ) {
                    communityAdminValidateUtil = new CommunityAdminValidateUtil();
                }
            }
        }
        return communityAdminValidateUtil;
    }

    //手机号-正则
    private static final String PHONE_REGEX = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[013678])|(18[0,5-9]))\\d{8}$";
    //中文户籍 - 正则
    private static final String CHINESE_REGEX = "[\\u4e00-\\u9fa5]{2,20}";
    //账号 - 正则
    private static final String ACCOUNT_REGEX = "^[a-zA-Z]{1}[-_a-zA-Z0-9]{5,19}+$";

    public AjaxRes validateObj(CommunityAdmin communityAdmin){
        AjaxRes phoneAjax = validatePhone(communityAdmin);
        if(phoneAjax!=null){
            return phoneAjax;
        }
        AjaxRes accountAjax = validateAccount(communityAdmin);
        if(accountAjax!=null){
            return accountAjax;
        }
        AjaxRes nameAjax = validateName(communityAdmin);
        if(nameAjax!=null){
            return nameAjax;
        }
        return null;
    }

    @Override
    public AjaxRes validatePhone(CommunityAdmin communityAdmin) {
        String phone = communityAdmin.getPhone();
        Pattern pattern = Pattern.compile(CommunityAdminValidateUtil.PHONE_REGEX);
        Matcher matcher = pattern.matcher(phone);
        boolean flag = matcher.matches();
        if(flag){
            return null;
        }else{
            return CommunityAdminCode.PHONE_ILLEGAL;
        }
    }

    @Override
    public AjaxRes validateName(CommunityAdmin communityAdmin) {
        String name = communityAdmin.getName();
        Pattern pattern = Pattern.compile(CommunityAdminValidateUtil.CHINESE_REGEX);
        Matcher matcher = pattern.matcher(name);
        boolean flag = matcher.matches();
        if(flag){
            return null;
        }else{
            return CommunityAdminCode.NAME_ILLEGAL;
        }
    }

    @Override
    public AjaxRes validateAccount(CommunityAdmin communityAdmin) {
        String account = communityAdmin.getAccount();
        Pattern pattern = Pattern.compile(CommunityAdminValidateUtil.ACCOUNT_REGEX);
        Matcher matcher = pattern.matcher(account);
        boolean flag = matcher.matches();
        if(flag){
            return null;
        }else{
            return CommunityAdminCode.ACCOUNT_ILLEGAL;
        }
    }
}
