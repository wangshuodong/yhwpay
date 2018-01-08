package com.wangsd.web.controller;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.wangsd.common.base.BaseController;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author wangsd
 * @since 2018-01-01
 */
@Controller
@RequestMapping("/sysUser")
public class SysUserController extends BaseController {

    @RequestMapping("/list")
    public String index(Model model){
        return "users/list";
    }

    @RequestMapping("/info")
    public String info(Model model){
        return "users/info";
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(Model model){
        return "users/updatePassword";
    }
}

