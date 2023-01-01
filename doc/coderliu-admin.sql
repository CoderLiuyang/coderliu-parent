/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : coderliu-admin

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 01/01/2023 23:50:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门id',
  `p_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父部门id',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` bit(1) NULL DEFAULT b'0' COMMENT '部门状态（1正常 0停用）',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dept_name`(`dept_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '骐进科技发展有限公司', 0, '康志国', '15888888888', 'hanshijie@qijin.net', b'0', b'0', 'admin', '2021-04-29 13:41:30', '00762', '2022-08-26 13:54:47', NULL);
INSERT INTO `sys_dept` VALUES ('101', '100', '金服事业部', 1, '郭馨阳', '15888888888', 'hanshijie@qijin.net', b'0', b'0', 'admin', '2021-04-29 13:41:30', '00762', '2022-07-27 16:16:27', NULL);
INSERT INTO `sys_dept` VALUES ('102', '100', '运输公司', 32, '郄春乾', '15888888888', 'hanshijie@qijin.net', b'0', b'0', 'admin', '2021-04-29 13:41:30', '00239', '2022-07-12 10:21:55', NULL);
INSERT INTO `sys_dept` VALUES ('103', '101', '研发部', 10, '任奋飞', '15888888888', 'hanshijie@qijin.net', b'0', b'0', 'admin', '2021-04-29 13:41:30', 'admin', '2021-05-22 14:59:23', NULL);
INSERT INTO `sys_dept` VALUES ('104', '101', '信审部', 11, '王金玲', '15888888888', 'hanshijie@qijin.net', b'0', b'0', 'admin', '2021-04-29 13:41:30', 'admin', '2021-05-22 15:01:03', NULL);
INSERT INTO `sys_dept` VALUES ('105', '101', '运营部', 12, '老余', '15888888888', 'hanshijie@qijin.net', b'0', b'0', 'admin', '2021-04-29 13:41:30', 'admin', '2021-05-22 15:01:11', NULL);
INSERT INTO `sys_dept` VALUES ('106', '100', '资产管理部', 10, '', '', '', b'0', b'0', 'admin', '2021-04-29 13:41:30', '00762', '2022-06-09 17:34:27', NULL);
INSERT INTO `sys_dept` VALUES ('107', '110', '诉讼合规部', 4, '王志平', '', '', b'0', b'0', 'admin', '2021-04-29 13:41:30', 'admin', '2021-05-09 09:03:31', NULL);
INSERT INTO `sys_dept` VALUES ('108', '128', '平山办事处', 1, '樊晓维', '15888888888', 'hanshijie@qijin.net', b'0', b'0', 'admin', '2021-04-29 13:41:30', '00239', '2022-07-12 10:22:20', NULL);
INSERT INTO `sys_dept` VALUES ('109', '102', '井陉运输公司', 2, '高永明', '15888888888', 'hanshijie@qijin.net', b'0', b'0', 'admin', '2021-04-29 13:41:30', 'admin', '2021-07-19 15:36:08', NULL);
INSERT INTO `sys_dept` VALUES ('110', '100', '智能风控部', 5, '付进波', '', '', b'0', b'0', 'admin', '2021-05-09 08:59:41', '00762', '2022-06-09 17:33:10', NULL);
INSERT INTO `sys_dept` VALUES ('111', '110', '体系建设组', 1, '', '', '', b'0', b'0', 'admin', '2021-05-09 09:00:14', '00762', '2022-06-09 17:33:10', NULL);
INSERT INTO `sys_dept` VALUES ('112', '110', '信审组', 2, '付进波', '', '', b'0', b'0', 'admin', '2021-05-09 09:01:11', '00762', '2022-06-09 16:51:34', NULL);
INSERT INTO `sys_dept` VALUES ('113', '100', '信息科技部', 4, '', '', '', b'0', b'0', 'adminhan', '2021-05-22 10:22:05', 'admin', '2022-03-02 09:23:28', NULL);
INSERT INTO `sys_dept` VALUES ('114', '100', '山东大区', 20, '', '', '', b'0', b'0', 'admin', '2021-05-22 14:51:53', 'admin', '2022-01-12 17:53:53', NULL);
INSERT INTO `sys_dept` VALUES ('115', '114', '聊城办事处', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:52:20', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('116', '234', '徐州办事处', 2, '', '', '', b'0', b'0', 'admin', '2021-05-22 14:52:32', 'admin', '2022-01-20 11:19:02', NULL);
INSERT INTO `sys_dept` VALUES ('117', '114', '泰安办事处', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:52:45', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('118', '114', '滨州办事处', 4, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:53:13', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('119', '114', '日照办事处', 5, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:53:25', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('120', '114', '东营办事处', 6, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:53:47', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('121', '114', '青岛办事处', 7, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:54:01', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('122', '114', '潍坊办事处', 8, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:54:17', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('123', '234', '连云港办事处', 9, '', '', '', b'0', b'0', 'admin', '2021-05-22 14:54:41', 'admin', '2022-01-20 11:20:10', NULL);
INSERT INTO `sys_dept` VALUES ('124', '114', '菏泽办事处', 10, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:55:00', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('125', '114', '济南办事处', 11, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:55:19', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('126', '114', '德州办事处', 12, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:55:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('127', '114', '枣庄办事处', 13, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:56:10', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('128', '100', '京津冀大区', 23, '', '', '', b'0', b'0', 'admin', '2021-05-22 14:57:39', '00239', '2022-07-22 17:07:58', NULL);
INSERT INTO `sys_dept` VALUES ('129', '128', '石家庄办事处', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:58:10', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('130', '128', '邯郸办事处', 2, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:58:32', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('131', '128', '天津办事处', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:58:45', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('132', '128', '张家口办事处', 4, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 14:59:01', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('133', '100', '新疆大区', 22, '', '', '', b'0', b'0', 'admin', '2021-05-22 15:00:40', 'admin', '2022-01-12 17:54:25', NULL);
INSERT INTO `sys_dept` VALUES ('134', '133', '乌鲁木齐办事处', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 15:00:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('135', '133', '南疆办事处', 2, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 15:01:51', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('136', '133', '伊犁办事处', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 15:02:38', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('137', '133', '哈密办事处', 4, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-05-22 15:03:18', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('138', '106', '执行委员会', 1, '康志国', NULL, NULL, b'0', b'0', 'liangxu', '2021-05-26 09:21:57', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('139', '100', '执行委员会', 5, '康志国', NULL, NULL, b'0', b'0', 'liangxu', '2021-05-26 09:25:16', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('140', '100', '融资部', 6, '吴振朝', '18031113555', '', b'0', b'0', 'liangxu', '2021-05-26 09:27:08', '00762', '2022-06-09 16:59:09', NULL);
INSERT INTO `sys_dept` VALUES ('141', '100', '西南大区', 24, '', '18733113888', '', b'0', b'0', 'liangxu', '2021-05-26 09:30:03', 'admin', '2022-01-12 17:54:48', NULL);
INSERT INTO `sys_dept` VALUES ('142', '141', '成都办事处', 1, '和利超', '13127277175', NULL, b'0', b'0', 'liangxu', '2021-05-26 09:31:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('143', '141', '重庆办事处', 2, '和利超', '13127277175', NULL, b'0', b'0', 'liangxu', '2021-05-26 09:33:25', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('144', '184', '晋中办事处', 5, '孔胜兰', '18831119114', NULL, b'0', b'0', 'liangxu', '2021-05-26 09:35:51', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('145', '184', '吕梁办事处', 6, '高千生', '18833151678', NULL, b'0', b'0', 'liangxu', '2021-05-26 09:37:04', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('146', '184', '忻州办事处', 7, '左宽', '15303507345', NULL, b'0', b'0', 'liangxu', '2021-05-26 09:38:12', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('147', '295', '南宁办事处', 8, '翟建廷', '18978951768', '', b'0', b'0', 'liangxu', '2021-05-26 09:42:10', 'admin', '2021-10-07 18:01:59', NULL);
INSERT INTO `sys_dept` VALUES ('148', '236', '银川办事处', 9, '', '18531126765', '', b'0', b'0', 'liangxu', '2021-05-26 09:45:58', '00239', '2022-07-05 13:27:08', NULL);
INSERT INTO `sys_dept` VALUES ('149', '303', '呼和浩特办事处', 2, '', '', '', b'0', b'0', 'liangxu', '2021-05-26 09:47:37', 'admin', '2022-01-20 11:28:44', NULL);
INSERT INTO `sys_dept` VALUES ('150', '141', '普洱办事处', 11, '杨帆', '17333981214', '', b'0', b'0', 'liangxu', '2021-05-26 09:48:27', 'admin', '2021-10-07 17:47:22', NULL);
INSERT INTO `sys_dept` VALUES ('151', '303', '包头办事处', 12, '王利昆', '15176145225', '', b'0', b'0', 'liangxu', '2021-05-26 09:52:58', 'admin', '2022-01-20 15:34:33', NULL);
INSERT INTO `sys_dept` VALUES ('152', '189', '西安办事处', 13, '孔胜兰', '18831119114', '', b'0', b'0', 'liangxu', '2021-05-26 09:54:37', 'admin', '2022-01-06 14:38:50', NULL);
INSERT INTO `sys_dept` VALUES ('153', '187', '杭州办事处', 14, '刘红兵', '18032798123', NULL, b'0', b'0', 'liangxu', '2021-05-26 09:56:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('154', '140', '业务组', 1, '吴振朝', '18031113555', '', b'0', b'0', 'liangxu', '2021-05-26 10:23:12', '00762', '2022-06-09 16:58:32', NULL);
INSERT INTO `sys_dept` VALUES ('155', '140', '运营组', 2, '', '', '', b'0', b'0', 'liangxu', '2021-05-26 10:25:06', '00762', '2022-06-09 16:59:09', NULL);
INSERT INTO `sys_dept` VALUES ('156', '100', '财务部', 8, '封美平', '15930168831', '', b'0', b'0', 'liangxu', '2021-05-26 10:26:22', 'liangxu', '2021-05-26 10:30:13', NULL);
INSERT INTO `sys_dept` VALUES ('157', '100', '总经理办公室', 7, '李志龙', '18631100165', NULL, b'0', b'0', 'liangxu', '2021-05-26 10:27:56', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('158', '100', '人力资源部', 9, '张琛', '13303036530', '', b'0', b'0', 'liangxu', '2021-05-26 10:33:38', 'liangxu', '2021-05-26 10:34:12', NULL);
INSERT INTO `sys_dept` VALUES ('159', '100', '科技部', 10, '韩世杰', '18031267609', NULL, b'0', b'0', 'liangxu', '2021-05-27 09:52:12', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('160', '102', '三一销售部', 11, '', '', '', b'0', b'0', 'liangxu', '2021-05-27 09:54:21', 'admin', '2021-09-23 17:55:50', NULL);
INSERT INTO `sys_dept` VALUES ('161', '141', '昆明办事处', 15, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:45:30', 'admin', '2021-10-07 17:58:57', NULL);
INSERT INTO `sys_dept` VALUES ('162', '101', '德阳办事处', 16, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:45:53', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('163', '128', '邢台办事处', 17, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:46:03', 'admin', '2021-06-28 15:17:11', NULL);
INSERT INTO `sys_dept` VALUES ('164', '102', '赞皇运输公司', 18, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:46:21', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('165', '114', '济宁办事处', 19, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:46:37', 'admin', '2021-06-28 15:17:30', NULL);
INSERT INTO `sys_dept` VALUES ('166', '128', '沧州办事处', 20, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:46:49', 'admin', '2021-09-23 18:22:03', NULL);
INSERT INTO `sys_dept` VALUES ('167', '128', '唐山办事处', 21, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:46:58', 'admin', '2021-06-28 15:18:44', NULL);
INSERT INTO `sys_dept` VALUES ('168', '101', '上海办事处', 22, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:47:10', 'admin', '2021-06-28 09:47:19', NULL);
INSERT INTO `sys_dept` VALUES ('169', '101', '湘赣办事处', 23, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:48:20', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('170', '248', '深圳办事处', 2, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:48:28', '00611', '2022-02-10 14:36:15', NULL);
INSERT INTO `sys_dept` VALUES ('171', '191', '南昌办事处', 25, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:48:35', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('172', '192', '拉萨办事处', 26, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:48:42', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('173', '102', '行唐运输公司', 27, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:48:50', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('174', '102', '藁城运输公司', 28, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:48:57', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('175', '191', '河南办事处', 29, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:49:08', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('176', '102', '祺邦运输公司', 30, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:49:16', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('177', '128', '承德办事处', 31, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:49:24', 'admin', '2021-06-28 15:16:27', NULL);
INSERT INTO `sys_dept` VALUES ('178', '141', '大理办事处', 32, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:49:36', 'admin', '2021-10-07 18:05:55', NULL);
INSERT INTO `sys_dept` VALUES ('179', '141', '曲靖办事处', 33, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:49:43', 'admin', '2021-10-07 18:06:27', NULL);
INSERT INTO `sys_dept` VALUES ('180', '189', '兰州办事处', 34, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-06-28 09:49:51', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('181', '128', '包钢办事处', 35, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:49:58', 'admin', '2021-09-23 17:40:17', NULL);
INSERT INTO `sys_dept` VALUES ('182', '349', '长沙办事处', 36, '', '', '', b'0', b'0', 'admin', '2021-06-28 09:50:05', '00239', '2022-06-22 10:33:01', NULL);
INSERT INTO `sys_dept` VALUES ('184', '100', '山西大区', 25, '姜志刚', '', '', b'0', b'0', 'admin', '2021-09-23 17:35:30', 'admin', '2022-01-12 17:54:57', NULL);
INSERT INTO `sys_dept` VALUES ('185', '102', '辛集运输公司', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-09-23 17:57:34', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('186', '102', '鹿泉运输公司', 4, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-09-23 17:57:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('187', '100', '杭州办事处(大区)', 26, '', '', '', b'0', b'0', 'admin', '2021-09-23 17:58:34', '00239', '2022-05-30 15:38:15', NULL);
INSERT INTO `sys_dept` VALUES ('188', '100', '云南', 6, '', '', '', b'0', b'0', 'admin', '2021-09-23 18:00:55', 'admin', '2021-10-07 17:43:30', NULL);
INSERT INTO `sys_dept` VALUES ('189', '100', '西北大区', 27, '', '', '', b'0', b'0', 'admin', '2021-09-23 18:17:03', 'admin', '2022-01-12 17:55:27', NULL);
INSERT INTO `sys_dept` VALUES ('190', '100', '广西', 8, '', '', '', b'0', b'0', 'admin', '2021-09-23 18:20:03', 'admin', '2021-10-07 17:43:43', NULL);
INSERT INTO `sys_dept` VALUES ('191', '100', '其它', 30, '', '', '', b'0', b'0', 'admin', '2021-09-23 18:22:35', 'admin', '2022-01-12 17:50:30', NULL);
INSERT INTO `sys_dept` VALUES ('192', '100', '西藏', 31, '', '', '', b'0', b'0', 'admin', '2021-09-23 18:28:40', 'admin', '2022-01-12 17:50:48', NULL);
INSERT INTO `sys_dept` VALUES ('193', '100', '轿车公司', 33, '', '', '', b'0', b'0', 'admin', '2021-09-23 18:29:56', 'admin', '2022-01-12 17:51:34', NULL);
INSERT INTO `sys_dept` VALUES ('194', '193', '轿车公司', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-09-23 18:31:59', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('195', '100', '集团办公室', 3, '余轶', '', '', b'0', b'0', 'admin', '2021-10-30 08:45:29', '00762', '2022-08-26 13:54:47', NULL);
INSERT INTO `sys_dept` VALUES ('196', '195', '河北-邢台迈顺', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-10-30 08:46:07', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('197', '195', '辽宁-大连金项', 2, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-10-30 08:46:48', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('198', '100', '安徽大区', 21, '', '', '', b'0', b'0', 'admin', '2021-11-29 14:08:04', 'admin', '2022-01-12 17:54:11', NULL);
INSERT INTO `sys_dept` VALUES ('199', '198', '合肥办事处', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-11-29 14:08:21', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('200', '198', '滁州办事处', 2, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-11-29 14:09:09', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('201', '198', '亳州办事处', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-11-29 14:09:43', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('202', '198', '宿州办事处', 4, NULL, NULL, NULL, b'0', b'0', 'admin', '2021-11-29 14:10:00', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('203', '101', '运营中心', 4, '', '', '', b'0', b'0', '00762', '2021-11-29 19:07:15', '00239', '2022-07-19 13:31:54', NULL);
INSERT INTO `sys_dept` VALUES ('204', '195', '外部合作渠道-孔', 1, '', '', '', b'0', b'0', '00762', '2021-11-29 19:07:49', '00762', '2022-07-29 10:19:35', NULL);
INSERT INTO `sys_dept` VALUES ('205', '113', '付小娜6291', 1, NULL, NULL, NULL, b'0', b'0', '00762', '2021-11-29 19:09:53', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('206', '204', '孔：渠道-石家庄', 1, '', '', '', b'0', b'0', '00762', '2021-11-29 19:10:44', 'admin', '2022-03-09 09:44:23', NULL);
INSERT INTO `sys_dept` VALUES ('207', '204', '孔：渠道-宁夏王凤', 2, '', '', '', b'0', b'0', '00762', '2021-11-29 19:11:08', '00006', '2022-03-22 12:33:39', NULL);
INSERT INTO `sys_dept` VALUES ('208', '204', '孔：渠道-袁红3704', 3, '', '', '', b'0', b'0', '00762', '2021-11-29 19:11:30', 'admin', '2022-03-09 09:46:09', NULL);
INSERT INTO `sys_dept` VALUES ('209', '204', '孔：渠道-石家庄高翔', 4, '', '', '', b'0', b'0', '00762', '2021-11-29 19:11:48', '00006', '2022-03-09 09:50:20', NULL);
INSERT INTO `sys_dept` VALUES ('210', '204', '孔：渠道-北京泽帛', 5, '', '', '', b'0', b'0', '00762', '2021-11-29 19:12:08', '00006', '2022-03-09 09:50:31', NULL);
INSERT INTO `sys_dept` VALUES ('211', '204', '孔：渠道-车车大师兄', 6, '', '', '', b'0', b'0', '00762', '2021-11-29 19:12:28', '00006', '2022-03-09 09:50:42', NULL);
INSERT INTO `sys_dept` VALUES ('212', '204', '孔：渠道-乐意保', 7, '', '', '', b'0', b'0', '00762', '2021-11-29 19:16:53', '00006', '2022-03-09 09:50:53', NULL);
INSERT INTO `sys_dept` VALUES ('213', '204', '孔：渠道-刘静3118', 8, '', '', '', b'0', b'0', '00762', '2021-11-29 19:17:50', '00006', '2022-03-09 09:51:56', NULL);
INSERT INTO `sys_dept` VALUES ('214', '204', '孔：渠道-白鸽1111', 9, '', '', '', b'0', b'0', '00762', '2021-11-29 19:18:10', '00006', '2022-03-09 09:52:17', NULL);
INSERT INTO `sys_dept` VALUES ('215', '204', '孔：渠道-黄志刚1516', 10, '', '', '', b'0', b'0', '00762', '2021-11-29 19:18:38', '00006', '2022-03-09 09:52:41', NULL);
INSERT INTO `sys_dept` VALUES ('216', '204', '孔：渠道-贵州', 11, '', '', '', b'0', b'0', '00762', '2021-11-29 19:19:05', '00006', '2022-03-09 09:52:50', NULL);
INSERT INTO `sys_dept` VALUES ('217', '204', '孔：渠道-相里金旺6789', 12, '', '', '', b'0', b'0', '00762', '2021-11-29 19:19:41', '00006', '2022-03-09 09:53:02', NULL);
INSERT INTO `sys_dept` VALUES ('218', '204', '孔：渠道-北京泽帛2', 13, '', '', '', b'0', b'0', '00762', '2021-11-29 19:20:30', '00006', '2022-03-09 09:53:24', NULL);
INSERT INTO `sys_dept` VALUES ('219', '204', '孔：渠道-上海麾众', 14, '', '', '', b'0', b'0', '00762', '2021-12-01 10:46:11', '00006', '2022-03-09 09:53:34', NULL);
INSERT INTO `sys_dept` VALUES ('220', '204', '孔：渠道-车车大师兄2', 15, '', '', '', b'0', b'0', '00762', '2021-12-01 15:44:14', '00006', '2022-03-09 09:53:43', NULL);
INSERT INTO `sys_dept` VALUES ('221', '204', '孔：渠道-张向峰', 16, '', '', '', b'0', b'0', '00762', '2021-12-03 13:25:38', '00239', '2022-04-26 17:38:43', NULL);
INSERT INTO `sys_dept` VALUES ('222', '204', '孔：渠道-中银金投', 17, '李梦顺', '13602159966', '', b'0', b'0', '00762', '2021-12-06 15:29:49', '00006', '2022-03-09 09:54:09', NULL);
INSERT INTO `sys_dept` VALUES ('223', '204', '孔：渠道-上海威林', 18, '', '', '', b'0', b'0', '00762', '2021-12-08 21:20:44', '00006', '2022-03-09 09:54:28', NULL);
INSERT INTO `sys_dept` VALUES ('224', '204', '孔：渠道-贵州车险贷', 19, '', '', '', b'0', b'0', '00762', '2021-12-16 14:21:36', '00006', '2022-03-09 09:54:42', NULL);
INSERT INTO `sys_dept` VALUES ('225', '204', '孔：渠道-天津张博', 20, '', '', '', b'0', b'0', '00762', '2021-12-20 10:06:04', '00006', '2022-03-09 09:56:55', NULL);
INSERT INTO `sys_dept` VALUES ('226', '204', '孔：渠道-昭泰信息科技', 21, '', '', '', b'0', b'0', '00762', '2021-12-23 16:26:09', '00006', '2022-03-09 09:57:08', NULL);
INSERT INTO `sys_dept` VALUES ('227', '100', '渠道-聊城秦坤', 12, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-06 16:17:01', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('228', '204', '孔：渠道-聊城秦坤', 22, '', '', '', b'0', b'0', '00762', '2022-01-07 11:09:12', '00006', '2022-03-09 09:56:43', NULL);
INSERT INTO `sys_dept` VALUES ('229', '204', '孔：渠道-平山平远汽贸', 23, '', '', '', b'0', b'0', '00762', '2022-01-12 15:20:24', '00006', '2022-03-09 09:56:33', NULL);
INSERT INTO `sys_dept` VALUES ('230', '101', '产品中心', 2, '', '', '', b'0', b'0', '00762', '2022-01-12 17:28:36', '00239', '2022-07-19 13:32:31', NULL);
INSERT INTO `sys_dept` VALUES ('231', '204', '孔：渠道-鹏祥物流', 26, '', '', '', b'0', b'0', '00762', '2022-01-17 13:50:47', '00006', '2022-03-09 09:56:22', NULL);
INSERT INTO `sys_dept` VALUES ('232', '204', '孔：渠道-山东张笛', 26, '', '', '', b'0', b'0', '00762', '2022-01-18 08:52:11', '00239', '2022-06-09 14:30:11', NULL);
INSERT INTO `sys_dept` VALUES ('233', '100', '吉辽大区', 19, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 11:00:39', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('234', '100', '苏北大区', 18, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 11:01:40', '00239', '2022-08-24 08:48:13', NULL);
INSERT INTO `sys_dept` VALUES ('235', '100', '湖北大区', 17, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 11:05:01', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('236', '100', '宁夏大区', 16, '', '', '', b'0', b'0', 'admin', '2022-01-20 11:09:24', '00239', '2022-07-05 13:27:08', NULL);
INSERT INTO `sys_dept` VALUES ('237', '204', '孔：渠道-保险分期', 28, '', '', '', b'0', b'0', '00762', '2022-01-20 11:15:57', '00006', '2022-03-09 09:55:57', NULL);
INSERT INTO `sys_dept` VALUES ('238', '234', '临时办事处', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 11:18:28', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('239', '198', '蚌埠办事处', 5, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 11:21:16', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('240', '236', '临时', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 11:28:01', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('241', '233', '吉林办事处', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 14:10:14', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('242', '233', '辽宁办事处', 2, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 14:10:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('243', '235', '武汉办事处', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 14:12:16', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('244', '235', '随州办事处', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 14:12:57', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('245', '235', '鄂东办事处', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 14:13:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('246', '235', '鄂西北办事处', 4, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-20 14:13:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('247', '141', '贵阳办事处', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-21 16:17:09', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('248', '100', '广东大区', 15, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-25 08:12:25', '00611', '2022-02-10 14:36:15', NULL);
INSERT INTO `sys_dept` VALUES ('249', '248', '广州办事处', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-25 08:12:45', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('251', '133', '库尔勒办事处', 5, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-25 08:13:29', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('252', '133', '昌吉办事处', 6, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-01-25 08:13:47', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('253', '128', '保定办事处', 36, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-02-14 11:02:27', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('254', '141', '南充办事处', 9, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-02-18 13:54:22', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('255', '141', '泸州办事处', 10, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-02-18 13:58:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('256', '141', '遵义办事处', 12, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-02-18 13:59:24', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('257', '141', '万州办事处', 13, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-02-18 13:59:43', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('258', '187', '绍兴办事处', 15, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-02-18 14:03:36', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('259', '187', '宁波办事处', 16, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-02-18 14:04:00', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('260', '187', '金华办事处', 17, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-02-18 14:04:29', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('261', '187', '宝山办事处', 18, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-02-18 14:04:57', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('262', '204', '孔：渠道-郑州杨志伟', 29, '孔江璞', '', '', b'0', b'0', '00762', '2022-02-22 15:33:43', '00006', '2022-03-09 09:55:44', NULL);
INSERT INTO `sys_dept` VALUES ('263', '204', '孔：渠道-福鑫何会刚', 30, '', '', '', b'0', b'0', 'admin', '2022-02-25 14:02:26', '00239', '2022-04-14 15:20:40', NULL);
INSERT INTO `sys_dept` VALUES ('264', '204', '孔：渠道-唐山王建海', 31, '', '', '', b'0', b'0', 'admin', '2022-02-25 14:02:46', '00006', '2022-03-09 09:55:13', NULL);
INSERT INTO `sys_dept` VALUES ('265', '204', '孔：渠道-哈尔滨关海洋', 32, '', '', '', b'0', b'0', 'admin', '2022-02-25 14:03:11', '00006', '2022-03-09 09:55:03', NULL);
INSERT INTO `sys_dept` VALUES ('266', '204', '孔：渠道-金乡县天顺祥', 33, '', '', '', b'0', b'0', 'admin', '2022-02-25 14:03:25', '00006', '2022-03-09 09:54:52', NULL);
INSERT INTO `sys_dept` VALUES ('267', '195', '外部合作渠道-余', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-01 09:56:04', '00762', '2022-08-26 13:54:47', NULL);
INSERT INTO `sys_dept` VALUES ('268', '267', '余：卡挂一稼（山东）', 1, '', '', '', b'0', b'0', 'admin', '2022-03-01 09:58:07', 'admin', '2022-03-09 09:43:51', NULL);
INSERT INTO `sys_dept` VALUES ('269', '267', '余：渠道-何晓莉', 2, '', '', '', b'0', b'0', 'admin', '2022-03-01 09:58:37', 'admin', '2022-03-09 09:43:43', NULL);
INSERT INTO `sys_dept` VALUES ('270', '267', '余：大连金埔', 3, '', '', '', b'0', b'0', 'admin', '2022-03-01 09:59:04', 'admin', '2022-03-09 09:44:31', NULL);
INSERT INTO `sys_dept` VALUES ('271', '267', '余：渠道-凌卫星', 4, '', '', '', b'0', b'0', 'admin', '2022-03-01 09:59:24', 'admin', '2022-03-09 09:44:44', NULL);
INSERT INTO `sys_dept` VALUES ('272', '230', '阜阳大成', 1, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-02 09:02:56', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('273', '101', '新车大客户中心', 1, '', '', '', b'0', b'0', 'admin', '2022-03-02 09:03:43', '00762', '2022-07-27 16:16:27', NULL);
INSERT INTO `sys_dept` VALUES ('274', '267', '余：渠道-王建平', 5, '', '', '', b'0', b'0', 'admin', '2022-03-02 10:58:16', 'admin', '2022-03-09 09:44:51', NULL);
INSERT INTO `sys_dept` VALUES ('275', '266', '渠道-丁玉峰', 34, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-02 13:20:25', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('276', '267', '余：河北唐山大度', 6, '', '', '', b'0', b'0', 'admin', '2022-03-02 13:28:12', 'admin', '2022-03-09 09:44:58', NULL);
INSERT INTO `sys_dept` VALUES ('277', '267', '余：渠道-李辉', 7, '', '', '', b'0', b'0', 'admin', '2022-03-02 20:49:11', 'admin', '2022-03-09 09:45:06', NULL);
INSERT INTO `sys_dept` VALUES ('278', '267', '余：新疆九源', 8, '', '', '', b'0', b'0', 'admin', '2022-03-03 08:25:23', 'admin', '2022-03-09 09:45:14', NULL);
INSERT INTO `sys_dept` VALUES ('279', '267', '余：吕梁鑫宝源', 9, '', '', '', b'0', b'0', 'admin', '2022-03-04 15:14:58', 'admin', '2022-03-09 09:45:24', NULL);
INSERT INTO `sys_dept` VALUES ('280', '267', '余：吕梁景盛远', 10, '', '', '', b'0', b'0', 'admin', '2022-03-04 15:15:32', 'admin', '2022-03-09 09:45:33', NULL);
INSERT INTO `sys_dept` VALUES ('281', '128', '元氏办事处', 37, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-04 15:36:48', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('282', '198', '淮北办事处', 6, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-05 10:30:10', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('283', '267', '余：陕西精英团队', 11, '', '', '', b'0', b'0', 'admin', '2022-03-08 13:23:42', 'admin', '2022-03-09 09:45:42', NULL);
INSERT INTO `sys_dept` VALUES ('284', '184', '临汾办事处', 4, NULL, NULL, NULL, b'0', b'0', '00762', '2022-03-09 17:03:16', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('285', '184', '大同办事处', 5, NULL, NULL, NULL, b'0', b'0', '00762', '2022-03-09 17:03:44', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('286', '267', '余：渠道-高东兴', 12, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-10 08:49:23', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('287', '189', '榆林办事处', 35, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-10 13:47:27', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('288', '189', '渭南办事处', 36, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-10 13:47:57', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('289', '267', '余：渠道-杨鹏', 13, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-11 10:39:15', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('290', '204', '孔：捷百通', 34, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-16 08:49:55', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('291', '184', '长治办事处', 8, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-16 14:41:06', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('292', '184', '运城办事处', 9, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-16 14:41:25', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('293', '248', '佛山办事处', 3, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-16 16:41:14', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('294', '100', '江苏大区（二手车）', 28, '', '', '', b'0', b'0', 'admin', '2022-03-21 09:50:58', 'admin', '2022-03-23 09:19:55', NULL);
INSERT INTO `sys_dept` VALUES ('295', '100', '南宁办事处（大区）', 29, '', '', '', b'0', b'0', 'admin', '2022-03-21 09:54:54', '00239', '2022-05-30 15:27:09', NULL);
INSERT INTO `sys_dept` VALUES ('296', '204', '元氏小毅公司', 35, '孔江璞', '', '', b'0', b'0', '00762', '2022-03-21 13:46:51', '00762', '2022-07-29 10:19:35', NULL);
INSERT INTO `sys_dept` VALUES ('297', '303', '乌兰察布办事处', 3, '', '', '', b'0', b'0', 'admin', '2022-03-21 14:44:08', '00239', '2022-07-11 16:58:00', NULL);
INSERT INTO `sys_dept` VALUES ('298', '236', '巴彦淖尔办事处', 4, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-21 14:44:28', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('299', '204', '京津冀元氏办事处-河北北鑫', 36, '', '', '', b'0', b'0', '00762', '2022-03-22 10:59:59', '00762', '2022-04-13 18:15:40', NULL);
INSERT INTO `sys_dept` VALUES ('300', '189', '西宁办事处', 37, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-22 18:39:45', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('301', '189', '格尔木办事处', 38, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-22 18:40:18', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('302', '189', '咸阳办事处', 39, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-22 18:40:50', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('303', '100', '内蒙大区', 31, '', '', '', b'0', b'0', 'admin', '2022-03-23 13:40:03', '00239', '2022-07-11 16:58:00', NULL);
INSERT INTO `sys_dept` VALUES ('304', '234', '徐州办事处（二手车）', 1, '', '', '', b'0', b'0', 'admin', '2022-03-23 16:15:35', '00239', '2022-08-24 08:47:51', NULL);
INSERT INTO `sys_dept` VALUES ('305', '204', '孔：河南物友会', 37, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-24 13:24:19', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('306', '204', '京津冀元氏办事处-今生有约', 38, '', '', '', b'0', b'0', '00762', '2022-03-24 16:08:45', '00762', '2022-04-13 18:15:55', NULL);
INSERT INTO `sys_dept` VALUES ('307', '267', '余：渠道-邓见任', 14, '', '', '', b'0', b'0', 'admin', '2022-03-25 15:02:37', 'admin', '2022-03-25 15:04:13', NULL);
INSERT INTO `sys_dept` VALUES ('308', '204', '孔：渠道-宁夏戴海娟', 39, '孔江璞', '', '', b'0', b'0', '00762', '2022-03-29 16:41:45', '00006', '2022-03-30 16:29:38', NULL);
INSERT INTO `sys_dept` VALUES ('309', '267', '余：渠道-张欢', 15, NULL, NULL, NULL, b'0', b'0', 'admin', '2022-03-29 17:10:28', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('310', '267', '余：渠道-甘肃金晟禾', 16, '', '', '', b'0', b'0', 'admin', '2022-03-29 18:45:35', 'admin', '2022-03-29 18:46:31', NULL);
INSERT INTO `sys_dept` VALUES ('311', '267', '余：渠道-吕岩', 17, NULL, NULL, NULL, b'0', b'0', '00640', '2022-04-02 13:32:35', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('312', '267', '余：渠道-任晓娟', 18, NULL, '18734926551', NULL, b'0', b'0', '00239', '2022-04-07 16:48:15', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('313', '204', '孔：渠道-广东伍绍滔', 40, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-12 15:15:48', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('314', '204', '孔：渠道-通辽朱海葵', 19, NULL, '15148793555', NULL, b'0', b'0', '00239', '2022-04-13 14:51:45', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('315', '267', '余：渠道-刘小莉', 19, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-13 15:16:35', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('316', '204', '孔：渠道-日照福鑫（何）', 41, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-14 09:55:12', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('317', '204', '孔：渠道-张晓敏', 41, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-14 14:14:30', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('318', '204', '孔：渠道-曾贤刚', 42, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-14 17:02:59', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('319', '114', '淄博办事处', 20, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-15 17:38:20', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('320', '184', '太原办事处', 10, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-15 17:38:53', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('321', '248', '韶关办事处', 4, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-19 13:58:47', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('322', '267', '余：渠道-陕西精英团队', 20, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-20 18:04:47', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('323', '187', '厦门办事处', 19, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-21 14:35:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('324', '267', '余：渠道-周密', 21, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-22 15:55:14', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('325', '204', '孔：渠道-北京靠谱科技', 43, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-27 15:09:47', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('326', '234', '常州办事处', 10, NULL, NULL, NULL, b'0', b'0', '00239', '2022-04-27 15:20:06', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('327', '267', '余：渠道-冯涛', 22, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-08 14:16:27', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('328', '234', '宿迁办事处', 11, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-09 11:20:30', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('329', '204', '孔：渠道-广西谢培海', 44, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-09 11:38:02', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('330', '141', '川北办事处', 34, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-09 16:52:01', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('331', '204', '孔：渠道-人寿周凯', 45, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-10 11:13:00', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('332', '204', '杭州直辖办事处-赵晶晶', 46, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-12 08:28:50', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('333', '198', '淮南办事处', 7, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-13 18:09:04', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('334', '267', '余：渠道-姚卫国', 23, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-16 13:23:30', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('335', '204', '孔：渠道-许芷中', 47, '孔江璞', '', '', b'0', b'0', '00762', '2022-05-19 11:35:37', '00762', '2022-05-19 11:35:54', NULL);
INSERT INTO `sys_dept` VALUES ('336', '204', '孔：渠道-杜智（司机之家）', 48, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-20 11:31:23', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('337', '204', '孔：渠道-张楠', 49, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-24 17:14:14', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('338', '267', '余：渠道-赵亚杰', 24, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-25 13:24:38', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('339', '204', '孔：渠道-杨冬鹤', 50, NULL, NULL, NULL, b'0', b'0', '00239', '2022-05-26 13:24:53', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('340', '198', '马鞍山办事处', 8, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-01 13:31:52', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('341', '234', '南京办事处（二手车）', 2, '', '', '', b'0', b'0', '00239', '2022-06-02 15:10:04', '00239', '2022-08-24 08:48:13', NULL);
INSERT INTO `sys_dept` VALUES ('342', '114', '梁山办事处（二手车）', 21, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-09 08:41:15', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('343', '128', '邯郸办事处（二手车）', 38, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-09 10:58:26', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('344', '156', '资金组', 2, '康晨霞', NULL, NULL, b'0', b'0', '00762', '2022-06-09 17:00:33', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('345', '156', '会计组', 1, NULL, NULL, NULL, b'0', b'0', '00762', '2022-06-09 17:01:15', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('346', '100', '法务部', 11, NULL, NULL, NULL, b'0', b'0', '00762', '2022-06-09 17:39:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('347', '114', '临沂办事处', 22, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-17 09:03:22', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('348', '303', '鄂尔多斯办事处', 13, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-17 10:20:13', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('349', '100', '湖南大区', 34, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-22 10:30:33', '00239', '2022-06-22 10:33:01', NULL);
INSERT INTO `sys_dept` VALUES ('350', '349', '株洲办事处', 2, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-22 10:32:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('351', '100', '苏南大区', 35, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-22 13:32:24', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('352', '351', '苏州办事处', 1, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-22 13:32:50', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('353', '351', '无锡办事处', 2, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-22 13:33:06', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('354', '351', '南通办事处', 3, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-22 13:33:18', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('355', '349', '益阳办事处', 3, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-23 09:24:11', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('356', '236', '固原办事处', 5, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-27 10:59:33', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('357', '236', '中卫办事处', 6, NULL, NULL, NULL, b'0', b'0', '00239', '2022-06-27 11:00:01', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('358', '349', '衡阳办事处', 5, NULL, NULL, NULL, b'0', b'0', '00239', '2022-07-13 16:40:59', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('359', '349', '娄底办事处', 6, NULL, NULL, NULL, b'0', b'0', '00239', '2022-07-13 16:41:18', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('360', '351', '扬州办事处', 4, NULL, NULL, NULL, b'0', b'0', '00239', '2022-07-13 16:53:50', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('361', '351', '南京办事处', 5, NULL, NULL, NULL, b'0', b'0', '00239', '2022-07-13 16:54:11', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('362', '267', '余：渠道-曹鹏', 25, NULL, NULL, NULL, b'0', b'0', '00239', '2022-07-20 13:45:56', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('363', '128', '小毅公司', 39, '', '', '', b'1', b'0', '00239', '2022-07-22 16:58:47', '00239', '2022-07-22 17:29:09', NULL);
INSERT INTO `sys_dept` VALUES ('364', '114', '烟台办事处', 23, NULL, NULL, NULL, b'0', b'0', '00239', '2022-07-25 17:10:07', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('365', '303', '锡林浩特办事处', 4, NULL, NULL, NULL, b'0', b'0', '00239', '2022-08-02 11:20:45', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('366', '303', '赤峰办事处', 5, NULL, NULL, NULL, b'0', b'0', '00239', '2022-08-02 11:21:02', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('367', '187', '嘉湖办事处', 20, NULL, NULL, NULL, b'0', b'0', '00239', '2022-08-09 09:42:17', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('368', '187', '温台办事处', 21, NULL, NULL, NULL, b'0', b'0', '00239', '2022-08-09 09:42:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('369', '114', '梁山办事处', 24, NULL, NULL, NULL, b'0', b'0', '00239', '2022-08-11 17:46:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('370', '267', '余：渠道-陈玲玲', 99, '', '', '', b'0', b'0', '00762', '2022-08-26 13:54:26', '00762', '2022-08-26 13:54:47', NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` bit(1) NULL DEFAULT b'1' COMMENT '菜单状态（1显示 0隐藏）',
  `is_refresh` bit(1) NULL DEFAULT b'0' COMMENT '是否刷新（1刷新 0不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `keep_alive` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由缓冲（是否开启）',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1000', '权限管理', '-1', 1, '/admin', '', '0', b'1', b'1', NULL, 'fa fa-user-o', '用户管理菜单', '0', b'0', 'admin', '2021-04-29 13:41:30', '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('1001', '用户管理', '1000', 1, '/admin/user/index', '', '0', b'1', b'0', NULL, 'icon-yonghuguanli', '', '0', b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('1002', '菜单管理', '1000', 2, '/admin/menu/index', '', '0', b'1', b'0', NULL, 'icon-caidanguanli', '', '0', b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('1003', '角色管理', '1000', 3, '/admin/role/index', '', '0', b'1', b'0', NULL, 'icon-jiaoseguanli', '', '0', b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('1004', '部门管理', '1000', 4, '/admin/dept/index', '', '0', b'1', b'0', NULL, 'icon-web-icon-', '', '0', b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('10041', '部门新增', '1004', 1, '#', '', '1', b'1', b'0', 'sys_dept_add', '#', '', NULL, b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('10042', '部门修改', '1004', 2, '#', '', '1', b'1', b'0', 'sys_dept_edit', '#', '', NULL, b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('10043', '部门删除', '1004', 3, '#', '', '1', b'1', b'0', 'sys_dept_del', '#', '', NULL, b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('1005', '岗位管理', '1000', 5, '/admin/post/index', '', '0', b'1', b'0', NULL, 'icon-gangweiguanli', '', '0', b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('10051', '岗位新增', '1005', 1, '#', '', '1', b'1', b'0', 'sys_post_add', '#', '', NULL, b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('10052', '岗位修改', '1005', 2, '#', '', '1', b'1', b'0', 'sys_post_edit', '#', '', NULL, b'0', '', NULL, '', NULL, 0);
INSERT INTO `sys_menu` VALUES ('10053', '岗位删除', '1005', 3, '#', '', '1', b'1', b'0', 'sys_post_del', '#', '', NULL, b'0', '', NULL, '', NULL, 0);

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details`  (
  `client_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端ID',
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源列表',
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端密钥',
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域',
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证类型',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向地址',
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色列表',
  `access_token_validity` int(11) NULL DEFAULT NULL COMMENT 'token 有效期',
  `refresh_token_validity` int(11) NULL DEFAULT NULL COMMENT '刷新令牌有效期',
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '令牌扩展字段JSON',
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自动放行',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('app', NULL, 'app', 'server', 'app,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('client', NULL, 'client', 'server', 'client_credentials', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('pig', NULL, 'pig', 'server', 'password,app,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('web', NULL, 'web', 'server', 'password,app,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态（1正常 0停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'user', '员工', 2, b'1', '打工人', b'0', 'admin', '2022-03-19 10:05:15', 'admin', '2022-03-19 10:42:28', 0);
INSERT INTO `sys_post` VALUES ('2', 'cto', 'cto', 0, b'1', 'cto666', b'0', 'admin', '2022-03-19 10:06:20', 'admin', '2022-03-19 10:06:20', 0);
INSERT INTO `sys_post` VALUES ('3', 'boss', '董事长', -1, b'1', '大boss', b'0', 'admin', '2022-03-19 10:06:35', 'admin', '2022-03-19 10:42:44', 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '角色状态（1正常 0停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', 1, '1', b'1', '超级管理员', b'0', 'admin', '2021-04-29 13:41:30', '', NULL, NULL);
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', 2, '5', b'1', '普通角色', b'0', 'admin', '2021-04-29 13:41:30', 'admin', '2021-11-15 16:40:10', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `dept_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '10041');
INSERT INTO `sys_role_menu` VALUES ('1', '10042');
INSERT INTO `sys_role_menu` VALUES ('1', '10043');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '10051');
INSERT INTO `sys_role_menu` VALUES ('1', '10052');
INSERT INTO `sys_role_menu` VALUES ('1', '10053');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `dept_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` bit(1) NULL DEFAULT b'1' COMMENT '帐号状态（1正常 0停用）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '100', 'admin', '超级码农', 'hanshijie@qijin.net', '15888888888', '0', '/profile/avatar/2022/02/10/46bd3de2-81b7-4a72-bf4a-e3761b0f3384.png', '$2a$10$kjAtkA7Z6/MhK/ePMEALsOdJHRxzlA99BOw0X57ibeS1j2PyPYZxu', b'1', '124.239.218.142', '2022-12-16 14:04:55', '2022-04-02 10:40:20', '管理员', b'0', 'admin', '2021-04-29 13:41:30', '', '2022-12-16 14:04:54', 0);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `post_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for t_test
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `dept_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` bit(1) NULL DEFAULT b'1' COMMENT '帐号状态（1正常 0停用）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_test
-- ----------------------------
INSERT INTO `t_test` VALUES ('1', '100', 'admin', '超级码农', 'hanshijie@qijin.net', '15888888888', '0', '/profile/avatar/2022/02/10/46bd3de2-81b7-4a72-bf4a-e3761b0f3384.png', '$2a$10$kjAtkA7Z6/MhK/ePMEALsOdJHRxzlA99BOw0X57ibeS1j2PyPYZxu', b'1', '124.239.218.142', '2022-12-16 14:04:55', '2022-04-02 10:40:20', '管理员', b'0', 'admin', '2021-04-29 13:41:30', '', '2022-12-16 14:04:54', 0);

SET FOREIGN_KEY_CHECKS = 1;
