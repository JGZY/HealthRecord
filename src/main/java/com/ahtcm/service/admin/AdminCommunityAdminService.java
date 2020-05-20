package com.ahtcm.service.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.CommunityAdmin;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;

public interface AdminCommunityAdminService {
    PageListResult getCommunityAdminList(QueryVo vo);

    AjaxRes addCommunityAdmin(CommunityAdmin communityAdmin);

    AjaxRes editCommunityAdmin(CommunityAdmin communityAdmin);

    AjaxRes deleteCommunityAdminById(Long id);
}
