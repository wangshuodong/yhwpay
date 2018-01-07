/**
 *
 */
package com.wangsd.common.shiro;

import java.io.Serializable;
import java.util.Set;

/**
 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息
 */
public class ShiroUser implements Serializable {
    private static final long serialVersionUID = -1373760761780840081L;
    
    private Long id;
    private final String loginName;
    private String name;
    //权限列表
    private Set<String> resources;
    //角色列表
    private Set<String> roles;

    public ShiroUser(String loginName) {
        this.loginName = loginName;
    }

    public ShiroUser(Long id, String loginName, String name) {
        this.id = id;
        this.loginName = loginName;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Set<String> getResources() {
        return resources;
    }

    public void setResources(Set<String> resources) {
        this.resources = resources;
    }

    public Set<String> getRoles() {
        return roles;
    }

    public void setRoles(Set<String> roles) {
        this.roles = roles;
    }

    public String getLoginName() {
        return loginName;
    }

    /**
     * 本函数输出将作为默认的<shiro:principal/>输出.
     */
    @Override
    public String toString() {
        return loginName;
    }
}