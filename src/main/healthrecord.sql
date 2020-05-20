/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : healthrecord

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-05-20 08:45:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '首席管理员', 'admin', '13856246856', '3fed7a346e430ea4c2aa10250928f4de');

-- ----------------------------
-- Table structure for case_record
-- ----------------------------
DROP TABLE IF EXISTS `case_record`;
CREATE TABLE `case_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `r_id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `hospital` varchar(255) DEFAULT NULL,
  `dept` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `complain` varchar(255) DEFAULT NULL,
  `history` varchar(255) DEFAULT NULL,
  `diagnose` varchar(255) DEFAULT NULL,
  `c_id` bigint(20) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL COMMENT '初诊、复诊状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case_record
-- ----------------------------
INSERT INTO `case_record` VALUES ('1', '12', '2020-03-27 20:20:10', '合肥第一人民医院', '急诊科', '1112312', '阵发性胸闷气短3天', '心衰病史', '胸闷待查', '8', '收住院', '0');
INSERT INTO `case_record` VALUES ('2', '12', '2020-03-28 15:28:14', '合肥第二人民医院', '外科', '10002312', '身体摔伤', '无', '骨折', '8', '住院', '0');
INSERT INTO `case_record` VALUES ('4', '12', '2020-04-08 09:22:13', '合肥第二人民医院', '外科', '112312312', '身体摔伤', '无', '基本康复', '8', '回家休养', '1');
INSERT INTO `case_record` VALUES ('5', '12', '2020-04-08 09:34:56', '合肥第一人民医院', '急诊科', '1121312431', '阵发性胸闷气短3天', '心衰病史', '康复', '8', '回家休养', '1');
INSERT INTO `case_record` VALUES ('6', '13', '2020-04-29 20:29:06', '合肥第一人民医院', '急诊科', '10000001', '身体摔伤', '无', '骨折', '8', '住院休养', '0');
INSERT INTO `case_record` VALUES ('7', '12', '2020-04-29 20:42:03', '合肥第二人民医院', '皮肤科', '1234567', '皮肤瘙痒', '无药物过敏史', '皮肤干燥', '8', '注意保湿', '0');

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `community_name` varchar(80) DEFAULT NULL,
  `max_people` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES ('1', '五里庙', '500');
INSERT INTO `community` VALUES ('6', '童话村', '400');
INSERT INTO `community` VALUES ('7', '石头村', '900');
INSERT INTO `community` VALUES ('8', '大东门', '1000');

-- ----------------------------
-- Table structure for community_admin
-- ----------------------------
DROP TABLE IF EXISTS `community_admin`;
CREATE TABLE `community_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `community_id` bigint(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_ca` (`community_id`),
  CONSTRAINT `fk_c_ca` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community_admin
-- ----------------------------
INSERT INTO `community_admin` VALUES ('5', '五五开', 'admin1', '18756565656', '6', 'c2328243cf2480ca3248ae9be76e5179');
INSERT INTO `community_admin` VALUES ('6', '曹操', 'caocao1', '13856234567', '1', '10ac78c9400ebf2c1ec0c771efa54dc3');
INSERT INTO `community_admin` VALUES ('7', '司马懿', 'simayi2', '17867786778', '8', '5ae2df31489bc32500120957ef948803');
INSERT INTO `community_admin` VALUES ('8', '孙权', 'sunquan', '13867875645', '7', '1e80028b7beb5c04eecb8af8ced858e2');

-- ----------------------------
-- Table structure for consultant
-- ----------------------------
DROP TABLE IF EXISTS `consultant`;
CREATE TABLE `consultant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `consultant_name` varchar(50) DEFAULT NULL,
  `consultant_age` int(11) DEFAULT NULL,
  `consultant_phone` varchar(50) DEFAULT NULL,
  `consultant_gender` tinyint(1) DEFAULT NULL,
  `community_id` bigint(20) DEFAULT NULL,
  `consultant_account` varchar(50) DEFAULT NULL,
  `consultant_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consultant
-- ----------------------------
INSERT INTO `consultant` VALUES ('7', '大司马', '33', '18723456789', '1', '8', 'dasima', '4a3de5b791181dac85efa105f2c9106e');
INSERT INTO `consultant` VALUES ('8', '马飞飞', '25', '13955559999', '1', '6', 'mafeifei', 'f8b6e3eb1a5452b177bd1248fc6a7475');
INSERT INTO `consultant` VALUES ('10', '五里庙admin', '34', '18912345678', '0', '1', 'wulimiao', '3bc86fe8429f58e376cb5649e2aa0e44');
INSERT INTO `consultant` VALUES ('11', '石头村医师', '55', '13856246856', '1', '7', 'shitoucun1', '77902ddae30a9ea011ac95f5680eb01f');
INSERT INTO `consultant` VALUES ('13', 'da', '56', '13978677867', '1', '1', 'da', 'ceeccab5007af81a663e0ef3f1e16782');

-- ----------------------------
-- Table structure for health_record
-- ----------------------------
DROP TABLE IF EXISTS `health_record`;
CREATE TABLE `health_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `high_blood` tinyint(1) DEFAULT NULL,
  `covid` tinyint(1) DEFAULT NULL,
  `family_illness` varchar(255) DEFAULT NULL,
  `blood_type` varchar(50) DEFAULT NULL,
  `color_blind` varchar(50) DEFAULT NULL,
  `blood_sugar` varchar(50) DEFAULT NULL,
  `white_blood` tinyint(1) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `c_id` bigint(20) DEFAULT NULL,
  `vaccin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of health_record
-- ----------------------------
INSERT INTO `health_record` VALUES ('1', '闻杰', 'wenjie', '0', '0', '无', 'A', '否', '5.1mmol/L', '0', '', '6', '乙肝，甲肝，乙脑，水痘，天花，卡介苗');
INSERT INTO `health_record` VALUES ('4', '刘某', 'liumou', '1', '0', '白化病', 'AB', '无', '5.6mmol/L', '0', '肥胖，癌症', '6', '乙肝，甲肝，乙脑，天花');
INSERT INTO `health_record` VALUES ('5', '五五开', 'wuwukai', '0', '1', '无', 'O', '是', '5.4mmol/L', '0', '抑郁症病史', '6', '	\r\n乙肝，甲肝，乙脑，水痘，天花，卡介苗，麻疹疫苗\r\n');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '管理员菜单', null, null, '9');
INSERT INTO `menu` VALUES ('2', '居民管理', '/admin/residentPage', '1', '1');
INSERT INTO `menu` VALUES ('3', '居民账号审核', '/admin/applyAccountPage', '1', '2');
INSERT INTO `menu` VALUES ('4', '社区医师管理', '/admin/consultantPage', '1', '3');
INSERT INTO `menu` VALUES ('5', '社区管理', '/admin/communityPage', '1', '4');
INSERT INTO `menu` VALUES ('6', '社区管理员管理', '/admin/communityAdminPage', '1', '5');
INSERT INTO `menu` VALUES ('7', '角色权限管理', '/admin/rolePage', '1', '6');
INSERT INTO `menu` VALUES ('8', '系统日志', '/admin/loggerPage', '1', '7');
INSERT INTO `menu` VALUES ('9', '菜单管理', '/admin/menuPage', '1', '8');
INSERT INTO `menu` VALUES ('10', '居民菜单', null, null, '10');
INSERT INTO `menu` VALUES ('12', '个人信息管理', '/resident/personalPage', '10', '11');
INSERT INTO `menu` VALUES ('16', '社区医师菜单', '', null, '14');
INSERT INTO `menu` VALUES ('17', '健康档案管理', '/consultant/healthRecord', '16', '16');
INSERT INTO `menu` VALUES ('19', '个人健康档案', '/resident/personalHealthRecordPage', '10', '15');
INSERT INTO `menu` VALUES ('21', '居民病历管理', '/consultant/caseRecordPage', '16', '17');
INSERT INTO `menu` VALUES ('22', '个人病历信息', '/resident/personalCaseRecordPage', '10', '18');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) DEFAULT NULL,
  `presource` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '居民管理', 'resident:index');
