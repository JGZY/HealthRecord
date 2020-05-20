package com.ahtcm.service.admin;

import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;

public interface AdminSystemLogService {
    PageListResult getLoggerList(QueryVo vo);
}
