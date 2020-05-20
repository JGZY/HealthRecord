package com.ahtcm.service.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Menu;
import com.ahtcm.domain.Permission;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;

import java.util.List;

public interface AdminMenuService {
    PageListResult getMenuList(QueryVo vo);

    List<Menu> getParentList();

    AjaxRes saveMenu(Menu menu);

    AjaxRes updateMenu(Menu menu);

    AjaxRes deleteById(Long id);

    List<Permission> permissionList();

}