INSERT INTO `permission` VALUES ('2', '居民账号申请', 'applyAccount:index');
INSERT INTO `permission` VALUES ('3', '社区医师管理', 'consultant:index');
INSERT INTO `permission` VALUES ('4', '社区管理', 'community:index');
INSERT INTO `permission` VALUES ('5', '社区管理员管理', 'communityAdmin:index');
INSERT INTO `permission` VALUES ('6', '角色权限管理', 'role:index');
INSERT INTO `permission` VALUES ('7', '系统日志', 'systemLog:index');
INSERT INTO `permission` VALUES ('8', '菜单管理', 'menu:index');
INSERT INTO `permission` VALUES ('9', '管理员菜单', 'adminMenu');
INSERT INTO `permission` VALUES ('10', '居民菜单', 'residentMenu');
INSERT INTO `permission` VALUES ('11', '个人信息菜单', 'personal:index');
INSERT INTO `permission` VALUES ('14', '社区医师菜单', 'consultantMenu');
INSERT INTO `permission` VALUES ('15', '个人健康档案', 'personal:healthRecord');
INSERT INTO `permission` VALUES ('16', '健康档案管理', 'healthRecord');
INSERT INTO `permission` VALUES ('17', '居民病历管理', 'caseRecordPage');
INSERT INTO `permission` VALUES ('18', '个人病历信息', 'pesonal:caseRecord');
INSERT INTO `permission` VALUES ('19', 'newPage', '测试权限');

