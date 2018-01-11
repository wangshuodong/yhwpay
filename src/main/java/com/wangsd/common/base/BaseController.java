package com.wangsd.common.base;

import com.wangsd.common.shiro.ShiroUser;
import com.wangsd.common.utils.Charsets;
import com.wangsd.common.utils.URLUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 基础 controller
 */
public abstract class BaseController {
    // 控制器本来就是单例，这样似乎更加合理
    protected Logger logger = LogManager.getLogger(getClass());

    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpServletResponse response;

    @Autowired
    protected HttpSession session;

    @Autowired
    protected ServletContext application;

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder) {
        /**
         * 自动转换日期类型的字段格式
         */
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * 获取当前登录用户对象
     *
     * @return {ShiroUser}
     */
    public ShiroUser getShiroUser() {
        return (ShiroUser) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 获取当前登录用户id
     *
     * @return {Long}
     */
    public Long getUserId() {
        return this.getShiroUser().getId();
    }

    /**
     * 获取当前登录用户名
     *
     * @return {String}
     */
    public String getStaffName() {
        return this.getShiroUser().getName();
    }

    /**
     * 下载文件
     *
     * @param file 文件
     */
    protected ResponseEntity<Resource> download(File file) {
        String fileName = file.getName();
        return download(file, fileName);
    }

    /**
     * 下载
     *
     * @param file     文件
     * @param fileName 生成的文件名
     * @return {ResponseEntity}
     */
    protected ResponseEntity<Resource> download(File file, String fileName) {
        Resource resource = new FileSystemResource(file);

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        String header = request.getHeader("User-Agent");
        // 避免空指针
        header = header == null ? "" : header.toUpperCase();
        HttpStatus status;
        if (header.contains("MSIE") || header.contains("TRIDENT") || header.contains("EDGE")) {
            fileName = URLUtils.encodeURL(fileName, Charsets.UTF_8);
            status = HttpStatus.OK;
        } else {
            fileName = new String(fileName.getBytes(Charsets.UTF_8), Charsets.ISO_8859_1);
            status = HttpStatus.CREATED;
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", fileName);
        return new ResponseEntity<Resource>(resource, headers, status);
    }
}
