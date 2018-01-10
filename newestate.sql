/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : newestate

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-01-10 17:56:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) NOT NULL COMMENT '部门编号',
  `deptName` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `serviceId` tinyint(16) DEFAULT NULL COMMENT '顶级服务商id',
  `pid` tinyint(16) DEFAULT NULL COMMENT '直接上级id',
  `region` varchar(255) DEFAULT NULL COMMENT '区域',
  `contact_people` varchar(255) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `contact_address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginName` varchar(50) NOT NULL COMMENT '用户',
  `title` varchar(300) DEFAULT NULL COMMENT '日志',
  `url` varchar(300) DEFAULT NULL COMMENT '地址',
  `params` text COMMENT '参数',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `createTime` datetime DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '用户登录成功', '/doLogin', '{\"loginName\":[\"admin\"],\"password\":[\"123456\"]}', '0:0:0:0:0:0:0:1', '2018-01-10 11:10:16');
INSERT INTO `sys_log` VALUES ('2', 'admin', '用户登录成功', '/doLogin', '{\"loginName\":[\"admin\"],\"password\":[\"123456\"]}', '0:0:0:0:0:0:0:1', '2018-01-10 11:44:05');
INSERT INTO `sys_log` VALUES ('3', 'admin', '用户登录成功', '/doLogin', '{\"loginName\":[\"admin\"],\"password\":[\"123456\"],\"rememberMe\":[\"1\"]}', '0:0:0:0:0:0:0:1', '2018-01-10 13:55:13');
INSERT INTO `sys_log` VALUES ('4', 'admin', '用户登录成功', '/doLogin', '{\"loginName\":[\"admin\"],\"password\":[\"123456\"]}', '0:0:0:0:0:0:0:1', '2018-01-10 15:38:25');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(16) NOT NULL COMMENT '主键',
  `menuName` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `pid` bigint(16) DEFAULT NULL COMMENT '父级菜单ID',
  `url` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `menuState` tinyint(1) DEFAULT '1' COMMENT '菜单状态',
  `resource` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `deep` int(11) DEFAULT NULL COMMENT '深度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '服务商管理', null, null, 'fa fa-cloud', '1', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('2', '物业管理', null, null, 'fa fa-snowflake-o', '2', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('3', '小区管理', null, null, 'fa fa-bank', '3', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('4', '账单管理', null, null, 'fa fa-bar-chart-o', '4', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('5', '用户管理', null, null, 'fa fa-user-circle-o', '5', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('6', '系统设置', null, null, 'fa fa-gears', '6', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('101', '我的服务商', '1', null, null, '1', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('201', '我的物业', '2', null, null, '2', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('301', '我的小区', '3', null, null, '3', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('302', '房屋信息', '3', null, null, '4', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('401', '我的账单', '4', null, null, '5', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('402', '电子发票', '4', null, null, '6', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('403', '交易中心', '4', null, null, '7', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('501', '用户中心', '5', '/sysUser/list', null, '8', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('601', '角色管理', '6', '/sysRole/list', null, '9', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('602', '费用类型', '6', null, null, '10', '1', null, '2');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleName` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `roleDesc` varchar(300) DEFAULT NULL COMMENT '角色描述',
  `roleType` int(2) DEFAULT NULL COMMENT '1代表服务商，2代表物业，3代表小区,99管理员',
  `roleState` tinyint(1) DEFAULT '1' COMMENT '状态',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', null, null, '1', '2018-01-10 11:09:03');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleId` bigint(20) NOT NULL COMMENT '角色主键',
  `menuId` bigint(20) NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '101');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '201');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '301');
INSERT INTO `sys_role_menu` VALUES ('10', '1', '302');
INSERT INTO `sys_role_menu` VALUES ('11', '1', '401');
INSERT INTO `sys_role_menu` VALUES ('12', '1', '402');
INSERT INTO `sys_role_menu` VALUES ('13', '1', '403');
INSERT INTO `sys_role_menu` VALUES ('14', '1', '501');
INSERT INTO `sys_role_menu` VALUES ('15', '1', '601');
INSERT INTO `sys_role_menu` VALUES ('16', '1', '602');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名',
  `loginName` varchar(50) DEFAULT NULL COMMENT '登录名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `pwd` varchar(50) DEFAULT NULL,
  `userState` tinyint(1) DEFAULT '1' COMMENT '用户状态',
  `deptId` bigint(16) DEFAULT NULL COMMENT '部门主键',
  `deptCode` varchar(255) DEFAULT NULL COMMENT '部门code',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `salt` varchar(255) DEFAULT NULL COMMENT '密码加密盐',
  `userDesc` varchar(300) DEFAULT NULL COMMENT '描述',
  `userImg` varchar(300) DEFAULT 'http://news.mydrivers.com/Img/20110518/04481549.png' COMMENT '头像',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '管理员', 'admin', 'a76fc2de0f02698e133fc88b3511565a', '123456', '1', null, null, null, null, 'aa971fba-b3c4-4d06-84f7-1ba07ec578f9', null, 'http://news.mydrivers.com/Img/20110518/04481549.png', '2018-01-10 11:09:03');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `Id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(20) NOT NULL COMMENT '用户主键',
  `roleId` bigint(20) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');
