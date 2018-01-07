package com.wangsd.web.service.impl;

import com.wangsd.web.mapper.SysUserMapper;
import com.wangsd.web.model.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class TestService {
    @Autowired
    private SysUserMapper userMapper;
	
    @Cacheable(value = "hour", key = "#id")
	public SysUser selectById(Serializable id) {
		return userMapper.selectById(id);
	}
}
