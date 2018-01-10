package com.wangsd.web.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author wangsd
 * @since 2018-01-10
 */
@TableName("sys_user")
public class SysUser extends Model<SysUser> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	@TableId(value="id", type= IdType.AUTO)
	private Long id;
    /**
     * 用户名
     */
	private String userName;
    /**
     * 登录名
     */
	private String loginName;
    /**
     * 密码
     */
	private String password;
	private String pwd;
    /**
     * 用户状态
     */
	private Boolean userState;
    /**
     * 部门主键
     */
	private Long deptId;
    /**
     * 部门code
     */
	private String deptCode;
    /**
     * 电话
     */
	private String phone;
    /**
     * 电子邮件
     */
	private String email;
    /**
     * 密码加密盐
     */
	private String salt;
    /**
     * 描述
     */
	private String userDesc;
    /**
     * 头像
     */
	private String userImg;
    /**
     * 创建时间
     */
	private Date createTime;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Boolean getUserState() {
		return userState;
	}

	public void setUserState(Boolean userState) {
		this.userState = userState;
	}

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getUserDesc() {
		return userDesc;
	}

	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "SysUser{" +
			", id=" + id +
			", userName=" + userName +
			", loginName=" + loginName +
			", password=" + password +
			", pwd=" + pwd +
			", userState=" + userState +
			", deptId=" + deptId +
			", deptCode=" + deptCode +
			", phone=" + phone +
			", email=" + email +
			", salt=" + salt +
			", userDesc=" + userDesc +
			", userImg=" + userImg +
			", createTime=" + createTime +
			"}";
	}
}
