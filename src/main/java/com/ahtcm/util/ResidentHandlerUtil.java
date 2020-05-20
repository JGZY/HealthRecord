package com.ahtcm.util;

import com.ahtcm.domain.Resident;

public class ResidentHandlerUtil {

    public Resident convertStrField(Resident resident){
        String name = emptyStrToNull(resident.getResidentName());
        String account = emptyStrToNull(resident.getResidentAccount());
        String password = emptyStrToNull(resident.getResidentPassword());
        String phone = emptyStrToNull(resident.getResidentPhone());
        resident.setResidentName(name);
        resident.setResidentAccount(account);
        resident.setResidentPassword(password);
        resident.setResidentPhone(phone);
        return resident;
    }

    /**
     * 将空字符串转为null
     */
    public String emptyStrToNull(String string){
        if(string.equals("")){
            string =null;
        }
        return string;
    }
}
