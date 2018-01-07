package com.wangsd.web.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangsd.web.mapper.SysMenuMapper;
import com.wangsd.web.mapper.SysRoleMenuMapper;
import com.wangsd.web.model.SysMenu;
import com.wangsd.web.model.SysRoleMenu;
import com.wangsd.web.service.ISysRoleMenuService;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 角色菜单关联表 服务实现类
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements ISysRoleMenuService {

    @Autowired
    SysMenuMapper menuMapper;

    /**
     * 角色授权
     */
    @Override
    public void addAuth(Long roleId, Long[] menuIds) {
        //删除原有权限
        this.delete(new EntityWrapper<SysRoleMenu>().eq("roleId", roleId));

        //从新授权
        if(ArrayUtils.isNotEmpty(menuIds)){
            for(Long menuId : menuIds){
                SysRoleMenu sysRoleMenu2 = new SysRoleMenu();
                sysRoleMenu2.setRoleId(roleId);
                sysRoleMenu2.setMenuId(menuId);
                this.insert(sysRoleMenu2);
            }
        }
    }

    @Override
    public Set<String> selectResourceByUserid(Long uid) {
        // TODO Auto-generated method stub
        List<SysMenu> list = menuMapper.selectMenusByUserid(uid);
        Set<String> set = new HashSet<>();
        for (SysMenu menu : list) {
            set.add(menu.getResource());
        }
        return set;
    }
}
