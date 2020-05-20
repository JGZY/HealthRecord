package com.ahtcm.util;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@ControllerAdvice
public class HandleException {
    @ExceptionHandler(AuthorizationException.class)
    public void handleShiroException(HandlerMethod method, HttpServletResponse response){
        ResponseBody annotation = method.getMethodAnnotation(ResponseBody.class);
        if(annotation!=null){
            AjaxRes ajaxRes = CommonCode.NO_PERMISSION;
            try {
                String s = new ObjectMapper().writeValueAsString(ajaxRes);
                response.setCharacterEncoding("utf-8");
                response.getWriter().print(s);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else {
            try {
                response.sendRedirect("/noPermission");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
