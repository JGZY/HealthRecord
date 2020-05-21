package com.ahtcm.mapper;

import com.ahtcm.domain.Resident;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResidentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Resident record);

    Resident selectByPrimaryKey(Long id);

    List<Resident> selectAll(@Param("keyword") String keyword,@Param("cid")Long cid);

    int updateByPrimaryKey(Resident record);

    List<Resident> selectApplyList();

    void updateAuditPass(Long id);

    void updateAuditNoPass(Long id);

    List<Resident> selectSameAccountResident(@Param("residentAccount") String residentAccount, @Param("id") Long id);

    Resident getRegisterInfo(String activeAccount);

    Resident selectByAccount(String account);


    List<Resident> selectByIds(List<Integer> ids);
}