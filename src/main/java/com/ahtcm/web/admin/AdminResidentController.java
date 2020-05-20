package com.ahtcm.web.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Community;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.domain.Resident;
import com.ahtcm.service.admin.AdminResidentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/resident")
public class AdminResidentController {

    @Autowired
    AdminResidentService adminResidentService;

    @RequestMapping("/getResidentList")
    @ResponseBody
    public PageListResult getResidentList(QueryVo vo){
        return adminResidentService.getResidentList(vo);
    }

    @RequestMapping("/getCommunityList")
    @ResponseBody
    public List<Community> getCommunityList(){
        return adminResidentService.getCommunityList();
    }

    @RequestMapping("/updateResident")
    @ResponseBody
    public AjaxRes updateResident(Resident resident){
        return adminResidentService.updateResident(resident);
    }

    @RequestMapping("/deleteResidentById/{id}")
    @ResponseBody
    public AjaxRes deleteResidentById(@PathVariable Long id){
        return adminResidentService.deleteResidentById(id);
    }
}
