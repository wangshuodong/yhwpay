package com.wangsd.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangsd.common.base.BaseController;
import com.wangsd.common.entity.PageInfo;
import com.wangsd.common.entity.Rest;
import com.wangsd.common.scan.Log;
import com.wangsd.common.shiro.ShiroUser;
import com.wangsd.web.model.SysRole;
import com.wangsd.web.model.custom.TreeMenu;
import com.wangsd.web.service.ISysMenuService;
import com.wangsd.web.service.ISysRoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
@Controller
@RequestMapping("/sysRole")
public class SysRoleController extends BaseController {

    @Autowired
    ISysRoleService roleService;
    @Autowired
    ISysMenuService menuService;

    @RequestMapping("/list")
    public String index(Model model){
        return "role/list";
    }

    @RequestMapping("/add")
    public String add(Model model){
        return "role/add";
    }

    @RequestMapping("/edit")
    public String edit(Long id, Model model){
        SysRole sysRole = roleService.selectById(id);
        model.addAttribute("sysRole", sysRole);
        return "role/edit";
    }

    @RequestMapping("/auth")
    public String auth(Model model){
        ShiroUser loginUser = this.getShiroUser();
        Long userId = null;
        if (!"admin".equals(loginUser.getLoginName())) {
            userId = loginUser.getId();
        }
        List<TreeMenu> list = menuService.selectAllTreeMenuByUserId(userId);
        model.addAttribute("treeMenu", list);
        return "role/auth";
    }

    /**
     * 新增
     */
    @Log("新增角色")
    @RequestMapping("/insertRole")
    @ResponseBody
    public Object insertRole(SysRole sysRole, Model model){
        sysRole.setCreateTime(new Date());
        roleService.insert(sysRole);
        return Rest.ok("新增成功");
    }

    /**
     * 数据展示
     */
    @RequestMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(Model model, String search){
        String pageNumber = request.getParameter("page");
        String pageSize = request.getParameter("limit");
        Page<SysRole> page = new Page<SysRole>(Integer.parseInt(pageNumber),Integer.parseInt(pageSize));
        page.setOrderByField("createTime");
        page.setAsc(false);
        // 查询分页
        EntityWrapper<SysRole> ew = new EntityWrapper<SysRole>();
        if(StringUtils.isNotBlank(search)){
            ew.like("roleName",search);
        }
        Page<SysRole> pageData = roleService.selectPage(page, ew);
        //设置返回json
        PageInfo pageInfo = new PageInfo();
        pageInfo.setCode(0);
        pageInfo.setCount(pageData.getTotal());
        pageInfo.setData(pageData.getRecords());
        return pageInfo;
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/updateRole")
    @ResponseBody
    public Object updateRoleState(SysRole sysRole) {
        roleService.updateById(sysRole);
        return Rest.ok("修改成功");
    }

    /**
     * 删除角色信息
     */
    @Log("删除角色")
    @RequestMapping(value = "/deleteRole")
    @ResponseBody
    public Object deleteRole(Long id) {
        if (true) {
            throw new RuntimeException();
        }
        roleService.deleteById(id);
        return Rest.ok("删除成功");
    }

    /**
     * 批量删除
     */
    @Log("批量删除角色")
    @RequestMapping("/deleteAll")
    @ResponseBody
    public Rest deleteAll(Long[] ids){
        roleService.deleteBatchIds(Arrays.asList(ids));
        return Rest.ok();
    }

    /**
     * 检查角色名是否存在
     */
    @RequestMapping(value = "/checkRole")
    @ResponseBody
    public Object checkRole(SysRole sysRole) {
        EntityWrapper<SysRole> ew = new EntityWrapper<SysRole>();
        if(StringUtils.isNotBlank(sysRole.getRoleName())){
            ew.eq("roleName",sysRole.getRoleName());
        }
        if (null != sysRole.getId()) {
            ew.where("id != {0}", sysRole.getId());
        }
        SysRole role = roleService.selectOne(ew);
        if (role != null) {
            return Rest.failure("角色名称重复");
        }
        return Rest.ok();
    }

}

