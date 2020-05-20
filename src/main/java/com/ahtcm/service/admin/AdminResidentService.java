package com.ahtcm.service.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Community;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.domain.Resident;

import java.util.List;

public interface AdminResidentService {
    PageListResult getResidentList(QueryVo vo);

    List<Community> getCommunityList();

    AjaxRes updateResident(Resident resident);

    Resident getResidentById(Long id);

    AjaxRes deleteResidentById(Long id);

    List<Resident> getSameAccountResident(String residentAccount,Long id);
}
