package com.ahtcm.web.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Community;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.service.admin.AdminCommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/community")
public class AdminCommunityController {

    @Autowired
    AdminCommunityService adminCommunityService;

    @RequestMapping("/saveCommunity")
    @ResponseBody
    public AjaxRes saveCommunity(Community community){
         return  adminCommunityService.saveCommunity(community);
    }

    @RequestMapping("/updateCommunity")
    @ResponseBody
    public AjaxRes updateCommunity(Community community){
        return adminCommunityService.updateCommunity(community);
    }

    @RequestMapping("getCommunityList")
    @ResponseBody
    public PageListResult getCommunityList(QueryVo vo){
        return adminCommunityService.getCommunityList(vo);
    }

    @RequestMapping("/deleteCommunityById/{id}")
    @ResponseBody
    public AjaxRes deleteCommunityById(@PathVariable Long id){
        return adminCommunityService.deleteCommunityById(id);
    }
}
