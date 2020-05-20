package com.ahtcm.ajaxResponse.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.JsonEnumSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.ToString;

@ToString
@JsonSerialize(using = JsonEnumSerializer.class)
public enum CommunityAdminCode implements AjaxRes{
    PHONE_ILLEGAL(false,80000,"非法电话号码,请重新输入"),
    ACCOUNT_ILLEGAL(false,80001,"非法账号,请重新输入"),
    NAME_ILLEGAL(false,80002,"非法姓名，请重新输入"),
    SAME_ACCOUNT(false,80003,"已有相同账号，请重新输入");
    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    private CommunityAdminCode(boolean success,int code, String message){
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
