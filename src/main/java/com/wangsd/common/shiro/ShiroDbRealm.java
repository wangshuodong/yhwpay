package com.wangsd.common.shiro;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.wangsd.web.model.SysUser;
import com.wangsd.web.service.ISysUserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * shiro权限认证
 */
public class ShiroDbRealm extends AuthorizingRealm {
    private static final Logger LOGGER = LogManager.getLogger(ShiroDbRealm.class);

    @Autowired
    private ISysUserService userService;

    /**
     * Shiro权限认证
     *
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(shiroUser.getRoles());
        authorizationInfo.setStringPermissions(shiroUser.getUrlSet());

        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        LOGGER.info("Shiro开始登录认证");
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        String username = (String) token.getPrincipal();
        SysUser sysUser = userService.selectOne(new EntityWrapper<SysUser>().eq("loginName", username));
        // 账号不存在
        if (sysUser == null) {
            throw new UnknownAccountException();
        }
        // 账号未启用
        if (sysUser.getUserState() == 0) {
            throw new LockedAccountException();
        }
        // 读取用户的url和角色
//        Map<String, Set<String>> resourceMap = roleService.selectResourceMapByUserId(sysUser.getId());
//        Set<String> urls = resourceMap.get("urls");
//        Set<String> roles = resourceMap.get("roles");
        ShiroUser shiroUser = new ShiroUser(sysUser.getId(), sysUser.getLoginName(), sysUser.getUserName());
//        shiroUser.setRoles(roles);
//        shiroUser.setUrlSet(urls);
        // 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                shiroUser, // 用户名
                sysUser.getPassword(), // 密码
                ByteSource.Util.bytes(sysUser.getSalt()),
                getName() // realm name
        );
        return authenticationInfo;
    }

    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }

}
