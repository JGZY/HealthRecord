package com.ahtcm.ajaxResponse.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.JsonEnumSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.ToString;

@ToString
@JsonSerialize(using = JsonEnumSerializer.class)
public enum HealthRecordCode implements AjaxRes{
    HAS_NOT_USER(false,5000,"该居民不存在，请重新确认"),
    ACCOUNT_NOT_PATTEN_NAME(false,5001,"居民账号与姓名不匹配，请重新确认信息"),
    REPEAT_INFO(false,5002,"该居民已有健康档案信息，不予重复添加"),
    BAN_UPDATE_ACCOUNT(false,5003,"居民账号不允许修改，请修改"),
    ISNOTSAME_NAME(false,5004,"居民账号与姓名信息不一致，请修改"),
    NULL_RESIDENT(false,5005,"该账号对应的居民不存在，请重新输入"),
    BAN_INSERT_CASE(false,5006,"非医师账号不允许填写病历");
    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    private HealthRecordCode(boolean success,int code, String message){
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
