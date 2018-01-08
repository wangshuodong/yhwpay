package com.wangsd.web.controller;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.wangsd.common.base.BaseController;

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

    @RequestMapping("/list")
    public String index(Model model){
        return "role/list";
    }

    @RequestMapping("/add")
    public String add(Model model){
        return "role/info";
    }
}

