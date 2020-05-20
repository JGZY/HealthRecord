package com.ahtcm.mapper;

import com.ahtcm.domain.HealthRecord;
import com.ahtcm.util.QueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HealthRecordMapper {
    int deleteByPrimaryKey(Long id);

    int insert(HealthRecord record);

    HealthRecord selectByPrimaryKey(Long id);

    List<HealthRecord> selectAll(@Param("keyword") String keyword,@Param("cid") Long cid);

    int updateByPrimaryKey(HealthRecord record);

    HealthRecord selectByAccount(String account);

}