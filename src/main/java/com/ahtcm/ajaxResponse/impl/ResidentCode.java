package com.ahtcm.ajaxResponse.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.JsonEnumSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.ToString;

@ToString
@JsonSerialize(using = JsonEnumSerializer.class)
public enum ResidentCode implements AjaxRes {
    HEIGHT_ERROR(false,5000,"身高范围不合法(必须在50-250之间)"),
    HEIGHT_ILLEGAL(false,5001,"非法身高数据,请重新输入"),
    WEIGHT_ILLEGAL(false,5002,"非法体重数据,请重新输入"),
    PHONELENGTH_ERROR(false,5003,"手机号码应为11位数,请重新输入"),
    PHONE_ILLEGAL(false,5004,"非法手机号,请重新输入"),
    HOUSE_ILLEGAL(false,5005,"户籍存在非法字符,请重新输入"),
    ACCOUNT_ILLEGAL(false,5006,"非法账号,账号仅支持6-20个字母、数字、下划线或减号，且必须以字母开头"),
    SAMEACCOUNT_ERROR(false,5007,"已存在同名账号,请重新修改"),
    CHINESE_NAME_ILLEGAL(false,5008,"姓名存在非法字符或长度不符合要求,请重新输入");
    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    private ResidentCode(boolean success,int code, String message){
        this.success = success;
        this.code = code;
        this.message = message;
    }

    @Override
    public boolean success() {
        return success;
    }
    @Override
    public int code() {
        return code;
    }
    @Override
    public String msg() {
        return message;
    }
}
