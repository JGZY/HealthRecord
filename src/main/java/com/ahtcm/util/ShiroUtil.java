package com.ahtcm.util;

import com.ahtcm.domain.User;
import org.apache.shiro.SecurityUtils;

public class ShiroUtil {

    /**
     * 获取当前登陆的用户
     */
    public static User getActiveUser(){
        return (User)SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 获取当前登陆的用户账号
     */
    public static String getActiveAccount(){
        return getActiveUser().getAccount();
    }

}
