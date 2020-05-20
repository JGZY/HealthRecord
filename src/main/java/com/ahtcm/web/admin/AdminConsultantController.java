package com.ahtcm.web.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.domain.Community;
import com.ahtcm.domain.Consultant;
import com.ahtcm.service.admin.AdminConsultantService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin/consultant")
public class AdminConsultantController {

    @Autowired
    private AdminConsultantService adminConsultantService;

    @RequestMapping("getConsultantList")
    public PageListResult getConsultantList(QueryVo vo){
        return adminConsultantService.getConsultantList(vo);
    }

    @RequestMapping("addConsultant")
    public AjaxRes addConsultant(Consultant consultant){
        return adminConsultantService.addConsultant(consultant);
    }

    @RequestMapping("editConsultant")
    public AjaxRes editConsultant(Consultant consultant){
        return adminConsultantService.editConsultant(consultant);
    }

    @RequestMapping("/deleteConsultantById/{id}")
    public AjaxRes deleteConsultantById(@PathVariable Long id){
        return adminConsultantService.deleteConsultantById(id);
    }

    @RequestMapping("getCommunityList")
    public List<Community> getCommunityList(){
        return adminConsultantService.getCommunityList();
    }

}
