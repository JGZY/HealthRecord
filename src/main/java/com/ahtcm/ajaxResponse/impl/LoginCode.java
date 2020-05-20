package com.ahtcm.ajaxResponse.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.JsonEnumSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.ToString;

@ToString
@JsonSerialize(using = JsonEnumSerializer.class)
public enum LoginCode implements AjaxRes{
    SUCCESS(true,10,"登陆成功"),
    ACCOUNT_OR_PASSWORD_ERROR(false,11,"账号或密码错误,请重新输入");

    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    private LoginCode(boolean success,int code, String message){
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
