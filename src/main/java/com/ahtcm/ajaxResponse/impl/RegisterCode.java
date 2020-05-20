package com.ahtcm.ajaxResponse.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.JsonEnumSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.ToString;

@ToString
@JsonSerialize(using = JsonEnumSerializer.class)
public enum RegisterCode implements AjaxRes {
    HAS_SAME_ACCOUNT(false,90000,"已存在相同账号,请重新申请"),
    HAS_NULL_FIELD(false,90001,"请填入完整的数据");

    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    private RegisterCode(boolean success,int code, String message){
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
