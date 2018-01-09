package com.wangsd.common.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by wangsd on 2018-01-09.
 */
public class PageInfo {
    private final static int PAGESIZE = 10; //默认显示的记录数
    /**
     * 成功的状态码，默认：0
     */
     private int code = 0;
    /**
     * 状态信息的字段名称
     */
     private String msg;
    /**
     * 总条数
     */
     private int count;
    /**
     * 页编号 : 第几页
     */
    protected int pageNum = 1;
    /**
     * 页大小 : 每页的数量
     */
    protected int pageSize = 15;
    /**
     * 查询结果
     */
    protected List data = new ArrayList();
    /**
     * 查询条件
     */
    private Map<String, Object> condition;
    /**
     * 排序字段
     */
    private String sort = "id";
    /**
     * 排序方式
     */
    private String order = "asc";

    public PageInfo() {}

    //构造方法
    public PageInfo(int pageNum, int pageSize) {
        //计算当前页
        if (pageNum < 0) {
            this.pageNum = 1;
        } else {
            //当前页
            this.pageNum = pageNum;
        }
        //记录每页显示的记录数
        if (pageSize < 0) {
            this.pageSize = PAGESIZE;
        } else {
            this.pageSize = pageSize;
        }
    }

    // 构造方法
    public PageInfo(int pageNum, int pageSize, String sort, String order) {
        this(pageNum, pageSize) ;
        // 排序字段，正序还是反序
        this.sort = sort;
        this.order = order;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    public Map<String, Object> getCondition() {
        return condition;
    }

    public void setCondition(Map<String, Object> condition) {
        this.condition = condition;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }
}
