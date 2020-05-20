package com.ahtcm.service.register;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Community;
import com.ahtcm.domain.Resident;

import java.util.List;

public interface RegisterService {
    List<Community> getCommunityList();

    AjaxRes register(Resident resident);
}
