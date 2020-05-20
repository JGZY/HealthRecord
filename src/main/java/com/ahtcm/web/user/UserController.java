package com.ahtcm.web.user;

import com.ahtcm.domain.Menu;
import com.ahtcm.service.user.MenuService;
import com.ahtcm.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    MenuService menuService;

    @ResponseBody
    @RequestMapping(value = "/user/getUserName",produces = "text/html;charset=UTF-8")
    public String getUserName(){
        return userService.getUserName();
    }

    /**
     * 获取树形菜单数据
     */
    @ResponseBody
    @RequestMapping(value = "/user/getTreeData")
    public List<Menu> getTreeData(){
        return menuService.getTreeData();
    }
}
