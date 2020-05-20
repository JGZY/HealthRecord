package com.ahtcm.web.admin;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Menu;
import com.ahtcm.domain.Permission;
import com.ahtcm.service.admin.AdminMenuService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin/menu")
public class AdminMenuController {

    @Autowired
    private AdminMenuService adminMenuService;

    @PostMapping("/menuList")
    public PageListResult menuList(QueryVo vo){
        return adminMenuService.getMenuList(vo);
    }

    @PostMapping("/parentList")
    public List<Menu> parentList(){
        return adminMenuService.getParentList();
    }

    @RequestMapping("/saveMenu")
    public AjaxRes saveMenu(Menu menu){
        return adminMenuService.saveMenu(menu);
    }

    @RequestMapping("/updateMenu")
    public AjaxRes updateMenu(Menu menu){
        return adminMenuService.updateMenu(menu);
    }

    @RequestMapping("/deleteById")
    public AjaxRes deleteById(Long id){
        return adminMenuService.deleteById(id);
    }

    @RequestMapping("/permissionList")
    public List<Permission> permissionList(){
        return adminMenuService.permissionList();
    }
}