-- ----------------------------
-- Table structure for resident
-- ----------------------------
DROP TABLE IF EXISTS `resident`;
CREATE TABLE `resident` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resident_name` varchar(50) DEFAULT NULL,
  `resident_account` varchar(50) DEFAULT NULL,
  `resident_birth` datetime DEFAULT NULL,
  `resident_gender` tinyint(1) DEFAULT NULL COMMENT '男为1，女为0',
  `resident_height` varchar(50) DEFAULT NULL,
  `resident_weight` varchar(50) DEFAULT NULL,
  `resident_phone` varchar(50) DEFAULT NULL,
  `resident_community_id` bigint(20) DEFAULT NULL COMMENT '居住小区',
  `resident_house` varchar(255) DEFAULT NULL COMMENT '户籍地址',
  `resident_work` varchar(50) DEFAULT NULL,
  `resident_apply_state` tinyint(1) DEFAULT NULL,
  `resident_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_resident_community` (`resident_community_id`),
  CONSTRAINT `fk_resident_community` FOREIGN KEY (`resident_community_id`) REFERENCES `community` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resident
-- ----------------------------
INSERT INTO `resident` VALUES ('5', '闻杰', 'wenjie', '2020-03-19 00:00:00', '1', '180', '75', '13856246856', '6', '安徽铜陵', '程序员', '1', '135f293ce58d1e2f831e19a56b67ce61');
INSERT INTO `resident` VALUES ('12', '刘某', 'liumou', '2020-03-05 00:00:00', '1', '189', '88', '18900009999', '6', '安徽合肥', '公务员', '1', '6255f8090d6ba7f437567fa1dc8aba7d');
INSERT INTO `resident` VALUES ('13', '五五开', 'wuwukai', '2020-04-15 00:00:00', '1', '175', '66', '17899990000', '6', '上海', '打LoL职业', '1', '5a4c78ed9af844e01e47fdb9f30c416c');
INSERT INTO `resident` VALUES ('14', '卢本伟', 'lubenwei', null, null, null, null, '13867768998', '6', null, null, '0', '9cdd5b9d0443b6d8c73c0456a34c485e');
INSERT INTO `resident` VALUES ('15', '张三', 'zhangsan', null, null, null, null, '13856246856', '6', null, null, null, '8b51b90d65deccb3a7eaf96d6632082e');
INSERT INTO `resident` VALUES ('16', '张三', 'zhangsan', '2020-05-07 00:00:00', '1', '167', '66', '13856246856', '8', '安徽合肥', '公务员', '1', '8b51b90d65deccb3a7eaf96d6632082e');
INSERT INTO `resident` VALUES ('17', '闻杰', 'wenjie234', '2020-05-12 00:00:00', '1', '175', '77', '17823456789', '1', '安徽合肥', '教师', '1', '29ac455d5f84c78363a7cc2342e78227');
INSERT INTO `resident` VALUES ('18', '刘备', 'liubei', '2020-05-06 00:00:00', '1', '167', '68', '13856246856', '6', '安徽合肥', '教师', '1', '91fbd7517165dfc85068ad1031d341e5');
INSERT INTO `resident` VALUES ('19', '贾宝玉', 'jiabaoyu', null, null, null, null, '13745677890', '8', null, null, null, '5e4c5fa6d944410f0754b4b887fb698f');
INSERT INTO `resident` VALUES ('20', '李四', 'lisi22', '2020-05-06 00:00:00', '1', '156', '56', '13867566756', '1', '安徽', '教师', '1', 'fc1da91c1384d5f286f1a7435460f059');
INSERT INTO `resident` VALUES ('21', '张三', 'zhangsan2', null, null, null, null, '17867575667', '7', null, null, '1', '09540ba21b79513705a706e6c8d1250d');
INSERT INTO `resident` VALUES ('22', '关羽', 'guanyu', null, null, null, null, '18978676778', '6', null, null, '1', '73f82332da3599cb755826c7636d0e5b');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `rnum` varchar(50) DEFAULT NULL,
  `rname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rnum_uq` (`rnum`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'resident', '社区居民');
INSERT INTO `role` VALUES ('2', 'consultant', '社区医师');
INSERT INTO `role` VALUES ('3', 'admin', '超级管理员');
INSERT INTO `role` VALUES ('4', 'communityAdmin', '社区管理员');

-- ----------------------------
-- Table structure for role_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_rel`;
CREATE TABLE `role_permission_rel` (
  `rid` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  PRIMARY KEY (`rid`,`pid`),
  KEY `fk_permission` (`pid`),
  CONSTRAINT `fk_permission` FOREIGN KEY (`pid`) REFERENCES `permission` (`pid`),
  CONSTRAINT `fk_role` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission_rel
-- ----------------------------
INSERT INTO `role_permission_rel` VALUES ('3', '1');
INSERT INTO `role_permission_rel` VALUES ('4', '1');
INSERT INTO `role_permission_rel` VALUES ('3', '2');
INSERT INTO `role_permission_rel` VALUES ('4', '2');
INSERT INTO `role_permission_rel` VALUES ('3', '3');
INSERT INTO `role_permission_rel` VALUES ('4', '3');
INSERT INTO `role_permission_rel` VALUES ('3', '4');
INSERT INTO `role_permission_rel` VALUES ('3', '5');
INSERT INTO `role_permission_rel` VALUES ('3', '6');
INSERT INTO `role_permission_rel` VALUES ('3', '7');
INSERT INTO `role_permission_rel` VALUES ('3', '8');
INSERT INTO `role_permission_rel` VALUES ('3', '9');
INSERT INTO `role_permission_rel` VALUES ('4', '9');
INSERT INTO `role_permission_rel` VALUES ('1', '10');
INSERT INTO `role_permission_rel` VALUES ('1', '11');
INSERT INTO `role_permission_rel` VALUES ('2', '14');
INSERT INTO `role_permission_rel` VALUES ('1', '15');
INSERT INTO `role_permission_rel` VALUES ('2', '16');
INSERT INTO `role_permission_rel` VALUES ('2', '17');
INSERT INTO `role_permission_rel` VALUES ('1', '18');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `optime` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `params` varchar(2000) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', '2020-03-18 21:29:23', null, 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":5,\"consultantName\":\"韩金龙\",\"consultantAccount\":\"hanjl\",\"consultantAge\":30,\"consultantPhone\":\"13712345666\",\"consultantGender\":true,\"community\":{\"id\":7,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"hanjl,hanjl\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('2', '2020-03-18 21:31:39', null, 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:deleteConsultantById', '[5]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('3', '2020-03-18 21:31:39', null, 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:deleteConsultantById', '[5]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('4', '2020-03-18 21:51:03', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":6,\"consultantName\":\"韩金龙\",\"consultantAccount\":\"hanjl\",\"consultantAge\":40,\"consultantPhone\":\"13955927777\",\"consultantGender\":true,\"community\":{\"id\":8,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"hanjl,hanjl\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('5', '2020-03-18 21:53:41', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:deleteConsultantById', '[6]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('6', '2020-03-24 21:47:41', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('7', '2020-03-24 21:48:23', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('8', '2020-03-24 21:51:58', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('9', '2020-03-24 21:51:58', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('10', '2020-03-24 21:55:08', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('11', '2020-03-24 21:55:08', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('12', '2020-03-24 21:55:34', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('13', '2020-03-24 21:55:34', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('14', '2020-03-24 22:02:17', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('15', '2020-03-24 22:02:17', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('16', '2020-03-24 22:02:26', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"aaa\",\"url\":\"/ad\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('17', '2020-03-24 22:04:51', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"aaa\",\"url\":\"/ad\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('18', '2020-03-24 22:04:57', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('19', '2020-03-24 22:04:58', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('20', '2020-03-24 22:05:04', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('21', '2020-03-24 22:06:55', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('22', '2020-03-24 22:06:55', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('23', '2020-03-24 22:06:55', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('24', '2020-03-24 22:17:38', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('25', '2020-03-24 22:17:38', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('26', '2020-03-24 22:17:44', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":9,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('27', '2020-03-24 22:18:00', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":9,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('28', '2020-03-24 22:19:05', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":9,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('29', '2020-03-24 22:19:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('30', '2020-03-24 22:19:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('31', '2020-03-24 22:19:31', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":9,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('32', '2020-03-24 22:21:09', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('33', '2020-03-24 22:21:09', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('34', '2020-03-24 22:21:15', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":9,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('35', '2020-03-24 22:22:23', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('36', '2020-03-24 22:22:23', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('37', '2020-03-24 22:22:48', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":9,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('38', '2020-03-24 22:24:02', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":9,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('39', '2020-03-24 22:24:02', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:parentList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('40', '2020-03-24 22:24:02', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:menuList', '[{\"page\":1,\"rows\":10,\"keyword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('41', '2020-03-24 22:26:50', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":9,\"text\":\"asd\",\"url\":\"asd\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('42', '2020-03-24 22:37:17', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[9]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('43', '2020-03-24 22:37:42', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"aa\",\"url\":\"aa\",\"parent\":{\"id\":2,\"text\":null,\"url\":null,\"parent\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('44', '2020-03-24 22:37:50', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[10]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('45', '2020-03-24 22:56:05', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"aaa\",\"url\":\"aa\",\"parent\":{\"id\":2,\"text\":null,\"url\":null,\"parent\":null,\"children\":[]},\"children\":[]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('46', '2020-03-24 22:56:23', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[11]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('47', '2020-03-24 23:43:05', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[10]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('48', '2020-03-24 23:43:08', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[11]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('49', '2020-03-25 00:22:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":1,\"rnum\":\"resident\",\"rname\":\"社区居民\",\"permissions\":[{\"pid\":9,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('50', '2020-03-25 00:39:43', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":4,\"rnum\":\"communityAdmin\",\"rname\":\"社区管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('51', '2020-03-25 00:46:39', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:addCommunityAdmin', '[{\"id\":5,\"name\":\"五五开\",\"account\":\"admin1\",\"phone\":\"18756565656\",\"community\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"password\":\"c2328243cf2480ca3248ae9be76e5179\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('52', '2020-03-25 01:14:59', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:editCommunityAdmin', '[{\"id\":5,\"name\":\"五五开\",\"account\":\"admin1\",\"phone\":\"18756565656\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"password\":\"\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('53', '2020-03-25 12:32:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"个人信息管理\",\"url\":\"/resident/personalPage\",\"parent\":{\"id\":10,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('54', '2020-03-25 12:36:08', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":1,\"rnum\":\"resident\",\"rname\":\"社区居民\",\"permissions\":[{\"pid\":10,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('55', '2020-03-25 12:37:12', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":1,\"rnum\":\"resident\",\"rname\":\"社区居民\",\"permissions\":[{\"pid\":10,\"pname\":null,\"presource\":null},{\"pid\":11,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('56', '2020-03-26 01:25:37', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":5,\"residentName\":\"闻杰\",\"residentAccount\":\"wenjie\",\"residentBirth\":\"2020-03-19\",\"residentGender\":true,\"residentHeight\":\"180\",\"residentWeight\":\"75\",\"residentPhone\":\"13856246856\",\"residentCommunity\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽铜陵\",\"residentWork\":\"程序员\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('57', '2020-03-26 01:48:29', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"居民病历管理\",\"url\":\"/resident/medicalRecord\",\"parent\":{\"id\":4,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('58', '2020-03-26 01:48:39', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:deleteConsultantById', '[3]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('59', '2020-03-26 01:48:42', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:deleteConsultantById', '[1]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('60', '2020-03-26 01:48:44', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:deleteConsultantById', '[4]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('61', '2020-03-26 01:49:23', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":5,\"consultantName\":\"大司马\",\"consultantAccount\":\"dasima\",\"consultantAge\":33,\"consultantPhone\":\"13678900976\",\"consultantGender\":true,\"community\":{\"id\":7,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"dasima,dasima\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('62', '2020-03-26 01:53:49', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[14]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('63', '2020-03-26 01:55:36', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"居民病历管理\",\"url\":\"/resident/medicalRecord\",\"parent\":{\"id\":13,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('64', '2020-03-26 01:56:30', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":null,\"consultantName\":\"大司马\",\"consultantAccount\":\"dasima\",\"consultantAge\":33,\"consultantPhone\":\"18723456789\",\"consultantGender\":true,\"community\":{\"id\":7,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"dasima,dasima\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('65', '2020-03-26 01:57:03', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":6,\"consultantName\":\"大司马\",\"consultantAccount\":\"dasima\",\"consultantAge\":33,\"consultantPhone\":\"18723456789\",\"consultantGender\":true,\"community\":{\"id\":7,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"dasima,dasima\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('66', '2020-03-26 02:06:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":7,\"consultantName\":\"大司马\",\"consultantAccount\":\"dasima\",\"consultantAge\":33,\"consultantPhone\":\"18723456789\",\"consultantGender\":true,\"community\":{\"id\":8,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"dasima\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('67', '2020-03-26 21:06:49', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":2,\"rnum\":\"consultant\",\"rname\":\"社区医师\",\"permissions\":[{\"pid\":3,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('68', '2020-03-26 21:23:07', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":4,\"text\":\"社区医师管理\",\"url\":\"/admin/consultantPage\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('69', '2020-03-26 21:27:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"社区医师菜单\",\"url\":\"\",\"parent\":{\"id\":null,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('70', '2020-03-26 21:45:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":8,\"consultantName\":\"马飞飞\",\"consultantAccount\":\"mafeifei\",\"consultantAge\":25,\"consultantPhone\":\"13955559999\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"f8b6e3eb1a5452b177bd1248fc6a7475\"}]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('71', '2020-03-26 21:48:44', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":2,\"rnum\":\"consultant\",\"rname\":\"社区医师\",\"permissions\":[{\"pid\":14,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('72', '2020-03-26 21:50:48', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"健康档案管理\",\"url\":\"/consultant/medicalRecordconsultant/medicalRecord\",\"parent\":{\"id\":16,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('73', '2020-03-26 22:40:44', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"Aa\",\"url\":\"/asdsa/asdas\",\"parent\":{\"id\":16,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('74', '2020-03-26 22:40:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[18]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('77', '2020-03-27 15:28:08', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"aa\",\"account\":\"aa\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":true,\"covid\":true,\"familyIllness\":\"aa\",\"bloodType\":\"aa\",\"colorBlind\":\"aa\",\"bloodSugar\":\"aa\",\"whiteBlood\":false,\"remark\":\"aa\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('78', '2020-03-27 15:35:30', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"ww\",\"account\":\"wenjie\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":true,\"covid\":true,\"familyIllness\":\"a\",\"bloodType\":\"a\",\"colorBlind\":\"a\",\"bloodSugar\":\"a\",\"whiteBlood\":false,\"remark\":\"asdas\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('79', '2020-03-27 15:35:37', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"闻杰\",\"account\":\"wenjie\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":true,\"covid\":true,\"familyIllness\":\"a\",\"bloodType\":\"a\",\"colorBlind\":\"a\",\"bloodSugar\":\"a\",\"whiteBlood\":false,\"remark\":\"asdas\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('80', '2020-03-27 15:37:47', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[10]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('81', '2020-03-27 15:37:55', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:deleteResidentById', '[10]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('82', '2020-03-27 15:42:25', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[11]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('83', '2020-03-27 15:42:31', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:deleteResidentById', '[11]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('84', '2020-03-27 15:44:01', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[12]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('85', '2020-03-27 15:44:49', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":12,\"residentName\":\"刘某\",\"residentAccount\":\"liumou\",\"residentBirth\":\"2020-03-05\",\"residentGender\":true,\"residentHeight\":\"189\",\"residentWeight\":\"88\",\"residentPhone\":\"18900009999\",\"residentCommunity\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽铜陵\",\"residentWork\":\"主播\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('86', '2020-03-27 15:47:03', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"刘谋\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":true,\"covid\":false,\"familyIllness\":\"无\",\"bloodType\":\"B\",\"colorBlind\":\"否\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"remark\":\"肥胖癌\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('87', '2020-03-27 15:47:17', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":true,\"covid\":false,\"familyIllness\":\"无\",\"bloodType\":\"B\",\"colorBlind\":\"否\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"remark\":\"肥胖癌\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('88', '2020-03-27 15:51:23', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":true,\"covid\":false,\"familyIllness\":\"无\",\"bloodType\":\"A\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.5mmol/L\",\"whiteBlood\":false,\"remark\":\"肥胖\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('89', '2020-03-27 16:39:38', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑\",\"remark\":\"肥胖\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('90', '2020-03-27 16:40:01', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑\",\"remark\":\"肥胖\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('91', '2020-03-27 16:41:01', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑\",\"remark\":\"肥胖\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('92', '2020-03-27 16:47:48', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑\",\"remark\":\"肥胖\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('93', '2020-03-27 17:17:35', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":4,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑，天花\",\"remark\":\"肥胖，癌症\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('94', '2020-03-27 17:17:44', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":4,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑，天花\",\"remark\":\"肥胖，癌症\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('95', '2020-03-27 17:18:34', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":4,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑，天花\",\"remark\":\"肥胖，癌症\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('96', '2020-03-27 17:19:58', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":4,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑，天花\",\"remark\":\"肥胖，癌症\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('97', '2020-03-27 17:21:46', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":4,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑，天花\",\"remark\":\"肥胖，癌症\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('98', '2020-03-27 17:22:23', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":4,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑，天花\",\"remark\":\"肥胖，癌症\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('99', '2020-03-27 17:23:13', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":4,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑，天花\",\"remark\":\"肥胖，癌症\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('100', '2020-03-27 17:56:49', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('101', '2020-03-27 17:57:20', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('102', '2020-03-27 17:58:22', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('103', '2020-03-27 17:59:22', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('104', '2020-03-27 18:02:31', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('105', '2020-03-27 18:02:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('106', '2020-03-27 18:03:40', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('107', '2020-03-27 18:04:42', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('108', '2020-03-27 18:05:26', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('109', '2020-03-27 18:06:44', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"个人健康档案\",\"url\":\"/resident/healthRecord\",\"parent\":{\"id\":10,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":15,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('110', '2020-03-27 18:07:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":19,\"text\":\"个人健康档案\",\"url\":\"/resident/healthRecord\",\"parent\":{\"id\":10,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":11,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('111', '2020-03-27 18:10:14', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":19,\"text\":\"个人健康档案\",\"url\":\"/resident/healthRecord\",\"parent\":{\"id\":10,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":15,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('112', '2020-03-27 18:10:30', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('113', '2020-03-27 18:11:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"sadcxa\",\"url\":\"/as/asd\",\"parent\":{\"id\":2,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":1,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('114', '2020-03-27 18:12:01', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[20]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('115', '2020-03-27 18:12:25', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":1,\"rnum\":\"resident\",\"rname\":\"社区居民\",\"permissions\":[{\"pid\":10,\"pname\":null,\"presource\":null},{\"pid\":11,\"pname\":null,\"presource\":null},{\"pid\":15,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('116', '2020-03-27 18:13:30', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('117', '2020-03-27 18:13:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":12,\"text\":\"个人信息管理\",\"url\":\"/resident/personalPage\",\"parent\":{\"id\":10,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":11,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('118', '2020-03-27 18:15:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('119', '2020-03-27 18:15:28', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":17,\"text\":\"健康档案管理\",\"url\":\"/consultant/healthRecord\",\"parent\":{\"id\":16,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":16,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('120', '2020-03-27 18:30:48', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('121', '2020-03-27 18:42:30', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":2,\"rnum\":\"consultant\",\"rname\":\"社区医师\",\"permissions\":[{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('122', '2020-03-27 18:45:14', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('123', '2020-03-27 18:45:28', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":19,\"text\":\"个人健康档案\",\"url\":\"/resident/healthRecordPage\",\"parent\":{\"id\":10,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":15,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('124', '2020-03-27 18:48:07', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":19,\"text\":\"个人健康档案\",\"url\":\"/resident/personalHealthRecordPage\",\"parent\":{\"id\":10,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":15,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('125', '2020-03-27 19:17:02', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('126', '2020-03-27 19:17:51', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":4,\"rnum\":\"communityAdmin\",\"rname\":\"社区管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('127', '2020-03-27 19:19:56', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('128', '2020-03-27 19:21:04', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('129', '2020-03-27 19:22:11', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[15]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('130', '2020-03-27 19:24:24', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('131', '2020-03-27 19:25:31', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"居民病历管理\",\"url\":\"/consultant/caseRecordPage\",\"parent\":{\"id\":16,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":17,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('132', '2020-03-27 19:26:04', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":2,\"rnum\":\"consultant\",\"rname\":\"社区医师\",\"permissions\":[{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('133', '2020-03-27 23:57:27', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":null,\"createTime\":null,\"hospital\":\"asdf\",\"dept\":\"asdf\",\"code\":null,\"complain\":\"asdf\",\"history\":\"asdf\",\"diagnose\":\"sadf\",\"consultant\":null,\"view\":\"asfd\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('134', '2020-03-28 00:00:06', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":null,\"createTime\":null,\"hospital\":\"asdf\",\"dept\":\"asdf\",\"code\":null,\"complain\":\"asdf\",\"history\":\"asdf\",\"diagnose\":\"sadf\",\"consultant\":null,\"view\":\"asfd\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('135', '2020-03-28 00:00:36', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":{\"id\":null,\"residentName\":null,\"residentAccount\":\"dasf\",\"residentBirth\":null,\"residentGender\":null,\"residentHeight\":null,\"residentWeight\":null,\"residentPhone\":null,\"residentCommunity\":null,\"residentHouse\":null,\"residentWork\":null,\"residentApplyState\":null,\"residentPassword\":null},\"createTime\":null,\"hospital\":\"asdf\",\"dept\":\"asdf\",\"code\":null,\"complain\":\"asdf\",\"history\":\"sadf\",\"diagnose\":\"asfd\",\"consultant\":null,\"view\":\"asdf\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('136', '2020-03-28 00:12:31', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":{\"id\":8,\"residentName\":\"阿斯顿\",\"residentAccount\":\"asd\",\"residentBirth\":null,\"residentGender\":null,\"residentHeight\":null,\"residentWeight\":null,\"residentPhone\":\"13856246856\",\"residentCommunity\":{\"id\":1,\"communityName\":\"五里庙\",\"maxPeople\":null},\"residentHouse\":null,\"residentWork\":null,\"residentApplyState\":null,\"residentPassword\":null},\"createTime\":1585325550784,\"hospital\":\"asdf\",\"dept\":\"asd\",\"code\":null,\"complain\":\"asd\",\"history\":\"ads\",\"diagnose\":\"asd\",\"consultant\":{\"id\":8,\"consultantName\":\"马飞飞\",\"consultantAccount\":\"mafeifei\",\"consultantAge\":25,\"consultantPhone\":\"13955559999\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":\"400\"},\"consultantPassword\":null},\"view\":\"asd\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('137', '2020-03-28 00:13:13', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":{\"id\":8,\"residentName\":\"阿斯顿\",\"residentAccount\":\"asd\",\"residentBirth\":null,\"residentGender\":null,\"residentHeight\":null,\"residentWeight\":null,\"residentPhone\":\"13856246856\",\"residentCommunity\":{\"id\":1,\"communityName\":\"五里庙\",\"maxPeople\":null},\"residentHouse\":null,\"residentWork\":null,\"residentApplyState\":null,\"residentPassword\":null},\"createTime\":1585325593164,\"hospital\":\"asdf\",\"dept\":\"asd\",\"code\":null,\"complain\":\"asd\",\"history\":\"ads\",\"diagnose\":\"asd\",\"consultant\":{\"id\":8,\"consultantName\":\"马飞飞\",\"consultantAccount\":\"mafeifei\",\"consultantAge\":25,\"consultantPhone\":\"13955559999\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":\"400\"},\"consultantPassword\":null},\"view\":\"asd\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('138', '2020-03-28 00:22:11', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":{\"id\":12,\"residentName\":\"刘某\",\"residentAccount\":\"liumou\",\"residentBirth\":\"2020-03-05\",\"residentGender\":true,\"residentHeight\":\"189\",\"residentWeight\":\"88\",\"residentPhone\":\"18900009999\",\"residentCommunity\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":null},\"residentHouse\":\"安徽铜陵\",\"residentWork\":\"主播\",\"residentApplyState\":true,\"residentPassword\":null},\"createTime\":1585326131173,\"hospital\":\"合肥第二医院\",\"dept\":\"肛肠科\",\"code\":\"12312312\",\"complain\":\"痔疮\",\"history\":\"被刚\",\"diagnose\":\"脱岗\",\"consultant\":{\"id\":8,\"consultantName\":\"马飞飞\",\"consultantAccount\":\"mafeifei\",\"consultantAge\":25,\"consultantPhone\":\"13955559999\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":\"400\"},\"consultantPassword\":null},\"view\":\"休息一下\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('139', '2020-03-28 00:24:02', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('140', '2020-03-28 00:25:41', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('141', '2020-03-28 00:26:00', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"个人病历信息\",\"url\":\"/resident/personalCaseRecord\",\"parent\":{\"id\":12,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":18,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('142', '2020-03-28 00:26:14', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('143', '2020-03-28 00:26:52', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":22,\"text\":\"个人病历信息\",\"url\":\"/resident/personalCaseRecord\",\"parent\":{\"id\":12,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":10,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('144', '2020-03-28 00:27:04', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":1,\"rnum\":\"resident\",\"rname\":\"社区居民\",\"permissions\":[{\"pid\":10,\"pname\":null,\"presource\":null},{\"pid\":11,\"pname\":null,\"presource\":null},{\"pid\":15,\"pname\":null,\"presource\":null},{\"pid\":18,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('145', '2020-03-28 00:27:34', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('146', '2020-03-28 00:28:00', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":22,\"text\":\"个人病历信息\",\"url\":\"/resident/personalCaseRecord\",\"parent\":{\"id\":10,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":18,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('147', '2020-03-28 01:33:22', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('148', '2020-03-28 01:33:39', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('149', '2020-03-28 01:35:33', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('150', '2020-03-28 01:37:06', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('151', '2020-03-28 01:37:29', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('152', '2020-03-28 01:41:26', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('153', '2020-03-28 01:58:07', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('154', '2020-03-28 01:58:33', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('155', '2020-03-28 01:59:11', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('156', '2020-03-28 02:00:25', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('157', '2020-03-28 02:03:36', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('158', '2020-03-28 02:05:18', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('159', '2020-03-28 02:05:35', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('160', '2020-03-28 13:41:02', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:uploadExcelFile', '[null]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('161', '2020-03-28 13:41:03', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:uploadExcelFile', '[null]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('162', '2020-03-28 13:41:07', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:uploadExcelFile', '[null]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('163', '2020-03-28 13:48:46', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('164', '2020-03-28 14:38:20', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcelTpl', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('165', '2020-03-28 14:39:39', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:uploadExcelFile', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('166', '2020-03-28 14:39:45', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:uploadExcelFile', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('167', '2020-03-28 14:41:52', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:uploadExcelFile', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('168', '2020-03-28 14:43:26', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:uploadExcelFile', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('169', '2020-03-28 15:46:18', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcel', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('170', '2020-03-28 15:48:37', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcel', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('171', '2020-03-28 15:50:36', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcel', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('172', '2020-03-28 15:52:14', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:downloadExcel', null, 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('173', '2020-03-28 17:07:50', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('174', '2020-03-28 17:17:32', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('175', '2020-03-28 17:19:03', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":4,\"rnum\":\"communityAdmin\",\"rname\":\"社区管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('176', '2020-03-29 05:02:58', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('177', '2020-04-07 13:28:48', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('178', '2020-04-08 09:19:21', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":{\"id\":12,\"residentName\":\"刘某\",\"residentAccount\":\"liumou\",\"residentBirth\":\"2020-03-05\",\"residentGender\":true,\"residentHeight\":\"189\",\"residentWeight\":\"88\",\"residentPhone\":\"18900009999\",\"residentCommunity\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":null},\"residentHouse\":\"安徽铜陵\",\"residentWork\":\"主播\",\"residentApplyState\":true,\"residentPassword\":null},\"createTime\":1586308761186,\"hospital\":\"合肥第二人民医院\",\"dept\":\"外科\",\"code\":\"100001212\",\"complain\":\"身体摔伤\",\"history\":\"无\",\"diagnose\":\"基本康复\",\"consultant\":{\"id\":8,\"consultantName\":\"马飞飞\",\"consultantAccount\":\"mafeifei\",\"consultantAge\":25,\"consultantPhone\":\"13955559999\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":\"400\"},\"consultantPassword\":null},\"view\":\"回家休养\",\"status\":\"1\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('179', '2020-04-08 09:22:13', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":{\"id\":12,\"residentName\":\"刘某\",\"residentAccount\":\"liumou\",\"residentBirth\":\"2020-03-05\",\"residentGender\":true,\"residentHeight\":\"189\",\"residentWeight\":\"88\",\"residentPhone\":\"18900009999\",\"residentCommunity\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":null},\"residentHouse\":\"安徽铜陵\",\"residentWork\":\"主播\",\"residentApplyState\":true,\"residentPassword\":null},\"createTime\":1586308933304,\"hospital\":\"合肥第二人民医院\",\"dept\":\"外科\",\"code\":\"112312312\",\"complain\":\"身体摔伤\",\"history\":\"无\",\"diagnose\":\"基本康复\",\"consultant\":{\"id\":8,\"consultantName\":\"马飞飞\",\"consultantAccount\":\"mafeifei\",\"consultantAge\":25,\"consultantPhone\":\"13955559999\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":\"400\"},\"consultantPassword\":null},\"view\":\"回家休养\",\"status\":\"1\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('180', '2020-04-08 13:38:36', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:addPermission', '[{\"pid\":null,\"pname\":null,\"presource\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('181', '2020-04-08 13:39:35', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:addPermission', '[{\"pid\":null,\"pname\":null,\"presource\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('182', '2020-04-08 13:42:24', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:addPermission', '[{\"pid\":null,\"pname\":\"asdagre\",\"presource\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('183', '2020-04-08 13:44:27', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:addPermission', '[{\"pid\":null,\"pname\":\"asds\",\"presource\":\"afdgar\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('184', '2020-04-08 13:46:05', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:addPermission', '[{\"pid\":null,\"pname\":\"asd\",\"presource\":\"ewqrw\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('185', '2020-04-08 13:49:01', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:addPermission', '[{\"pid\":null,\"pname\":\"adsf\",\"presource\":\"adsfafweq\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('186', '2020-04-08 13:52:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:addPermission', '[{\"pid\":null,\"pname\":\"fdsgfE\",\"presource\":\"REGQE\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('187', '2020-04-13 16:43:11', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('188', '2020-04-13 16:43:25', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":3,\"text\":\"居民账号编辑\",\"url\":\"/admin/applyAccountPage\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":2,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('189', '2020-04-13 16:44:00', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('190', '2020-04-13 16:44:14', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:updateMenu', '[{\"id\":3,\"text\":\"居民账号审核\",\"url\":\"/admin/applyAccountPage\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":2,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('191', '2020-04-29 15:48:21', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":12,\"residentName\":\"刘某\",\"residentAccount\":\"liumou\",\"residentBirth\":\"2020-03-05\",\"residentGender\":true,\"residentHeight\":\"189\",\"residentWeight\":\"88\",\"residentPhone\":\"18900009999\",\"residentCommunity\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽铜陵\",\"residentWork\":\"公务员\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('192', '2020-04-29 16:12:08', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":12,\"residentName\":\"刘某\",\"residentAccount\":\"liumou\",\"residentBirth\":\"2020-03-05\",\"residentGender\":true,\"residentHeight\":\"189\",\"residentWeight\":\"88\",\"residentPhone\":\"18900009999\",\"residentCommunity\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽合肥\",\"residentWork\":\"公务员\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('193', '2020-04-29 16:28:52', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('194', '2020-04-29 16:30:48', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('195', '2020-04-29 16:35:00', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[13]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('196', '2020-04-29 16:57:43', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('197', '2020-04-29 17:00:03', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('198', '2020-04-29 17:07:33', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditNoPass', '[14]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('199', '2020-04-29 17:38:30', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":9,\"consultantName\":\"简自豪\",\"consultantAccount\":\"uzi\",\"consultantAge\":22,\"consultantPhone\":\"17898786757\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"9940c8c0f5a3c36f9c360caa352eabec\"}]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('200', '2020-04-29 17:59:56', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('201', '2020-04-29 18:00:40', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('202', '2020-04-29 20:28:45', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":{\"id\":null,\"residentName\":null,\"residentAccount\":\"uzi\",\"residentBirth\":null,\"residentGender\":null,\"residentHeight\":null,\"residentWeight\":null,\"residentPhone\":null,\"residentCommunity\":null,\"residentHouse\":null,\"residentWork\":null,\"residentApplyState\":null,\"residentPassword\":null},\"createTime\":null,\"hospital\":\"合肥第一人民医院\",\"dept\":\"急诊科\",\"code\":\"10000001\",\"complain\":\"身体摔伤\",\"history\":\"无\",\"diagnose\":\"骨折\",\"consultant\":null,\"view\":\"住院休养\",\"status\":\"0\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('203', '2020-04-29 20:29:06', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertCaseRecord', '[{\"id\":null,\"resident\":{\"id\":13,\"residentName\":\"五五开\",\"residentAccount\":\"wuwukai\",\"residentBirth\":null,\"residentGender\":null,\"residentHeight\":null,\"residentWeight\":null,\"residentPhone\":\"17899990000\",\"residentCommunity\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":null},\"residentHouse\":null,\"residentWork\":null,\"residentApplyState\":true,\"residentPassword\":null},\"createTime\":1588163346856,\"hospital\":\"合肥第一人民医院\",\"dept\":\"急诊科\",\"code\":\"10000001\",\"complain\":\"身体摔伤\",\"history\":\"无\",\"diagnose\":\"骨折\",\"consultant\":{\"id\":8,\"consultantName\":\"马飞飞\",\"consultantAccount\":\"mafeifei\",\"consultantAge\":25,\"consultantPhone\":\"13955559999\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":\"童话村\",\"maxPeople\":\"400\"},\"consultantPassword\":null},\"view\":\"住院休养\",\"status\":\"0\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('204', '2020-04-29 21:14:34', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('205', '2020-04-30 10:00:11', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[16]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('206', '2020-04-30 12:13:12', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('207', '2020-04-30 13:44:07', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":13,\"residentName\":\"五五开\",\"residentAccount\":\"wuwukai\",\"residentBirth\":\"2020-04-15\",\"residentGender\":true,\"residentHeight\":\"175\",\"residentWeight\":\"66\",\"residentPhone\":\"17899990000\",\"residentCommunity\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"上海\",\"residentWork\":\"打LoL职业\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin1', '五五开');
INSERT INTO `system_log` VALUES ('208', '2020-04-30 13:51:44', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('209', '2020-04-30 13:52:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('210', '2020-04-30 13:52:21', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('211', '2020-04-30 13:52:31', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('212', '2020-04-30 13:53:12', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('213', '2020-04-30 13:53:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('214', '2020-04-30 13:54:10', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('215', '2020-04-30 13:59:02', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('216', '2020-04-30 13:59:22', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('217', '2020-05-03 20:06:38', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('218', '2020-05-03 20:09:30', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('219', '2020-05-03 20:09:51', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('220', '2020-05-03 20:15:04', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('221', '2020-05-03 20:16:07', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('222', '2020-05-03 20:17:23', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('223', '2020-05-03 20:22:48', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('224', '2020-05-03 20:22:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('225', '2020-05-03 20:26:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('226', '2020-05-03 20:29:37', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('227', '2020-05-03 20:41:32', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('228', '2020-05-18 08:41:47', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":16,\"residentName\":\"张三\",\"residentAccount\":\"zhangsan\",\"residentBirth\":\"2020-05-07\",\"residentGender\":true,\"residentHeight\":\"167\",\"residentWeight\":\"66\",\"residentPhone\":\"13856246856\",\"residentCommunity\":{\"id\":7,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽合肥\",\"residentWork\":\"公务员\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('229', '2020-05-18 08:46:45', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[15]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('230', '2020-05-18 08:47:55', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('231', '2020-05-18 08:55:12', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('232', '2020-05-18 09:03:13', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:addPermission', '[{\"pid\":null,\"pname\":\"newPage\",\"presource\":\"测试权限\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('233', '2020-05-18 09:03:25', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":19,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('234', '2020-05-18 09:04:02', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('235', '2020-05-18 09:04:39', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:saveMenu', '[{\"id\":null,\"text\":\"测试page\",\"url\":\"/new\",\"parent\":{\"id\":1,\"text\":null,\"url\":null,\"parent\":null,\"children\":[],\"permission\":null},\"children\":[],\"permission\":{\"pid\":19,\"pname\":null,\"presource\":null}}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('236', '2020-05-18 09:13:23', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('237', '2020-05-18 09:33:40', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('238', '2020-05-18 09:33:46', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:deleteById', '[23]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('239', '2020-05-18 09:37:14', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('240', '2020-05-18 09:37:56', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":16,\"residentName\":\"张三\",\"residentAccount\":\"zhangsan\",\"residentBirth\":\"2020-05-07\",\"residentGender\":true,\"residentHeight\":\"167\",\"residentWeight\":\"66\",\"residentPhone\":\"13856246856\",\"residentCommunity\":{\"id\":8,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽合肥\",\"residentWork\":\"公务员\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('241', '2020-05-18 09:38:17', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('242', '2020-05-18 09:38:49', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('243', '2020-05-18 09:40:13', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[17]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('244', '2020-05-18 09:40:46', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":17,\"residentName\":\"闻杰\",\"residentAccount\":\"wenjie2\",\"residentBirth\":\"2020-05-12\",\"residentGender\":true,\"residentHeight\":\"178\",\"residentWeight\":\"77\",\"residentPhone\":\"17823456789\",\"residentCommunity\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽合肥\",\"residentWork\":\"教师\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('245', '2020-05-18 09:42:14', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":10,\"consultantName\":\"五里庙admin\",\"consultantAccount\":\"wulimiao\",\"consultantAge\":34,\"consultantPhone\":\"18912345678\",\"consultantGender\":false,\"community\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"3bc86fe8429f58e376cb5649e2aa0e44\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('246', '2020-05-18 10:02:40', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":11,\"consultantName\":\"石头村医师\",\"consultantAccount\":\"shitoucun1\",\"consultantAge\":55,\"consultantPhone\":\"13856246856\",\"consultantGender\":true,\"community\":{\"id\":7,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"77902ddae30a9ea011ac95f5680eb01f\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('247', '2020-05-18 10:03:27', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:editCommunityAdmin', '[{\"id\":5,\"name\":\"五五开\",\"account\":\"admin11\",\"phone\":\"18756565656\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"password\":\"\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('248', '2020-05-18 10:03:32', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:editCommunityAdmin', '[{\"id\":5,\"name\":\"五五开\",\"account\":\"admin1\",\"phone\":\"18756565656\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"password\":\"\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('249', '2020-05-18 10:22:17', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":2,\"rnum\":\"consultant\",\"rname\":\"社区医师\",\"permissions\":[{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null},{\"pid\":1,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('250', '2020-05-18 10:29:56', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[18]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('251', '2020-05-18 10:30:26', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":18,\"residentName\":\"刘备\",\"residentAccount\":\"liubei\",\"residentBirth\":\"2020-05-06\",\"residentGender\":true,\"residentHeight\":\"167\",\"residentWeight\":\"68\",\"residentPhone\":\"13856246856\",\"residentCommunity\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽合肥\",\"residentWork\":\"教师\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('252', '2020-05-18 10:31:33', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:addCommunityAdmin', '[{\"id\":6,\"name\":\"曹操\",\"account\":\"caocao\",\"phone\":\"13856234567\",\"community\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"password\":\"10ac78c9400ebf2c1ec0c771efa54dc3\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('253', '2020-05-18 10:37:35', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":4,\"name\":\"刘某\",\"account\":\"liumou\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":true,\"covid\":false,\"familyIllness\":\"白化病\",\"bloodType\":\"AB\",\"colorBlind\":\"无\",\"bloodSugar\":\"5.6mmol/L\",\"whiteBlood\":false,\"vaccin\":\"乙肝，甲肝，乙脑，天花\",\"remark\":\"肥胖，癌症\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('254', '2020-05-18 10:39:07', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:deleteConsultantById', '[9]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('255', '2020-05-18 10:41:50', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('256', '2020-05-18 10:51:06', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":17,\"residentName\":\"闻杰\",\"residentAccount\":\"wenjie234\",\"residentBirth\":\"2020-05-12\",\"residentGender\":true,\"residentHeight\":\"175\",\"residentWeight\":\"77\",\"residentPhone\":\"17823456789\",\"residentCommunity\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽合肥\",\"residentWork\":\"教师\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('257', '2020-05-18 10:51:46', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:editCommunityAdmin', '[{\"id\":6,\"name\":\"曹操\",\"account\":\"caocao1\",\"phone\":\"13856234567\",\"community\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"password\":\"\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('258', '2020-05-18 10:52:09', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[15]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('259', '2020-05-18 11:05:41', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:insertHealthRecord', '[{\"id\":null,\"name\":\"五五开\",\"account\":\"wuwukai\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":true,\"familyIllness\":\"无\",\"bloodType\":\"O\",\"colorBlind\":\"否\",\"bloodSugar\":\"5.4mmol/L\",\"whiteBlood\":false,\"vaccin\":\"\\t\\r\\n乙肝，甲肝，乙脑，水痘，天花，卡介苗\\r\\n\",\"remark\":\"抑郁症病史\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('260', '2020-05-18 11:06:32', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":5,\"name\":\"五五开\",\"account\":\"wuwukai\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":true,\"familyIllness\":\"无\",\"bloodType\":\"O\",\"colorBlind\":\"否\",\"bloodSugar\":\"5.4mmol/L\",\"whiteBlood\":false,\"vaccin\":\"\\t\\r\\n乙肝，甲肝，乙脑，水痘，天花，卡介苗，麻疹疫苗\\r\\n\",\"remark\":\"抑郁症病史\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('261', '2020-05-18 11:09:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('262', '2020-05-18 11:10:16', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('263', '2020-05-18 11:11:15', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:addCommunityAdmin', '[{\"id\":7,\"name\":\"司马懿\",\"account\":\"simayi\",\"phone\":\"17867786778\",\"community\":{\"id\":8,\"communityName\":null,\"maxPeople\":null},\"password\":\"5ae2df31489bc32500120957ef948803\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('264', '2020-05-18 11:14:40', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('265', '2020-05-18 11:14:44', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('266', '2020-05-18 11:15:45', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('267', '2020-05-18 11:16:36', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":2,\"rnum\":\"consultant\",\"rname\":\"社区医师\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('268', '2020-05-18 11:18:27', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":2,\"rnum\":\"consultant\",\"rname\":\"社区医师\",\"permissions\":[{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":13,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('269', '2020-05-18 11:19:01', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":2,\"rnum\":\"consultant\",\"rname\":\"社区医师\",\"permissions\":[{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null},{\"pid\":17,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('270', '2020-05-18 13:09:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('271', '2020-05-18 14:59:23', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('272', '2020-05-18 14:59:32', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('273', '2020-05-18 15:01:30', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('274', '2020-05-18 15:01:52', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:editCommunityAdmin', '[{\"id\":7,\"name\":\"司马懿\",\"account\":\"simayi2\",\"phone\":\"17867786778\",\"community\":{\"id\":8,\"communityName\":null,\"maxPeople\":null},\"password\":\"\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('275', '2020-05-19 08:04:22', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:addCommunityAdmin', '[{\"id\":8,\"name\":\"孙权\",\"account\":\"sunquan\",\"phone\":\"13867875645\",\"community\":{\"id\":7,\"communityName\":null,\"maxPeople\":null},\"password\":\"1e80028b7beb5c04eecb8af8ced858e2\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('276', '2020-05-19 08:04:55', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":18,\"residentName\":\"刘备\",\"residentAccount\":\"liubei1\",\"residentBirth\":\"2020-05-06\",\"residentGender\":true,\"residentHeight\":\"167\",\"residentWeight\":\"68\",\"residentPhone\":\"13856246856\",\"residentCommunity\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽合肥\",\"residentWork\":\"教师\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('277', '2020-05-19 08:05:01', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":18,\"residentName\":\"刘备\",\"residentAccount\":\"liubei\",\"residentBirth\":\"2020-05-06\",\"residentGender\":true,\"residentHeight\":\"167\",\"residentWeight\":\"68\",\"residentPhone\":\"13856246856\",\"residentCommunity\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽合肥\",\"residentWork\":\"教师\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('278', '2020-05-19 08:05:18', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:editCommunityAdmin', '[{\"id\":6,\"name\":\"曹操\",\"account\":\"caocao\",\"phone\":\"13856234567\",\"community\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"password\":\"\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('279', '2020-05-19 08:05:34', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:editCommunityAdmin', '[{\"id\":6,\"name\":\"曹操\",\"account\":\"caocao1\",\"phone\":\"13856234567\",\"community\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"password\":\"\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('280', '2020-05-19 08:05:41', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:editCommunityAdmin', '[{\"id\":6,\"name\":\"曹操\",\"account\":\"caocao\",\"phone\":\"13856234567\",\"community\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"password\":\"\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('281', '2020-05-19 08:07:04', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null},{\"pid\":14,\"pname\":null,\"presource\":null},{\"pid\":16,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('282', '2020-05-19 08:07:12', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminMenuServiceImpl:permissionList', '[]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('283', '2020-05-19 08:07:36', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminRoleServiceImpl:updateRole', '[{\"rid\":3,\"rnum\":\"admin\",\"rname\":\"超级管理员\",\"permissions\":[{\"pid\":1,\"pname\":null,\"presource\":null},{\"pid\":2,\"pname\":null,\"presource\":null},{\"pid\":3,\"pname\":null,\"presource\":null},{\"pid\":4,\"pname\":null,\"presource\":null},{\"pid\":5,\"pname\":null,\"presource\":null},{\"pid\":6,\"pname\":null,\"presource\":null},{\"pid\":7,\"pname\":null,\"presource\":null},{\"pid\":8,\"pname\":null,\"presource\":null},{\"pid\":9,\"pname\":null,\"presource\":null}]}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('284', '2020-05-19 08:43:02', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminCommunityAdminServiceImpl:editCommunityAdmin', '[{\"id\":6,\"name\":\"曹操\",\"account\":\"caocao1\",\"phone\":\"13856234567\",\"community\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"password\":\"\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('285', '2020-05-19 08:52:23', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":null,\"consultantName\":\"qweqw\",\"consultantAccount\":\"qweq\",\"consultantAge\":12,\"consultantPhone\":\"16756786789\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"qwe\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('286', '2020-05-19 08:52:31', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":12,\"consultantName\":\"qweqw\",\"consultantAccount\":\"qweq\",\"consultantAge\":12,\"consultantPhone\":\"13867788978\",\"consultantGender\":true,\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"a60df08a4ab821767b92c68934f2967c\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('287', '2020-05-19 08:53:50', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:deleteConsultantById', '[12]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('288', '2020-05-19 08:55:29', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminConsultantServiceImpl:addConsultant', '[{\"id\":13,\"consultantName\":\"da\",\"consultantAccount\":\"da\",\"consultantAge\":56,\"consultantPhone\":\"13978677867\",\"consultantGender\":true,\"community\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"consultantPassword\":\"ceeccab5007af81a663e0ef3f1e16782\"}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('289', '2020-05-19 09:49:23', '192.168.10.1', 'com.ahtcm.service.consultant.impl.ConsultantServiceImpl:editHealthRecord', '[{\"id\":5,\"name\":\"五五开\",\"account\":\"wuwukai\",\"community\":{\"id\":6,\"communityName\":null,\"maxPeople\":null},\"highBlood\":false,\"covid\":true,\"familyIllness\":\"无\",\"bloodType\":\"O\",\"colorBlind\":\"是\",\"bloodSugar\":\"5.4mmol/L\",\"whiteBlood\":false,\"vaccin\":\"\\t\\r\\n乙肝，甲肝，乙脑，水痘，天花，卡介苗，麻疹疫苗\\r\\n\",\"remark\":\"抑郁症病史\"}]', 'mafeifei', '马飞飞');
INSERT INTO `system_log` VALUES ('290', '2020-05-19 10:03:22', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[20]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('291', '2020-05-19 10:03:54', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":20,\"residentName\":\"李四\",\"residentAccount\":\"lisi\",\"residentBirth\":\"2020-05-06\",\"residentGender\":true,\"residentHeight\":\"156\",\"residentWeight\":\"56\",\"residentPhone\":\"13867566756\",\"residentCommunity\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽\",\"residentWork\":\"教师\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('292', '2020-05-19 10:04:00', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":20,\"residentName\":\"李四\",\"residentAccount\":\"lisi2\",\"residentBirth\":\"2020-05-06\",\"residentGender\":true,\"residentHeight\":\"156\",\"residentWeight\":\"56\",\"residentPhone\":\"13867566756\",\"residentCommunity\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽\",\"residentWork\":\"教师\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('293', '2020-05-19 10:04:09', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminResidentServiceImpl:updateResident', '[{\"id\":20,\"residentName\":\"李四\",\"residentAccount\":\"lisi22\",\"residentBirth\":\"2020-05-06\",\"residentGender\":true,\"residentHeight\":\"156\",\"residentWeight\":\"56\",\"residentPhone\":\"13867566756\",\"residentCommunity\":{\"id\":1,\"communityName\":null,\"maxPeople\":null},\"residentHouse\":\"安徽\",\"residentWork\":\"教师\",\"residentApplyState\":true,\"residentPassword\":null}]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('294', '2020-05-19 10:05:55', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[21]', 'admin', '首席管理员');
INSERT INTO `system_log` VALUES ('295', '2020-05-19 10:06:49', '192.168.10.1', 'com.ahtcm.service.admin.impl.AdminApplyServiceImpl:setAuditPass', '[22]', 'admin', '首席管理员');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) DEFAULT NULL,
  `rid` bigint(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '1', null, null);
INSERT INTO `user` VALUES ('1', '4', null, null);
INSERT INTO `user` VALUES ('2', '4', null, null);
INSERT INTO `user` VALUES ('3', '4', null, null);
INSERT INTO `user` VALUES ('4', '4', null, null);
INSERT INTO `user` VALUES ('1', '3', 'admin', '3fed7a346e430ea4c2aa10250928f4de');
INSERT INTO `user` VALUES ('5', '1', 'wenjie', '135f293ce58d1e2f831e19a56b67ce61');
INSERT INTO `user` VALUES ('5', '4', 'admin1', 'c2328243cf2480ca3248ae9be76e5179');
INSERT INTO `user` VALUES ('7', '2', 'dasima', '4a3de5b791181dac85efa105f2c9106e');
INSERT INTO `user` VALUES ('8', '2', 'mafeifei', 'f8b6e3eb1a5452b177bd1248fc6a7475');
INSERT INTO `user` VALUES ('12', '1', 'liumou', '6255f8090d6ba7f437567fa1dc8aba7d');
INSERT INTO `user` VALUES ('13', '1', 'wuwukai', '5a4c78ed9af844e01e47fdb9f30c416c');
INSERT INTO `user` VALUES ('16', '1', 'zhangsan', '8b51b90d65deccb3a7eaf96d6632082e');
INSERT INTO `user` VALUES ('17', '1', 'wenjie2', '29ac455d5f84c78363a7cc2342e78227');
INSERT INTO `user` VALUES ('10', '2', 'wulimiao', '3bc86fe8429f58e376cb5649e2aa0e44');
INSERT INTO `user` VALUES ('11', '2', 'shitoucun1', '77902ddae30a9ea011ac95f5680eb01f');
INSERT INTO `user` VALUES ('18', '1', 'liubei', '91fbd7517165dfc85068ad1031d341e5');
INSERT INTO `user` VALUES ('6', '4', 'caocao', '10ac78c9400ebf2c1ec0c771efa54dc3');
INSERT INTO `user` VALUES ('7', '4', 'simayi', '5ae2df31489bc32500120957ef948803');
INSERT INTO `user` VALUES ('8', '4', 'sunquan', '1e80028b7beb5c04eecb8af8ced858e2');
INSERT INTO `user` VALUES ('13', '2', 'da', 'ceeccab5007af81a663e0ef3f1e16782');
INSERT INTO `user` VALUES ('20', '1', 'lisi', 'fc1da91c1384d5f286f1a7435460f059');
INSERT INTO `user` VALUES ('21', '1', 'zhangsan2', '09540ba21b79513705a706e6c8d1250d');
INSERT INTO `user` VALUES ('22', '1', 'guanyu', '73f82332da3599cb755826c7636d0e5b');
