package com.ahtcm.filter;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.ajaxResponse.impl.LoginCode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class HealthLoginFilter extends FormAuthenticationFilter {

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        AjaxRes ajaxRes = LoginCode.SUCCESS;
        //返回json格式字符串
        String jsonString = new ObjectMapper().writeValueAsString(ajaxRes);
        response.getWriter().print(jsonString);
        return false;
    }

    @Override
    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request, ServletResponse response) {
        AjaxRes ajaxRes = null;
        if(e!=null){
            String name = e.getClass().getName();
            if(name.equals(UnknownAccountException.class.getName())||name.equals(IncorrectCredentialsException.class.getName())){
                ajaxRes = LoginCode.ACCOUNT_OR_PASSWORD_ERROR;
            }else{
                ajaxRes = CommonCode.FAIL;
            }
            e.printStackTrace();
        }
        try {
            response.setCharacterEncoding("utf-8");
            String jsonString = new ObjectMapper().writeValueAsString(ajaxRes);
            response.getWriter().print(jsonString);
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        return false;
    }
}
