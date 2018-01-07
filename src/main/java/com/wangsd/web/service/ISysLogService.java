package com.wangsd.web.service;

import com.wangsd.web.model.SysLog;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 日志表 服务类
 * </p>
 *
 * @author wangsd
 * @since 2018-01-07
 */
public interface ISysLogService extends IService<SysLog> {

    /**
     * 记录日志
     * @param title
     * @param uname
     * @param url
     * @param parms
     * @param clientIp
     */
    void insertLog(String title, String uname, String url, String parms, String clientIp);
}
