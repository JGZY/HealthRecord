package com.ahtcm.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * 密码加密工具类
 * */
public class EncryptionUtil {

    public static String encryption(String account,String password){
        try {
            Md5Hash md5Hash = new Md5Hash(password, account, 3);
            return md5Hash.toString();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }
}
