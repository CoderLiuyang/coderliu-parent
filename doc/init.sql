DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`              varchar(32) NOT NULL COMMENT '用户ID',
    `dept_id`         varchar(32) NULL DEFAULT NULL COMMENT '部门ID',
    `login_name`      varchar(30) NOT NULL COMMENT '登录账号',
    `user_name`       varchar(30) NULL DEFAULT '' COMMENT '用户昵称',
    `email`           varchar(50) NULL DEFAULT '' COMMENT '用户邮箱',
    `phone`     varchar(11) NULL DEFAULT '' COMMENT '手机号码',
    `sex`             char(1) NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`          varchar(100) NULL DEFAULT '' COMMENT '头像路径',
    `password`        varchar(50) NULL DEFAULT '' COMMENT '密码',
    `salt`            varchar(20) NULL DEFAULT '' COMMENT '盐加密',
    `status`          bit(1) NULL DEFAULT b'1' COMMENT '帐号状态（1正常 0停用）',

    `login_ip`        varchar(128) NULL DEFAULT '' COMMENT '最后登录IP',
    `login_date`      datetime NULL DEFAULT NULL COMMENT '最后登录时间',
    `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
    `remark`          varchar(500) NULL DEFAULT NULL COMMENT '备注',

    `del_flag`        bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
    `create_by`       varchar(64) NULL DEFAULT '' COMMENT '创建者',
    `create_time`     datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64) NULL DEFAULT '' COMMENT '更新者',
    `update_time`     datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '用户信息表';



DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`          varchar(32)  NOT NULL COMMENT '角色ID',
    `role_name`   varchar(30)  NOT NULL COMMENT '角色名称',
    `role_key`    varchar(100) NOT NULL COMMENT '角色权限字符串',
    `role_sort`   int(4) NOT NULL COMMENT '显示顺序',
    `data_scope`  char(1) NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `status`      bit(1)       NOT NULL DEFAULT b'1' COMMENT '角色状态（1正常 0停用）',
    `remark`      varchar(500) NULL DEFAULT NULL COMMENT '备注',

    `del_flag`    bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
    `create_by`   varchar(64) NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',

    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '角色信息表';


DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `id`          varchar(32) NOT NULL COMMENT '菜单ID',
    `menu_name`   varchar(50) NOT NULL COMMENT '菜单名称',
    `parent_id`   varchar(32) NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int(4) NULL DEFAULT 0 COMMENT '显示顺序',
    `url`         varchar(200) NULL DEFAULT '#' COMMENT '请求地址',
    `target`      varchar(20) NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
    `menu_type`   char(1) NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     bit(1) NULL DEFAULT b'1' COMMENT '菜单状态（1显示 0隐藏）',
    `is_refresh`  bit(1) NULL DEFAULT b'0' COMMENT '是否刷新（1刷新 0不刷新）',
    `perms`       varchar(100) NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) NULL DEFAULT '#' COMMENT '菜单图标',
    `remark`      varchar(500) NULL DEFAULT '' COMMENT '备注',

    `del_flag`    bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
    `create_by`   varchar(64) NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',

    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '菜单权限表';

DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`
(
    `id`          varchar(32) NOT NULL COMMENT '岗位ID',
    `post_code`   varchar(64) NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(50) NOT NULL COMMENT '岗位名称',
    `post_sort`   int(4) NOT NULL COMMENT '显示顺序',
    `status`      bit(1)      NOT NULL DEFAULT b'1' COMMENT '状态（1正常 0停用）',
    `remark`      varchar(500) NULL DEFAULT NULL COMMENT '备注',

    `del_flag`    bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
    `create_by`   varchar(64) NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',

    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '岗位信息表';


DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`
(
    `role_id` varchar(32) NOT NULL COMMENT '角色ID',
    `dept_id` varchar(32) NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '角色和部门关联表';

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `role_id` varchar(32) NOT NULL COMMENT '角色ID',
    `menu_id` varchar(32) NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '角色和菜单关联表';


DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`
(
    `user_id` varchar(32) NOT NULL COMMENT '用户ID',
    `post_id` varchar(32) NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '用户与岗位关联表';


DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` varchar(32) NOT NULL COMMENT '用户ID',
    `role_id` varchar(32) NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '用户和角色关联表';
