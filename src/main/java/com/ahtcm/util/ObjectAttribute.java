package com.ahtcm.util;

import com.ahtcm.domain.Resident;

import java.lang.reflect.Field;

//判断居民表单数据是否被修改
public class ObjectAttribute {

    public static boolean attributeIsChange(Resident o1,Resident o2){
        boolean flag = false;
        Class aClass = o1.getClass();
        Class bClass = o2.getClass();
        Field[] aFields = aClass.getDeclaredFields();
        Field[] bFields = bClass.getDeclaredFields();
        for (int i=0;i<aFields.length;i++) {
            Field aField = aFields[i];
            Field bField = bFields[i];
            bField.setAccessible(true);
            aField.setAccessible(true);
            try {
                Object x = aField.get(o1);
                Object y = bField.get(o2);
                if(x!=null){
                    if(y!=null){
                        if(!x.equals(y)){
                            flag = true;
                            break;
                        }
                    }else{
                        flag = true;
                        break;
                    }
                }
                if(x==null){
                    if(y!=null){
                        flag = true;
                        break;
                    }
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

}
