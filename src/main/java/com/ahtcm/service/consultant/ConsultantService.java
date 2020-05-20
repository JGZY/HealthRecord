package com.ahtcm.service.consultant;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.CaseRecord;
import com.ahtcm.domain.HealthRecord;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ConsultantService {
    PageListResult getHealthRecordList(QueryVo vo);

    String getConsultantCommunityId();

    AjaxRes insertHealthRecord(HealthRecord healthRecord);

    AjaxRes editHealthRecord(HealthRecord healthRecord);

    PageListResult getCaseRecordList(QueryVo vo);

    AjaxRes insertCaseRecord(CaseRecord caseRecord);

    void downloadExcelTpl(HttpServletRequest request, HttpServletResponse response);

    AjaxRes uploadExcelFile(MultipartFile file, HttpServletResponse response);

    void downloadExcel(HttpServletRequest request, HttpServletResponse response);
}
