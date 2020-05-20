package com.ahtcm.util.aspect;

import com.ahtcm.domain.SystemLog;
import com.ahtcm.mapper.SystemLogMapper;
import com.ahtcm.service.user.UserService;
import com.ahtcm.util.ShiroUtil;
import com.ahtcm.util.UserIPUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

public class SystemAspect {

    @Autowired
    UserService userService;

    @Autowired
    SystemLogMapper systemLogMapper;

    //记录日志
    public void writerLog(JoinPoint joinPoint){
        SystemLog systemLog = new SystemLog();
        systemLog.setOptime(new Date());
        systemLog.setUserName(userService.getUserName());
        systemLog.setAccount(ShiroUtil.getActiveAccount());
        HttpServletRequest request = UserIPUtil.getRequest();
        String ip = UserIPUtil.getIp(request);
        systemLog.setIp(ip);

        //方法的全路径
        String name = joinPoint.getTarget().getClass().getName();
        String signature = joinPoint.getSignature().getName();
        String function = name+":"+signature;
        systemLog.setFunction(function);
        //方法的参数
        try {
            String params = new ObjectMapper().writeValueAsString(joinPoint.getArgs());
            systemLog.setParams(params);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        if(ShiroUtil.getActiveUser()!=null){ systemLogMapper.insert(systemLog);}
    }
}
