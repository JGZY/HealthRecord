package com.ahtcm.mapper;

import com.ahtcm.domain.Menu;
import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Menu record);

    Menu selectByPrimaryKey(Long id);

    List<Menu> selectAll();

    int updateByPrimaryKey(Menu record);

    Long selectParentId(Long id);

    void updateMenuRel(Long id);

    List<Menu> getTreeData();
}