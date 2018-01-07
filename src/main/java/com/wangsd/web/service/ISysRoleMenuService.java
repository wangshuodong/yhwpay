package com.wangsd.web.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangsd.web.model.SysRoleMenu;

import java.util.Set;

/**
 * <p>
 * 角色菜单关联表 服务类
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
public interface ISysRoleMenuService extends IService<SysRoleMenu> {

    /**
     * 角色授权
     */
    void addAuth(Long roleId, Long[] menuIds);

    /**
     * 根据用户id查询权限列表
     * @param uid
     * @return
     */
    Set<String> selectResourceByUserid(Long uid);


}
