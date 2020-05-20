package com.ahtcm.util.validate.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.ConsultantCode;
import com.ahtcm.domain.Consultant;
import com.ahtcm.util.validate.ConsultantValidate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ConsultantValidateUtil implements ConsultantValidate {

    private ConsultantValidateUtil(){}

    private static ConsultantValidateUtil consultantValidateUtil = null;

    //DCL双重检查锁定单例
    public static ConsultantValidateUtil getInstance(){
        if(consultantValidateUtil == null){
            synchronized( ResidentValidateUtil.class ){
                if( consultantValidateUtil == null ) {
                    consultantValidateUtil = new ConsultantValidateUtil();
                }
            }
        }
        return consultantValidateUtil;
    }

    private static final String PHONE_REGEX = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[013678])|(18[0,5-9]))\\d{8}$";

    @Override
    public AjaxRes validatePhone(Consultant consultant) {
        String consultantPhone = consultant.getConsultantPhone();
        if(consultantPhone.length()!=11){
            return ConsultantCode.PHONE_ILLEGAL;
        }
        Pattern pattern = Pattern.compile(ConsultantValidateUtil.PHONE_REGEX);
        Matcher matcher = pattern.matcher(consultantPhone);
        boolean flag = matcher.matches();
        if(flag){
            return null;
        }else{
            return ConsultantCode.PHONE_ILLEGAL;
        }
    }
}
