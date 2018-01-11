package com.wangsd.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangsd.common.base.BaseController;
import com.wangsd.common.entity.PageInfo;
import com.wangsd.common.entity.Rest;
import com.wangsd.web.model.SysRole;
import com.wangsd.web.service.ISysRoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

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

    @RequestMapping("/list")
    public String index(Model model){
        return "role/list";
    }

    @RequestMapping("/add")
    public String add(Model model){
        return "role/info";
    }

    /**
     * 新增角色
     * @param sysRole
     * @param model
     * @return
     */
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
     * 修改角色信息
     * @param sysRole
     * @return
     */
    @RequestMapping(value = "/updateRole")
    @ResponseBody
    public Object updateRoleState(SysRole sysRole) {
        roleService.updateById(sysRole);
        return Rest.ok("修改成功");
    }

    /**
     * 删除角色信息
     * @param
     * @return
     */
    @RequestMapping(value = "/deleteRole")
    @ResponseBody
    public Object deleteRole(Long id) {
        roleService.deleteById(id);
        return Rest.ok("删除成功");
    }

    /**
     * 检查角色名是否存在
     * @param
     * @return
     */
    @RequestMapping(value = "/checkRole")
    @ResponseBody
    public Object checkRole(String name) {
        EntityWrapper<SysRole> ew = new EntityWrapper<SysRole>();
        if(StringUtils.isNotBlank(name)){
            ew.like("roleName",name);
        }
        SysRole sysRole = roleService.selectOne(ew);
        if (sysRole != null) {
            return Rest.failure("角色名称重复");
        }
        return Rest.ok();
    }

}

