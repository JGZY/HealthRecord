package com.ahtcm.web.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Community;
import com.ahtcm.domain.CommunityAdmin;
import com.ahtcm.service.admin.AdminCommunityAdminService;
import com.ahtcm.service.admin.AdminResidentService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin/communityAdmin")
public class AdminCommunityAdminController {

    @Autowired
    AdminCommunityAdminService adminCommunityAdminService;

    @Autowired
    AdminResidentService adminResidentService;

    @RequestMapping("/addCommunityAdmin")
    public AjaxRes addCommunityAdmin(CommunityAdmin communityAdmin){
        return adminCommunityAdminService.addCommunityAdmin(communityAdmin);
    }

    @RequestMapping("/getCommunityAdminList")
    public PageListResult getCommunityAdminList(QueryVo vo){
        return adminCommunityAdminService.getCommunityAdminList(vo);
    }

    @RequestMapping("/getCommunityList")
    public List<Community> getCommunityList(){
        return adminResidentService.getCommunityList();
    }

    @RequestMapping("/editCommunityAdmin")
    public AjaxRes editCommunityAdmin(CommunityAdmin communityAdmin){
        return adminCommunityAdminService.editCommunityAdmin(communityAdmin);
    }

    @RequestMapping("/deleteCommunityAdminById/{id}")
    public AjaxRes deleteCommunityAdminById(@PathVariable("id") Long id){
        return adminCommunityAdminService.deleteCommunityAdminById(id);
    }
}
