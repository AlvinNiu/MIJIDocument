-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.17-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 miji 的数据库结构
CREATE DATABASE IF NOT EXISTS `miji` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `miji`;

-- 导出  表 miji.tb_history_password 结构
CREATE TABLE IF NOT EXISTS `tb_history_password` (
  `id` int(11) NOT NULL COMMENT '密码编号',
  `title` varchar(200) NOT NULL COMMENT '密码的标题',
  `pwd` varchar(200) NOT NULL COMMENT '密码，通过加密算法计算之后的数值',
  `host` varchar(100) DEFAULT '' COMMENT '密码的域名',
  `keyword` varchar(200) DEFAULT '' COMMENT '关键字，以英文逗号分隔',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录的时间',
  `operate_ip` varchar(100) NOT NULL COMMENT '记录的ip',
  `user_id` int(11) NOT NULL COMMENT '外键，与用户表关联',
  PRIMARY KEY (`id`),
  KEY `title` (`title`,`keyword`,`user_id`,`operate_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 数据导出被取消选择。
-- 导出  表 miji.tb_log 结构
CREATE TABLE IF NOT EXISTS `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `operate_type` varchar(20) NOT NULL COMMENT '操作的类型：登陆，查询，删除，修改,注册',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作的时间',
  `operate_ip` varchar(100) NOT NULL COMMENT '操作者所在的ip',
  `operate_place` varchar(200) NOT NULL COMMENT '操作地点',
  `remark` text NOT NULL COMMENT '操作备注',
  `user_id` int(11) NOT NULL COMMENT '外键，与用户表关联，如果是游客登陆则为0',
  PRIMARY KEY (`id`),
  KEY `operate_time` (`operate_time`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 miji.tb_password 结构
CREATE TABLE IF NOT EXISTS `tb_password` (
  `id` int(11) NOT NULL COMMENT '密码编号',
  `title` varchar(200) NOT NULL COMMENT '密码的标题',
  `pwd` varchar(200) NOT NULL COMMENT '密码，通过加密算法计算之后的数值',
  `host` varchar(100) DEFAULT '' COMMENT '密码的域名',
  `keyword` varchar(200) DEFAULT '' COMMENT '关键字，以英文逗号分隔',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录的时间',
  `operate_ip` varchar(100) NOT NULL COMMENT '记录的ip',
  `user_id` int(11) NOT NULL COMMENT '外键，与用户表关联',
  PRIMARY KEY (`id`),
  KEY `title` (`title`,`keyword`,`user_id`,`operate_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 miji.tb_user 结构
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(11) NOT NULL COMMENT '用户编号',
  `user_name` varchar(200) NOT NULL COMMENT '用户名',
  `pwd` varchar(100) NOT NULL COMMENT '密码，经过不可逆加密后存放',
  `register_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `register_ip` varchar(100) NOT NULL COMMENT '注册地点',
  `register_place` varchar(200) NOT NULL COMMENT '注册IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `pwd` (`pwd`),
  KEY `register_time` (`register_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
