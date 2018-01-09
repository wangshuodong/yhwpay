package com.wangsd.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangsd.common.base.BaseController;
import com.wangsd.common.entity.PageInfo;
import com.wangsd.web.model.SysRole;
import com.wangsd.web.service.ISysRoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}

