package com.ahtcm.web.login;

import com.ahtcm.service.admin.AdminRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @Autowired
    AdminRoleService adminRoleService;

    @RequestMapping("/login")
    public String login(){
        return "redirect:login.jsp";
    }


    /*@RequestMapping("/login/getRoleList")
    @ResponseBody
    public List<Role> getRoleList(){
        return adminRoleService.getRoles();
    }*/

}
