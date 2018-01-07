package com.wangsd.web.mapper;

import com.wangsd.web.model.SysMenu;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    /**
     * 根据用户id查询权限列表
     * @param uid
     * @return
     */
    List<SysMenu> selectMenusByUserid(@Param("uid") Long uid);
}
