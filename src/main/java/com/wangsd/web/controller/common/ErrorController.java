package com.wangsd.web.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>
 * 错误控制器
 * </p>
 *
 * @author wangsd
 * @since 2018-01-07
 */
@Controller
@RequestMapping("/error")
public class ErrorController {  
    @RequestMapping(value ="/{code}")
    public String index(@PathVariable String code, Model model){
		return code;
    }  
}
