package com.wangsd.web.model.custom;


import com.wangsd.web.model.SysMenu;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单树
 */
public class TreeMenu extends SysMenu {

	/**
	 * 子菜单
	 */
	private List<TreeMenu> children = new ArrayList<TreeMenu>();

	private boolean checked;

	private boolean open;

	public List<TreeMenu> getChildren() {
		return children;
	}

	public void setChildren(List<TreeMenu> children) {
		this.children = children;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}
}
