package com.ahtcm.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/residentPage")
    public String resident(){
        return "resident";
    }

    @RequestMapping("/applyAccountPage")
    public String applyAccount(){
        return "applyAccount";
    }

    @RequestMapping("/communityPage")
    public String community(){
        return "community";
    }

    @RequestMapping("/consultantPage")
    public String consultant(){
        return "consultant";
    }

    @RequestMapping("/rolePage")
    public String role(){
        return "role";
    }

    @RequestMapping("/communityAdminPage")
    public String communityAdmin(){
        return "communityAdmin";
    }

    @RequestMapping("/loggerPage")
    public String loggerPage(){
        return "logger";
    }

    @RequestMapping("/menuPage")
    public String menuPage(){
        return "menu";
    }
}
