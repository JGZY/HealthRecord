package com.ahtcm.web.admin;

import com.ahtcm.service.admin.AdminSystemLogService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/logger")
public class AdminLoggerController {

    @Autowired
    AdminSystemLogService adminSystemLogService;

    @RequestMapping("getLoggerList")
    public PageListResult getLoggerList(QueryVo vo){
        return adminSystemLogService.getLoggerList(vo);
    }
}
