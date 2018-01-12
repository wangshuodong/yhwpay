package com.wangsd.web.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangsd.web.mapper.SysMenuMapper;
import com.wangsd.web.model.SysMenu;
import com.wangsd.web.model.custom.TreeMenu;
import com.wangsd.web.service.ISysMenuService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {

    @Autowired
    SysMenuMapper menuMapper;

    /**
     * 查询左侧菜单列表（1、2级）
     * @param uid
     * @return
     */
    @Cacheable(value = "halfHour", key = "#uid")
    @Override
    public List<TreeMenu> selectTreeMenuByUserId(Long uid) {

        List<SysMenu> list = menuMapper.selectMenusByUserid(uid);
        //总菜单
        List<TreeMenu> treeMenus = new ArrayList<TreeMenu>();
        for (SysMenu menu : list) {
            if (menu.getDeep() == 1) {
                //1级菜单
                TreeMenu parent = new TreeMenu();
                BeanUtils.copyProperties(menu, parent);
                //子菜单
                for (SysMenu menu2 : list) {
                    if (menu.getId().equals(menu2.getPid())) {
                        TreeMenu children = new TreeMenu();
                        BeanUtils.copyProperties(menu2, children);
                        parent.getChildren().add(children);
                    }
                }
                treeMenus.add(parent);
            }
        }
        return treeMenus;
    }

    /**
     * 获取当前用户的所有菜单（1、2、3级）
     * 不传入uid就查询所有菜单
     */
    @Override
    public List<TreeMenu> selectAllTreeMenuByUserId(Long uid) {
        //不传入uid就查询所有菜单
        EntityWrapper<SysMenu> ew = new EntityWrapper();
        if (uid != null) {
            ew.eq("id", uid);
        }
        List<SysMenu> list = menuMapper.selectList(ew);
        List<TreeMenu> treeMenus = new ArrayList<TreeMenu>();
        for (SysMenu menu : list) {
            if (menu.getDeep() == 1) {
                //1级菜单
                TreeMenu parent = new TreeMenu();
                BeanUtils.copyProperties(menu, parent);
                //二级菜单
                for (SysMenu menu2 : list) {
                    if (menu.getId().equals(menu2.getPid())) {
                        TreeMenu two = new TreeMenu();
                        BeanUtils.copyProperties(menu2, two);
                        //三级菜单
                        for (SysMenu menu3 : list) {
                            if (menu2.getId().equals(menu3.getPid())) {
                                TreeMenu three = new TreeMenu();
                                BeanUtils.copyProperties(menu3, three);
                                two.getChildren().add(three);
                            }
                        }
                        parent.getChildren().add(two);
                    }
                }
                treeMenus.add(parent);
            }
        }
        return treeMenus;
    }
}
