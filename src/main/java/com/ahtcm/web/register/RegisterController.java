package com.ahtcm.web.register;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.domain.Community;
import com.ahtcm.domain.Resident;
import com.ahtcm.service.register.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    RegisterService registerService;

    @RequestMapping("/getCommunityList")
    @ResponseBody
    public List<Community> getCommunityList(){
        return registerService.getCommunityList();
    }

    @RequestMapping("/register")
    @ResponseBody
    public AjaxRes register(Resident resident){
        return registerService.register(resident);
    }

}
