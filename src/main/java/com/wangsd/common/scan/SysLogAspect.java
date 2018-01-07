package com.wangsd.common.scan;

import com.alibaba.fastjson.JSONObject;
import com.wangsd.common.shiro.ShiroUser;
import com.wangsd.web.service.ISysLogService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * 日志记录
 */
@Aspect
@Component
@Order
public class SysLogAspect {
    private static final Logger LOGGER = LogManager.getLogger(SysLogAspect.class);

    @Autowired
    private ISysLogService sysLogService;

    @Pointcut("within(@org.springframework.stereotype.Controller *)")
    public void cutController() {
    }

    @Around("cutController()")
    public Object recordSysLog(ProceedingJoinPoint point) throws Throwable {
        MethodSignature methodSignature = (MethodSignature) point.getSignature();
        Method method = methodSignature.getMethod();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String strMethodName = request.getRequestURI();
        String strParam = JSONObject.toJSONString(request.getParameterMap());
        String strClassName = point.getTarget().getClass().getName();
        String strMessage = String.format("[类名]:%s,[方法]:%s,[参数]:%s", strClassName, strMethodName, strParam);
        LOGGER.info(strMessage);

        Log log = method.getAnnotation(Log.class);
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        if(log != null){
            String loginName = shiroUser != null ? shiroUser.getLoginName() : "system";
            sysLogService.insertLog(log.value(), loginName, strMethodName, strParam, request.getRemoteAddr());
        }
        return point.proceed();
    }

}
