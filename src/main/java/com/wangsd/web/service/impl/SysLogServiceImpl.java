package com.wangsd.web.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangsd.web.mapper.SysLogMapper;
import com.wangsd.web.model.SysLog;
import com.wangsd.web.service.ISysLogService;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 * 日志表 服务实现类
 * </p>
 *
 * @author wangsd
 * @since 2018-01-07
 */
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements ISysLogService {

    public void insertLog(String title, String uname, String url, String parms, String clientIp) {
        SysLog sysLog = new SysLog();
        sysLog.setLoginName(uname);
        sysLog.setTitle(title);
        sysLog.setUrl(url);
        sysLog.setParams(parms);
        sysLog.setClientIp(clientIp);
        sysLog.setCreateTime(new Date());
        this.insert(sysLog);
    }
}
