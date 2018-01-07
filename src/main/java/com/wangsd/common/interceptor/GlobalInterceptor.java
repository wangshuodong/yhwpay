package com.wangsd.common.interceptor;

import com.wangsd.common.shiro.ShiroUser;
import com.wangsd.web.model.custom.TreeMenu;
import com.wangsd.web.service.ISysMenuService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 全局拦截器
 * @author jameszhou
 *
 */
public class GlobalInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	ISysMenuService menuService;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub

		if (handler instanceof HandlerMethod) {
			
			/**
			 * 保存登录信息
			 */
			ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
			if(shiroUser == null){
				return true;
			}
			request.setAttribute("shiroUser", shiroUser);
			/**
			 * 资源和当前选中菜单
			 */
			//上级菜单id
			String res = request.getParameter("p");
			if (StringUtils.isNotBlank(res)) {
				request.getSession().setAttribute("res", res);
			}
			//当前点击菜单id
			String cur = request.getParameter("t");
			if (StringUtils.isNotBlank(cur)) {
				request.getSession().setAttribute("cur", cur);
			}

			/**
			 * 获取当前用户的菜单
			 */
			List<TreeMenu> treeMenus = menuService.selectTreeMenuByUserId(shiroUser.getId());
			request.setAttribute("treeMenus", treeMenus);
		}

		/**
		 * 通过拦截
		 */
		return true;
	}

}
