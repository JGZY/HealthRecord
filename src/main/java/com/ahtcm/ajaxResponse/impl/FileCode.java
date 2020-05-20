package com.ahtcm.ajaxResponse.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.JsonEnumSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.ToString;

/**
 * @author 17921
 */
@ToString
@JsonSerialize(using = JsonEnumSerializer.class)
public class FileCode implements AjaxRes {

    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    public FileCode(boolean success,int code, String message){
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
