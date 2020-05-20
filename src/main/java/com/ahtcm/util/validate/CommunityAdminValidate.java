package com.ahtcm.util.validate;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.CommunityAdmin;

public interface CommunityAdminValidate {

    AjaxRes validatePhone(CommunityAdmin communityAdmin);

    AjaxRes validateName(CommunityAdmin communityAdmin);

    AjaxRes validateAccount(CommunityAdmin communityAdmin);
}
