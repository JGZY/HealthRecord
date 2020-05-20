package com.ahtcm.service.admin.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.ajaxResponse.impl.CommunityCode;
import com.ahtcm.domain.Community;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.mapper.CommunityMapper;
import com.ahtcm.service.admin.AdminCommunityService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminCommunityServiceImpl implements AdminCommunityService{

    @Autowired
    private CommunityMapper communityMapper;

    @Override
    public PageListResult getCommunityList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        List<Community> community = communityMapper.selectAll(vo);
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        pageListResult.setRows(community);
        return pageListResult;
    }

    @Override
    public AjaxRes saveCommunity(Community community) {

       //判断是否是maxPeople整数
        if(!NumberUtils.isDigits(community.getMaxPeople())){
            return CommunityCode.PEOPLE_NUM_ERROR;
        }
        //判断是否有同名社区
        List<Community> communityList = this.getCommunityByName(community.getCommunityName());
        if(communityList.size()>0){
            return CommunityCode.COMMUNITYNAME_ERROR;
        }
        try{
            communityMapper.insert(community);
            return CommonCode.SUCCESS;
        }catch (Exception e ){
            return CommonCode.FAIL;
        }

    }

    @Override
    public AjaxRes deleteCommunityById(Long id) {
        try{
            communityMapper.deleteByPrimaryKey(id);
            return CommonCode.SUCCESS;
        }catch (DataIntegrityViolationException e){
            return CommunityCode.DELETE_ERROR;
        }
        catch (Exception e){
            return CommonCode.FAIL;
        }

    }

    @Override
    public List<Community> getCommunityByName(String communityName) {
        return communityMapper.selectCommunityByName(communityName);
    }

    @Override
    public Community getCommunityById(Long id) {
        return communityMapper.selectByPrimaryKey(id);
    }

    @Override
    public AjaxRes updateCommunity(Community community) {

        Community c = this.getCommunityById(community.getId());
        if(community.getCommunityName().equals(c.getCommunityName())&&community.getMaxPeople().equals(c.getMaxPeople())){
            return CommonCode.NOTEDITFORM;
        }
        if(!NumberUtils.isDigits(community.getMaxPeople())){
            return CommunityCode.PEOPLE_NUM_ERROR;
        }
        //查询是否有同名社区
        List<Community> communities = communityMapper.selectSameNameCommunity(community.getId(),community.getCommunityName());
        if(communities.size()>0){
            return CommunityCode.COMMUNITYNAME_ERROR;
        }
        try{
            communityMapper.updateByPrimaryKey(community);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }
}
