/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : config_center

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-06-18 17:48:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `middleware_message`
-- ----------------------------
DROP TABLE IF EXISTS `middleware_message`;
CREATE TABLE `middleware_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `message_body` text NOT NULL COMMENT '消息体 json',
  `delivered` char(10) DEFAULT 'no' COMMENT '是否已经成功发送 yes / no',
  `err_msg` char(200) DEFAULT NULL COMMENT '失败错误信息',
  `attempt_made` int(11) DEFAULT '0' COMMENT '重试次数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tb_status` char(50) DEFAULT '正常' COMMENT '状态：正常，正常；删除，删除；',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of middleware_message
-- ----------------------------

