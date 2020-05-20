package com.ahtcm.mapper;

import com.ahtcm.domain.SystemLog;
import com.ahtcm.util.QueryVo;

import java.util.List;

public interface SystemLogMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SystemLog record);

    SystemLog selectByPrimaryKey(Long id);

    List<SystemLog> selectAll(QueryVo vo);

    int updateByPrimaryKey(SystemLog record);
}