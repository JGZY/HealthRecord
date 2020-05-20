package com.ahtcm.mapper;

import com.ahtcm.domain.Community;
import com.ahtcm.util.QueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Community record);

    Community selectByPrimaryKey(Long id);

    List<Community> selectAll(QueryVo vo);

    int updateByPrimaryKey(Community record);

    List<Community> selectCommunityByName(String communityName);

    List<Community> selectAll();

    List<Community> selectSameNameCommunity(@Param("id") Long id, @Param("communityName") String communityName);

}