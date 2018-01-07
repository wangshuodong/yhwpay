/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : newestate

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-01-07 22:48:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `code` varchar(255) NOT NULL COMMENT '部门编号',
  `deptName` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `serviceId` int(11) DEFAULT NULL COMMENT '顶级服务商id',
  `parentId` int(11) DEFAULT NULL COMMENT '直接上级id',
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
  `id` bigint(20) NOT NULL COMMENT '主键',
  `loginName` varchar(50) NOT NULL COMMENT '用户',
  `title` varchar(300) DEFAULT NULL COMMENT '日志',
  `url` varchar(300) DEFAULT NULL COMMENT '地址',
  `params` text COMMENT '参数',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `createTime` datetime DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('949907285220065281', 'admin', '用户登录成功', '/doLogin', '{\"loginName\":[\"admin\"],\"password\":[\"123456\"]}', '0:0:0:0:0:0:0:1', '2018-01-07 15:35:20');
INSERT INTO `sys_log` VALUES ('949907285333311490', 'admin', '访问首页', '/index', '{}', '0:0:0:0:0:0:0:1', '2018-01-07 15:35:20');
INSERT INTO `sys_log` VALUES ('949908828145139713', 'admin', '用户登录成功', '/doLogin', '{\"loginName\":[\"admin\"],\"password\":[\"123456\"]}', '0:0:0:0:0:0:0:1', '2018-01-07 15:41:28');
INSERT INTO `sys_log` VALUES ('949908828249997314', 'admin', '访问首页', '/index', '{}', '0:0:0:0:0:0:0:1', '2018-01-07 15:41:28');
INSERT INTO `sys_log` VALUES ('949932412364214274', 'admin', '用户登录成功', '/doLogin', '{\"loginName\":[\"admin\"],\"password\":[\"123456\"]}', '0:0:0:0:0:0:0:1', '2018-01-07 17:15:11');
INSERT INTO `sys_log` VALUES ('949932481868025857', 'admin', '访问首页', '/index', '{}', '0:0:0:0:0:0:0:1', '2018-01-07 17:15:27');
INSERT INTO `sys_log` VALUES ('949978310746066946', 'admin', '用户登录成功', '/doLogin', '{\"loginName\":[\"admin\"],\"password\":[\"123456\"]}', '0:0:0:0:0:0:0:1', '2018-01-07 20:17:34');
INSERT INTO `sys_log` VALUES ('949978310876090370', 'admin', '访问首页', '/index', '{}', '0:0:0:0:0:0:0:1', '2018-01-07 20:17:34');
INSERT INTO `sys_log` VALUES ('950004755883139073', 'admin', '用户登录成功', '/doLogin', '{\"loginName\":[\"admin\"],\"password\":[\"123456\"]}', '0:0:0:0:0:0:0:1', '2018-01-07 22:02:39');
INSERT INTO `sys_log` VALUES ('950004756013162498', 'admin', '访问首页', '/index', '{}', '0:0:0:0:0:0:0:1', '2018-01-07 22:02:39');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `menuName` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `parentId` varchar(50) DEFAULT NULL COMMENT '父级菜单ID',
  `url` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `menuState` int(2) DEFAULT '1' COMMENT '菜单状态,1-启用,-1禁用',
  `resource` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `deep` int(11) DEFAULT NULL COMMENT '深度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '服务商管理', null, null, 'fa fa-cloud', '0', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('2', '物业管理', null, null, 'fa fa-snowflake-o', '0', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('3', '小区管理', null, null, 'fa fa-bank', '0', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('4', '账单管理', null, null, 'fa fa-bar-chart-o', '0', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('5', '用户管理', null, null, 'fa fa-user-circle-o', '0', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('6', '系统设置', null, null, 'fa fa-gears', '0', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('101', '我的服务商', '1', null, null, '0', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('201', '我的物业', '2', null, null, '0', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('301', '我的小区', '3', null, null, '0', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('302', '房屋信息', '3', null, null, '0', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('401', '我的账单', '4', null, null, '0', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('402', '电子发票', '4', null, null, '0', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('403', '交易中心', '4', null, null, '0', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('501', '用户中心', '5', null, null, '0', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('601', '角色管理', '6', null, null, '0', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('602', '费用类型', '6', null, null, '0', '1', null, '2');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `roleName` varchar(50) NOT NULL COMMENT '角色名称',
  `roleDesc` varchar(300) DEFAULT NULL COMMENT '角色描述',
  `roleType` int(2) DEFAULT NULL COMMENT '1代表服务商，2代表物业，3代表小区,99管理员',
  `roleState` int(2) DEFAULT '1' COMMENT '状态,1-启用,-1禁用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('948573251449737217', 'superAdmin', '超级管理员', '99', '1', '2018-01-03 23:14:21');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `roleId` bigint(20) NOT NULL COMMENT '角色主键',
  `menuId` bigint(20) NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('948573252548644865', '948573251449737217', '1');
