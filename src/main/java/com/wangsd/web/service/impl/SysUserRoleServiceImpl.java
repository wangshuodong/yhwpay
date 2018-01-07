package com.wangsd.web.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangsd.web.mapper.SysUserRoleMapper;
import com.wangsd.web.model.SysUserRole;
import com.wangsd.web.service.ISysUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 用户角色关联表 服务实现类
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements ISysUserRoleService {

    @Autowired
    SysUserRoleMapper userRoleMapper;

    @Override
    public Set<String> findRolesByUserid(Long uid) {
        // TODO Auto-generated method stub
        List<String> list = userRoleMapper.findRolesByUserid(uid);

        return new HashSet<>(list);
    }
}
