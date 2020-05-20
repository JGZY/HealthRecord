package com.ahtcm.service.admin.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.ajaxResponse.impl.MenuCode;
import com.ahtcm.domain.Menu;
import com.ahtcm.domain.Permission;
import com.ahtcm.mapper.MenuMapper;
import com.ahtcm.mapper.PermissionMapper;
import com.ahtcm.service.admin.AdminMenuService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminMenuServiceImpl implements AdminMenuService{

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public PageListResult getMenuList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        List<Menu> menus = menuMapper.selectAll();
        PageListResult pageListRes = new PageListResult();
        pageListRes.setTotal(page.getTotal());
        pageListRes.setRows(menus);
        return pageListRes;
    }

    @Override
    public List<Menu> getParentList() {
        return menuMapper.selectAll();
    }

    @Override
    public AjaxRes saveMenu(Menu menu) {
        try {
            menuMapper.insert(menu);
            return CommonCode.SUCCESS;
        }catch (Exception e){
           return CommonCode.FAIL;
        }
    }

    @Override
    public AjaxRes updateMenu(Menu menu) {
        /*判断选择的菜单是否是自己的子菜单*/
        Long id = menu.getParent().getId();
        /*查询该id对应的menu*/
        Long parent_id=menuMapper.selectParentId(id);
        if(parent_id!=null){
            if(menu.getId().longValue()==parent_id.longValue()){
                return MenuCode.BAN_SELECT_SELF;
            }
        }
        try{
            menuMapper.updateByPrimaryKey(menu);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public AjaxRes deleteById(Long id) {
        try{
            /*1.打破关系*/
            menuMapper.updateMenuRel(id);
            /*删除菜单*/
            menuMapper.deleteByPrimaryKey(id);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    /**
     * 查询所有权限
     */
    @Override
    public List<Permission> permissionList() {
        return permissionMapper.selectAll();
    }
}
