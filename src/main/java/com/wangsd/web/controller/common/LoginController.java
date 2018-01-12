package com.wangsd.web.controller.common;

import com.alibaba.fastjson.JSONObject;
import com.google.code.kaptcha.servlet.KaptchaExtend;
import com.wangsd.common.base.BaseController;
import com.wangsd.web.service.ISysLogService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.ServletException;
import java.io.IOException;

/**
 * <p>
 * 登录控制器
 * </p>
 *
 * @author wangsd
 * @since 2018-01-07
 */
@Controller
public class LoginController extends BaseController {

    @Autowired
    private ISysLogService sysLogService;

    @RequestMapping("/login")
    public String login(Model model) throws Exception {
        if (SecurityUtils.getSubject().isAuthenticated()) {
            return "redirect:/index";
        }
        return "login";
    }

    /**
     * 执行登录
     */
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(String loginName, String password, String captcha,
                          @RequestParam(value = "rememberMe", defaultValue = "0") Integer rememberMe,
                          RedirectAttributesModelMap model) {
//        if (StringUtils.isBlank(captcha)) {
//            throw new RuntimeException("验证码不能为空");
//        }
//        if (!dreamCaptcha.validate(request, response, captcha)) {
//            throw new RuntimeException("验证码错误");
//        }
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(loginName, password);
        token.setRememberMe(1 == rememberMe);
        if (!currentUser.isAuthenticated()) {
            try {
                currentUser.login(token);
            } catch (UnknownAccountException e) {
                model.addFlashAttribute("error", "未知用户");
                return "redirect:/login";
            } catch (IncorrectCredentialsException e) {
                model.addFlashAttribute("error", "密码错误");
                return "redirect:/login";
            } catch (LockedAccountException e) {
                model.addFlashAttribute("error", "账号已锁定");
                return "redirect:/login";
            } catch (AuthenticationException e) {
                model.addFlashAttribute("error", "服务器繁忙");
                return "redirect:/login";
            }
        }
        //记录日志
        sysLogService.insertLog("用户登录成功", loginName, request.getRequestURI(), JSONObject.toJSONString(request.getParameterMap()), request.getRemoteAddr());
        return "redirect:/index";
    }

    /**
     * 退出
     *
     * @return
     */
    @GetMapping("/logout")
    public String logout() {
        logger.info("登出");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/login";
    }

    /**
     * 未授权
     *
     * @return {String}
     */
    @GetMapping("/unauth")
    public String unauth() {
        if (SecurityUtils.getSubject().isAuthenticated() == false) {
            return "redirect:/login";
        }
        return "unauth";
    }

    /**
     * 验证码
     */
    @RequestMapping("/captcha")
    @ResponseBody
    public void captcha() throws ServletException, IOException {
        KaptchaExtend kaptchaExtend = new KaptchaExtend();
        kaptchaExtend.captcha(request, response);
    }
}
