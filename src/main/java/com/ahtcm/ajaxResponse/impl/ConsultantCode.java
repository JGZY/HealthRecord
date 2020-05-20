package com.ahtcm.ajaxResponse.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.JsonEnumSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.ToString;

@ToString
@JsonSerialize(using = JsonEnumSerializer.class)
public enum ConsultantCode implements AjaxRes {
    PHONELENGTH_ERROR(false,6001,"手机号码应为11位数,请重新输入"),
    PHONE_ILLEGAL(false,6002,"非法手机号,请重新输入"),
    HAS_SAME_ACCOUNT(false,6003,"已存在相同账号,请重新输入");
    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    private ConsultantCode(boolean success,int code, String message){
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
