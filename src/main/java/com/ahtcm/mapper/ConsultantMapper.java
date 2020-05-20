package com.ahtcm.mapper;

import com.ahtcm.domain.Consultant;
import com.ahtcm.util.QueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ConsultantMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Consultant record);

    Consultant selectByPrimaryKey(Long id);

    List<Consultant> selectAll(@Param("keyword") String keyword,@Param("cid")Long cid);

    int updateByPrimaryKey(Consultant record);

    Consultant selectByAccount(String consultantAccount);

    List<Consultant> selectOtherByAccount(@Param("consultantAccount") String consultantAccount, @Param("id") Long id);
}