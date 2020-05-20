package com.ahtcm.web.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.service.admin.AdminApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/apply")
public class AdminApplyController {

    @Autowired
    AdminApplyService adminApplyService;

    @RequestMapping("/applyAccountList")
    @ResponseBody
    public PageListResult getApplyAccountList(QueryVo vo){
        return adminApplyService.getApplyAccountList(vo);
    }

    @RequestMapping("/auditPass/{id}")
    @ResponseBody
    public AjaxRes auditPass(@PathVariable Long id){
        return adminApplyService.setAuditPass(id);
    }

    @RequestMapping("/auditNoPass/{id}")
    @ResponseBody
    public AjaxRes auditNoPass(@PathVariable Long id){
        return adminApplyService.setAuditNoPass(id);
    }
}
