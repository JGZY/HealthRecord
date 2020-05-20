package com.ahtcm.util.validate;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Resident;

//居民数据验证器
public interface ResidentValidate {

    AjaxRes validateHeight(Resident resident);

    AjaxRes validateWeight(Resident resident);

    AjaxRes validatePhone(Resident resident);

    AjaxRes validateHouse(Resident resident);

    AjaxRes validateAccount(Resident resident);
}
