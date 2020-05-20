package com.ahtcm.util.validate.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.ResidentCode;
import com.ahtcm.domain.Resident;
import com.ahtcm.util.validate.ResidentValidate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

//居民属性合法验证工具类
//懒汉模式
public class ResidentValidateUtil implements ResidentValidate {

    private ResidentValidateUtil(){}

    private static ResidentValidateUtil residentValidateUtil = null;

    //DCL双重检查锁定单例
    public static ResidentValidateUtil getInstance(){
        if(residentValidateUtil == null){
            synchronized( ResidentValidateUtil.class ){
                if( residentValidateUtil == null ) {
                    residentValidateUtil = new ResidentValidateUtil();
                }
            }
        }
        return residentValidateUtil;
    }

    //手机号-正则
    private static final String PHONE_REGEX = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[013678])|(18[0,5-9]))\\d{8}$";
    //中文户籍 - 正则
    private static final String CHINESE_REGEX = "[\\u4e00-\\u9fa5]{2,20}";
    //账号 - 正则
    private static final String ACCOUNT_REGEX = "^[a-zA-Z]{1}[-_a-zA-Z0-9]{5,19}+$";
    //中文名
    private static final String CHINESENAME_REGEX = "[\\u4e00-\\u9fa5]{2,5}";

     public  AjaxRes validateObj(Resident resident){
         AjaxRes ajaxAccount = this.validateAccount(resident);
         if(ajaxAccount!=null){
             return ajaxAccount;
         }
         AjaxRes ajaxHeight = this.validateHeight(resident);
        if(ajaxHeight!=null){
            return ajaxHeight;
        }
         AjaxRes ajaxWeight = this.validateWeight(resident);
        if(ajaxWeight!=null){
            return ajaxWeight;
        }
        AjaxRes ajaxPhone = this.validatePhone(resident);
        if(ajaxPhone!=null){
            return ajaxPhone;
        }
        AjaxRes ajaxHouse = this.validateHouse(resident);
         if(ajaxHouse!=null){
             return ajaxHouse;
         }
        return null;
    }

     public AjaxRes validateHeight(Resident resident){
        String residentHeight = resident.getResidentHeight();

        String height = "50-240";
        String regex = "-";
        String[] strArr = height.split(regex);
        int small = Integer.parseInt(strArr[0]);
        int big = Integer.parseInt(strArr[1]);

        try{
            int rh =  Integer.parseInt(residentHeight);
            if(rh>=small&&rh<=big){
                return null;
            }else{
                return ResidentCode.HEIGHT_ERROR;
            }
        }catch (Exception e){
                return ResidentCode.HEIGHT_ILLEGAL;
        }

    }

    public AjaxRes validateWeight(Resident resident){
        String residentWeight = resident.getResidentWeight();
        try{
            int i = Integer.parseInt(residentWeight);
            return null;
        }catch (Exception e){
            return ResidentCode.WEIGHT_ILLEGAL;
        }
    }

    public AjaxRes validatePhone(Resident resident){
        String residentPhone = resident.getResidentPhone();
        if(residentPhone!=null){
            if(residentPhone.length()!=11){
                return ResidentCode.PHONELENGTH_ERROR;
            }
        }else{
            return ResidentCode.PHONE_ILLEGAL;
        }
        Pattern pattern = Pattern.compile(ResidentValidateUtil.PHONE_REGEX);
        Matcher matcher = pattern.matcher(residentPhone);
        boolean flag = matcher.matches();
        if(flag){
            return null;
        }else{
            return ResidentCode.PHONE_ILLEGAL;
        }
    }

    public AjaxRes validateHouse(Resident resident){
        String residentHouse = resident.getResidentHouse();
        Pattern pattern = Pattern.compile(ResidentValidateUtil.CHINESE_REGEX);
        Matcher matcher = pattern.matcher(residentHouse);
        boolean flag = matcher.matches();
        if(flag){
            return null;
        }else{
            return ResidentCode.HOUSE_ILLEGAL;
        }
    }

    public AjaxRes validateAccount(Resident resident){
        String residentAccount = resident.getResidentAccount();
        Pattern pattern = Pattern.compile(ResidentValidateUtil.ACCOUNT_REGEX);
        Matcher matcher = pattern.matcher(residentAccount);
        boolean flag = matcher.matches();
        if(flag){
            return null;
        }else{
            return ResidentCode.ACCOUNT_ILLEGAL;
        }
    }

    public AjaxRes validateName(Resident resident){
        String name = resident.getResidentName();
        Pattern pattern = Pattern.compile(ResidentValidateUtil.CHINESENAME_REGEX);
        Matcher matcher = pattern.matcher(name);
        boolean flag = matcher.matches();
        if(flag){
            return null;
        }else{
            return ResidentCode.CHINESE_NAME_ILLEGAL;
        }
    }
}
