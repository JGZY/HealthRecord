package com.ahtcm.service.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Community;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;

import java.util.List;

public interface AdminCommunityService {

    //查询社区列表
    PageListResult getCommunityList(QueryVo vo);

    //添加社区
    AjaxRes saveCommunity(Community community);

    /**根据id删除社区*/
    AjaxRes deleteCommunityById(Long id);

    /**查询同名小区*/
    List<Community> getCommunityByName(String communityName);

    Community getCommunityById(Long id);

    AjaxRes updateCommunity(Community community);
}
