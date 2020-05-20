package com.ahtcm.web.consultant;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.CaseRecord;
import com.ahtcm.domain.HealthRecord;
import com.ahtcm.service.consultant.ConsultantService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/consultant")
public class ConsultantController {

    @Autowired
    ConsultantService consultantService;

    @RequestMapping("/healthRecord")
    public String healthRecord(){
        return "healthRecord";
    }

    @RequestMapping("/getHealthRecordList")
    @ResponseBody
    public PageListResult getHealthRecordList(QueryVo vo){
        System.out.println("asd");
        return consultantService.getHealthRecordList(vo);
    }

    @ResponseBody
    @RequestMapping("/insertHealthRecord")
    public AjaxRes insertHealthRecord(HealthRecord healthRecord){
        return consultantService.insertHealthRecord(healthRecord);
    }

    @ResponseBody
    @RequestMapping("/editHealthRecord")
    public AjaxRes editHealthRecord(HealthRecord healthRecord){
        return consultantService.editHealthRecord(healthRecord);
    }

    @RequestMapping("/getConsultantCommunityId")
    @ResponseBody
    public String getConsultantCommunityId(){
        return consultantService.getConsultantCommunityId();
    }

    @RequestMapping("/caseRecordPage")
    public String caseRecordPage(){
        return "caseRecordPage";
    }

    @RequestMapping("/getCaseRecordList")
    @ResponseBody
    public PageListResult getCaseRecordList(QueryVo vo){
        return consultantService.getCaseRecordList(vo);
    }

    @RequestMapping("/insertCaseRecord")
    @ResponseBody
    public AjaxRes insertCaseRecord(CaseRecord caseRecord){
        return consultantService.insertCaseRecord(caseRecord);
    }

    /*
        下载模板
     */
    @RequestMapping("/downloadExcelTpl")
    @ResponseBody
    public void downloadExcelTpl(HttpServletRequest request, HttpServletResponse response){
        consultantService.downloadExcelTpl(request,response);
    }

    /**
     * 上传Excel
     * @param excel
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping("/uploadExcelFile")
    public AjaxRes uploadExcelFile(MultipartFile excel, HttpServletResponse response){
        return consultantService.uploadExcelFile(excel,response);
    }

    /**
     * 导出
     * @param request
     * @param response
     */
    @ResponseBody
    @RequestMapping("/downloadExcel")
    public void downloadExcel(HttpServletRequest request, HttpServletResponse response){
        consultantService.downloadExcel(request,response);
    }
}
