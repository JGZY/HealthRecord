package com.ahtcm.web.resident;

import com.ahtcm.domain.Resident;
import com.ahtcm.service.resident.ResidentService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.util.ReturnVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/resident")
public class ResidentController {

    @Autowired
    ResidentService residentService;

    @RequestMapping("/personalPage")
    public String personalPage(){
        return "personal";
    }

    @RequestMapping("/getRegisterInfo")
    @ResponseBody
    public List<ReturnVo> getRegisterInfo(){
        return residentService.getRegisterInfo();
    }

    @ResponseBody
    @RequestMapping("/getResident")
    public Resident getResident(){
        return residentService.getResident();
    }

    @RequestMapping("/personalHealthRecordPage")
    public String personalHealthRecordPage(){
        return "personalHealthRecordPage";
    }

    @RequestMapping("/getPersonalHealthRecord")
    @ResponseBody
    public List<ReturnVo> getPersonalHealthRecord(){
        return residentService.getPersonalHealthRecord();
    }

    @RequestMapping("personalCaseRecordPage")
    public String personalCaseRecordPage(){
        return "personalCaseRecordPage";
    }

    @RequestMapping("/getPersonalCaseRecordList")
    @ResponseBody
    public PageListResult getPersonalCaseRecordList(QueryVo vo){
        return residentService.getPersonalCaseRecordList(vo);
    }
}
