package com.wangsd.web.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>
 * 首页控制器
 * </p>
 *
 * @author wangsd
 * @since 2018-01-07
 */
@Controller
public class IndexController {

    @RequestMapping({"","/","/index"})
    /*@Log("访问首页")*/
    public  String index(Model model){
		return "index";
    }  
}
