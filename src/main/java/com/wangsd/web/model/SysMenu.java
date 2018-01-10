package com.wangsd.web.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 菜单表
 * </p>
 *
 * @author wangsd
 * @since 2018-01-10
 */
@TableName("sys_menu")
public class SysMenu extends Model<SysMenu> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private Long id;
    /**
     * 菜单名称
     */
	private String menuName;
    /**
     * 父级菜单ID
     */
	private Long pid;
    /**
     * 连接地址
     */
	private String url;
    /**
     * 图标
     */
	private String icon;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 菜单状态
     */
	private Boolean menuState;
    /**
     * 资源名称
     */
	private String resource;
    /**
     * 深度
     */
	private Integer deep;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Boolean getMenuState() {
		return menuState;
	}

	public void setMenuState(Boolean menuState) {
		this.menuState = menuState;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public Integer getDeep() {
		return deep;
	}

	public void setDeep(Integer deep) {
		this.deep = deep;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "SysMenu{" +
			", id=" + id +
			", menuName=" + menuName +
			", pid=" + pid +
			", url=" + url +
			", icon=" + icon +
			", sort=" + sort +
			", menuState=" + menuState +
			", resource=" + resource +
			", deep=" + deep +
			"}";
	}
}
