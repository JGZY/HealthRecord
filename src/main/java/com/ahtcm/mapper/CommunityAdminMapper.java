package com.ahtcm.mapper;

import com.ahtcm.domain.CommunityAdmin;
import com.ahtcm.util.QueryVo;

import java.util.List;

public interface CommunityAdminMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CommunityAdmin communityAdmin);

    CommunityAdmin selectByPrimaryKey(Long id);

    List<CommunityAdmin> selectAll(QueryVo vo);

    int updateByPrimaryKey(CommunityAdmin communityAdmin);

    CommunityAdmin selectByAccount(String account);

    List<CommunityAdmin> selectAdminByCid(Long id);
}