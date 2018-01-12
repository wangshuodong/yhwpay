package com.wangsd.web.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangsd.web.model.SysMenu;
import com.wangsd.web.model.custom.TreeMenu;

import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
public interface ISysMenuService extends IService<SysMenu> {

    /**
     * 查询左侧菜单列表（1、2级）
     */
    List<TreeMenu> selectTreeMenuByUserId(Long uid);

    /**
     * 获取当前用户的所有菜单（1、2、3级）
     * 不传入uid就查询所有菜单
     */
    List<TreeMenu> selectAllTreeMenuByUserId(Long uid);
}