INSERT INTO `sys_role_menu` VALUES ('948573252573810689', '948573251449737217', '2');
INSERT INTO `sys_role_menu` VALUES ('948573252582199297', '948573251449737217', '3');
INSERT INTO `sys_role_menu` VALUES ('948573252590587905', '948573251449737217', '4');
INSERT INTO `sys_role_menu` VALUES ('948573252598976513', '948573251449737217', '5');
INSERT INTO `sys_role_menu` VALUES ('948573252615753729', '948573251449737217', '6');
INSERT INTO `sys_role_menu` VALUES ('948573252624142338', '948573251449737217', '101');
INSERT INTO `sys_role_menu` VALUES ('948573252632530945', '948573251449737217', '201');
INSERT INTO `sys_role_menu` VALUES ('948573252640919553', '948573251449737217', '301');
INSERT INTO `sys_role_menu` VALUES ('948573252645113858', '948573251449737217', '302');
INSERT INTO `sys_role_menu` VALUES ('948573252657696769', '948573251449737217', '401');
INSERT INTO `sys_role_menu` VALUES ('948573252666085378', '948573251449737217', '402');
INSERT INTO `sys_role_menu` VALUES ('948573252670279681', '948573251449737217', '403');
INSERT INTO `sys_role_menu` VALUES ('948573252691251202', '948573251449737217', '501');
INSERT INTO `sys_role_menu` VALUES ('948573252699639809', '948573251449737217', '601');
INSERT INTO `sys_role_menu` VALUES ('948573252703834113', '948573251449737217', '602');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `loginName` varchar(50) DEFAULT NULL COMMENT '登录名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `pwd` varchar(50) DEFAULT NULL,
  `userState` int(2) NOT NULL DEFAULT '1' COMMENT '用户状态,1-启用,-1禁用',
  `parentId` int(11) DEFAULT NULL COMMENT '部门主键',
  `parentCode` varchar(255) DEFAULT NULL COMMENT '部门code',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `salt` varchar(255) DEFAULT NULL COMMENT '密码加密盐',
  `roleId` int(11) DEFAULT NULL COMMENT '角色ID',
  `userDesc` varchar(300) DEFAULT NULL COMMENT '描述',
  `userImg` varchar(300) DEFAULT 'http://news.mydrivers.com/Img/20110518/04481549.png' COMMENT '头像',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('948573252993241089', '管理员', 'admin', 'cf16ecca1711d415c0db652834f5770e', '123456', '1', null, null, null, null, '0da444ab-8d19-4ad5-b5e1-492692acf3a9', null, null, 'http://news.mydrivers.com/Img/20110518/04481549.png', '2018-01-03 23:14:22');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(20) NOT NULL COMMENT '用户主键',
  `roleId` bigint(20) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '948573252993241089', '948573251449737217');
