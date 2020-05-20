package com.ahtcm.service.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Community;
import com.ahtcm.domain.Consultant;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;

import java.util.List;

public interface AdminConsultantService {
    PageListResult getConsultantList(QueryVo vo);

    List<Community> getCommunityList();

    AjaxRes addConsultant(Consultant consultant);

    AjaxRes editConsultant(Consultant consultant);

    AjaxRes deleteConsultantById(Long id);
}
