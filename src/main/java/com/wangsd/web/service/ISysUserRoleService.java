package com.wangsd.web.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangsd.web.model.SysUserRole;

import java.util.Set;

/**
 * <p>
 * 用户角色关联表 服务类
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
public interface ISysUserRoleService extends IService<SysUserRole> {
    /**
     * 获取用户的角色
     * @param uid
     * @return
     */
    Set<String> findRolesByUserid(Long uid);
}
