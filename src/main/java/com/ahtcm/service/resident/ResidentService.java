package com.ahtcm.service.resident;

import com.ahtcm.domain.Resident;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.util.ReturnVo;

import java.util.List;

public interface ResidentService {
    List<ReturnVo> getRegisterInfo();

    Resident getResident();

    List<ReturnVo> getPersonalHealthRecord();

    PageListResult getPersonalCaseRecordList(QueryVo vo);
}
