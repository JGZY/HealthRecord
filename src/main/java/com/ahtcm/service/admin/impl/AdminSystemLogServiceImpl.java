package com.ahtcm.service.admin.impl;

import com.ahtcm.domain.SystemLog;
import com.ahtcm.mapper.SystemLogMapper;
import com.ahtcm.service.admin.AdminSystemLogService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminSystemLogServiceImpl implements AdminSystemLogService{

    @Autowired
    SystemLogMapper systemLogMapper;

    @Override
    public PageListResult getLoggerList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        List<SystemLog> systemLogs = systemLogMapper.selectAll(vo);
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        systemLogs.forEach(systemLog -> {
            String function = systemLog.getFunction();
            String substring = function.substring(function.lastIndexOf(".") + 1).replace("Impl","");
            systemLog.setFunction(substring);
        });
        pageListResult.setRows(systemLogs);
        return pageListResult;
    }
}
