package com.ahtcm.ajaxResponse.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.JsonEnumSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.ToString;

@ToString
@JsonSerialize(using = JsonEnumSerializer.class)
public enum CommonCode implements AjaxRes {
    SUCCESS(true,10000,"操作成功！"),
    FAIL(false,10001,"系统繁忙,请稍后重试！"),
    NOTEDITFORM(false,10002,"编辑失败,请先修改表单数据再提交!"),
    PHONE_ILLEGAL(false,10003,"非法电话号码,请重新输入"),
    SAME_ACCOUNT(false,10004,"已存在相同账号，请重新输入"),
    NO_PERMISSION(false,10005,"您没有权限进行操作");
    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    private CommonCode(boolean success,int code, String message){
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
