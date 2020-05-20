package com.ahtcm.mapper;

import com.ahtcm.domain.CaseRecord;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CaseRecordMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CaseRecord record);

    CaseRecord selectByPrimaryKey(Long id);

    List<CaseRecord> selectAll(@Param("keyword") String keyword, @Param("cid") Long cid);

    int updateByPrimaryKey(CaseRecord record);

    List<CaseRecord> getPersonalCaseRecordList(@Param("keyword") String keyword, @Param("account") String account);

    @Select("select * from case_record ")
    List<CaseRecord> selectList();
}