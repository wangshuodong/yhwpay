package com.wangsd.web.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.wangsd.web.model.SysUserRole;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 用户角色关联表 Mapper 接口
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {

    @Select("SELECT * FROM sys_user_role ur LEFT JOIN sys_role r on ur.roleId = r.id WHERE ur.userId = #{userid}")
    List<String> findRolesByUserid(Long userid);
}
