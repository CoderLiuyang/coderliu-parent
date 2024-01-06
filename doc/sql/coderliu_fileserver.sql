/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : coderliu_fileserver

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 06/01/2024 22:37:45
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file_business_param
-- ----------------------------
DROP TABLE IF EXISTS `file_business_param`;
CREATE TABLE `file_business_param`
(
    `id`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT 'id',
    `bus_name`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '场景名字',
    `del_flag`    smallint NULL DEFAULT NULL,
    `create_time` datetime NULL DEFAULT NULL,
    `create_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL,
    `update_time` datetime NULL DEFAULT NULL,
    `update_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_german2_ci COMMENT = '文件业务配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_business_param
-- ----------------------------

-- ----------------------------
-- Table structure for file_data
-- ----------------------------
DROP TABLE IF EXISTS `file_data`;
CREATE TABLE `file_data`
(
    `id`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT 'id',
    `bus_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '业务id',
    `sce_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '场景id',
    `file_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '连接业务id',
    `real_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '文件原名',
    `extend_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '扩展名',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '存储的名',
    `del_flag`    smallint NULL DEFAULT NULL,
    `create_time` datetime NULL DEFAULT NULL,
    `create_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL,
    `update_time` datetime NULL DEFAULT NULL,
    `update_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_german2_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_data
-- ----------------------------

-- ----------------------------
-- Table structure for file_scene_param
-- ----------------------------
DROP TABLE IF EXISTS `file_scene_param`;
CREATE TABLE `file_scene_param`
(
    `id`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT 'id',
    `bus_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '业务ID',
    `scene_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '场景名字',
    `scene_ops`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '场景配置',
    `del_flag`    smallint NULL DEFAULT NULL,
    `create_time` datetime NULL DEFAULT NULL,
    `create_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL,
    `update_time` datetime NULL DEFAULT NULL,
    `update_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_german2_ci COMMENT = '文件场景配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_scene_param
-- ----------------------------

SET
FOREIGN_KEY_CHECKS = 1;
