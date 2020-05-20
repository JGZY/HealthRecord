package com.ahtcm.ajaxResponse.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.JsonEnumSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.ToString;

@ToString
@JsonSerialize(using = JsonEnumSerializer.class)
public enum AuditCode implements AjaxRes {
    SUCCESS(true,200,"审核成功"),
    SAME_ACCOUNT(false,222,"审核失败，已存在相同账号,请审核未通过");


    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    private AuditCode(boolean success,int code, String message){
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
