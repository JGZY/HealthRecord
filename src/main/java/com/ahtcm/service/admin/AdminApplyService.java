package com.ahtcm.service.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;

public interface AdminApplyService {

    //查询申请列表
    PageListResult getApplyAccountList(QueryVo vo);

    //审核通过
    AjaxRes setAuditPass(Long id);

    //审核未通过
    AjaxRes setAuditNoPass(Long id);
}
