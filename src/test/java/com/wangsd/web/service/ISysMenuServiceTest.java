package com.wangsd.web.service;

import com.alibaba.fastjson.JSONObject;
import com.wangsd.base.BaseTest;
import com.wangsd.web.model.custom.TreeMenu;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by wangsd on 2018-01-12.
 */
public class ISysMenuServiceTest extends BaseTest {

    @Autowired
    ISysMenuService menuService;

    @Test
    public void selectTreeMenuByUserId() throws Exception {
//        EntityWrapper<TreeMenu> ew = new EntityWrapper<TreeMenu>();
//        ew.and("user_name={0}", "'zhangsan'").and("id=1").eq("username", "wsd");
        Long a1 = 6l;
        Long a2 = 6l;
        System.out.println(a1 == a2);
    }

    @Test
    public void selectAllTreeMenu() throws Exception {
        List<TreeMenu> list = menuService.selectAllTreeMenuByUserId(null);
        System.out.println(JSONObject.toJSON(list));
    }

}