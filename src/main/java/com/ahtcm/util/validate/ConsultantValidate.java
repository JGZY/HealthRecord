package com.ahtcm.util.validate;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.domain.Consultant;

public interface ConsultantValidate {

    AjaxRes validatePhone(Consultant consultant);
}
