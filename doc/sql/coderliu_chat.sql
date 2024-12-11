/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:3306
 Source Schema         : coderliu_chat

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 11/12/2024 15:25:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for artist
-- ----------------------------
DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist`  (
  `artist_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `citizenship` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artist
-- ----------------------------
INSERT INTO `artist` VALUES ('Shrikanta', '印度', '男性', 'tagore');
INSERT INTO `artist` VALUES ('Prity', '孟加拉国', '女性', 'nazrul');
INSERT INTO `artist` VALUES ('Farida', '孟加拉国', '女性', '民间');
INSERT INTO `artist` VALUES ('Topu', '印度', '女性', '现代');
INSERT INTO `artist` VALUES ('Enrique', '美国', '男性', '蓝调');
INSERT INTO `artist` VALUES ('Michel', '英国', '男性', '流行');

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `f_id` bigint NOT NULL,
  `artist_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_size` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `duration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `formats` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES (1, 'Shrikanta', '3.78 MB', '3:45', 'mp4');
INSERT INTO `files` VALUES (2, 'Prity', '4.12 MB', '2:56', 'mp3');
INSERT INTO `files` VALUES (3, 'Farida', '3.69 MB', '4:12', 'mp4');
INSERT INTO `files` VALUES (4, 'Enrique', '4.58 MB', '5:23', 'mp4');
INSERT INTO `files` VALUES (5, 'Michel', '5.10 MB', '4:34', 'mp3');
INSERT INTO `files` VALUES (6, 'Topu', '4.10 MB', '4:30', 'mp4');

-- ----------------------------
-- Table structure for genre
-- ----------------------------
DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre`  (
  `g_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NULL DEFAULT NULL,
  `most_popular_in` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`g_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of genre
-- ----------------------------
INSERT INTO `genre` VALUES ('nazrul', 7, '孟加拉国');
INSERT INTO `genre` VALUES ('tagore', 8, '孟加拉国');
INSERT INTO `genre` VALUES ('民间', 9, '锡尔赫特、吉大港、库斯蒂亚');
INSERT INTO `genre` VALUES ('流行', 9, '美国');
INSERT INTO `genre` VALUES ('现代', 8, '孟加拉国');
INSERT INTO `genre` VALUES ('蓝调', 7, '加拿大');

-- ----------------------------
-- Table structure for s2_agent
-- ----------------------------
DROP TABLE IF EXISTS `s2_agent`;
CREATE TABLE `s2_agent`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `examples` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `status` tinyint NULL DEFAULT NULL,
  `model` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `tool_config` varchar(6000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `llm_config` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `chat_model_config` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `visual_config` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `enable_search` tinyint NULL DEFAULT 1,
  `enable_feedback` tinyint NULL DEFAULT 1,
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_agent
-- ----------------------------
INSERT INTO `s2_agent` VALUES (1, '算指标', '帮助您用自然语言查询指标，支持时间限定、条件筛选、下钻维度以及聚合统计', '[\"近15天超音数访问次数汇总\",\"按部门统计超音数的访问人数\",\"对比alice和lucy的停留时长\",\"过去30天访问次数最高的部门top3\",\"近1个月总访问次数超过100次的部门有几个\",\"过去半个月每个核心用户的总停留时长\"]', 1, NULL, '{\"tools\":[{\"dataSetIds\":[1],\"id\":\"1\",\"type\":\"DATASET\"}]}', NULL, '{\"MEMORY_REVIEW\":{\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),comment=(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"REWRITE_MULTI_TURN\":{\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \",\"enable\":false,\"chatModelId\":1},\"S2SQL_CORRECTOR\":{\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),sql=(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\",\"enable\":false,\"chatModelId\":1},\"SMALL_TALK\":{\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"DATA_INTERPRETER\":{\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\",\"enable\":false,\"chatModelId\":1},\"S2SQL_PARSER\":{\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `>`,`<`,`>=`,`<=` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\",\"enable\":true,\"chatModelId\":1},\"REWRITE_ERROR_MESSAGE\":{\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \",\"enable\":false,\"chatModelId\":1}}', '', 1, 0, 'admin', '2024-12-10 09:46:53', 'admin', '2024-12-10 09:46:53');
INSERT INTO `s2_agent` VALUES (2, '做圈选', '帮助您用自然语言进行圈选，支持多条件组合筛选', '[\"国风流派歌手\",\"港台歌手\",\"周杰伦流派\"]', 1, NULL, '{\"tools\":[{\"dataSetIds\":[2],\"id\":\"1\",\"type\":\"DATASET\"}]}', NULL, '{\"MEMORY_REVIEW\":{\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),comment=(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"REWRITE_MULTI_TURN\":{\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \",\"enable\":false,\"chatModelId\":1},\"S2SQL_CORRECTOR\":{\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),sql=(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\",\"enable\":false,\"chatModelId\":1},\"SMALL_TALK\":{\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"DATA_INTERPRETER\":{\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\",\"enable\":false,\"chatModelId\":1},\"S2SQL_PARSER\":{\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `>`,`<`,`>=`,`<=` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\",\"enable\":true,\"chatModelId\":1},\"REWRITE_ERROR_MESSAGE\":{\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \",\"enable\":false,\"chatModelId\":1}}', '', 1, 0, 'admin', '2024-12-10 09:46:59', 'admin', '2024-12-10 09:46:59');
INSERT INTO `s2_agent` VALUES (3, '来闲聊', '直接与大模型对话，验证连通性', '[\"如何才能变帅\",\"如何才能赚更多钱\",\"如何才能世界和平\"]', 1, NULL, '{\"tools\":[]}', NULL, '{\"MEMORY_REVIEW\":{\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),comment=(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"REWRITE_MULTI_TURN\":{\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \",\"enable\":false,\"chatModelId\":1},\"S2SQL_CORRECTOR\":{\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),sql=(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\",\"enable\":false,\"chatModelId\":1},\"SMALL_TALK\":{\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \",\"enable\":true,\"chatModelId\":1},\"DATA_INTERPRETER\":{\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\",\"enable\":false,\"chatModelId\":1},\"S2SQL_PARSER\":{\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `>`,`<`,`>=`,`<=` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\",\"enable\":false,\"chatModelId\":1},\"REWRITE_ERROR_MESSAGE\":{\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \",\"enable\":false,\"chatModelId\":1}}', '', 0, 0, 'admin', '2024-12-10 09:46:59', 'admin', '2024-12-10 09:46:59');

-- ----------------------------
-- Table structure for s2_app
-- ----------------------------
DROP TABLE IF EXISTS `s2_app`;
CREATE TABLE `s2_app`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `qps` int NULL DEFAULT NULL,
  `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_app
-- ----------------------------

-- ----------------------------
-- Table structure for s2_auth_groups
-- ----------------------------
DROP TABLE IF EXISTS `s2_auth_groups`;
CREATE TABLE `s2_auth_groups`  (
  `group_id` int NOT NULL,
  `config` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_auth_groups
-- ----------------------------
INSERT INTO `s2_auth_groups` VALUES (1, '{\"modelId\":3,\"name\":\"jack_column_permission\",\"groupId\":1,\"authRules\":[{\"metrics\":[\"stay_hours\"],\"dimensions\":[\"page\"]}],\"authorizedUsers\":[\"jack\"],\"authorizedDepartmentIds\":[]}');
INSERT INTO `s2_auth_groups` VALUES (2, '{\"modelId\":2,\"name\":\"tom_row_permission\",\"groupId\":2,\"authRules\":[],\"dimensionFilters\":[\"user_name \\u003d \\u0027tom\\u0027\"],\"dimensionFilterDescription\":\"用户名\\u003d\\u0027tom\\u0027\",\"authorizedUsers\":[\"tom\"],\"authorizedDepartmentIds\":[]}');

-- ----------------------------
-- Table structure for s2_available_date_info
-- ----------------------------
DROP TABLE IF EXISTS `s2_available_date_info`;
CREATE TABLE `s2_available_date_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_period` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `end_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `unavailable_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_available_date_info
-- ----------------------------
INSERT INTO `s2_available_date_info` VALUES (1, 1, 'dimension', 'yyyy-MM-dd', NULL, '2024-11-12', '2024-12-09', '[]', '2023-06-01 00:00:00', 'admin', '2023-06-01 00:00:00', 'admin', 0);
INSERT INTO `s2_available_date_info` VALUES (2, 2, 'dimension', 'yyyy-MM-dd', NULL, '2024-11-12', '2024-12-09', '[]', '2023-06-01 00:00:00', 'admin', '2023-06-01 00:00:00', 'admin', 0);
INSERT INTO `s2_available_date_info` VALUES (3, 3, 'dimension', 'yyyy-MM-dd', NULL, '2024-11-12', '2024-12-09', '[]', '2023-06-01 00:00:00', 'admin', '2023-06-01 00:00:00', 'admin', 0);

-- ----------------------------
-- Table structure for s2_canvas
-- ----------------------------
DROP TABLE IF EXISTS `s2_canvas`;
CREATE TABLE `s2_canvas`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `domain_id` bigint NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'datasource、dimension、metric',
  `config` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'config detail',
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_canvas
-- ----------------------------
INSERT INTO `s2_canvas` VALUES (1, 1, 'modelEdgeRelation', '[{\"source\":\"datasource-1\",\"target\":\"datasource-3\",\"type\":\"polyline\",\"id\":\"edge-0.305251275235679741702883718912\",\"style\":{\"active\":{\"stroke\":\"rgb(95, 149, 255)\",\"lineWidth\":1},\"selected\":{\"stroke\":\"rgb(95, 149, 255)\",\"lineWidth\":2,\"shadowColor\":\"rgb(95, 149, 255)\",\"shadowBlur\":10,\"text-shape\":{\"fontWeight\":500}},\"highlight\":{\"stroke\":\"rgb(95, 149, 255)\",\"lineWidth\":2,\"text-shape\":{\"fontWeight\":500}},\"inactive\":{\"stroke\":\"rgb(234, 234, 234)\",\"lineWidth\":1},\"disable\":{\"stroke\":\"rgb(245, 245, 245)\",\"lineWidth\":1},\"stroke\":\"#296df3\",\"endArrow\":true},\"startPoint\":{\"x\":-94,\"y\":-137.5,\"anchorIndex\":0,\"id\":\"-94|||-137.5\"},\"endPoint\":{\"x\":-234,\"y\":-45,\"anchorIndex\":1,\"id\":\"-234|||-45\"},\"sourceAnchor\":2,\"targetAnchor\":1,\"label\":\"模型关系编辑\"},{\"source\":\"datasource-1\",\"target\":\"datasource-2\",\"type\":\"polyline\",\"id\":\"edge-0.466237264629309141702883756359\",\"style\":{\"active\":{\"stroke\":\"rgb(95, 149, 255)\",\"lineWidth\":1},\"selected\":{\"stroke\":\"rgb(95, 149, 255)\",\"lineWidth\":2,\"shadowColor\":\"rgb(95, 149, 255)\",\"shadowBlur\":10,\"text-shape\":{\"fontWeight\":500}},\"highlight\":{\"stroke\":\"rgb(95, 149, 255)\",\"lineWidth\":2,\"text-shape\":{\"fontWeight\":500}},\"inactive\":{\"stroke\":\"rgb(234, 234, 234)\",\"lineWidth\":1},\"disable\":{\"stroke\":\"rgb(245, 245, 245)\",\"lineWidth\":1},\"stroke\":\"#296df3\",\"endArrow\":true},\"startPoint\":{\"x\":-12,\"y\":-137.5,\"anchorIndex\":1,\"id\":\"-12|||-137.5\"},\"endPoint\":{\"x\":85,\"y\":31.5,\"anchorIndex\":0,\"id\":\"85|||31.5\"},\"sourceAnchor\":1,\"targetAnchor\":2,\"label\":\"模型关系编辑\"}]', '2023-06-01 00:00:00', 'admin', '2023-06-01 00:00:00', 'admin');

-- ----------------------------
-- Table structure for s2_chat
-- ----------------------------
DROP TABLE IF EXISTS `s2_chat`;
CREATE TABLE `s2_chat`  (
  `chat_id` bigint NOT NULL AUTO_INCREMENT,
  `agent_id` int NULL DEFAULT NULL,
  `chat_name` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_time` datetime NULL DEFAULT NULL,
  `creator` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `last_question` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_delete` tinyint NULL DEFAULT 0 COMMENT 'is deleted',
  `is_top` tinyint NULL DEFAULT 0 COMMENT 'is top',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_chat
-- ----------------------------
INSERT INTO `s2_chat` VALUES (1, 1, '样例对话1', '2024-12-10 09:46:53', '2024-12-10 10:03:35', 'admin', '访问次数最高的部门', 0, 0);
INSERT INTO `s2_chat` VALUES (2, 2, '新问答对话', '2024-12-10 10:49:09', '2024-12-10 10:51:18', 'admin', '国风流派歌手', 0, 0);
INSERT INTO `s2_chat` VALUES (3, 3, '新问答对话', '2024-12-10 10:49:10', '2024-12-10 10:52:42', 'admin', '嗯 你了解我嘛', 0, 0);

-- ----------------------------
-- Table structure for s2_chat_config
-- ----------------------------
DROP TABLE IF EXISTS `s2_chat_config`;
CREATE TABLE `s2_chat_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_id` bigint NULL DEFAULT NULL,
  `chat_detail_config` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '明细模式配置信息',
  `chat_agg_config` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '指标模式配置信息',
  `recommended_questions` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '推荐问题配置',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '更新人',
  `status` tinyint NOT NULL COMMENT '主题域扩展信息状态, 0-删除，1-生效',
  `llm_examples` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'llm examples',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '主题域扩展信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_chat_config
-- ----------------------------

-- ----------------------------
-- Table structure for s2_chat_context
-- ----------------------------
DROP TABLE IF EXISTS `s2_chat_context`;
CREATE TABLE `s2_chat_context`  (
  `chat_id` bigint NOT NULL COMMENT 'context chat id',
  `modified_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'row modify time',
  `user` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'row modify user',
  `query_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'query text',
  `semantic_parse` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'parse data',
  `ext_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'extend data',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_chat_context
-- ----------------------------
INSERT INTO `s2_chat_context` VALUES (1, '2024-12-10 10:03:35', NULL, NULL, '{\"id\":1,\"queryMode\":\"LLM_S2SQL\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{}},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"isNecessary\":false},{\"dimensionId\":2,\"isNecessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{}}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"}}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":1,\"period\":\"DAY\",\"isInherited\":false,\"groupByDate\":false},\"limit\":500,\"score\":18.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"}},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"部门\",\"word\":\"部门\",\"frequency\":100000,\"isInherited\":false},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"isNecessary\":false},{\"dimensionId\":2,\"isNecessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{}},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"isInherited\":false},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.011519511093787238,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"}},\"offset\":0.0,\"similarity\":0.9884804889062128,\"detectWord\":\"数最高的\",\"word\":\"数据日期\",\"frequency\":100000,\"isInherited\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\",\"correctedS2SQL\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 WHERE (数据日期 \\u003e\\u003d \\u00272024-12-03\\u0027 AND 数据日期 \\u003c\\u003d \\u00272024-12-10\\u0027) GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\",\"querySQL\":\"SELECT `department`, SUM(`pv`) AS `访问次数`\\r\\nFROM\\r\\n(SELECT `t7`.`sys_imp_date`, `t6`.`department`, `t7`.`s2_pv_uv_statis_pv` AS `pv`\\r\\nFROM\\r\\n(SELECT `user_name`, `department`\\r\\nFROM\\r\\ns2_user_department) AS `t6`\\r\\nLEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t7` ON `t6`.`user_name` \\u003d `t7`.`user_name`) AS `t8`\\r\\nWHERE `t8`.`sys_imp_date` \\u003e\\u003d \\u00272024-12-03\\u0027 AND `t8`.`sys_imp_date` \\u003c\\u003d \\u00272024-12-10\\u0027\\r\\nGROUP BY `department`\\r\\nORDER BY 2 DESC\\r\\nLIMIT 1\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数 **维度:** 部门 **数据时间:** 2024-12-03~2024-12-10 \",\"properties\":{\"sql_exemplar\":{\"dbSchema\":\"DatabaseType\\u003d[mysql], Table\\u003d[超音数数据集], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], PrimaryKeyField\\u003d[用户], Metrics\\u003d[\\u003c访问次数 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027\\u003e], Values\\u003d[]\",\"question\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate\\u003d[2024-12-10]\",\"sql\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\"},\"type\":\"internal\",\"CONTEXT\":{\"llmReq\":{\"schema\":{\"databaseType\":\"mysql\",\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"values\":[],\"metrics\":[{\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"一段时间内用户的访问次数\",\"type\":\"METRIC\",\"isTag\":0,\"extInfo\":{},\"defaultAgg\":\"SUM\",\"dataSetId\":1,\"partitionTimeFormat\":\"\",\"bizName\":\"pv\",\"name\":\"访问次数\",\"alias\":[],\"model\":2,\"id\":1,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":false}],\"fieldNameList\":[\"访问次数\",\"部门\",\"数据日期\",\"数据日期\",\"用户\"],\"partitionTime\":{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":0,\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"dataSetId\":1,\"partitionTimeFormat\":\"yyyy-MM-dd\",\"bizName\":\"imp_date\",\"timeFormat\":\"yyyy-MM-dd\",\"name\":\"数据日期\",\"alias\":[],\"model\":3,\"id\":3,\"partitionTime\":true,\"order\":0.0,\"primaryKey\":false},\"dimensions\":[{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":1,\"extInfo\":{\"dimension_type\":\"categorical\"},\"dataSetId\":1,\"partitionTimeFormat\":\"\",\"bizName\":\"department\",\"name\":\"部门\",\"alias\":[],\"model\":1,\"id\":1,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":false},{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":0,\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"dataSetId\":1,\"partitionTimeFormat\":\"yyyy-MM-dd\",\"bizName\":\"imp_date\",\"timeFormat\":\"yyyy-MM-dd\",\"name\":\"数据日期\",\"alias\":[],\"model\":3,\"id\":3,\"partitionTime\":true,\"order\":0.011519511093787238,\"primaryKey\":false}],\"primaryKey\":{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"用户\",\"type\":\"DIMENSION\",\"isTag\":0,\"extInfo\":{\"dimension_type\":\"primary_key\"},\"dataSetId\":1,\"partitionTimeFormat\":\"\",\"bizName\":\"user_name\",\"name\":\"用户\",\"alias\":[],\"model\":1,\"id\":2,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":true}},\"terms\":[],\"dynamicExemplars\":[{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c用户\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-15],DomainTerms\\u003d[\\u003c忠实用户 COMMENT \\u0027一段时间内总访问次数大于100的用户\\u0027\\u003e]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 \\u003e\\u003d \\u00272023-09-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272023-09-15\\u0027 GROUP BY 用户 HAVING SUM(访问次数) \\u003e 100\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"过去半个月核心用户的访问次数\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-15],DomainTerms\\u003d[\\u003c核心用户 COMMENT \\u0027用户为alice\\u0027\\u003e]\",\"sql\":\"SELECT 用户,SUM(访问次数) FROM 超音数产品 WHERE 用户\\u003d\\u0027alice\\u0027 AND 数据日期 \\u003e\\u003d \\u00272023-09-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272023-09-15\\u0027 GROUP BY 用户\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e,\\u003c访问用户数 ALIAS \\u0027UV,访问人数,\\u0027 COMMENT \\u0027访问的用户个数\\u0027 AGGREGATE \\u0027COUNT\\u0027\\u003e,\\u003c人均访问次数 ALIAS \\u0027平均访问次数,\\u0027 COMMENT \\u0027每个用户平均访问的次数\\u0027\\u003e], Dimensions\\u003d[\\u003c数据日期\\u003e], Values[\\u003c用户\\u003d\\u0027jackjchen\\u0027\\u003e,\\u003c用户\\u003d\\u0027robinlee\\u0027\\u003e]\",\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate\\u003d[2020-12-01],DomainTerms\\u003d[\\u003c核心用户 COMMENT \\u0027核心用户指tom和lucy\\u0027\\u003e]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\\u0027jackjchen\\u0027, \\u0027robinlee\\u0027) AND 数据日期 \\u003e\\u003d \\u00272020-01-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272020-12-01\\u0027\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 \\u003e 1000\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e,\\u003c访问用户数 ALIAS \\u0027UV,访问人数,\\u0027 COMMENT \\u0027访问的用户个数\\u0027 AGGREGATE \\u0027COUNT\\u0027\\u003e,\\u003c人均访问次数 ALIAS \\u0027平均访问次数,\\u0027 COMMENT \\u0027每个用户平均访问的次数\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate\\u003d[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 \\u003e\\u003d \\u00272021-11-06\\u0027 AND 数据日期 \\u003c\\u003d \\u00272022-11-06\\u0027\"}],\"sqlGenType\":\"1_pass_self_consistency\",\"queryText\":\"访问次数最高的部门\",\"currentDate\":\"2024-12-10\",\"chatAppConfig\":{\"MEMORY_REVIEW\":{\"enable\":false,\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion\\u003d(POSITIVE|NEGATIVE),comment\\u003d(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \"},\"REWRITE_MULTI_TURN\":{\"enable\":false,\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \"},\"S2SQL_CORRECTOR\":{\"enable\":false,\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion\\u003d(POSITIVE|NEGATIVE),sql\\u003d(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\"},\"SMALL_TALK\":{\"enable\":false,\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"chatModelId\":1,\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \"},\"DATA_INTERPRETER\":{\"enable\":false,\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\"},\"S2SQL_PARSER\":{\"enable\":true,\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `\\u003e`,`\\u003c`,`\\u003e\\u003d`,`\\u003c\\u003d` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\"},\"REWRITE_ERROR_MESSAGE\":{\"enable\":false,\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \"}}},\"dataSetId\":1,\"llmResp\":{\"schema\":\"DatabaseType\\u003d[mysql], Table\\u003d[超音数数据集], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], PrimaryKeyField\\u003d[用户], Metrics\\u003d[\\u003c访问次数 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027\\u003e], Values\\u003d[]\",\"sqlOutput\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\",\"query\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate\\u003d[2024-12-10]\",\"sqlRespMap\":{\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\":{\"fewShots\":[{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c用户\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-15],DomainTerms\\u003d[\\u003c忠实用户 COMMENT \\u0027一段时间内总访问次数大于100的用户\\u0027\\u003e]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 \\u003e\\u003d \\u00272023-09-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272023-09-15\\u0027 GROUP BY 用户 HAVING SUM(访问次数) \\u003e 100\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"过去半个月核心用户的访问次数\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-15],DomainTerms\\u003d[\\u003c核心用户 COMMENT \\u0027用户为alice\\u0027\\u003e]\",\"sql\":\"SELECT 用户,SUM(访问次数) FROM 超音数产品 WHERE 用户\\u003d\\u0027alice\\u0027 AND 数据日期 \\u003e\\u003d \\u00272023-09-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272023-09-15\\u0027 GROUP BY 用户\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e,\\u003c访问用户数 ALIAS \\u0027UV,访问人数,\\u0027 COMMENT \\u0027访问的用户个数\\u0027 AGGREGATE \\u0027COUNT\\u0027\\u003e,\\u003c人均访问次数 ALIAS \\u0027平均访问次数,\\u0027 COMMENT \\u0027每个用户平均访问的次数\\u0027\\u003e], Dimensions\\u003d[\\u003c数据日期\\u003e], Values[\\u003c用户\\u003d\\u0027jackjchen\\u0027\\u003e,\\u003c用户\\u003d\\u0027robinlee\\u0027\\u003e]\",\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate\\u003d[2020-12-01],DomainTerms\\u003d[\\u003c核心用户 COMMENT \\u0027核心用户指tom和lucy\\u0027\\u003e]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\\u0027jackjchen\\u0027, \\u0027robinlee\\u0027) AND 数据日期 \\u003e\\u003d \\u00272020-01-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272020-12-01\\u0027\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 \\u003e 1000\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e,\\u003c访问用户数 ALIAS \\u0027UV,访问人数,\\u0027 COMMENT \\u0027访问的用户个数\\u0027 AGGREGATE \\u0027COUNT\\u0027\\u003e,\\u003c人均访问次数 ALIAS \\u0027平均访问次数,\\u0027 COMMENT \\u0027每个用户平均访问的次数\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate\\u003d[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 \\u003e\\u003d \\u00272021-11-06\\u0027 AND 数据日期 \\u003c\\u003d \\u00272022-11-06\\u0027\"}],\"sqlWeight\":1.0}},\"dataSet\":\"超音数数据集\"}}}}', NULL);
INSERT INTO `s2_chat_context` VALUES (2, '2024-12-10 10:51:18', NULL, NULL, '{\"id\":1,\"queryMode\":\"LLM_S2SQL\",\"dataSet\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"id\":2,\"name\":\"歌手库数据集\",\"bizName\":\"singer\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{}},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"defaultDisplayInfo\":{\"dimensionIds\":[5,6,7,8],\"metricIds\":[5]},\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[],\"dimensions\":[{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"}}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[{\"bizName\":\"genre\",\"name\":\"流派\",\"operator\":\"EQUALS\",\"value\":\"国风\",\"elementID\":7}],\"metricFilters\":[],\"orders\":[],\"limit\":500,\"score\":12.0,\"elementMatches\":[{\"element\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"}},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"流派\",\"word\":\"流派\",\"frequency\":100000,\"isInherited\":false},{\"element\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"VALUE\",\"alias\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{}},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"国风\",\"word\":\"国风\",\"frequency\":2,\"isInherited\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 \\u003d \\u0027国风\\u0027\",\"correctedS2SQL\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 \\u003d \\u0027国风\\u0027\",\"querySQL\":\"SELECT `genre`\\r\\nFROM\\r\\n(SELECT `genre`, `singer_name` AS `singer_internal_cnt`\\r\\nFROM\\r\\nsinger) AS `t2`\\r\\nWHERE `genre` \\u003d \\u0027国风\\u0027 limit 1000\"},\"sqlEvaluation\":{},\"queryType\":\"DETAIL\",\"textInfo\":\"**数据集:** 歌手库数据集  **维度:** 流派 **筛选条件:** 流派 \\u003d 国风 \",\"properties\":{\"sql_exemplar\":{\"dbSchema\":\"DatabaseType\\u003d[mysql], Table\\u003d[歌手库数据集], PartitionTimeField\\u003d[], PrimaryKeyField\\u003d[歌手名], Metrics\\u003d[], Dimensions\\u003d[\\u003c流派\\u003e], Values\\u003d[\\u003c流派\\u003d\\u0027国风\\u0027\\u003e]\",\"question\":\"国风流派歌手\",\"sideInfo\":\"CurrentDate\\u003d[2024-12-10]\",\"sql\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 \\u003d \\u0027国风\\u0027\"},\"type\":\"internal\",\"CONTEXT\":{\"llmReq\":{\"schema\":{\"databaseType\":\"mysql\",\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"values\":[{\"fieldName\":\"流派\",\"fieldValue\":\"国风\"}],\"metrics\":[],\"fieldNameList\":[\"流派\",\"歌手名\"],\"dimensions\":[{\"schemaValueMaps\":[],\"dataSetName\":\"歌手库数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":1,\"extInfo\":{\"dimension_type\":\"categorical\"},\"dataSetId\":2,\"partitionTimeFormat\":\"\",\"bizName\":\"genre\",\"name\":\"流派\",\"alias\":[],\"model\":4,\"id\":7,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":false}],\"primaryKey\":{\"schemaValueMaps\":[],\"dataSetName\":\"歌手库数据集\",\"useCnt\":0,\"description\":\"歌手名\",\"type\":\"DIMENSION\",\"isTag\":1,\"extInfo\":{\"dimension_type\":\"primary_key\"},\"dataSetId\":2,\"partitionTimeFormat\":\"\",\"bizName\":\"singer_name\",\"name\":\"歌手名\",\"alias\":[],\"model\":4,\"id\":8,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":true}},\"terms\":[],\"dynamicExemplars\":[{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e,\\u003c访问用户数 ALIAS \\u0027UV,访问人数,\\u0027 COMMENT \\u0027访问的用户个数\\u0027 AGGREGATE \\u0027COUNT\\u0027\\u003e,\\u003c人均访问次数 ALIAS \\u0027平均访问次数,\\u0027 COMMENT \\u0027每个用户平均访问的次数\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate\\u003d[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 \\u003e\\u003d \\u00272021-11-06\\u0027 AND 数据日期 \\u003c\\u003d \\u00272022-11-06\\u0027\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table:[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics:[\\u003c访问时长 COMMENT \\u0027一段时间内用户的访问时长\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions:[\\u003c用户\\u003e,\\u003c数据日期\\u003e], Values:[\\u003c部门\\u003d\\u0027美术部\\u0027\\u003e]\",\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate\\u003d[2023-07-31],DomainTerms\\u003d[\\u003c核心用户 COMMENT \\u0027用户为tom和lucy\\u0027\\u003e]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 \\u003d \\u0027美术部\\u0027 AND 访问时长 \\u003c 1\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e,\\u003c访问用户数 ALIAS \\u0027UV,访问人数,\\u0027 COMMENT \\u0027访问的用户个数\\u0027 AGGREGATE \\u0027COUNT\\u0027\\u003e,\\u003c人均访问次数 ALIAS \\u0027平均访问次数,\\u0027 COMMENT \\u0027每个用户平均访问的次数\\u0027\\u003e], Dimensions\\u003d[\\u003c数据日期\\u003e], Values[\\u003c用户\\u003d\\u0027jackjchen\\u0027\\u003e,\\u003c用户\\u003d\\u0027robinlee\\u0027\\u003e]\",\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate\\u003d[2020-12-01],DomainTerms\\u003d[\\u003c核心用户 COMMENT \\u0027核心用户指tom和lucy\\u0027\\u003e]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\\u0027jackjchen\\u0027, \\u0027robinlee\\u0027) AND 数据日期 \\u003e\\u003d \\u00272020-01-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272020-12-01\\u0027\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 \\u003e 1000\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c用户\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-15],DomainTerms\\u003d[\\u003c忠实用户 COMMENT \\u0027一段时间内总访问次数大于100的用户\\u0027\\u003e]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 \\u003e\\u003d \\u00272023-09-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272023-09-15\\u0027 GROUP BY 用户 HAVING SUM(访问次数) \\u003e 100\"}],\"sqlGenType\":\"1_pass_self_consistency\",\"queryText\":\"国风流派歌手\",\"currentDate\":\"2024-12-10\",\"chatAppConfig\":{\"MEMORY_REVIEW\":{\"enable\":false,\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion\\u003d(POSITIVE|NEGATIVE),comment\\u003d(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \"},\"REWRITE_MULTI_TURN\":{\"enable\":false,\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \"},\"S2SQL_CORRECTOR\":{\"enable\":false,\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion\\u003d(POSITIVE|NEGATIVE),sql\\u003d(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\"},\"SMALL_TALK\":{\"enable\":false,\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"chatModelId\":1,\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \"},\"DATA_INTERPRETER\":{\"enable\":false,\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\"},\"S2SQL_PARSER\":{\"enable\":true,\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `\\u003e`,`\\u003c`,`\\u003e\\u003d`,`\\u003c\\u003d` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\"},\"REWRITE_ERROR_MESSAGE\":{\"enable\":false,\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \"}}},\"dataSetId\":2,\"llmResp\":{\"schema\":\"DatabaseType\\u003d[mysql], Table\\u003d[歌手库数据集], PartitionTimeField\\u003d[], PrimaryKeyField\\u003d[歌手名], Metrics\\u003d[], Dimensions\\u003d[\\u003c流派\\u003e], Values\\u003d[\\u003c流派\\u003d\\u0027国风\\u0027\\u003e]\",\"sqlOutput\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 \\u003d \\u0027国风\\u0027\",\"query\":\"国风流派歌手\",\"sideInfo\":\"CurrentDate\\u003d[2024-12-10]\",\"sqlRespMap\":{\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 \\u003d \\u0027国风\\u0027\":{\"fewShots\":[{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e,\\u003c访问用户数 ALIAS \\u0027UV,访问人数,\\u0027 COMMENT \\u0027访问的用户个数\\u0027 AGGREGATE \\u0027COUNT\\u0027\\u003e,\\u003c人均访问次数 ALIAS \\u0027平均访问次数,\\u0027 COMMENT \\u0027每个用户平均访问的次数\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate\\u003d[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 \\u003e\\u003d \\u00272021-11-06\\u0027 AND 数据日期 \\u003c\\u003d \\u00272022-11-06\\u0027\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table:[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics:[\\u003c访问时长 COMMENT \\u0027一段时间内用户的访问时长\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions:[\\u003c用户\\u003e,\\u003c数据日期\\u003e], Values:[\\u003c部门\\u003d\\u0027美术部\\u0027\\u003e]\",\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate\\u003d[2023-07-31],DomainTerms\\u003d[\\u003c核心用户 COMMENT \\u0027用户为tom和lucy\\u0027\\u003e]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 \\u003d \\u0027美术部\\u0027 AND 访问时长 \\u003c 1\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e,\\u003c访问用户数 ALIAS \\u0027UV,访问人数,\\u0027 COMMENT \\u0027访问的用户个数\\u0027 AGGREGATE \\u0027COUNT\\u0027\\u003e,\\u003c人均访问次数 ALIAS \\u0027平均访问次数,\\u0027 COMMENT \\u0027每个用户平均访问的次数\\u0027\\u003e], Dimensions\\u003d[\\u003c数据日期\\u003e], Values[\\u003c用户\\u003d\\u0027jackjchen\\u0027\\u003e,\\u003c用户\\u003d\\u0027robinlee\\u0027\\u003e]\",\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate\\u003d[2020-12-01],DomainTerms\\u003d[\\u003c核心用户 COMMENT \\u0027核心用户指tom和lucy\\u0027\\u003e]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\\u0027jackjchen\\u0027, \\u0027robinlee\\u0027) AND 数据日期 \\u003e\\u003d \\u00272020-01-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272020-12-01\\u0027\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c部门\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 \\u003e 1000\"},{\"dbSchema\":\"DatabaseType\\u003d[h2], Table\\u003d[超音数产品], PartitionTimeField\\u003d[数据日期 FORMAT \\u0027yyyy-MM-dd\\u0027], Metrics\\u003d[\\u003c访问次数 ALIAS \\u0027pv\\u0027 COMMENT \\u0027一段时间内用户的访问次数\\u0027 AGGREGATE \\u0027SUM\\u0027\\u003e], Dimensions\\u003d[\\u003c用户\\u003e,\\u003c数据日期\\u003e], Values\\u003d[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate\\u003d[2023-09-15],DomainTerms\\u003d[\\u003c忠实用户 COMMENT \\u0027一段时间内总访问次数大于100的用户\\u0027\\u003e]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 \\u003e\\u003d \\u00272023-09-01\\u0027 AND 数据日期 \\u003c\\u003d \\u00272023-09-15\\u0027 GROUP BY 用户 HAVING SUM(访问次数) \\u003e 100\"}],\"sqlWeight\":1.0}},\"dataSet\":\"歌手库数据集\"}}}}', NULL);

-- ----------------------------
-- Table structure for s2_chat_memory
-- ----------------------------
DROP TABLE IF EXISTS `s2_chat_memory`;
CREATE TABLE `s2_chat_memory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户问题',
  `side_info` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '辅助信息',
  `agent_id` int NULL DEFAULT NULL COMMENT '助理ID',
  `db_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'Schema映射',
  `s2_sql` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '大模型解析SQL',
  `status` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '状态',
  `llm_review` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '大模型评估结果',
  `llm_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '大模型评估意见',
  `human_review` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '管理员评估结果',
  `human_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '管理员评估意见',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_chat_memory
-- ----------------------------
INSERT INTO `s2_chat_memory` VALUES (1, '访问次数最高的部门', 'CurrentDate=[2024-12-10]', 1, 'DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]', 'SELECT 部门 FROM 超音数数据集 GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1', 'PENDING', NULL, NULL, NULL, NULL, '2024-12-10 10:00:58', '2024-12-10 10:00:58', 'admin', 'admin');
INSERT INTO `s2_chat_memory` VALUES (2, '访问次数最高的部门', 'CurrentDate=[2024-12-10]', 1, 'DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]', 'SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1', 'PENDING', NULL, NULL, NULL, NULL, '2024-12-10 10:03:35', '2024-12-10 10:03:35', 'admin', 'admin');
INSERT INTO `s2_chat_memory` VALUES (3, '国风流派歌手', 'CurrentDate=[2024-12-10]', 2, 'DatabaseType=[mysql], Table=[歌手库数据集], PartitionTimeField=[], PrimaryKeyField=[歌手名], Metrics=[], Dimensions=[<流派>], Values=[<流派=\'国风\'>]', 'SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'', 'PENDING', NULL, NULL, NULL, NULL, '2024-12-10 10:51:18', '2024-12-10 10:51:18', 'admin', 'admin');

-- ----------------------------
-- Table structure for s2_chat_model
-- ----------------------------
DROP TABLE IF EXISTS `s2_chat_model`;
CREATE TABLE `s2_chat_model`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `config` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '配置信息',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建人',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '更新人',
  `admin` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `viewer` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '对话大模型实例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_chat_model
-- ----------------------------
INSERT INTO `s2_chat_model` VALUES (1, 'OpenAI模型DEMO', '由langchain4j社区提供仅用于体验(单次请求最大token数1000), 正式使用请切换大模型', '{\"provider\":\"OPEN_AI\",\"baseUrl\":\"https://api.openai.com/v1\",\"apiKey\":\"demo\",\"modelName\":\"gpt-4o-mini\",\"temperature\":0.0,\"timeOut\":60}', '2024-12-10 09:46:49', 'admin', '2024-12-10 09:46:49', 'admin', 'admin', NULL);

-- ----------------------------
-- Table structure for s2_chat_parse
-- ----------------------------
DROP TABLE IF EXISTS `s2_chat_parse`;
CREATE TABLE `s2_chat_parse`  (
  `question_id` bigint NOT NULL,
  `chat_id` int NOT NULL,
  `parse_id` int NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `query_text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parse_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_candidate` int NULL DEFAULT 1 COMMENT '1是candidate,0是selected',
  INDEX `commonIndex`(`question_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_chat_parse
-- ----------------------------
INSERT INTO `s2_chat_parse` VALUES (1, 1, 1, '2024-12-10 09:46:55', '超音数 访问次数', 'admin', '{\"id\":1,\"queryMode\":\"METRIC_MODEL\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":3,\"name\":\"访问用户数\",\"bizName\":\"uv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[\"UV\",\"访问人数\"],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false}],\"defaultAgg\":\"count\",\"order\":0.0,\"isTag\":0,\"description\":\"访问的用户个数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":7,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":200,\"score\":4.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":3,\"name\":\"访问用户数\",\"bizName\":\"uv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[\"UV\",\"访问人数\"],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false}],\"defaultAgg\":\"count\",\"order\":0.009808523761615118,\"isTag\":0,\"description\":\"访问的用户个数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":0.9901914762383849,\"detectWord\":\"访问次\",\"word\":\"访问用户数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT sys_imp_date, SUM(访问次数) AS 访问次数, COUNT(访问用户数) AS 访问用户数 FROM 超音数数据集 WHERE sys_imp_date >= \'2024-12-03\' AND sys_imp_date <= \'2024-12-10\' GROUP BY sys_imp_date LIMIT 200\",\"correctedS2SQL\":\"SELECT 数据日期, SUM(访问次数) AS 访问次数, COUNT(访问用户数) AS 访问用户数 FROM 超音数数据集 WHERE 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期 LIMIT 200\",\"querySQL\":\"SELECT `sys_imp_date`, SUM(`pv`) AS `访问次数`, COUNT(DISTINCT `user_id`) AS `访问用户数`\\r\\nFROM\\r\\n(SELECT `imp_date` AS `sys_imp_date`, `user_name` AS `user_id`, 1 AS `pv`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t4`\\r\\nWHERE `sys_imp_date` >= \'2024-12-03\' AND `sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `sys_imp_date`\\r\\nLIMIT 200\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"entityInfo\":{\"dataSetInfo\":{\"itemId\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\"}},\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数,访问用户数 **数据时间:** 2024-12-03~2024-12-10 \",\"properties\":{},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500}', 0);
INSERT INTO `s2_chat_parse` VALUES (2, 1, 1, '2024-12-10 09:46:56', '按部门统计近7天访问次数', 'admin', '{\"id\":1,\"queryMode\":\"METRIC_GROUPBY\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":7,\"period\":\"DAY\",\"detectWord\":\"近7天\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":200,\"score\":9.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"部门\",\"word\":\"部门\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT sys_imp_date, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE sys_imp_date >= \'2024-12-03\' AND sys_imp_date <= \'2024-12-10\' GROUP BY sys_imp_date, 部门 LIMIT 200\",\"correctedS2SQL\":\"SELECT 数据日期, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期, 部门 LIMIT 200\",\"querySQL\":\"SELECT `sys_imp_date`, `department`, SUM(`pv`) AS `访问次数`\\r\\nFROM\\r\\n(SELECT `t6`.`sys_imp_date`, `t5`.`department`, `t6`.`s2_pv_uv_statis_pv` AS `pv`\\r\\nFROM\\r\\n(SELECT `user_name`, `department`\\r\\nFROM\\r\\ns2_user_department) AS `t5`\\r\\nLEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t6` ON `t5`.`user_name` = `t6`.`user_name`) AS `t7`\\r\\nWHERE `t7`.`sys_imp_date` >= \'2024-12-03\' AND `t7`.`sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `sys_imp_date`, `department`\\r\\nLIMIT 200\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"entityInfo\":{\"dataSetInfo\":{\"itemId\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\"}},\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数 **维度:** 部门 **数据时间:** 2024-12-03~2024-12-10 \",\"properties\":{},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500}', 0);
INSERT INTO `s2_chat_parse` VALUES (3, 1, 1, '2024-12-10 09:46:57', 'alice 停留时长', 'admin', '{\"id\":1,\"queryMode\":\"METRIC_FILTER\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":2,\"name\":\"停留时长\",\"bizName\":\"stay_hours\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"停留时长\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[{\"bizName\":\"user_name\",\"name\":\"用户\",\"operator\":\"=\",\"value\":\"alice\",\"elementID\":2}],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":7,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":200,\"score\":9.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":2,\"name\":\"用户\",\"bizName\":\"user_name\",\"useCnt\":0,\"type\":\"VALUE\",\"alias\":[],\"order\":0.0,\"isTag\":0,\"description\":\"用户\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"alice\",\"word\":\"alice\",\"frequency\":1,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":2,\"name\":\"停留时长\",\"bizName\":\"stay_hours\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"停留时长\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"停留时长\",\"word\":\"停留时长\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT sys_imp_date, SUM(停留时长) AS 停留时长 FROM 超音数数据集 WHERE 用户 = \'alice\' AND sys_imp_date >= \'2024-12-03\' AND sys_imp_date <= \'2024-12-10\' GROUP BY sys_imp_date LIMIT 200\",\"correctedS2SQL\":\"SELECT 数据日期, SUM(停留时长) AS 停留时长 FROM 超音数数据集 WHERE 用户 = \'alice\' AND 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期 LIMIT 200\",\"querySQL\":\"SELECT `sys_imp_date`, SUM(`stay_hours`) AS `停留时长`\\r\\nFROM\\r\\n(SELECT `imp_date` AS `sys_imp_date`, `user_name`, `stay_hours`\\r\\nFROM\\r\\ns2_stay_time_statis) AS `t4`\\r\\nWHERE `user_name` = \'alice\' AND `sys_imp_date` >= \'2024-12-03\' AND `sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `sys_imp_date`\\r\\nLIMIT 200\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 停留时长 **数据时间:** 2024-12-03~2024-12-10  **筛选条件:** 用户 = alice \",\"properties\":{},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500}', 0);
INSERT INTO `s2_chat_parse` VALUES (4, 1, 1, '2024-12-10 09:46:58', '访问次数最高的部门', 'admin', '{\"id\":1,\"queryMode\":\"METRIC_ORDERBY\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"aggType\":\"SUM\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[{\"column\":\"访问次数\",\"direction\":\"DESC\"}],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":7,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":200,\"score\":8.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"部门\",\"word\":\"部门\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.011519511093787238,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"},\"offset\":0.0,\"similarity\":0.9884804889062128,\"detectWord\":\"数最高的\",\"word\":\"数据日期\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT sys_imp_date, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE sys_imp_date >= \'2024-12-03\' AND sys_imp_date <= \'2024-12-10\' GROUP BY sys_imp_date, 部门 ORDER BY 访问次数 DESC LIMIT 200\",\"correctedS2SQL\":\"SELECT 数据日期, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期, 部门 ORDER BY SUM(访问次数) DESC LIMIT 200\",\"querySQL\":\"SELECT `sys_imp_date`, `department`, SUM(`pv`) AS `访问次数`\\r\\nFROM\\r\\n(SELECT `t6`.`sys_imp_date`, `t5`.`department`, `t6`.`s2_pv_uv_statis_pv` AS `pv`\\r\\nFROM\\r\\n(SELECT `user_name`, `department`\\r\\nFROM\\r\\ns2_user_department) AS `t5`\\r\\nLEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t6` ON `t5`.`user_name` = `t6`.`user_name`) AS `t7`\\r\\nWHERE `t7`.`sys_imp_date` >= \'2024-12-03\' AND `t7`.`sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `sys_imp_date`, `department`\\r\\nORDER BY 3 DESC\\r\\nLIMIT 200\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"entityInfo\":{\"dataSetInfo\":{\"itemId\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\"}},\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数 **维度:** 部门 **数据时间:** 2024-12-03~2024-12-10 \",\"properties\":{},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500}', 0);
INSERT INTO `s2_chat_parse` VALUES (5, 1, 1, '2024-12-10 10:00:34', '访问次数最高的部门', 'admin', '{\"id\":1,\"queryMode\":\"LLM_S2SQL\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-09\",\"endDate\":\"2024-12-09\",\"dateList\":[\"2024-12-09\"],\"unit\":1,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":500,\"score\":18.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"部门\",\"word\":\"部门\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.011519511093787238,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"},\"offset\":0.0,\"similarity\":0.9884804889062128,\"detectWord\":\"数最高的\",\"word\":\"数据日期\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT 部门 FROM 超音数数据集 GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\",\"correctedS2SQL\":\"SELECT 部门, SUM(访问次数) FROM 超音数数据集 WHERE (数据日期 >= \'2024-12-09\' AND 数据日期 <= \'2024-12-09\') GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\",\"querySQL\":\"SELECT `department`, SUM(`pv`)\\r\\nFROM\\r\\n(SELECT `t7`.`sys_imp_date`, `t6`.`department`, `t7`.`s2_pv_uv_statis_pv` AS `pv`\\r\\nFROM\\r\\n(SELECT `user_name`, `department`\\r\\nFROM\\r\\ns2_user_department) AS `t6`\\r\\nLEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t7` ON `t6`.`user_name` = `t7`.`user_name`) AS `t8`\\r\\nWHERE `t8`.`sys_imp_date` >= \'2024-12-09\' AND `t8`.`sys_imp_date` <= \'2024-12-09\'\\r\\nGROUP BY `department`\\r\\nORDER BY 2 DESC\\r\\nLIMIT 1\"},\"sqlEvaluation\":{},\"queryType\":\"DETAIL\",\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数 **维度:** 部门 **数据时间:** 2024-12-09~2024-12-09 \",\"properties\":{\"sql_exemplar\":{\"question\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"dbSchema\":\"DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]\",\"sql\":\"SELECT 部门 FROM 超音数数据集 GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\"},\"type\":\"internal\",\"CONTEXT\":{\"dataSetId\":1,\"llmReq\":{\"queryText\":\"访问次数最高的部门\",\"schema\":{\"databaseType\":\"mysql\",\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.011519511093787238,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"}],\"values\":[],\"partitionTime\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"},\"primaryKey\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":2,\"name\":\"用户\",\"bizName\":\"user_name\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":0,\"description\":\"用户\",\"extInfo\":{\"dimension_type\":\"primary_key\"},\"partitionTime\":false,\"primaryKey\":true,\"partitionTimeFormat\":\"\"},\"fieldNameList\":[\"访问次数\",\"部门\",\"数据日期\",\"数据日期\",\"用户\"]},\"terms\":[],\"currentDate\":\"2024-12-10\",\"sqlGenType\":\"1_pass_self_consistency\",\"chatAppConfig\":{\"MEMORY_REVIEW\":{\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),comment=(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"REWRITE_MULTI_TURN\":{\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \",\"enable\":false,\"chatModelId\":1},\"S2SQL_CORRECTOR\":{\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),sql=(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\",\"enable\":false,\"chatModelId\":1},\"SMALL_TALK\":{\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"DATA_INTERPRETER\":{\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\",\"enable\":false,\"chatModelId\":1},\"S2SQL_PARSER\":{\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `>`,`<`,`>=`,`<=` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\",\"enable\":true,\"chatModelId\":1},\"REWRITE_ERROR_MESSAGE\":{\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \",\"enable\":false,\"chatModelId\":1}},\"dynamicExemplars\":[{\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"},{\"question\":\"超音数本月pv最高的用户有哪些\",\"sideInfo\":\"CurrentDate=[2023-08-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-08-01\' AND 数据日期 <= \'2023-08-31\' ORDER BY 访问次数 DESC LIMIT 1\"},{\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"},{\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate=[2023-07-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table:[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics:[<访问时长 COMMENT \'一段时间内用户的访问时长\' AGGREGATE \'SUM\'>], Dimensions:[<用户>,<数据日期>], Values:[<部门=\'美术部\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 = \'美术部\' AND 访问时长 < 1\"}]},\"llmResp\":{\"query\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"dataSet\":\"超音数数据集\",\"schema\":\"DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]\",\"sqlOutput\":\"SELECT 部门 FROM 超音数数据集 GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\",\"sqlRespMap\":{\"SELECT 部门 FROM 超音数数据集 GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\":{\"sqlWeight\":1.0,\"fewShots\":[{\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"},{\"question\":\"超音数本月pv最高的用户有哪些\",\"sideInfo\":\"CurrentDate=[2023-08-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-08-01\' AND 数据日期 <= \'2023-08-31\' ORDER BY 访问次数 DESC LIMIT 1\"},{\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"},{\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate=[2023-07-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table:[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics:[<访问时长 COMMENT \'一段时间内用户的访问时长\' AGGREGATE \'SUM\'>], Dimensions:[<用户>,<数据日期>], Values:[<部门=\'美术部\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 = \'美术部\' AND 访问时长 < 1\"}]}}}}},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500}', 0);
INSERT INTO `s2_chat_parse` VALUES (6, 1, 1, '2024-12-10 10:03:35', '访问次数最高的部门', 'admin', '{\"id\":1,\"queryMode\":\"LLM_S2SQL\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":1,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":500,\"score\":18.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"部门\",\"word\":\"部门\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.011519511093787238,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"},\"offset\":0.0,\"similarity\":0.9884804889062128,\"detectWord\":\"数最高的\",\"word\":\"数据日期\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\",\"correctedS2SQL\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 WHERE (数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\') GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\",\"querySQL\":\"SELECT `department`, SUM(`pv`) AS `访问次数`\\r\\nFROM\\r\\n(SELECT `t7`.`sys_imp_date`, `t6`.`department`, `t7`.`s2_pv_uv_statis_pv` AS `pv`\\r\\nFROM\\r\\n(SELECT `user_name`, `department`\\r\\nFROM\\r\\ns2_user_department) AS `t6`\\r\\nLEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t7` ON `t6`.`user_name` = `t7`.`user_name`) AS `t8`\\r\\nWHERE `t8`.`sys_imp_date` >= \'2024-12-03\' AND `t8`.`sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `department`\\r\\nORDER BY 2 DESC\\r\\nLIMIT 1\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数 **维度:** 部门 **数据时间:** 2024-12-03~2024-12-10 \",\"properties\":{\"sql_exemplar\":{\"question\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"dbSchema\":\"DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]\",\"sql\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\"},\"type\":\"internal\",\"CONTEXT\":{\"dataSetId\":1,\"llmReq\":{\"queryText\":\"访问次数最高的部门\",\"schema\":{\"databaseType\":\"mysql\",\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.011519511093787238,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"}],\"values\":[],\"partitionTime\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"},\"primaryKey\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":2,\"name\":\"用户\",\"bizName\":\"user_name\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":0,\"description\":\"用户\",\"extInfo\":{\"dimension_type\":\"primary_key\"},\"partitionTime\":false,\"primaryKey\":true,\"partitionTimeFormat\":\"\"},\"fieldNameList\":[\"访问次数\",\"部门\",\"数据日期\",\"数据日期\",\"用户\"]},\"terms\":[],\"currentDate\":\"2024-12-10\",\"sqlGenType\":\"1_pass_self_consistency\",\"chatAppConfig\":{\"MEMORY_REVIEW\":{\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),comment=(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"REWRITE_MULTI_TURN\":{\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \",\"enable\":false,\"chatModelId\":1},\"S2SQL_CORRECTOR\":{\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),sql=(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\",\"enable\":false,\"chatModelId\":1},\"SMALL_TALK\":{\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"DATA_INTERPRETER\":{\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\",\"enable\":false,\"chatModelId\":1},\"S2SQL_PARSER\":{\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `>`,`<`,`>=`,`<=` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\",\"enable\":true,\"chatModelId\":1},\"REWRITE_ERROR_MESSAGE\":{\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \",\"enable\":false,\"chatModelId\":1}},\"dynamicExemplars\":[{\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"},{\"question\":\"过去半个月核心用户的访问次数\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<核心用户 COMMENT \'用户为alice\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户,SUM(访问次数) FROM 超音数产品 WHERE 用户=\'alice\' AND 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户\"},{\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate=[2020-12-01],DomainTerms=[<核心用户 COMMENT \'核心用户指tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<数据日期>], Values[<用户=\'jackjchen\'>,<用户=\'robinlee\'>]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\'jackjchen\', \'robinlee\') AND 数据日期 >= \'2020-01-01\' AND 数据日期 <= \'2020-12-01\'\"},{\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"}]},\"llmResp\":{\"query\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"dataSet\":\"超音数数据集\",\"schema\":\"DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]\",\"sqlOutput\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\",\"sqlRespMap\":{\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\":{\"sqlWeight\":1.0,\"fewShots\":[{\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"},{\"question\":\"过去半个月核心用户的访问次数\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<核心用户 COMMENT \'用户为alice\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户,SUM(访问次数) FROM 超音数产品 WHERE 用户=\'alice\' AND 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户\"},{\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate=[2020-12-01],DomainTerms=[<核心用户 COMMENT \'核心用户指tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<数据日期>], Values[<用户=\'jackjchen\'>,<用户=\'robinlee\'>]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\'jackjchen\', \'robinlee\') AND 数据日期 >= \'2020-01-01\' AND 数据日期 <= \'2020-12-01\'\"},{\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"}]}}}}},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500}', 0);
INSERT INTO `s2_chat_parse` VALUES (7, 2, 1, '2024-12-10 10:51:18', '国风流派歌手', 'admin', '{\"id\":1,\"queryMode\":\"LLM_S2SQL\",\"dataSet\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"id\":2,\"name\":\"歌手库数据集\",\"bizName\":\"singer\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":false},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"defaultDisplayInfo\":{\"dimensionIds\":[5,6,7,8],\"metricIds\":[5]},\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[],\"dimensions\":[{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":false}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[{\"bizName\":\"genre\",\"name\":\"流派\",\"operator\":\"=\",\"value\":\"国风\",\"elementID\":7}],\"metricFilters\":[],\"orders\":[],\"limit\":500,\"score\":12.0,\"elementMatches\":[{\"element\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":false},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"流派\",\"word\":\"流派\",\"frequency\":100000,\"fullMatched\":true,\"inherited\":false},{\"element\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"VALUE\",\"alias\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":false},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"国风\",\"word\":\"国风\",\"frequency\":2,\"fullMatched\":true,\"inherited\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\",\"correctedS2SQL\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\",\"querySQL\":\"SELECT `genre`\\r\\nFROM\\r\\n(SELECT `genre`, `singer_name` AS `singer_internal_cnt`\\r\\nFROM\\r\\nsinger) AS `t2`\\r\\nWHERE `genre` = \'国风\' limit 1000\"},\"sqlEvaluation\":{},\"queryType\":\"DETAIL\",\"textInfo\":\"**数据集:** 歌手库数据集  **维度:** 流派 **筛选条件:** 流派 = 国风 \",\"properties\":{\"sql_exemplar\":{\"question\":\"国风流派歌手\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"dbSchema\":\"DatabaseType=[mysql], Table=[歌手库数据集], PartitionTimeField=[], PrimaryKeyField=[歌手名], Metrics=[], Dimensions=[<流派>], Values=[<流派=\'国风\'>]\",\"sql\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\"},\"type\":\"internal\",\"CONTEXT\":{\"dataSetId\":2,\"llmReq\":{\"queryText\":\"国风流派歌手\",\"schema\":{\"databaseType\":\"mysql\",\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"metrics\":[],\"dimensions\":[{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":false}],\"values\":[{\"fieldName\":\"流派\",\"fieldValue\":\"国风\"}],\"primaryKey\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":8,\"name\":\"歌手名\",\"bizName\":\"singer_name\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"歌手名\",\"extInfo\":{\"dimension_type\":\"primary_key\"},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":true},\"fieldNameList\":[\"流派\",\"歌手名\"]},\"terms\":[],\"currentDate\":\"2024-12-10\",\"sqlGenType\":\"1_pass_self_consistency\",\"chatAppConfig\":{\"MEMORY_REVIEW\":{\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),comment=(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"REWRITE_MULTI_TURN\":{\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \",\"enable\":false,\"chatModelId\":1},\"S2SQL_CORRECTOR\":{\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),sql=(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\",\"enable\":false,\"chatModelId\":1},\"SMALL_TALK\":{\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \",\"enable\":false,\"chatModelId\":1},\"DATA_INTERPRETER\":{\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\",\"enable\":false,\"chatModelId\":1},\"S2SQL_PARSER\":{\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `>`,`<`,`>=`,`<=` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\",\"enable\":true,\"chatModelId\":1},\"REWRITE_ERROR_MESSAGE\":{\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \",\"enable\":false,\"chatModelId\":1}},\"dynamicExemplars\":[{\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"},{\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate=[2023-07-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table:[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics:[<访问时长 COMMENT \'一段时间内用户的访问时长\' AGGREGATE \'SUM\'>], Dimensions:[<用户>,<数据日期>], Values:[<部门=\'美术部\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 = \'美术部\' AND 访问时长 < 1\"},{\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate=[2020-12-01],DomainTerms=[<核心用户 COMMENT \'核心用户指tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<数据日期>], Values[<用户=\'jackjchen\'>,<用户=\'robinlee\'>]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\'jackjchen\', \'robinlee\') AND 数据日期 >= \'2020-01-01\' AND 数据日期 <= \'2020-12-01\'\"},{\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"}]},\"llmResp\":{\"query\":\"国风流派歌手\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"dataSet\":\"歌手库数据集\",\"schema\":\"DatabaseType=[mysql], Table=[歌手库数据集], PartitionTimeField=[], PrimaryKeyField=[歌手名], Metrics=[], Dimensions=[<流派>], Values=[<流派=\'国风\'>]\",\"sqlOutput\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\",\"sqlRespMap\":{\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\":{\"sqlWeight\":1.0,\"fewShots\":[{\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"},{\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate=[2023-07-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table:[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics:[<访问时长 COMMENT \'一段时间内用户的访问时长\' AGGREGATE \'SUM\'>], Dimensions:[<用户>,<数据日期>], Values:[<部门=\'美术部\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 = \'美术部\' AND 访问时长 < 1\"},{\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate=[2020-12-01],DomainTerms=[<核心用户 COMMENT \'核心用户指tom和lucy\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<数据日期>], Values[<用户=\'jackjchen\'>,<用户=\'robinlee\'>]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\'jackjchen\', \'robinlee\') AND 数据日期 >= \'2020-01-01\' AND 数据日期 <= \'2020-12-01\'\"},{\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"}]}}}}},\"dataSetId\":2,\"detailLimit\":500,\"metricLimit\":200}', 0);
INSERT INTO `s2_chat_parse` VALUES (8, 3, 1, '2024-12-10 10:52:02', '你是谁', 'admin', '{\"id\":1,\"queryMode\":\"PLAIN_TEXT\",\"metrics\":[],\"dimensions\":[],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"limit\":500,\"score\":0.0,\"elementMatches\":[],\"sqlInfo\":{},\"sqlEvaluation\":{},\"queryType\":\"ID\",\"properties\":{},\"detailLimit\":500,\"metricLimit\":200}', 0);
INSERT INTO `s2_chat_parse` VALUES (9, 3, 1, '2024-12-10 10:52:31', '我是谁', 'admin', '{\"id\":1,\"queryMode\":\"PLAIN_TEXT\",\"metrics\":[],\"dimensions\":[],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"limit\":500,\"score\":0.0,\"elementMatches\":[],\"sqlInfo\":{},\"sqlEvaluation\":{},\"queryType\":\"ID\",\"properties\":{},\"detailLimit\":500,\"metricLimit\":200}', 0);
INSERT INTO `s2_chat_parse` VALUES (10, 3, 1, '2024-12-10 10:52:41', '嗯 你了解我嘛', 'admin', '{\"id\":1,\"queryMode\":\"PLAIN_TEXT\",\"metrics\":[],\"dimensions\":[],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"limit\":500,\"score\":0.0,\"elementMatches\":[],\"sqlInfo\":{},\"sqlEvaluation\":{},\"queryType\":\"ID\",\"properties\":{},\"detailLimit\":500,\"metricLimit\":200}', 0);

-- ----------------------------
-- Table structure for s2_chat_query
-- ----------------------------
DROP TABLE IF EXISTS `s2_chat_query`;
CREATE TABLE `s2_chat_query`  (
  `question_id` bigint NOT NULL AUTO_INCREMENT,
  `agent_id` int NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `query_text` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `user_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `query_state` int NULL DEFAULT NULL,
  `chat_id` bigint NOT NULL,
  `query_result` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `score` int NULL DEFAULT 0,
  `feedback` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  `similar_queries` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  `parse_time_cost` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_chat_query
-- ----------------------------
INSERT INTO `s2_chat_query` VALUES (1, 1, '2024-12-10 09:46:58', '超音数 访问次数', 'admin', 1, 1, '{\"queryMode\":\"METRIC_MODEL\",\"querySql\":\"SELECT `sys_imp_date`, SUM(`pv`) AS `访问次数`, COUNT(DISTINCT `user_id`) AS `访问用户数` FROM (SELECT `imp_date` AS `sys_imp_date`, `user_name` AS `user_id`, 1 AS `pv` FROM s2_pv_uv_statis) AS `t4` WHERE `sys_imp_date` >= \'2024-12-03\' AND `sys_imp_date` <= \'2024-12-10\' GROUP BY `sys_imp_date` LIMIT 200\",\"queryState\":\"SUCCESS\",\"queryColumns\":[{\"name\":\"date\",\"type\":\"VARCHAR\",\"nameEn\":\"sys_imp_date\",\"showType\":\"DATE\",\"authorized\":true},{\"name\":\"访问次数\",\"type\":\"DECIMAL\",\"nameEn\":\"访问次数\",\"showType\":\"NUMBER\",\"authorized\":true},{\"name\":\"访问用户数\",\"type\":\"BIGINT\",\"nameEn\":\"访问用户数\",\"showType\":\"NUMBER\",\"authorized\":true}],\"chatContext\":{\"id\":1,\"queryMode\":\"METRIC_MODEL\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":3,\"name\":\"访问用户数\",\"bizName\":\"uv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[\"UV\",\"访问人数\"],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false}],\"defaultAgg\":\"count\",\"order\":0.0,\"isTag\":0,\"description\":\"访问的用户个数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":7,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":200,\"score\":4.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":3,\"name\":\"访问用户数\",\"bizName\":\"uv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[\"UV\",\"访问人数\"],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false}],\"defaultAgg\":\"count\",\"order\":0.009808523761615118,\"isTag\":0,\"description\":\"访问的用户个数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":0.9901914762383849,\"detectWord\":\"访问次\",\"word\":\"访问用户数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT sys_imp_date, SUM(访问次数) AS 访问次数, COUNT(访问用户数) AS 访问用户数 FROM 超音数数据集 WHERE sys_imp_date >= \'2024-12-03\' AND sys_imp_date <= \'2024-12-10\' GROUP BY sys_imp_date LIMIT 200\",\"correctedS2SQL\":\"SELECT 数据日期, SUM(访问次数) AS 访问次数, COUNT(访问用户数) AS 访问用户数 FROM 超音数数据集 WHERE 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期 LIMIT 200\",\"querySQL\":\"SELECT `sys_imp_date`, SUM(`pv`) AS `访问次数`, COUNT(DISTINCT `user_id`) AS `访问用户数`\\r\\nFROM\\r\\n(SELECT `imp_date` AS `sys_imp_date`, `user_name` AS `user_id`, 1 AS `pv`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t4`\\r\\nWHERE `sys_imp_date` >= \'2024-12-03\' AND `sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `sys_imp_date`\\r\\nLIMIT 200\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"entityInfo\":{\"dataSetInfo\":{\"itemId\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\"},\"dimensions\":[],\"metrics\":[]},\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数,访问用户数 **数据时间:** 2024-12-03~2024-12-10 \",\"properties\":{},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500},\"queryResults\":[{\"sys_imp_date\":\"2024-12-03\",\"访问次数\":11,\"访问用户数\":5},{\"sys_imp_date\":\"2024-12-04\",\"访问次数\":14,\"访问用户数\":5},{\"sys_imp_date\":\"2024-12-05\",\"访问次数\":1,\"访问用户数\":1},{\"sys_imp_date\":\"2024-12-06\",\"访问次数\":19,\"访问用户数\":6},{\"sys_imp_date\":\"2024-12-07\",\"访问次数\":18,\"访问用户数\":6},{\"sys_imp_date\":\"2024-12-08\",\"访问次数\":24,\"访问用户数\":6},{\"sys_imp_date\":\"2024-12-09\",\"访问次数\":23,\"访问用户数\":6},{\"sys_imp_date\":\"2024-12-10\",\"访问次数\":6,\"访问用户数\":5}],\"textResult\":\"| date | 访问次数 | 访问用户数 |\\n|:---:|:---:|:---:|\\n| 2024-12-03 | 11 | 5 |\\n| 2024-12-04 | 14 | 5 |\\n| 2024-12-05 | 1 | 1 |\\n| 2024-12-06 | 19 | 6 |\\n| 2024-12-07 | 18 | 6 |\\n| 2024-12-08 | 24 | 6 |\\n| 2024-12-09 | 23 | 6 |\\n| 2024-12-10 | 6 | 5 |\\n\",\"queryTimeCost\":0,\"recommendedDimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":2,\"name\":\"用户\",\"bizName\":\"user_name\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":0,\"description\":\"用户\",\"extInfo\":{\"dimension_type\":\"primary_key\"},\"partitionTime\":false,\"primaryKey\":true,\"partitionTimeFormat\":\"\"}],\"aggregateInfo\":{\"metricInfos\":[]}}', 5, '', '[]', '{\"parseStartTime\":1733795213550,\"parseTime\":1047,\"sqlTime\":0}');
INSERT INTO `s2_chat_query` VALUES (2, 1, '2024-12-10 09:46:55', '按部门统计近7天访问次数', 'admin', 1, 1, '{\"queryMode\":\"METRIC_GROUPBY\",\"querySql\":\"SELECT `sys_imp_date`, `department`, SUM(`pv`) AS `访问次数` FROM (SELECT `t6`.`sys_imp_date`, `t5`.`department`, `t6`.`s2_pv_uv_statis_pv` AS `pv` FROM (SELECT `user_name`, `department` FROM s2_user_department) AS `t5` LEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name` FROM s2_pv_uv_statis) AS `t6` ON `t5`.`user_name` = `t6`.`user_name`) AS `t7` WHERE `t7`.`sys_imp_date` >= \'2024-12-03\' AND `t7`.`sys_imp_date` <= \'2024-12-10\' GROUP BY `sys_imp_date`, `department` LIMIT 200\",\"queryState\":\"SUCCESS\",\"queryColumns\":[{\"name\":\"date\",\"type\":\"VARCHAR\",\"nameEn\":\"sys_imp_date\",\"showType\":\"DATE\",\"authorized\":true},{\"name\":\"部门\",\"type\":\"VARCHAR\",\"nameEn\":\"department\",\"showType\":\"CATEGORY\",\"authorized\":true},{\"name\":\"访问次数\",\"type\":\"DECIMAL\",\"nameEn\":\"访问次数\",\"showType\":\"NUMBER\",\"authorized\":true}],\"chatContext\":{\"id\":1,\"queryMode\":\"METRIC_GROUPBY\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":7,\"period\":\"DAY\",\"detectWord\":\"近7天\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":200,\"score\":9.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"部门\",\"word\":\"部门\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT sys_imp_date, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE sys_imp_date >= \'2024-12-03\' AND sys_imp_date <= \'2024-12-10\' GROUP BY sys_imp_date, 部门 LIMIT 200\",\"correctedS2SQL\":\"SELECT 数据日期, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期, 部门 LIMIT 200\",\"querySQL\":\"SELECT `sys_imp_date`, `department`, SUM(`pv`) AS `访问次数`\\r\\nFROM\\r\\n(SELECT `t6`.`sys_imp_date`, `t5`.`department`, `t6`.`s2_pv_uv_statis_pv` AS `pv`\\r\\nFROM\\r\\n(SELECT `user_name`, `department`\\r\\nFROM\\r\\ns2_user_department) AS `t5`\\r\\nLEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t6` ON `t5`.`user_name` = `t6`.`user_name`) AS `t7`\\r\\nWHERE `t7`.`sys_imp_date` >= \'2024-12-03\' AND `t7`.`sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `sys_imp_date`, `department`\\r\\nLIMIT 200\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"entityInfo\":{\"dataSetInfo\":{\"itemId\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\"},\"dimensions\":[],\"metrics\":[]},\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数 **维度:** 部门 **数据时间:** 2024-12-03~2024-12-10 \",\"properties\":{},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500},\"queryResults\":[{\"sys_imp_date\":\"2024-12-10\",\"department\":\"marketing\",\"访问次数\":2},{\"sys_imp_date\":\"2024-12-10\",\"department\":\"HR\",\"访问次数\":2},{\"sys_imp_date\":\"2024-12-10\",\"department\":\"sales\",\"访问次数\":2},{\"sys_imp_date\":\"2024-12-10\",\"department\":\"strategy\",\"访问次数\":1},{\"sys_imp_date\":\"2024-12-05\",\"department\":\"marketing\",\"访问次数\":1},{\"sys_imp_date\":\"2024-12-06\",\"department\":\"HR\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-07\",\"department\":\"marketing\",\"访问次数\":8},{\"sys_imp_date\":\"2024-12-09\",\"department\":\"sales\",\"访问次数\":9},{\"sys_imp_date\":\"2024-12-09\",\"department\":\"strategy\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-04\",\"department\":\"sales\",\"访问次数\":5},{\"sys_imp_date\":\"2024-12-03\",\"department\":\"marketing\",\"访问次数\":1},{\"sys_imp_date\":\"2024-12-07\",\"department\":\"strategy\",\"访问次数\":4},{\"sys_imp_date\":\"2024-12-04\",\"department\":\"marketing\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-08\",\"department\":\"strategy\",\"访问次数\":4},{\"sys_imp_date\":\"2024-12-08\",\"department\":\"marketing\",\"访问次数\":7},{\"sys_imp_date\":\"2024-12-08\",\"department\":\"sales\",\"访问次数\":9},{\"sys_imp_date\":\"2024-12-04\",\"department\":\"HR\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-06\",\"department\":\"strategy\",\"访问次数\":1},{\"sys_imp_date\":\"2024-12-03\",\"department\":\"HR\",\"访问次数\":4},{\"sys_imp_date\":\"2024-12-06\",\"department\":\"sales\",\"访问次数\":7},{\"sys_imp_date\":\"2024-12-09\",\"department\":\"HR\",\"访问次数\":8},{\"sys_imp_date\":\"2024-12-03\",\"department\":\"strategy\",\"访问次数\":3},{\"sys_imp_date\":\"2024-12-06\",\"department\":\"marketing\",\"访问次数\":8},{\"sys_imp_date\":\"2024-12-08\",\"department\":\"HR\",\"访问次数\":8},{\"sys_imp_date\":\"2024-12-03\",\"department\":\"sales\",\"访问次数\":5},{\"sys_imp_date\":\"2024-12-09\",\"department\":\"marketing\",\"访问次数\":4},{\"sys_imp_date\":\"2024-12-07\",\"department\":\"HR\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-07\",\"department\":\"sales\",\"访问次数\":3}],\"textResult\":\"| date | 部门 | 访问次数 |\\n|:---:|:---:|:---:|\\n| 2024-12-10 | marketing | 2 |\\n| 2024-12-10 | HR | 2 |\\n| 2024-12-10 | sales | 2 |\\n| 2024-12-10 | strategy | 1 |\\n| 2024-12-05 | marketing | 1 |\\n| 2024-12-06 | HR | 6 |\\n| 2024-12-07 | marketing | 8 |\\n| 2024-12-09 | sales | 9 |\\n| 2024-12-09 | strategy | 6 |\\n| 2024-12-04 | sales | 5 |\\n| 2024-12-03 | marketing | 1 |\\n| 2024-12-07 | strategy | 4 |\\n| 2024-12-04 | marketing | 6 |\\n| 2024-12-08 | strategy | 4 |\\n| 2024-12-08 | marketing | 7 |\\n| 2024-12-08 | sales | 9 |\\n| 2024-12-04 | HR | 6 |\\n| 2024-12-06 | strategy | 1 |\\n| 2024-12-03 | HR | 4 |\\n| 2024-12-06 | sales | 7 |\\n| 2024-12-09 | HR | 8 |\\n| 2024-12-03 | strategy | 3 |\\n| 2024-12-06 | marketing | 8 |\\n| 2024-12-08 | HR | 8 |\\n| 2024-12-03 | sales | 5 |\\n| 2024-12-09 | marketing | 4 |\\n| 2024-12-07 | HR | 6 |\\n| 2024-12-07 | sales | 3 |\\n\",\"queryTimeCost\":0,\"recommendedDimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":2,\"name\":\"用户\",\"bizName\":\"user_name\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":0,\"description\":\"用户\",\"extInfo\":{\"dimension_type\":\"primary_key\"},\"partitionTime\":false,\"primaryKey\":true,\"partitionTimeFormat\":\"\"}],\"aggregateInfo\":{\"metricInfos\":[]}}', 0, '', '', '{\"parseStartTime\":1733795214978,\"parseTime\":860,\"sqlTime\":0}');
INSERT INTO `s2_chat_query` VALUES (3, 1, '2024-12-10 09:46:56', 'alice 停留时长', 'admin', 1, 1, '{\"queryMode\":\"METRIC_FILTER\",\"querySql\":\"SELECT `sys_imp_date`, SUM(`stay_hours`) AS `停留时长` FROM (SELECT `imp_date` AS `sys_imp_date`, `user_name`, `stay_hours` FROM s2_stay_time_statis) AS `t4` WHERE `user_name` = \'alice\' AND `sys_imp_date` >= \'2024-12-03\' AND `sys_imp_date` <= \'2024-12-10\' GROUP BY `sys_imp_date` LIMIT 200\",\"queryState\":\"SUCCESS\",\"queryColumns\":[{\"name\":\"date\",\"type\":\"VARCHAR\",\"nameEn\":\"sys_imp_date\",\"showType\":\"DATE\",\"authorized\":true},{\"name\":\"停留时长\",\"type\":\"DOUBLE\",\"nameEn\":\"停留时长\",\"showType\":\"NUMBER\",\"authorized\":true}],\"chatContext\":{\"id\":1,\"queryMode\":\"METRIC_FILTER\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":2,\"name\":\"停留时长\",\"bizName\":\"stay_hours\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"停留时长\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[{\"bizName\":\"user_name\",\"name\":\"用户\",\"operator\":\"=\",\"value\":\"alice\",\"elementID\":2}],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":7,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":200,\"score\":9.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":2,\"name\":\"用户\",\"bizName\":\"user_name\",\"useCnt\":0,\"type\":\"VALUE\",\"alias\":[],\"order\":0.0,\"isTag\":0,\"description\":\"用户\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"alice\",\"word\":\"alice\",\"frequency\":1,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":2,\"name\":\"停留时长\",\"bizName\":\"stay_hours\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"停留时长\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"停留时长\",\"word\":\"停留时长\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT sys_imp_date, SUM(停留时长) AS 停留时长 FROM 超音数数据集 WHERE 用户 = \'alice\' AND sys_imp_date >= \'2024-12-03\' AND sys_imp_date <= \'2024-12-10\' GROUP BY sys_imp_date LIMIT 200\",\"correctedS2SQL\":\"SELECT 数据日期, SUM(停留时长) AS 停留时长 FROM 超音数数据集 WHERE 用户 = \'alice\' AND 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期 LIMIT 200\",\"querySQL\":\"SELECT `sys_imp_date`, SUM(`stay_hours`) AS `停留时长`\\r\\nFROM\\r\\n(SELECT `imp_date` AS `sys_imp_date`, `user_name`, `stay_hours`\\r\\nFROM\\r\\ns2_stay_time_statis) AS `t4`\\r\\nWHERE `user_name` = \'alice\' AND `sys_imp_date` >= \'2024-12-03\' AND `sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `sys_imp_date`\\r\\nLIMIT 200\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 停留时长 **数据时间:** 2024-12-03~2024-12-10  **筛选条件:** 用户 = alice \",\"properties\":{},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500},\"queryResults\":[{\"sys_imp_date\":\"2024-12-06\",\"停留时长\":3.7790223355266317},{\"sys_imp_date\":\"2024-12-04\",\"停留时长\":1.5120376931855422},{\"sys_imp_date\":\"2024-12-08\",\"停留时长\":0.9796159603778489},{\"sys_imp_date\":\"2024-12-07\",\"停留时长\":0.8654528466186735},{\"sys_imp_date\":\"2024-12-03\",\"停留时长\":0.5963801306980994},{\"sys_imp_date\":\"2024-12-09\",\"停留时长\":0.6705580511822682}],\"textResult\":\"| date | 停留时长 |\\n|:---:|:---:|\\n| 2024-12-06 | 3.7790223355266317 |\\n| 2024-12-04 | 1.5120376931855422 |\\n| 2024-12-08 | 0.9796159603778489 |\\n| 2024-12-07 | 0.8654528466186735 |\\n| 2024-12-03 | 0.5963801306980994 |\\n| 2024-12-09 | 0.6705580511822682 |\\n\",\"queryTimeCost\":0,\"recommendedDimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":2,\"name\":\"用户\",\"bizName\":\"user_name\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":0,\"description\":\"用户\",\"extInfo\":{\"dimension_type\":\"primary_key\"},\"partitionTime\":false,\"primaryKey\":true,\"partitionTimeFormat\":\"\"}],\"aggregateInfo\":{\"metricInfos\":[]}}', 0, '', '', '{\"parseStartTime\":1733795216174,\"parseTime\":789,\"sqlTime\":0}');
INSERT INTO `s2_chat_query` VALUES (4, 1, '2024-12-10 09:46:58', '访问次数最高的部门', 'admin', 0, 1, '{\"queryMode\":\"METRIC_ORDERBY\",\"querySql\":\"SELECT `sys_imp_date`, `department`, SUM(`pv`) AS `访问次数` FROM (SELECT `t6`.`sys_imp_date`, `t5`.`department`, `t6`.`s2_pv_uv_statis_pv` AS `pv` FROM (SELECT `user_name`, `department` FROM s2_user_department) AS `t5` LEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name` FROM s2_pv_uv_statis) AS `t6` ON `t5`.`user_name` = `t6`.`user_name`) AS `t7` WHERE `t7`.`sys_imp_date` >= \'2024-12-03\' AND `t7`.`sys_imp_date` <= \'2024-12-10\' GROUP BY `sys_imp_date`, `department` ORDER BY 3 DESC LIMIT 200\",\"queryState\":\"SUCCESS\",\"queryColumns\":[{\"name\":\"date\",\"type\":\"VARCHAR\",\"nameEn\":\"sys_imp_date\",\"showType\":\"DATE\",\"authorized\":true},{\"name\":\"部门\",\"type\":\"VARCHAR\",\"nameEn\":\"department\",\"showType\":\"CATEGORY\",\"authorized\":true},{\"name\":\"访问次数\",\"type\":\"DECIMAL\",\"nameEn\":\"访问次数\",\"showType\":\"NUMBER\",\"authorized\":true}],\"chatContext\":{\"id\":1,\"queryMode\":\"METRIC_ORDERBY\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"aggType\":\"SUM\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[{\"column\":\"访问次数\",\"direction\":\"DESC\"}],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":7,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":200,\"score\":8.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"部门\",\"word\":\"部门\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.011519511093787238,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"},\"offset\":0.0,\"similarity\":0.9884804889062128,\"detectWord\":\"数最高的\",\"word\":\"数据日期\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT sys_imp_date, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE sys_imp_date >= \'2024-12-03\' AND sys_imp_date <= \'2024-12-10\' GROUP BY sys_imp_date, 部门 ORDER BY 访问次数 DESC LIMIT 200\",\"correctedS2SQL\":\"SELECT 数据日期, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期, 部门 ORDER BY SUM(访问次数) DESC LIMIT 200\",\"querySQL\":\"SELECT `sys_imp_date`, `department`, SUM(`pv`) AS `访问次数`\\r\\nFROM\\r\\n(SELECT `t6`.`sys_imp_date`, `t5`.`department`, `t6`.`s2_pv_uv_statis_pv` AS `pv`\\r\\nFROM\\r\\n(SELECT `user_name`, `department`\\r\\nFROM\\r\\ns2_user_department) AS `t5`\\r\\nLEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t6` ON `t5`.`user_name` = `t6`.`user_name`) AS `t7`\\r\\nWHERE `t7`.`sys_imp_date` >= \'2024-12-03\' AND `t7`.`sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `sys_imp_date`, `department`\\r\\nORDER BY 3 DESC\\r\\nLIMIT 200\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"entityInfo\":{\"dataSetInfo\":{\"itemId\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\"},\"dimensions\":[],\"metrics\":[]},\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数 **维度:** 部门 **数据时间:** 2024-12-03~2024-12-10 \",\"properties\":{},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500},\"queryResults\":[{\"sys_imp_date\":\"2024-12-08\",\"department\":\"sales\",\"访问次数\":9},{\"sys_imp_date\":\"2024-12-09\",\"department\":\"sales\",\"访问次数\":9},{\"sys_imp_date\":\"2024-12-06\",\"department\":\"marketing\",\"访问次数\":8},{\"sys_imp_date\":\"2024-12-09\",\"department\":\"HR\",\"访问次数\":8},{\"sys_imp_date\":\"2024-12-07\",\"department\":\"marketing\",\"访问次数\":8},{\"sys_imp_date\":\"2024-12-08\",\"department\":\"HR\",\"访问次数\":8},{\"sys_imp_date\":\"2024-12-08\",\"department\":\"marketing\",\"访问次数\":7},{\"sys_imp_date\":\"2024-12-06\",\"department\":\"sales\",\"访问次数\":7},{\"sys_imp_date\":\"2024-12-06\",\"department\":\"HR\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-09\",\"department\":\"strategy\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-04\",\"department\":\"marketing\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-04\",\"department\":\"HR\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-07\",\"department\":\"HR\",\"访问次数\":6},{\"sys_imp_date\":\"2024-12-03\",\"department\":\"sales\",\"访问次数\":5},{\"sys_imp_date\":\"2024-12-04\",\"department\":\"sales\",\"访问次数\":5},{\"sys_imp_date\":\"2024-12-07\",\"department\":\"strategy\",\"访问次数\":4},{\"sys_imp_date\":\"2024-12-08\",\"department\":\"strategy\",\"访问次数\":4},{\"sys_imp_date\":\"2024-12-09\",\"department\":\"marketing\",\"访问次数\":4},{\"sys_imp_date\":\"2024-12-03\",\"department\":\"HR\",\"访问次数\":4},{\"sys_imp_date\":\"2024-12-07\",\"department\":\"sales\",\"访问次数\":3},{\"sys_imp_date\":\"2024-12-03\",\"department\":\"strategy\",\"访问次数\":3},{\"sys_imp_date\":\"2024-12-10\",\"department\":\"sales\",\"访问次数\":2},{\"sys_imp_date\":\"2024-12-10\",\"department\":\"HR\",\"访问次数\":2},{\"sys_imp_date\":\"2024-12-10\",\"department\":\"marketing\",\"访问次数\":2},{\"sys_imp_date\":\"2024-12-06\",\"department\":\"strategy\",\"访问次数\":1},{\"sys_imp_date\":\"2024-12-03\",\"department\":\"marketing\",\"访问次数\":1},{\"sys_imp_date\":\"2024-12-05\",\"department\":\"marketing\",\"访问次数\":1},{\"sys_imp_date\":\"2024-12-10\",\"department\":\"strategy\",\"访问次数\":1}],\"textResult\":\"| date | 部门 | 访问次数 |\\n|:---:|:---:|:---:|\\n| 2024-12-08 | sales | 9 |\\n| 2024-12-09 | sales | 9 |\\n| 2024-12-06 | marketing | 8 |\\n| 2024-12-09 | HR | 8 |\\n| 2024-12-07 | marketing | 8 |\\n| 2024-12-08 | HR | 8 |\\n| 2024-12-08 | marketing | 7 |\\n| 2024-12-06 | sales | 7 |\\n| 2024-12-06 | HR | 6 |\\n| 2024-12-09 | strategy | 6 |\\n| 2024-12-04 | marketing | 6 |\\n| 2024-12-04 | HR | 6 |\\n| 2024-12-07 | HR | 6 |\\n| 2024-12-03 | sales | 5 |\\n| 2024-12-04 | sales | 5 |\\n| 2024-12-07 | strategy | 4 |\\n| 2024-12-08 | strategy | 4 |\\n| 2024-12-09 | marketing | 4 |\\n| 2024-12-03 | HR | 4 |\\n| 2024-12-07 | sales | 3 |\\n| 2024-12-03 | strategy | 3 |\\n| 2024-12-10 | sales | 2 |\\n| 2024-12-10 | HR | 2 |\\n| 2024-12-10 | marketing | 2 |\\n| 2024-12-06 | strategy | 1 |\\n| 2024-12-03 | marketing | 1 |\\n| 2024-12-05 | marketing | 1 |\\n| 2024-12-10 | strategy | 1 |\\n\",\"queryTimeCost\":0,\"recommendedDimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":2,\"name\":\"用户\",\"bizName\":\"user_name\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":0,\"description\":\"用户\",\"extInfo\":{\"dimension_type\":\"primary_key\"},\"partitionTime\":false,\"primaryKey\":true,\"partitionTimeFormat\":\"\"}],\"aggregateInfo\":{\"metricInfos\":[]}}', 5, '', '', '{\"parseStartTime\":1733795217231,\"parseTime\":823,\"sqlTime\":0}');
INSERT INTO `s2_chat_query` VALUES (5, 1, '2024-12-10 10:00:30', '访问次数最高的部门', 'admin', 0, 1, '{\"queryMode\":\"LLM_S2SQL\",\"querySql\":\"SELECT `department`, SUM(`pv`) FROM (SELECT `t7`.`sys_imp_date`, `t6`.`department`, `t7`.`s2_pv_uv_statis_pv` AS `pv` FROM (SELECT `user_name`, `department` FROM s2_user_department) AS `t6` LEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name` FROM s2_pv_uv_statis) AS `t7` ON `t6`.`user_name` = `t7`.`user_name`) AS `t8` WHERE `t8`.`sys_imp_date` >= \'2024-12-09\' AND `t8`.`sys_imp_date` <= \'2024-12-09\' GROUP BY `department` ORDER BY 2 DESC LIMIT 1\",\"queryState\":\"SUCCESS\",\"queryColumns\":[{\"name\":\"部门\",\"type\":\"VARCHAR\",\"nameEn\":\"department\",\"showType\":\"CATEGORY\",\"authorized\":true},{\"name\":\"访问次数\",\"type\":\"DECIMAL\",\"nameEn\":\"SUM(`pv`)\",\"showType\":\"NUMBER\",\"authorized\":true}],\"chatContext\":{\"id\":1,\"queryMode\":\"LLM_S2SQL\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-09\",\"endDate\":\"2024-12-09\",\"dateList\":[\"2024-12-09\"],\"unit\":1,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":500,\"score\":18.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"部门\",\"word\":\"部门\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.011519511093787238,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"},\"offset\":0.0,\"similarity\":0.9884804889062128,\"detectWord\":\"数最高的\",\"word\":\"数据日期\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT 部门 FROM 超音数数据集 GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\",\"correctedS2SQL\":\"SELECT 部门, SUM(访问次数) FROM 超音数数据集 WHERE (数据日期 >= \'2024-12-09\' AND 数据日期 <= \'2024-12-09\') GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\",\"querySQL\":\"SELECT `department`, SUM(`pv`)\\r\\nFROM\\r\\n(SELECT `t7`.`sys_imp_date`, `t6`.`department`, `t7`.`s2_pv_uv_statis_pv` AS `pv`\\r\\nFROM\\r\\n(SELECT `user_name`, `department`\\r\\nFROM\\r\\ns2_user_department) AS `t6`\\r\\nLEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t7` ON `t6`.`user_name` = `t7`.`user_name`) AS `t8`\\r\\nWHERE `t8`.`sys_imp_date` >= \'2024-12-09\' AND `t8`.`sys_imp_date` <= \'2024-12-09\'\\r\\nGROUP BY `department`\\r\\nORDER BY 2 DESC\\r\\nLIMIT 1\"},\"sqlEvaluation\":{},\"queryType\":\"DETAIL\",\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数 **维度:** 部门 **数据时间:** 2024-12-09~2024-12-09 \",\"properties\":{\"sql_exemplar\":{\"dbSchema\":\"DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]\",\"question\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"sql\":\"SELECT 部门 FROM 超音数数据集 GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\"},\"type\":\"internal\",\"CONTEXT\":{\"llmReq\":{\"schema\":{\"databaseType\":\"mysql\",\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"values\":[],\"metrics\":[{\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"一段时间内用户的访问次数\",\"type\":\"METRIC\",\"isTag\":0,\"extInfo\":{},\"defaultAgg\":\"SUM\",\"dataSetId\":1,\"partitionTimeFormat\":\"\",\"bizName\":\"pv\",\"name\":\"访问次数\",\"alias\":[],\"model\":2,\"id\":1,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":false}],\"fieldNameList\":[\"访问次数\",\"部门\",\"数据日期\",\"数据日期\",\"用户\"],\"partitionTime\":{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":0,\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"dataSetId\":1,\"partitionTimeFormat\":\"yyyy-MM-dd\",\"bizName\":\"imp_date\",\"timeFormat\":\"yyyy-MM-dd\",\"name\":\"数据日期\",\"alias\":[],\"model\":3,\"id\":3,\"partitionTime\":true,\"order\":0.0,\"primaryKey\":false},\"dimensions\":[{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":1,\"extInfo\":{\"dimension_type\":\"categorical\"},\"dataSetId\":1,\"partitionTimeFormat\":\"\",\"bizName\":\"department\",\"name\":\"部门\",\"alias\":[],\"model\":1,\"id\":1,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":false},{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":0,\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"dataSetId\":1,\"partitionTimeFormat\":\"yyyy-MM-dd\",\"bizName\":\"imp_date\",\"timeFormat\":\"yyyy-MM-dd\",\"name\":\"数据日期\",\"alias\":[],\"model\":3,\"id\":3,\"partitionTime\":true,\"order\":0.011519511093787238,\"primaryKey\":false}],\"primaryKey\":{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"用户\",\"type\":\"DIMENSION\",\"isTag\":0,\"extInfo\":{\"dimension_type\":\"primary_key\"},\"dataSetId\":1,\"partitionTimeFormat\":\"\",\"bizName\":\"user_name\",\"name\":\"用户\",\"alias\":[],\"model\":1,\"id\":2,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":true}},\"terms\":[],\"dynamicExemplars\":[{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"question\":\"超音数本月pv最高的用户有哪些\",\"sideInfo\":\"CurrentDate=[2023-08-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-08-01\' AND 数据日期 <= \'2023-08-31\' ORDER BY 访问次数 DESC LIMIT 1\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"},{\"dbSchema\":\"DatabaseType=[h2], Table:[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics:[<访问时长 COMMENT \'一段时间内用户的访问时长\' AGGREGATE \'SUM\'>], Dimensions:[<用户>,<数据日期>], Values:[<部门=\'美术部\'>]\",\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate=[2023-07-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 = \'美术部\' AND 访问时长 < 1\"}],\"sqlGenType\":\"1_pass_self_consistency\",\"queryText\":\"访问次数最高的部门\",\"currentDate\":\"2024-12-10\",\"chatAppConfig\":{\"MEMORY_REVIEW\":{\"enable\":false,\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),comment=(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \"},\"REWRITE_MULTI_TURN\":{\"enable\":false,\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \"},\"S2SQL_CORRECTOR\":{\"enable\":false,\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),sql=(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\"},\"SMALL_TALK\":{\"enable\":false,\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"chatModelId\":1,\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \"},\"DATA_INTERPRETER\":{\"enable\":false,\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\"},\"S2SQL_PARSER\":{\"enable\":true,\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `>`,`<`,`>=`,`<=` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\"},\"REWRITE_ERROR_MESSAGE\":{\"enable\":false,\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \"}}},\"dataSetId\":1,\"llmResp\":{\"schema\":\"DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]\",\"sqlOutput\":\"SELECT 部门 FROM 超音数数据集 GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\",\"query\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"sqlRespMap\":{\"SELECT 部门 FROM 超音数数据集 GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1\":{\"fewShots\":[{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"question\":\"超音数本月pv最高的用户有哪些\",\"sideInfo\":\"CurrentDate=[2023-08-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-08-01\' AND 数据日期 <= \'2023-08-31\' ORDER BY 访问次数 DESC LIMIT 1\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"},{\"dbSchema\":\"DatabaseType=[h2], Table:[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics:[<访问时长 COMMENT \'一段时间内用户的访问时长\' AGGREGATE \'SUM\'>], Dimensions:[<用户>,<数据日期>], Values:[<部门=\'美术部\'>]\",\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate=[2023-07-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 = \'美术部\' AND 访问时长 < 1\"}],\"sqlWeight\":1.0}},\"dataSet\":\"超音数数据集\"}}},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500},\"queryResults\":[{\"department\":\"sales\",\"SUM(`pv`)\":9}],\"textResult\":\"| 部门 | 访问次数 |\\n|:---:|:---:|\\n| sales | 9 |\\n\",\"queryTimeCost\":0}', 0, '', '[]', '{\"parseStartTime\":1733796030610,\"parseTime\":2794,\"sqlTime\":189}');
INSERT INTO `s2_chat_query` VALUES (6, 1, '2024-12-10 10:03:32', '访问次数最高的部门', 'admin', 1, 1, '{\"queryMode\":\"LLM_S2SQL\",\"querySql\":\"SELECT `department`, SUM(`pv`) AS `访问次数` FROM (SELECT `t7`.`sys_imp_date`, `t6`.`department`, `t7`.`s2_pv_uv_statis_pv` AS `pv` FROM (SELECT `user_name`, `department` FROM s2_user_department) AS `t6` LEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name` FROM s2_pv_uv_statis) AS `t7` ON `t6`.`user_name` = `t7`.`user_name`) AS `t8` WHERE `t8`.`sys_imp_date` >= \'2024-12-03\' AND `t8`.`sys_imp_date` <= \'2024-12-10\' GROUP BY `department` ORDER BY 2 DESC LIMIT 1\",\"queryState\":\"SUCCESS\",\"queryColumns\":[{\"name\":\"部门\",\"type\":\"VARCHAR\",\"nameEn\":\"department\",\"showType\":\"CATEGORY\",\"authorized\":true},{\"name\":\"访问次数\",\"type\":\"DECIMAL\",\"nameEn\":\"访问次数\",\"showType\":\"NUMBER\",\"authorized\":true}],\"chatContext\":{\"id\":1,\"queryMode\":\"LLM_S2SQL\",\"dataSet\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"id\":1,\"name\":\"超音数数据集\",\"bizName\":\"s2\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"dimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[],\"metricFilters\":[],\"orders\":[],\"dateInfo\":{\"dateMode\":\"BETWEEN\",\"startDate\":\"2024-12-03\",\"endDate\":\"2024-12-10\",\"dateList\":[\"2024-12-03\",\"2024-12-04\",\"2024-12-05\",\"2024-12-06\",\"2024-12-07\",\"2024-12-08\",\"2024-12-09\",\"2024-12-10\"],\"unit\":1,\"period\":\"DAY\",\"groupByDate\":false,\"inherited\":false,\"groupByTimeDimension\":\"sys_imp_date\"},\"limit\":500,\"score\":18.0,\"elementMatches\":[{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"部门\",\"word\":\"部门\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":2,\"id\":1,\"name\":\"访问次数\",\"bizName\":\"pv\",\"useCnt\":0,\"type\":\"METRIC\",\"alias\":[],\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"defaultAgg\":\"SUM\",\"order\":0.0,\"isTag\":0,\"description\":\"一段时间内用户的访问次数\",\"extInfo\":{},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"访问次数\",\"word\":\"访问次数\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":true},{\"element\":{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":3,\"id\":3,\"name\":\"数据日期\",\"bizName\":\"imp_date\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.011519511093787238,\"isTag\":0,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"partitionTime\":true,\"timeFormat\":\"yyyy-MM-dd\",\"primaryKey\":false,\"partitionTimeFormat\":\"yyyy-MM-dd\"},\"offset\":0.0,\"similarity\":0.9884804889062128,\"detectWord\":\"数最高的\",\"word\":\"数据日期\",\"frequency\":100000,\"inherited\":false,\"fullMatched\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\",\"correctedS2SQL\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 WHERE (数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\') GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\",\"querySQL\":\"SELECT `department`, SUM(`pv`) AS `访问次数`\\r\\nFROM\\r\\n(SELECT `t7`.`sys_imp_date`, `t6`.`department`, `t7`.`s2_pv_uv_statis_pv` AS `pv`\\r\\nFROM\\r\\n(SELECT `user_name`, `department`\\r\\nFROM\\r\\ns2_user_department) AS `t6`\\r\\nLEFT JOIN (SELECT 1 AS `s2_pv_uv_statis_pv`, `imp_date` AS `sys_imp_date`, `user_name`\\r\\nFROM\\r\\ns2_pv_uv_statis) AS `t7` ON `t6`.`user_name` = `t7`.`user_name`) AS `t8`\\r\\nWHERE `t8`.`sys_imp_date` >= \'2024-12-03\' AND `t8`.`sys_imp_date` <= \'2024-12-10\'\\r\\nGROUP BY `department`\\r\\nORDER BY 2 DESC\\r\\nLIMIT 1\"},\"sqlEvaluation\":{},\"queryType\":\"AGGREGATE\",\"textInfo\":\"**数据集:** 超音数数据集  **指标:** 访问次数 **维度:** 部门 **数据时间:** 2024-12-03~2024-12-10 \",\"properties\":{\"sql_exemplar\":{\"dbSchema\":\"DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]\",\"question\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"sql\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\"},\"type\":\"internal\",\"CONTEXT\":{\"llmReq\":{\"schema\":{\"databaseType\":\"mysql\",\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"values\":[],\"metrics\":[{\"relatedSchemaElements\":[{\"dimensionId\":1,\"necessary\":false},{\"dimensionId\":2,\"necessary\":false}],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"一段时间内用户的访问次数\",\"type\":\"METRIC\",\"isTag\":0,\"extInfo\":{},\"defaultAgg\":\"SUM\",\"dataSetId\":1,\"partitionTimeFormat\":\"\",\"bizName\":\"pv\",\"name\":\"访问次数\",\"alias\":[],\"model\":2,\"id\":1,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":false}],\"fieldNameList\":[\"访问次数\",\"部门\",\"数据日期\",\"数据日期\",\"用户\"],\"partitionTime\":{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":0,\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"dataSetId\":1,\"partitionTimeFormat\":\"yyyy-MM-dd\",\"bizName\":\"imp_date\",\"timeFormat\":\"yyyy-MM-dd\",\"name\":\"数据日期\",\"alias\":[],\"model\":3,\"id\":3,\"partitionTime\":true,\"order\":0.0,\"primaryKey\":false},\"dimensions\":[{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":1,\"extInfo\":{\"dimension_type\":\"categorical\"},\"dataSetId\":1,\"partitionTimeFormat\":\"\",\"bizName\":\"department\",\"name\":\"部门\",\"alias\":[],\"model\":1,\"id\":1,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":false},{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":0,\"extInfo\":{\"dimension_type\":\"partition_time\",\"time_format\":\"yyyy-MM-dd\"},\"dataSetId\":1,\"partitionTimeFormat\":\"yyyy-MM-dd\",\"bizName\":\"imp_date\",\"timeFormat\":\"yyyy-MM-dd\",\"name\":\"数据日期\",\"alias\":[],\"model\":3,\"id\":3,\"partitionTime\":true,\"order\":0.011519511093787238,\"primaryKey\":false}],\"primaryKey\":{\"schemaValueMaps\":[],\"dataSetName\":\"超音数数据集\",\"useCnt\":0,\"description\":\"用户\",\"type\":\"DIMENSION\",\"isTag\":0,\"extInfo\":{\"dimension_type\":\"primary_key\"},\"dataSetId\":1,\"partitionTimeFormat\":\"\",\"bizName\":\"user_name\",\"name\":\"用户\",\"alias\":[],\"model\":1,\"id\":2,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":true}},\"terms\":[],\"dynamicExemplars\":[{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"过去半个月核心用户的访问次数\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<核心用户 COMMENT \'用户为alice\'>]\",\"sql\":\"SELECT 用户,SUM(访问次数) FROM 超音数产品 WHERE 用户=\'alice\' AND 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<数据日期>], Values[<用户=\'jackjchen\'>,<用户=\'robinlee\'>]\",\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate=[2020-12-01],DomainTerms=[<核心用户 COMMENT \'核心用户指tom和lucy\'>]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\'jackjchen\', \'robinlee\') AND 数据日期 >= \'2020-01-01\' AND 数据日期 <= \'2020-12-01\'\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"}],\"sqlGenType\":\"1_pass_self_consistency\",\"queryText\":\"访问次数最高的部门\",\"currentDate\":\"2024-12-10\",\"chatAppConfig\":{\"MEMORY_REVIEW\":{\"enable\":false,\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),comment=(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \"},\"REWRITE_MULTI_TURN\":{\"enable\":false,\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \"},\"S2SQL_CORRECTOR\":{\"enable\":false,\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),sql=(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\"},\"SMALL_TALK\":{\"enable\":false,\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"chatModelId\":1,\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \"},\"DATA_INTERPRETER\":{\"enable\":false,\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\"},\"S2SQL_PARSER\":{\"enable\":true,\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `>`,`<`,`>=`,`<=` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\"},\"REWRITE_ERROR_MESSAGE\":{\"enable\":false,\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \"}}},\"dataSetId\":1,\"llmResp\":{\"schema\":\"DatabaseType=[mysql], Table=[超音数数据集], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], PrimaryKeyField=[用户], Metrics=[<访问次数 COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期 FORMAT \'yyyy-MM-dd\'>], Values=[]\",\"sqlOutput\":\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\",\"query\":\"访问次数最高的部门\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"sqlRespMap\":{\"SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1\":{\"fewShots\":[{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"过去半个月核心用户的访问次数\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<核心用户 COMMENT \'用户为alice\'>]\",\"sql\":\"SELECT 用户,SUM(访问次数) FROM 超音数产品 WHERE 用户=\'alice\' AND 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<数据日期>], Values[<用户=\'jackjchen\'>,<用户=\'robinlee\'>]\",\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate=[2020-12-01],DomainTerms=[<核心用户 COMMENT \'核心用户指tom和lucy\'>]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\'jackjchen\', \'robinlee\') AND 数据日期 >= \'2020-01-01\' AND 数据日期 <= \'2020-12-01\'\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"}],\"sqlWeight\":1.0}},\"dataSet\":\"超音数数据集\"}}},\"dataSetId\":1,\"metricLimit\":200,\"detailLimit\":500},\"queryResults\":[{\"department\":\"HR\",\"访问次数\":40}],\"textResult\":\"| 部门 | 访问次数 |\\n|:---:|:---:|\\n| HR | 40 |\\n\",\"queryTimeCost\":0,\"recommendedDimensions\":[{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":1,\"name\":\"部门\",\"bizName\":\"department\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"primaryKey\":false,\"partitionTimeFormat\":\"\"},{\"dataSetId\":1,\"dataSetName\":\"超音数数据集\",\"model\":1,\"id\":2,\"name\":\"用户\",\"bizName\":\"user_name\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":0,\"description\":\"用户\",\"extInfo\":{\"dimension_type\":\"primary_key\"},\"partitionTime\":false,\"primaryKey\":true,\"partitionTimeFormat\":\"\"}],\"aggregateInfo\":{\"metricInfos\":[]}}', 0, '', '', '{\"parseStartTime\":1733796212486,\"parseTime\":2466,\"sqlTime\":151}');
INSERT INTO `s2_chat_query` VALUES (7, 2, '2024-12-10 10:51:13', '国风流派歌手', 'admin', 1, 2, '{\"queryMode\":\"LLM_S2SQL\",\"querySql\":\"SELECT `genre` FROM (SELECT `genre`, `singer_name` AS `singer_internal_cnt` FROM singer) AS `t2` WHERE `genre` = \'国风\' limit 1000\",\"queryState\":\"SUCCESS\",\"queryColumns\":[{\"name\":\"流派\",\"type\":\"VARCHAR\",\"nameEn\":\"genre\",\"showType\":\"CATEGORY\",\"authorized\":true}],\"chatContext\":{\"id\":1,\"queryMode\":\"LLM_S2SQL\",\"dataSet\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"id\":2,\"name\":\"歌手库数据集\",\"bizName\":\"singer\",\"type\":\"DATASET\",\"order\":0.0,\"isTag\":0,\"extInfo\":{},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":false},\"queryConfig\":{\"detailTypeDefaultConfig\":{\"defaultDisplayInfo\":{\"dimensionIds\":[5,6,7,8],\"metricIds\":[5]},\"timeDefaultConfig\":{\"unit\":1,\"period\":\"DAY\",\"timeMode\":\"LAST\"},\"limit\":500},\"aggregateTypeDefaultConfig\":{\"timeDefaultConfig\":{\"unit\":7,\"period\":\"DAY\",\"timeMode\":\"RECENT\"},\"limit\":200}},\"metrics\":[],\"dimensions\":[{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":false}],\"aggType\":\"NONE\",\"filterType\":\"AND\",\"dimensionFilters\":[{\"bizName\":\"genre\",\"name\":\"流派\",\"operator\":\"=\",\"value\":\"国风\",\"elementID\":7}],\"metricFilters\":[],\"orders\":[],\"limit\":500,\"score\":12.0,\"elementMatches\":[{\"element\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"DIMENSION\",\"alias\":[],\"schemaValueMaps\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{\"dimension_type\":\"categorical\"},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":false},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"流派\",\"word\":\"流派\",\"frequency\":100000,\"fullMatched\":true,\"inherited\":false},{\"element\":{\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"model\":4,\"id\":7,\"name\":\"流派\",\"bizName\":\"genre\",\"useCnt\":0,\"type\":\"VALUE\",\"alias\":[],\"order\":0.0,\"isTag\":1,\"description\":\"\",\"extInfo\":{},\"partitionTime\":false,\"partitionTimeFormat\":\"\",\"primaryKey\":false},\"offset\":0.0,\"similarity\":1.0,\"detectWord\":\"国风\",\"word\":\"国风\",\"frequency\":2,\"fullMatched\":true,\"inherited\":false}],\"sqlInfo\":{\"parsedS2SQL\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\",\"correctedS2SQL\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\",\"querySQL\":\"SELECT `genre`\\r\\nFROM\\r\\n(SELECT `genre`, `singer_name` AS `singer_internal_cnt`\\r\\nFROM\\r\\nsinger) AS `t2`\\r\\nWHERE `genre` = \'国风\' limit 1000\"},\"sqlEvaluation\":{},\"queryType\":\"DETAIL\",\"textInfo\":\"**数据集:** 歌手库数据集  **维度:** 流派 **筛选条件:** 流派 = 国风 \",\"properties\":{\"sql_exemplar\":{\"dbSchema\":\"DatabaseType=[mysql], Table=[歌手库数据集], PartitionTimeField=[], PrimaryKeyField=[歌手名], Metrics=[], Dimensions=[<流派>], Values=[<流派=\'国风\'>]\",\"question\":\"国风流派歌手\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"sql\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\"},\"type\":\"internal\",\"CONTEXT\":{\"llmReq\":{\"schema\":{\"databaseType\":\"mysql\",\"dataSetId\":2,\"dataSetName\":\"歌手库数据集\",\"values\":[{\"fieldName\":\"流派\",\"fieldValue\":\"国风\"}],\"metrics\":[],\"fieldNameList\":[\"流派\",\"歌手名\"],\"dimensions\":[{\"schemaValueMaps\":[],\"dataSetName\":\"歌手库数据集\",\"useCnt\":0,\"description\":\"\",\"type\":\"DIMENSION\",\"isTag\":1,\"extInfo\":{\"dimension_type\":\"categorical\"},\"dataSetId\":2,\"partitionTimeFormat\":\"\",\"bizName\":\"genre\",\"name\":\"流派\",\"alias\":[],\"model\":4,\"id\":7,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":false}],\"primaryKey\":{\"schemaValueMaps\":[],\"dataSetName\":\"歌手库数据集\",\"useCnt\":0,\"description\":\"歌手名\",\"type\":\"DIMENSION\",\"isTag\":1,\"extInfo\":{\"dimension_type\":\"primary_key\"},\"dataSetId\":2,\"partitionTimeFormat\":\"\",\"bizName\":\"singer_name\",\"name\":\"歌手名\",\"alias\":[],\"model\":4,\"id\":8,\"partitionTime\":false,\"order\":0.0,\"primaryKey\":true}},\"terms\":[],\"dynamicExemplars\":[{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"},{\"dbSchema\":\"DatabaseType=[h2], Table:[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics:[<访问时长 COMMENT \'一段时间内用户的访问时长\' AGGREGATE \'SUM\'>], Dimensions:[<用户>,<数据日期>], Values:[<部门=\'美术部\'>]\",\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate=[2023-07-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 = \'美术部\' AND 访问时长 < 1\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<数据日期>], Values[<用户=\'jackjchen\'>,<用户=\'robinlee\'>]\",\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate=[2020-12-01],DomainTerms=[<核心用户 COMMENT \'核心用户指tom和lucy\'>]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\'jackjchen\', \'robinlee\') AND 数据日期 >= \'2020-01-01\' AND 数据日期 <= \'2020-12-01\'\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"}],\"sqlGenType\":\"1_pass_self_consistency\",\"queryText\":\"国风流派歌手\",\"currentDate\":\"2024-12-10\",\"chatAppConfig\":{\"MEMORY_REVIEW\":{\"enable\":false,\"name\":\"记忆启用评估\",\"description\":\"通过大模型对记忆做正确性评估以决定是否启用\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and give your opinion.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),comment=(your comment)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n#Question: %s\\n#Schema: %s\\n#SideInfo: %s\\n#SQL: %s\\n#Response: \"},\"REWRITE_MULTI_TURN\":{\"enable\":false,\"name\":\"多轮对话改写\",\"description\":\"通过大模型根据历史对话来改写本轮对话\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data product manager experienced in data requirements.#Task: Your will be provided with current and history questions asked by a user,along with their mapped schema elements(metric, dimension and value),please try understanding the semantics and rewrite a question.#Rules: 1.ALWAYS keep relevant entities, metrics, dimensions, values and date ranges.2.ONLY respond with the rewritten question.#Current Question: {{current_question}}#Current Mapped Schema: {{current_schema}}#History Question: {{history_question}}#History Mapped Schema: {{history_schema}}#History SQL: {{history_sql}}#Rewritten Question: \"},\"S2SQL_CORRECTOR\":{\"enable\":false,\"name\":\"语义SQL修正\",\"description\":\"通过大模型对解析S2SQL做二次修正\",\"chatModelId\":1,\"prompt\":\"#Role: You are a senior data engineer experienced in writing SQL.\\n#Task: Your will be provided with a user question and the SQL written by a junior engineer,please take a review and help correct it if necessary.\\n#Rules: \\n1.ALWAYS follow the output format: `opinion=(POSITIVE|NEGATIVE),sql=(corrected sql if NEGATIVE; empty string if POSITIVE)`.\\n2.NO NEED to check date filters as the junior engineer seldom makes mistakes in this regard.\\n3.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n4.ALWAYS use `with` statement if nested aggregation is needed.\\n5.ALWAYS enclose alias created by `AS` command in underscores.\\n6.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Question:{{question}} #InputSQL:{{sql}} #Response:\"},\"SMALL_TALK\":{\"enable\":false,\"name\":\"闲聊对话\",\"description\":\"直接将原始输入透传大模型\",\"chatModelId\":1,\"prompt\":\"#Role: You are a nice person to talk to.\\n#Task: Respond quickly and nicely to the user.\\n#Rules: 1.ALWAYS use the same language as the `#Current Input`.\\n#History Inputs: %s\\n#Current Input: %s\\n#Response: \"},\"DATA_INTERPRETER\":{\"enable\":false,\"name\":\"结果数据解读\",\"description\":\"通过大模型对结果数据做提炼总结\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data expert who communicates with business users everyday.\\n#Task: Your will be provided with a question asked by a user and the relevant result data queried from the databases, please interpret the data and organize a brief answer.\\n#Rules: \\n1.ALWAYS respond in the use the same language as the `#Question`.\\n2.ALWAYS reference some key data in the `#Answer`.\\n#Question:{{question}} #Data:{{data}} #Answer:\"},\"S2SQL_PARSER\":{\"enable\":true,\"name\":\"语义SQL解析\",\"description\":\"通过大模型做语义解析生成S2SQL\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data analyst experienced in SQL languages.\\n#Task: You will be provided with a natural language question asked by users,please convert it to a SQL query so that relevant data could be returned by executing the SQL query against underlying database.\\n#Rules:\\n1.ALWAYS generate columns and values specified in the `Schema`, DO NOT hallucinate.\\n2.ALWAYS be cautious, word in the `Schema` does not mean it must appear in the SQL.\\n3.ALWAYS specify date filter using `>`,`<`,`>=`,`<=` operator.\\n4.DO NOT include date filter in the where clause if not explicitly expressed in the `Question`.\\n5.DO NOT calculate date range using functions.\\n6.DO NOT miss the AGGREGATE operator of metrics, always add it as needed.\\n7.ALWAYS use `with` statement if nested aggregation is needed.\\n8.ALWAYS enclose alias created by `AS` command in underscores.\\n9.ALWAYS translate alias created by `AS` command to the same language as the `#Question`.\\n#Exemplars: {{exemplar}}\\n#Query: Question:{{question}},Schema:{{schema}},SideInfo:{{information}}\"},\"REWRITE_ERROR_MESSAGE\":{\"enable\":false,\"name\":\"异常提示改写\",\"description\":\"通过大模型将异常信息改写为更友好和引导性的提示用语\",\"chatModelId\":1,\"prompt\":\"#Role: You are a data business partner who closely interacts with business people.\\n#Task: Your will be provided with user input, system output and some examples, please respond shortly to teach user how to ask the right question, by using `Examples` as references.#Rules: ALWAYS respond with the same language as the `Input`.\\n#Input: {{user_question}}\\n#Output: {{system_message}}\\n#Examples: {{examples}}\\n#Response: \"}}},\"dataSetId\":2,\"llmResp\":{\"schema\":\"DatabaseType=[mysql], Table=[歌手库数据集], PartitionTimeField=[], PrimaryKeyField=[歌手名], Metrics=[], Dimensions=[<流派>], Values=[<流派=\'国风\'>]\",\"sqlOutput\":\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\",\"query\":\"国风流派歌手\",\"sideInfo\":\"CurrentDate=[2024-12-10]\",\"sqlRespMap\":{\"SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\'\":{\"fewShots\":[{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数近12个月访问人数 按部门\",\"sideInfo\":\"CurrentDate=[2022-11-06]\",\"sql\":\"SELECT 部门, 数据日期, 访问人数 FROM 超音数产品 WHERE 数据日期 >= \'2021-11-06\' AND 数据日期 <= \'2022-11-06\'\"},{\"dbSchema\":\"DatabaseType=[h2], Table:[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics:[<访问时长 COMMENT \'一段时间内用户的访问时长\' AGGREGATE \'SUM\'>], Dimensions:[<用户>,<数据日期>], Values:[<部门=\'美术部\'>]\",\"question\":\"超音数访问时长小于1小时，且来自美术部的用户是哪些\",\"sideInfo\":\"CurrentDate=[2023-07-31],DomainTerms=[<核心用户 COMMENT \'用户为tom和lucy\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 部门 = \'美术部\' AND 访问时长 < 1\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>,<访问用户数 ALIAS \'UV,访问人数,\' COMMENT \'访问的用户个数\' AGGREGATE \'COUNT\'>,<人均访问次数 ALIAS \'平均访问次数,\' COMMENT \'每个用户平均访问的次数\'>], Dimensions=[<数据日期>], Values[<用户=\'jackjchen\'>,<用户=\'robinlee\'>]\",\"question\":\"比较jackjchen和robinlee今年以来的访问次数\",\"sideInfo\":\"CurrentDate=[2020-12-01],DomainTerms=[<核心用户 COMMENT \'核心用户指tom和lucy\'>]\",\"sql\":\"SELECT 用户, 访问次数 FROM 超音数产品 WHERE 用户 IN (\'jackjchen\', \'robinlee\') AND 数据日期 >= \'2020-01-01\' AND 数据日期 <= \'2020-12-01\'\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<部门>,<数据日期>], Values=[]\",\"question\":\"超音数访问次数大于1k的部门是哪些\",\"sideInfo\":\"CurrentDate=[2023-09-14]\",\"sql\":\"SELECT 部门 FROM 超音数产品 WHERE 访问次数 > 1000\"},{\"dbSchema\":\"DatabaseType=[h2], Table=[超音数产品], PartitionTimeField=[数据日期 FORMAT \'yyyy-MM-dd\'], Metrics=[<访问次数 ALIAS \'pv\' COMMENT \'一段时间内用户的访问次数\' AGGREGATE \'SUM\'>], Dimensions=[<用户>,<数据日期>], Values=[]\",\"question\":\"过去半个月忠实用户有哪一些\",\"sideInfo\":\"CurrentDate=[2023-09-15],DomainTerms=[<忠实用户 COMMENT \'一段时间内总访问次数大于100的用户\'>]\",\"sql\":\"SELECT 用户 FROM 超音数产品 WHERE 数据日期 >= \'2023-09-01\' AND 数据日期 <= \'2023-09-15\' GROUP BY 用户 HAVING SUM(访问次数) > 100\"}],\"sqlWeight\":1.0}},\"dataSet\":\"歌手库数据集\"}}},\"dataSetId\":2,\"detailLimit\":500,\"metricLimit\":200},\"queryResults\":[{\"genre\":\"国风\"},{\"genre\":\"国风\"}],\"textResult\":\"| 流派 |\\n|:---:|\\n| 国风 |\\n| 国风 |\\n\",\"queryTimeCost\":0}', 0, '', '', '{\"parseStartTime\":1733799075616,\"parseTime\":2070,\"sqlTime\":74}');
INSERT INTO `s2_chat_query` VALUES (8, 3, '2024-12-10 10:52:02', '你是谁', 'admin', 1, 3, '{\"queryMode\":\"PLAIN_TEXT\",\"queryState\":\"SUCCESS\",\"textResult\":\"我是一个友好的聊天助手，很高兴和你交流！你有什么想聊的吗？\"}', 0, '', '', '{\"parseStartTime\":1733799122117,\"parseTime\":29,\"sqlTime\":0}');
INSERT INTO `s2_chat_query` VALUES (9, 3, '2024-12-10 10:52:31', '我是谁', 'admin', 1, 3, '{\"queryMode\":\"PLAIN_TEXT\",\"queryState\":\"SUCCESS\",\"textResult\":\"你是一个独特而特别的人！每个人都有自己的故事和价值。你想聊聊自己吗？\"}', 0, '', '', '{\"parseStartTime\":1733799150543,\"parseTime\":33,\"sqlTime\":0}');
INSERT INTO `s2_chat_query` VALUES (10, 3, '2024-12-10 10:52:41', '嗯 你了解我嘛', 'admin', 1, 3, '{\"queryMode\":\"PLAIN_TEXT\",\"queryState\":\"SUCCESS\",\"textResult\":\"我对你了解不多，但我很乐意听你分享更多！你想聊些什么呢？\"}', 0, '', '', '{\"parseStartTime\":1733799161219,\"parseTime\":31,\"sqlTime\":0}');

-- ----------------------------
-- Table structure for s2_chat_statistics
-- ----------------------------
DROP TABLE IF EXISTS `s2_chat_statistics`;
CREATE TABLE `s2_chat_statistics`  (
  `question_id` bigint NOT NULL,
  `chat_id` bigint NOT NULL,
  `user_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `query_text` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `interface_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cost` int NULL DEFAULT 0,
  `type` int NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `commonIndex`(`question_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_chat_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for s2_collect
-- ----------------------------
DROP TABLE IF EXISTS `s2_collect`;
CREATE TABLE `s2_collect`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `collect_id` bigint NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_collect
-- ----------------------------

-- ----------------------------
-- Table structure for s2_data_set
-- ----------------------------
DROP TABLE IF EXISTS `s2_data_set`;
CREATE TABLE `s2_data_set`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `domain_id` bigint NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `biz_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_set_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `query_config` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `admin` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `admin_org` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_data_set
-- ----------------------------
INSERT INTO `s2_data_set` VALUES (1, 1, '超音数数据集', 's2', '包含超音数访问统计相关的指标和维度等', 1, NULL, '{\"dataSetModelConfigs\":[{\"dimensions\":[1,2],\"id\":1,\"includesAll\":false,\"metrics\":[]},{\"dimensions\":[],\"id\":2,\"includesAll\":false,\"metrics\":[1,3,4]},{\"dimensions\":[3,4],\"id\":3,\"includesAll\":false,\"metrics\":[2]}]}', '2024-12-10 09:46:53', 'admin', '2024-12-10 09:46:53', 'admin', '{\"aggregateTypeDefaultConfig\":{\"limit\":200,\"timeDefaultConfig\":{\"period\":\"DAY\",\"timeMode\":\"RECENT\",\"unit\":7}},\"detailTypeDefaultConfig\":{\"limit\":500,\"timeDefaultConfig\":{\"period\":\"DAY\",\"timeMode\":\"LAST\",\"unit\":1}}}', 'admin', NULL);
INSERT INTO `s2_data_set` VALUES (2, 2, '歌手库数据集', 'singer', '包含歌手相关标签和指标信息', 1, NULL, '{\"dataSetModelConfigs\":[{\"dimensions\":[5,6,7,8],\"id\":4,\"includesAll\":false,\"metrics\":[5,6,7]}]}', '2024-12-10 09:46:59', 'admin', '2024-12-10 09:46:59', 'admin', '{\"aggregateTypeDefaultConfig\":{\"limit\":200,\"timeDefaultConfig\":{\"period\":\"DAY\",\"timeMode\":\"RECENT\",\"unit\":7}},\"detailTypeDefaultConfig\":{\"defaultDisplayInfo\":{\"dimensionIds\":[5,6,7,8],\"metricIds\":[5]},\"limit\":500,\"timeDefaultConfig\":{\"period\":\"DAY\",\"timeMode\":\"LAST\",\"unit\":1}}}', 'admin,jack', NULL);
INSERT INTO `s2_data_set` VALUES (3, 4, '系统公告', 'bus_notice', '移动办公的系统公告', 3, NULL, '{\"dataSetModelConfigs\":[]}', '2024-12-10 13:59:18', 'admin', '2024-12-10 14:00:01', 'admin', '{\"aggregateTypeDefaultConfig\":{\"limit\":200,\"timeDefaultConfig\":{\"period\":\"DAY\",\"timeMode\":\"RECENT\",\"unit\":7}},\"detailTypeDefaultConfig\":{\"limit\":500,\"timeDefaultConfig\":{\"period\":\"DAY\",\"timeMode\":\"LAST\",\"unit\":1}}}', 'admin', NULL);

-- ----------------------------
-- Table structure for s2_database
-- ----------------------------
DROP TABLE IF EXISTS `s2_database`;
CREATE TABLE `s2_database`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '类型 mysql,clickhouse,tdw',
  `config` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '配置信息',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建人',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '更新人',
  `admin` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `viewer` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '数据库实例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_database
-- ----------------------------
INSERT INTO `s2_database` VALUES (1, '自带数据库', '', '5.7', 'mysql', '{\"password\":\"cb23zsm3Y6+09KLi3QmTrQ==\",\"url\":\"jdbc:mysql://localhost:3306/ss?useUnicode=true&characterEncoding=UTF-8&useSSL=false&allowMultiQueries=true\",\"userName\":\"root\"}', '2024-12-10 09:46:49', 'admin', '2024-12-10 11:30:56', 'admin', 'admin', '');
INSERT INTO `s2_database` VALUES (2, '移动办公测试', NULL, '8.0', 'mysql', '{\"password\":\"ByVh2dim2Dx52FhhqIVFKw==\",\"url\":\"jdbc:mysql://192.168.1.56:3316/ch_office?characterEncoding=UTF-8&useUnicode=true&useSSL=false&tinyInt1isBit=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\",\"userName\":\"root\"}', '2024-12-10 14:01:33', 'admin', '2024-12-10 14:10:48', 'admin', 'admin', '');

-- ----------------------------
-- Table structure for s2_dictionary_conf
-- ----------------------------
DROP TABLE IF EXISTS `s2_dictionary_conf`;
CREATE TABLE `s2_dictionary_conf`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `item_id` int NOT NULL,
  `config` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_dictionary_conf
-- ----------------------------
INSERT INTO `s2_dictionary_conf` VALUES (1, NULL, 'DIMENSION', 1, '', 'ONLINE', '2024-12-10 09:46:50', 'admin');
INSERT INTO `s2_dictionary_conf` VALUES (2, NULL, 'DIMENSION', 2, '', 'ONLINE', '2024-12-10 09:46:53', 'admin');

-- ----------------------------
-- Table structure for s2_dictionary_task
-- ----------------------------
DROP TABLE IF EXISTS `s2_dictionary_task`;
CREATE TABLE `s2_dictionary_task`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `item_id` int NOT NULL,
  `config` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `elapsed_ms` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典运行任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_dictionary_task
-- ----------------------------
INSERT INTO `s2_dictionary_task` VALUES (1, 'dic_value_1_DIMENSION_1', NULL, 'DIMENSION', 1, '', 'success', '2024-12-10 09:46:50', 'admin', NULL);
INSERT INTO `s2_dictionary_task` VALUES (2, 'dic_value_1_DIMENSION_2', NULL, 'DIMENSION', 2, '', 'success', '2024-12-10 09:46:53', 'admin', NULL);

-- ----------------------------
-- Table structure for s2_dimension
-- ----------------------------
DROP TABLE IF EXISTS `s2_dimension`;
CREATE TABLE `s2_dimension`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '维度ID',
  `model_id` bigint NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '维度名称',
  `biz_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字段名称',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '描述',
  `status` tinyint NOT NULL COMMENT '维度状态,0正常,1下架',
  `sensitive_level` int NULL DEFAULT NULL COMMENT '敏感级别',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '维度类型 categorical,time',
  `type_params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '类型参数',
  `data_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '维度数据类型 varchar、array',
  `expr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表达式',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建人',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '更新人',
  `semantic_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '语义类型DATE, ID, CATEGORY',
  `alias` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `default_values` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dim_value_maps` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_tag` tinyint NULL DEFAULT NULL,
  `ext` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '维度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_dimension
-- ----------------------------
INSERT INTO `s2_dimension` VALUES (1, 1, '部门', 'department', '', 1, 0, 'categorical', NULL, NULL, 'department', '2024-12-10 09:46:49', 'admin', '2024-12-10 09:46:49', 'admin', 'CATEGORY', NULL, NULL, NULL, 0, NULL);
INSERT INTO `s2_dimension` VALUES (2, 1, '用户', 'user_name', '用户', 1, 0, 'primary_key', NULL, NULL, 'user_name', '2024-12-10 09:46:49', 'admin', '2024-12-10 09:46:49', 'admin', 'CATEGORY', NULL, NULL, NULL, 0, NULL);
INSERT INTO `s2_dimension` VALUES (3, 3, '数据日期', 'imp_date', '', 1, 0, 'partition_time', NULL, NULL, 'imp_date', '2024-12-10 09:46:50', 'admin', '2024-12-10 09:46:50', 'admin', 'DATE', NULL, NULL, NULL, 0, '{\"time_format\":\"yyyy-MM-dd\"}');
INSERT INTO `s2_dimension` VALUES (4, 3, '页面', 'page', '页面', 1, 2, 'categorical', NULL, NULL, 'page', '2024-12-10 09:46:50', 'admin', '2024-12-10 09:46:50', 'admin', 'CATEGORY', 'page', NULL, '[]', 0, NULL);
INSERT INTO `s2_dimension` VALUES (5, 4, '活跃区域', 'act_area', '', 1, 0, 'categorical', NULL, NULL, 'act_area', '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', 'CATEGORY', NULL, NULL, NULL, 1, NULL);
INSERT INTO `s2_dimension` VALUES (6, 4, '代表作', 'song_name', '', 1, 0, 'categorical', NULL, NULL, 'song_name', '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', 'CATEGORY', NULL, NULL, NULL, 0, NULL);
INSERT INTO `s2_dimension` VALUES (7, 4, '流派', 'genre', '', 1, 0, 'categorical', NULL, NULL, 'genre', '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', 'CATEGORY', NULL, NULL, NULL, 1, NULL);
INSERT INTO `s2_dimension` VALUES (8, 4, '歌手名', 'singer_name', '歌手名', 1, 0, 'primary_key', NULL, NULL, 'singer_name', '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', 'CATEGORY', NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for s2_domain
-- ----------------------------
DROP TABLE IF EXISTS `s2_domain`;
CREATE TABLE `s2_domain`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题域名称',
  `biz_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内部名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父主题域ID',
  `status` tinyint NOT NULL COMMENT '主题域状态',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `admin` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题域管理员',
  `admin_org` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题域管理员组织',
  `is_open` tinyint NULL DEFAULT NULL COMMENT '主题域是否公开',
  `viewer` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题域可用用户',
  `view_org` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题域可用组织',
  `entity` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题域实体信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '主题域基础信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_domain
-- ----------------------------
INSERT INTO `s2_domain` VALUES (1, '超音数', 'supersonic', 0, 1, '2024-12-10 09:46:49', 'admin', '2024-12-10 11:05:58', 'admin', 'admin,jack', '', 1, '', '', NULL);
INSERT INTO `s2_domain` VALUES (2, '歌手库', 'singer', 0, 1, '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', 'admin,alice', '', 1, 'admin,tom,jack', '1', NULL);
INSERT INTO `s2_domain` VALUES (4, '移动办公', 'ch_office', 0, 1, '2024-12-10 13:58:35', 'admin', '2024-12-10 13:58:35', 'admin', '', '', 0, '', '', NULL);

-- ----------------------------
-- Table structure for s2_metric
-- ----------------------------
DROP TABLE IF EXISTS `s2_metric`;
CREATE TABLE `s2_metric`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `model_id` bigint NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '指标名称',
  `biz_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字段名称',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint NOT NULL COMMENT '指标状态',
  `sensitive_level` tinyint NOT NULL COMMENT '敏感级别',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '指标类型',
  `type_params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '类型参数',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建人',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '更新人',
  `data_format_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数值类型',
  `data_format` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数值类型参数',
  `alias` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `classifications` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `relate_dimensions` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '指标相关维度',
  `ext` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `define_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_publish` tinyint NULL DEFAULT NULL COMMENT '是否发布',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '指标表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_metric
-- ----------------------------
INSERT INTO `s2_metric` VALUES (1, 2, '访问次数', 'pv', '一段时间内用户的访问次数', 1, 0, 'ATOMIC', '{\"expr\":\"s2_pv_uv_statis_pv\",\"measures\":[{\"agg\":\"SUM\",\"bizName\":\"s2_pv_uv_statis_pv\",\"constraint\":\"\"}]}', '2024-12-10 09:46:49', 'admin', '2024-12-10 09:46:50', 'admin', NULL, NULL, NULL, NULL, '{\"drillDownDimensions\":[{\"dimensionId\":1,\"inheritedFromModel\":false,\"necessary\":false},{\"dimensionId\":2,\"inheritedFromModel\":false,\"necessary\":false}]}', NULL, 'MEASURE', 0);
INSERT INTO `s2_metric` VALUES (2, 3, '停留时长', 'stay_hours', '停留时长', 1, 2, 'ATOMIC', '{\"expr\":\"s2_stay_time_statis_stay_hours\",\"measures\":[{\"agg\":\"SUM\",\"bizName\":\"s2_stay_time_statis_stay_hours\",\"constraint\":\"\"}]}', '2024-12-10 09:46:50', 'admin', '2024-12-10 09:46:50', 'admin', NULL, NULL, NULL, '核心指标', '{\"drillDownDimensions\":[{\"dimensionId\":1,\"inheritedFromModel\":false,\"necessary\":false},{\"dimensionId\":2,\"inheritedFromModel\":false,\"necessary\":false}]}', NULL, 'MEASURE', 0);
INSERT INTO `s2_metric` VALUES (3, 2, '访问用户数', 'uv', '访问的用户个数', 1, 0, 'DERIVED', '{\"expr\":\"count(distinct user_id)\",\"fields\":[{\"fieldName\":\"user_id\"}]}', '2024-12-10 09:46:50', 'admin', '2024-12-10 09:46:50', 'admin', NULL, 'null', 'UV,访问人数', NULL, '{\"drillDownDimensions\":[{\"dimensionId\":1,\"inheritedFromModel\":false,\"necessary\":false}]}', NULL, 'FIELD', 0);
INSERT INTO `s2_metric` VALUES (4, 2, '人均访问次数', 'pv_avg', '每个用户平均访问的次数', 1, 2, 'DERIVED', '{\"expr\":\"pv/uv\",\"metrics\":[{\"bizName\":\"pv\",\"id\":1},{\"bizName\":\"uv\",\"id\":3}]}', '2024-12-10 09:46:50', 'admin', '2024-12-10 09:46:50', 'admin', NULL, 'null', '平均访问次数', '核心指标', '{\"drillDownDimensions\":[{\"dimensionId\":1,\"inheritedFromModel\":false,\"necessary\":false}]}', NULL, 'METRIC', 0);
INSERT INTO `s2_metric` VALUES (5, 4, '播放量', 'js_play_cnt', '播放量', 1, 0, 'ATOMIC', '{\"expr\":\"singer_js_play_cnt\",\"measures\":[{\"agg\":\"sum\",\"bizName\":\"singer_js_play_cnt\"}]}', '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, 'MEASURE', 0);
INSERT INTO `s2_metric` VALUES (6, 4, '下载量', 'down_cnt', '下载量', 1, 0, 'ATOMIC', '{\"expr\":\"singer_down_cnt\",\"measures\":[{\"agg\":\"sum\",\"bizName\":\"singer_down_cnt\"}]}', '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, 'MEASURE', 0);
INSERT INTO `s2_metric` VALUES (7, 4, '收藏量', 'favor_cnt', '收藏量', 1, 0, 'ATOMIC', '{\"expr\":\"singer_favor_cnt\",\"measures\":[{\"agg\":\"sum\",\"bizName\":\"singer_favor_cnt\"}]}', '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, 'MEASURE', 0);

-- ----------------------------
-- Table structure for s2_metric_query_default_config
-- ----------------------------
DROP TABLE IF EXISTS `s2_metric_query_default_config`;
CREATE TABLE `s2_metric_query_default_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `metric_id` bigint NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_config` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_metric_query_default_config
-- ----------------------------

-- ----------------------------
-- Table structure for s2_model
-- ----------------------------
DROP TABLE IF EXISTS `s2_model`;
CREATE TABLE `s2_model`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `biz_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `domain_id` bigint NULL DEFAULT NULL,
  `alias` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `viewer` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `view_org` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `admin` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `admin_org` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `is_open` tinyint NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `entity` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `drill_down_dimensions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `database_id` int NOT NULL,
  `model_detail` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `source_type` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `depends` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `filter_sql` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `tag_object_id` int NULL DEFAULT 0,
  `ext` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_model
-- ----------------------------
INSERT INTO `s2_model` VALUES (1, '用户部门', 'user_department', 1, NULL, 1, '用户部门信息', 'admin,tom,jack', '1', 'admin,alice', '', NULL, 'admin', '2024-12-10 09:46:49', 'admin', '2024-12-10 09:46:49', NULL, 'null', 1, '{\"dimensions\":[{\"bizName\":\"department\",\"dateFormat\":\"yyyy-MM-dd\",\"fieldName\":\"department\",\"isCreateDimension\":1,\"isTag\":0,\"name\":\"部门\",\"type\":\"categorical\"}],\"fields\":[{\"dataType\":\"Varchar\",\"fieldName\":\"user_name\"},{\"dataType\":\"Varchar\",\"fieldName\":\"department\"}],\"identifiers\":[{\"bizName\":\"user_name\",\"fieldName\":\"user_name\",\"isCreateDimension\":1,\"name\":\"用户\",\"type\":\"primary\"}],\"measures\":[],\"queryType\":\"sql_query\",\"sqlQuery\":\"select user_name,department from s2_user_department\",\"sqlVariables\":[]}', NULL, NULL, NULL, 1, NULL);
INSERT INTO `s2_model` VALUES (2, 'PVUV统计', 's2_pv_uv_statis', 1, NULL, 1, 'PVUV统计', 'admin,tom,jack', '1', 'admin', '', NULL, 'admin', '2024-12-10 09:46:49', 'admin', '2024-12-10 09:46:49', NULL, 'null', 1, '{\"dimensions\":[{\"bizName\":\"imp_date\",\"dateFormat\":\"yyyy-MM-dd\",\"fieldName\":\"imp_date\",\"isCreateDimension\":0,\"isTag\":0,\"name\":\"\",\"type\":\"partition_time\",\"typeParams\":{\"isPrimary\":\"true\",\"timeGranularity\":\"day\"}},{\"bizName\":\"page\",\"dateFormat\":\"yyyy-MM-dd\",\"expr\":\"page\",\"fieldName\":\"page\",\"isCreateDimension\":0,\"isTag\":0,\"name\":\"\",\"type\":\"categorical\"}],\"fields\":[{\"dataType\":\"Varchar\",\"fieldName\":\"user_name\"},{\"dataType\":\"Date\",\"fieldName\":\"imp_date\"},{\"dataType\":\"Varchar\",\"fieldName\":\"page\"},{\"dataType\":\"Long\",\"fieldName\":\"pv\"},{\"dataType\":\"Varchar\",\"fieldName\":\"user_id\"}],\"identifiers\":[{\"bizName\":\"user_name\",\"fieldName\":\"user_name\",\"isCreateDimension\":0,\"name\":\"用户名\",\"type\":\"foreign\"}],\"measures\":[{\"agg\":\"SUM\",\"bizName\":\"s2_pv_uv_statis_pv\",\"expr\":\"pv\",\"fieldName\":\"pv\",\"isCreateMetric\":1,\"name\":\"访问次数\"},{\"agg\":\"SUM\",\"bizName\":\"s2_pv_uv_statis_user_id\",\"expr\":\"user_id\",\"fieldName\":\"user_id\",\"isCreateMetric\":0,\"name\":\"访问用户数\"}],\"queryType\":\"sql_query\",\"sqlQuery\":\"SELECT imp_date, user_name, page, 1 as pv, user_name as user_id FROM s2_pv_uv_statis\",\"sqlVariables\":[]}', NULL, NULL, NULL, 0, NULL);
INSERT INTO `s2_model` VALUES (3, '停留时长统计', 's2_stay_time_statis', 1, NULL, 1, '停留时长统计', 'admin,tom,jack', '1', 'admin', '', NULL, 'admin', '2024-12-10 09:46:50', 'admin', '2024-12-10 09:46:50', NULL, 'null', 1, '{\"dimensions\":[{\"bizName\":\"imp_date\",\"dateFormat\":\"yyyy-MM-dd\",\"fieldName\":\"imp_date\",\"isCreateDimension\":1,\"isTag\":0,\"name\":\"数据日期\",\"type\":\"partition_time\",\"typeParams\":{\"isPrimary\":\"true\",\"timeGranularity\":\"day\"}},{\"bizName\":\"page\",\"dateFormat\":\"yyyy-MM-dd\",\"expr\":\"page\",\"fieldName\":\"page\",\"isCreateDimension\":1,\"isTag\":0,\"name\":\"页面\",\"type\":\"categorical\"}],\"fields\":[{\"dataType\":\"Varchar\",\"fieldName\":\"user_name\"},{\"dataType\":\"Date\",\"fieldName\":\"imp_date\"},{\"dataType\":\"Varchar\",\"fieldName\":\"page\"},{\"dataType\":\"Double\",\"fieldName\":\"stay_hours\"}],\"identifiers\":[{\"bizName\":\"user_name\",\"fieldName\":\"user_name\",\"isCreateDimension\":0,\"name\":\"用户\",\"type\":\"foreign\"}],\"measures\":[{\"agg\":\"SUM\",\"bizName\":\"s2_stay_time_statis_stay_hours\",\"expr\":\"stay_hours\",\"fieldName\":\"stay_hours\",\"isCreateMetric\":1,\"name\":\"停留时长\"}],\"queryType\":\"sql_query\",\"sqlQuery\":\"select imp_date,user_name,stay_hours,page from s2_stay_time_statis\",\"sqlVariables\":[]}', NULL, NULL, NULL, 0, NULL);
INSERT INTO `s2_model` VALUES (4, '歌手库', 'singer', 2, NULL, 1, '歌手库', 'admin,tom,jack', '1', 'admin', '', NULL, 'admin', '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', NULL, 'null', 1, '{\"dimensions\":[{\"bizName\":\"act_area\",\"dateFormat\":\"yyyy-MM-dd\",\"fieldName\":\"act_area\",\"isCreateDimension\":1,\"isTag\":1,\"name\":\"活跃区域\",\"type\":\"categorical\"},{\"bizName\":\"song_name\",\"dateFormat\":\"yyyy-MM-dd\",\"fieldName\":\"song_name\",\"isCreateDimension\":1,\"isTag\":0,\"name\":\"代表作\",\"type\":\"categorical\"},{\"bizName\":\"genre\",\"dateFormat\":\"yyyy-MM-dd\",\"fieldName\":\"genre\",\"isCreateDimension\":1,\"isTag\":1,\"name\":\"流派\",\"type\":\"categorical\"}],\"fields\":[{\"fieldName\":\"singer_name\"},{\"fieldName\":\"song_name\"},{\"fieldName\":\"act_area\"},{\"fieldName\":\"genre\"},{\"fieldName\":\"js_play_cnt\"},{\"fieldName\":\"favor_cnt\"},{\"fieldName\":\"down_cnt\"}],\"identifiers\":[{\"bizName\":\"singer_name\",\"entityNames\":[\"歌手\"],\"fieldName\":\"singer_name\",\"isCreateDimension\":1,\"name\":\"歌手名\",\"type\":\"primary\"}],\"measures\":[{\"agg\":\"sum\",\"bizName\":\"singer_js_play_cnt\",\"expr\":\"js_play_cnt\",\"fieldName\":\"js_play_cnt\",\"isCreateMetric\":1,\"name\":\"播放量\"},{\"agg\":\"sum\",\"bizName\":\"singer_down_cnt\",\"expr\":\"down_cnt\",\"fieldName\":\"down_cnt\",\"isCreateMetric\":1,\"name\":\"下载量\"},{\"agg\":\"sum\",\"bizName\":\"singer_favor_cnt\",\"expr\":\"favor_cnt\",\"fieldName\":\"favor_cnt\",\"isCreateMetric\":1,\"name\":\"收藏量\"}],\"queryType\":\"sql_query\",\"sqlQuery\":\"select singer_name, act_area, song_name, genre, js_play_cnt, down_cnt, favor_cnt from singer\",\"sqlVariables\":[]}', NULL, NULL, NULL, 2, NULL);

-- ----------------------------
-- Table structure for s2_model_rela
-- ----------------------------
DROP TABLE IF EXISTS `s2_model_rela`;
CREATE TABLE `s2_model_rela`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `domain_id` bigint NULL DEFAULT NULL,
  `from_model_id` bigint NULL DEFAULT NULL,
  `to_model_id` bigint NULL DEFAULT NULL,
  `join_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `join_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_model_rela
-- ----------------------------
INSERT INTO `s2_model_rela` VALUES (1, 1, 1, 2, 'left join', '[{\"leftField\":\"user_name\",\"operator\":\"=\",\"rightField\":\"user_name\"}]');
INSERT INTO `s2_model_rela` VALUES (2, 1, 1, 3, 'left join', '[{\"leftField\":\"user_name\",\"operator\":\"=\",\"rightField\":\"user_name\"}]');

-- ----------------------------
-- Table structure for s2_plugin
-- ----------------------------
DROP TABLE IF EXISTS `s2_plugin`;
CREATE TABLE `s2_plugin`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT 'DASHBOARD,WIDGET,URL',
  `data_set` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pattern` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `parse_mode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parse_mode_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `config` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_plugin
-- ----------------------------
INSERT INTO `s2_plugin` VALUES (1, 'WEB_PAGE', '1,2,-1', '用于分析超音数的流量概况，包含UV、PV等核心指标的追踪。P.S. 仅作为示例展示，无实际看板', NULL, '{\"name\":\"超音数流量分析看板\",\"description\":\"用于分析超音数的流量概况，包含UV、PV等核心指标的追踪。P.S. 仅作为示例展示，无实际看板\",\"parameters\":{\"type\":\"object\",\"properties\":{},\"required\":[]},\"examples\":[\"tom最近访问超音数情况怎么样\"]}', '超音数流量分析看板', '2024-12-10 09:46:53', 'admin', '2024-12-10 10:52:20', 'admin', '{\"url\":\"www.yourbi.com\",\"paramOptions\":[{\"paramType\":\"FORWARD\",\"key\":\"height\"}]}', NULL);
INSERT INTO `s2_plugin` VALUES (2, 'WEB_SERVICE', '-1', '用于分析超音数的流量概况，包含UV、PV等核心指标的追踪。P.S. 仅作为示例展示，无实际内容', NULL, '{\"description\":\"用于分析超音数的流量概况，包含UV、PV等核心指标的追踪。P.S. 仅作为示例展示，无实际内容\",\"examples\":[\"tom最近访问超音数情况怎么样\"],\"name\":\"超音数流量分析小助手\"}', '超音数流量分析小助手', '2024-12-10 09:46:53', 'admin', '2024-12-10 09:46:53', 'admin', '{\"url\":\"http://localhost:9080/api/chat/plugin/pluginDemo\",\"paramOptions\":[],\"params\":[]}', NULL);

-- ----------------------------
-- Table structure for s2_pv_uv_statis
-- ----------------------------
DROP TABLE IF EXISTS `s2_pv_uv_statis`;
CREATE TABLE `s2_pv_uv_statis`  (
  `imp_date` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_pv_uv_statis
-- ----------------------------
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-10', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-10', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-10', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-10', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-10', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-10', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-05', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'lucy', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'lucy', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'lucy', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'lucy', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'lucy', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-04', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'john', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'jack', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-09', 'lucy', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-19', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-27', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'alice', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-03', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-11', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'jack', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'lucy', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-23', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'dean', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-20', 'alice', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-21', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'dean', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-02', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-24', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'tom', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'john', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'alice', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'tom', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'john', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-17', 'dean', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'lucy', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'tom', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-29', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-13', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-08', 'jack', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-18', 'jack', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-26', 'john', 'p2');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'tom', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'lucy', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-12', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-06', 'dean', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'lucy', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-15', 'jack', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-22', 'lucy', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-16', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-25', 'john', 'p1');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-01', 'alice', 'p3');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-12-07', 'alice', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-30', 'tom', 'p4');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-28', 'dean', 'p5');
INSERT INTO `s2_pv_uv_statis` VALUES ('2024-11-14', 'tom', 'p4');

-- ----------------------------
-- Table structure for s2_query_rule
-- ----------------------------
DROP TABLE IF EXISTS `s2_query_rule`;
CREATE TABLE `s2_query_rule`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_set_id` bigint NULL DEFAULT NULL,
  `priority` int NOT NULL DEFAULT 1,
  `rule_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `biz_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `rule` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `action` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ext` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '查询规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_query_rule
-- ----------------------------

-- ----------------------------
-- Table structure for s2_query_stat_info
-- ----------------------------
DROP TABLE IF EXISTS `s2_query_stat_info`;
CREATE TABLE `s2_query_stat_info`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `trace_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '查询标识',
  `model_id` bigint NULL DEFAULT NULL,
  `data_set_id` bigint NULL DEFAULT NULL,
  `user` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行sql的用户',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '查询对应的场景',
  `query_type_back` int NULL DEFAULT 0 COMMENT '查询类型, 0-正常查询, 1-预刷类型',
  `query_sql_cmd` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '对应查询的struct',
  `sql_cmd_md5` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sql md5值',
  `query_struct_cmd` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '对应查询的struct',
  `struct_cmd_md5` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sql md5值',
  `sql` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '对应查询的sql',
  `sql_md5` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sql md5值',
  `query_engine` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '查询引擎',
  `elapsed_ms` bigint NULL DEFAULT NULL COMMENT '查询耗时',
  `query_state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '查询最终状态',
  `native_query` int NULL DEFAULT NULL COMMENT '1-明细查询,0-聚合查询',
  `start_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sql开始日期',
  `end_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sql结束日期',
  `dimensions` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'sql 涉及的维度',
  `metrics` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'sql 涉及的指标',
  `select_cols` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'sql select部分涉及的标签',
  `agg_cols` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'sql agg部分涉及的标签',
  `filter_cols` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'sql where部分涉及的标签',
  `group_by_cols` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'sql grouy by部分涉及的标签',
  `order_by_cols` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'sql order by部分涉及的标签',
  `use_result_cache` tinyint(1) NULL DEFAULT -1 COMMENT '是否命中sql缓存',
  `use_sql_cache` tinyint(1) NULL DEFAULT -1 COMMENT '是否命中sql缓存',
  `sql_cache_key` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '缓存的key',
  `result_cache_key` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '缓存的key',
  `query_opt_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '优化模式',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `domain_index`(`model_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '查询统计信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_query_stat_info
-- ----------------------------
INSERT INTO `s2_query_stat_info` VALUES (1, '', 1, NULL, 'Admin', '2024-12-10 09:46:52', 'SQL', 0, 'QuerySqlReq(sql=SELECT department, count(1) FROM tbl GROUP BY department ORDER BY count(1) DESC LIMIT 100000, limit=1000)', '4e38796a14ea6909440ccc3d790a83dc', NULL, NULL, NULL, NULL, NULL, 2330, 'success', NULL, NULL, NULL, '[]', '[\"1\"]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:1:443bebbdd59f4601d6ed1e93b9800b4c', NULL);
INSERT INTO `s2_query_stat_info` VALUES (2, '', 1, NULL, 'Admin', '2024-12-10 09:46:53', 'SQL', 0, 'QuerySqlReq(sql=SELECT user_name, count(1) FROM tbl GROUP BY user_name ORDER BY count(1) DESC LIMIT 100000, limit=1000)', '271e2420ae147db055497250c2ed10ce', NULL, NULL, NULL, NULL, NULL, 139, 'success', NULL, NULL, NULL, '[]', '[\"1\"]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:1:281eb7cefdb2c4b14d1282b1440b196e', NULL);
INSERT INTO `s2_query_stat_info` VALUES (3, '', NULL, 1, 'admin', '2024-12-10 09:46:54', 'SQL', 0, 'QuerySqlReq(sql=SELECT 数据日期, SUM(访问次数) AS 访问次数, COUNT(访问用户数) AS 访问用户数 FROM 超音数数据集 WHERE 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期 LIMIT 200, limit=null)', '4bc7f415f7e0a0897c1e442e0cbb433d', NULL, NULL, NULL, NULL, NULL, 92, 'success', NULL, NULL, NULL, '[\"访问用户数\",\"访问次数\"]', '[\"访问用户数\",\"访问次数\"]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:-1:c3808169caad5d61526850ed84107a0c', NULL);
INSERT INTO `s2_query_stat_info` VALUES (4, '', NULL, 1, 'admin', '2024-12-10 09:46:56', 'SQL', 0, 'QuerySqlReq(sql=SELECT 数据日期, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期, 部门 LIMIT 200, limit=null)', '03964b733d4b8600f08f6d1bf6ccbf62', NULL, NULL, NULL, NULL, NULL, 104, 'success', NULL, NULL, NULL, '[\"访问次数\"]', '[\"访问次数\"]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:-1:70b0c9d54eb9af8b37d5c225c053cff4', NULL);
INSERT INTO `s2_query_stat_info` VALUES (5, '', NULL, 1, 'admin', '2024-12-10 09:46:57', 'SQL', 0, 'QuerySqlReq(sql=SELECT 数据日期, SUM(停留时长) AS 停留时长 FROM 超音数数据集 WHERE 用户 = \'alice\' AND 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期 LIMIT 200, limit=null)', 'af6da7b3ed5965a88d12f0cc623aad58', NULL, NULL, NULL, NULL, NULL, 85, 'success', NULL, NULL, NULL, '[\"停留时长\"]', '[\"停留时长\"]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:-1:6b96802fc46e785a5be105581986762b', NULL);
INSERT INTO `s2_query_stat_info` VALUES (6, '', NULL, 1, 'admin', '2024-12-10 09:46:58', 'SQL', 0, 'QuerySqlReq(sql=SELECT 数据日期, 部门, SUM(访问次数) AS 访问次数 FROM 超音数数据集 WHERE 数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\' GROUP BY 数据日期, 部门 ORDER BY SUM(访问次数) DESC LIMIT 200, limit=null)', 'a4f78b831c01f38418b7c741ef22e8b2', NULL, NULL, NULL, NULL, NULL, 105, 'success', NULL, NULL, NULL, '[\"访问次数\"]', '[\"访问次数\"]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:-1:4b4358f49974b4919d9a27c5eeb63903', NULL);
INSERT INTO `s2_query_stat_info` VALUES (7, '', NULL, 1, 'admin', '2024-12-10 10:00:58', 'SQL', 0, 'QuerySqlReq(sql=SELECT 部门, SUM(访问次数) FROM 超音数数据集 WHERE (数据日期 >= \'2024-12-09\' AND 数据日期 <= \'2024-12-09\') GROUP BY 部门 ORDER BY SUM(访问次数) DESC LIMIT 1, limit=null)', '10e54796975475b5f7689003d58845f0', NULL, NULL, NULL, NULL, NULL, 133, 'success', NULL, NULL, NULL, '[\"访问次数\"]', '[\"访问次数\"]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:-1:4e2bc42aa610c9dcd0d5114ae9cd0f2f', NULL);
INSERT INTO `s2_query_stat_info` VALUES (8, '', NULL, 1, 'admin', '2024-12-10 10:03:35', 'SQL', 0, 'QuerySqlReq(sql=SELECT 部门, SUM(访问次数) AS _访问次数_ FROM 超音数数据集 WHERE (数据日期 >= \'2024-12-03\' AND 数据日期 <= \'2024-12-10\') GROUP BY 部门 ORDER BY _访问次数_ DESC LIMIT 1, limit=null)', '82e44ebf116457d7d18b91dbcacdb746', NULL, NULL, NULL, NULL, NULL, 125, 'success', NULL, NULL, NULL, '[\"访问次数\"]', '[\"访问次数\"]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:-1:9b34e0a6c3af67cee655cd7c4f20456f', NULL);
INSERT INTO `s2_query_stat_info` VALUES (9, '', NULL, 2, 'admin', '2024-12-10 10:51:15', 'SQL', 0, 'QuerySqlReq(sql=SELECT singer_name, genre, song_name, act_area, js_play_cnt, favor_cnt, down_cnt FROM 歌手库数据集 WHERE NULL = \'\' LIMIT 500, limit=1000)', '65ca191a2251eca0138bc273a2c8ddcb', NULL, NULL, NULL, NULL, NULL, 330, 'success', NULL, NULL, NULL, '[]', '[]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:-1:1837c5476ce25fef7bbd7d8a7757896f', NULL);
INSERT INTO `s2_query_stat_info` VALUES (10, '', NULL, 2, 'admin', '2024-12-10 10:51:15', 'SQL', 0, 'QuerySqlReq(sql=SELECT singer_name, genre, song_name, act_area, js_play_cnt, favor_cnt, down_cnt FROM 歌手库数据集 WHERE NULL = \'\' LIMIT 500, limit=1000)', '65ca191a2251eca0138bc273a2c8ddcb', NULL, NULL, NULL, NULL, NULL, 6, 'success', NULL, NULL, NULL, '[]', '[]', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `s2_query_stat_info` VALUES (11, '', NULL, 2, 'admin', '2024-12-10 10:51:17', 'SQL', 0, 'QuerySqlReq(sql=SELECT 流派 FROM 歌手库数据集 WHERE 流派 = \'国风\', limit=null)', '70d94063232575c030c8ad9d24b6d88d', NULL, NULL, NULL, NULL, NULL, 41, 'success', NULL, NULL, NULL, '[]', '[]', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 'supersonic:dev:0:-1:d08847a4f79093d4aa1bf4d1a697389b', NULL);

-- ----------------------------
-- Table structure for s2_semantic_pasre_info
-- ----------------------------
DROP TABLE IF EXISTS `s2_semantic_pasre_info`;
CREATE TABLE `s2_semantic_pasre_info`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `trace_id` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '查询标识',
  `domain_id` bigint NOT NULL COMMENT '主体域ID',
  `dimensions` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '查询相关的维度信息',
  `metrics` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '查询相关的指标信息',
  `orders` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '查询相关的排序信息',
  `filters` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '查询相关的过滤信息',
  `date_info` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '查询相关的日期信息',
  `limit` bigint NOT NULL COMMENT '查询相关的limit信息',
  `native_query` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1-明细查询,0-聚合查询',
  `sql` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '解析后的sql',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建人',
  `status` tinyint NOT NULL COMMENT '运行状态',
  `elapsed_ms` bigint NULL DEFAULT NULL COMMENT 'sql解析耗时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '语义层sql解析信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_semantic_pasre_info
-- ----------------------------

-- ----------------------------
-- Table structure for s2_stay_time_statis
-- ----------------------------
DROP TABLE IF EXISTS `s2_stay_time_statis`;
CREATE TABLE `s2_stay_time_statis`  (
  `imp_date` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stay_hours` double NOT NULL,
  `page` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_stay_time_statis
-- ----------------------------
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'jack', 0.7636857512911863, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'dean', 0.17663327393462436, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'alice', 0.38943688941552057, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'lucy', 0.2715819955225307, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'tom', 0.9358210273119568, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'alice', 0.9364586435510802, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'jack', 0.9707723036513162, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'tom', 0.8497763866782723, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'alice', 0.15504417761372413, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'jack', 0.9507563118298399, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'alice', 0.9746364180572994, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'dean', 0.12869214941133378, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'lucy', 0.3024970533288409, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'tom', 0.6639702099980812, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'lucy', 0.4929901454858626, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'lucy', 0.06853040276026445, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'tom', 0.8488086078299616, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'lucy', 0.8589111177125592, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'alice', 0.5576357066482228, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'john', 0.8047888670006846, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'john', 0.766944548494366, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'lucy', 0.5280072184505449, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'tom', 0.9693343356046343, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'dean', 0.12805203958456424, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'dean', 0.16963603387027637, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'alice', 0.5901202956521101, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'jack', 0.12710364646712236, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'tom', 0.6346530909156196, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'dean', 0.12461289103639872, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'john', 0.9863947334662437, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'alice', 0.48899961064192987, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'alice', 0.5382796792688207, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'dean', 0.3506568687014143, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'jack', 0.8633072449771709, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'tom', 0.13999135315363687, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'john', 0.07258740493845894, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'jack', 0.5244413940436958, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'john', 0.13258670732966138, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'john', 0.6015982054464575, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'lucy', 0.05513158944480323, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'alice', 0.6707121735296985, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-22', 'jack', 0.9330440339006469, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'dean', 0.5630674323371607, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'dean', 0.8720647566229917, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'john', 0.8331899070546519, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'alice', 0.6712876436249856, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'alice', 0.6694409980332703, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'john', 0.3703307480606334, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'dean', 0.775368688472696, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'lucy', 0.9151205443267096, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'tom', 0.09543108823305857, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'dean', 0.7893992120771057, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'lucy', 0.5119923080070498, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'lucy', 0.49906724167974936, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'tom', 0.046258282700961884, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'dean', 0.44843595680103954, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'alice', 0.7743935471689718, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'john', 0.5855299615656824, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'lucy', 0.9412963512379853, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'jack', 0.8383247587082538, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'lucy', 0.14517876867236124, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'john', 0.9327229861441061, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'john', 0.19042326582894153, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'jack', 0.6029067818254513, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'jack', 0.21715964747214422, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-22', 'lucy', 0.34259842721045974, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'john', 0.7064419016593382, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'lucy', 0.5725636566517865, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'john', 0.22332539583809208, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'jack', 0.8049036189055911, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'alice', 0.6029674758974956, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'lucy', 0.11884976360561716, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'alice', 0.7124916829130662, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'jack', 0.5893693718556829, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'alice', 0.602073304496253, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'tom', 0.10491061160039927, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'dean', 0.9006548872378379, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'alice', 0.8545144244288455, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-22', 'jack', 0.16915384987875726, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'dean', 0.2271640700690446, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'alice', 0.7807518577160636, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'john', 0.8919859648888653, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'dean', 0.1564450687270359, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'jack', 0.5840549187653847, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'tom', 0.2213255596777869, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'tom', 0.07868261880306426, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'jack', 0.07710010861455818, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'jack', 0.5131249730162654, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'jack', 0.5035035055368601, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'tom', 0.8996978291173905, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'john', 0.057442290722216294, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'jack', 0.6443079066865616, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'lucy', 0.7398098480748726, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'dean', 0.9835694815034591, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'john', 0.9879213445635557, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'jack', 0.4020136688147111, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'lucy', 0.6698797170128024, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'john', 0.17325132416789113, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'lucy', 0.5784229486763606, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'tom', 0.9185978183932058, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'jack', 0.5474783153973963, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'alice', 0.9730731954700215, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'tom', 0.5390873359288765, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'alice', 0.20522241320887713, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'alice', 0.4088233242325021, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'jack', 0.7608047695853417, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'tom', 0.2749731221085713, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'john', 0.06154055374702494, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'dean', 0.460668002022406, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'alice', 0.4474746325306228, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'alice', 0.5761666885467472, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'dean', 0.33233441360339655, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'alice', 0.7426534909874778, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'tom', 0.5841437875889118, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'alice', 0.2818296500094526, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'tom', 0.8670888843915217, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'alice', 0.5249294365740248, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'jack', 0.5483356748008438, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'dean', 0.7278566847412673, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'jack', 0.6779976902157362, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'lucy', 0.09995341651736978, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'jack', 0.4528538159233879, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'alice', 0.5870756885301056, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'tom', 0.9842091927290255, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'tom', 0.04580936015706816, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'alice', 0.8814678270145769, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'john', 0.06517379256096412, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'alice', 0.8769832364187129, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'dean', 0.584562279025023, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'john', 0.8102404090621375, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'john', 0.11481653429176686, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'jack', 0.43422888918962554, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'lucy', 0.0684414272594508, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'alice', 0.976546463969412, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.617906858141431, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'jack', 0.08663740247579998, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'lucy', 0.7124944606691416, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'alice', 0.1321700521239627, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'jack', 0.3078946609431664, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'alice', 0.6149442855237194, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'alice', 0.5963801306980994, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'lucy', 0.6999542038973406, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'john', 0.4599112653446624, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'dean', 0.20300901401048832, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'john', 0.39989705958717037, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'jack', 0.2486378364940327, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'john', 0.16880398079144077, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'tom', 0.73927288385526, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'john', 0.8645283506689198, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'alice', 0.3266940826759587, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'tom', 0.9195490073037541, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'lucy', 0.9452523036658287, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'john', 0.21269683438120535, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'dean', 0.7377502855387184, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'tom', 0.38981597634408716, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'john', 0.7001799391999863, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'john', 0.6616720024008785, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'dean', 0.497721735058096, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'jack', 0.22255613760959603, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'jack', 0.05247640233319417, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'dean', 0.27237572107833363, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'alice', 0.9529452406380252, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'alice', 0.28243045060463157, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'lucy', 0.17880444250082506, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'john', 0.035050038002381156, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'lucy', 0.840803223728221, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'jack', 0.5318457377361356, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'tom', 0.9280332892460665, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'lucy', 0.752354382202208, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'dean', 0.1866528331789219, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'alice', 0.7016165545791373, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'john', 0.4191547989960899, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'john', 0.7025516699007639, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'john', 0.6160127317884274, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'alice', 0.91223094958137, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'tom', 0.4383056089013998, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-22', 'jack', 0.595750781166582, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'lucy', 0.9472349338730268, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'jack', 0.0519104588842193, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'alice', 0.48043983034526205, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'lucy', 0.14754707786497478, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'alice', 0.36124288370035695, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'dean', 0.21777919493494613, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'lucy', 0.22637666702475057, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'john', 0.9378215576942598, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'john', 0.3309229261144562, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'alice', 0.7602880453727515, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'alice', 0.9470462487873785, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'dean', 0.6770215935547629, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'john', 0.1586074803669385, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'lucy', 0.2754855564794071, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'tom', 0.8355347738454384, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'alice', 0.7251813505573811, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'jack', 0.006606625589642534, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'alice', 0.304832277753024, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'jack', 0.026368662837989554, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'tom', 0.6855977520602776, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'tom', 0.8193746826441749, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'john', 0.021179295102459972, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'jack', 0.1533849522536005, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'alice', 0.18893553542301778, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'john', 0.39870999343833624, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'john', 0.9985665103520182, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'john', 0.6961441157700171, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'tom', 0.9861933923851885, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'tom', 0.993076500099477, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'alice', 0.4320547269058953, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'lucy', 0.18441071030375877, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'jack', 0.1501504986117118, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'tom', 0.252021845734527, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'lucy', 0.24442701577183745, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'tom', 0.07563738855797564, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'john', 0.34247820646440985, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'john', 0.9456979276862031, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'alice', 0.19494357263973816, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'alice', 0.9371493867882469, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'john', 0.6136241316589367, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'alice', 0.8922330760877784, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'dean', 0.9001986074661864, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'tom', 0.4889702884422866, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'tom', 0.2689551234431401, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'dean', 0.5223573993758465, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'tom', 0.05042295556527243, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'tom', 0.2717147121880483, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'john', 0.7397093309370814, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'dean', 0.157064341631733, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'lucy', 0.7213399784998017, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'tom', 0.764081440588005, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'john', 0.7514070600074144, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'john', 0.611647412825278, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'tom', 0.6600796877195596, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'john', 0.8942204153751679, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.07398121085929721, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'dean', 0.1652506990439564, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.5849759516111703, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'tom', 0.1672502732600889, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'tom', 0.7836135556233219, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'dean', 0.26181269644936356, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'alice', 0.6577275876355586, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'tom', 0.3067293364197956, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'alice', 0.8608288543866495, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'john', 0.814283434116926, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'jack', 0.33993584425872936, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'john', 0.010812798859160089, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.5156558224263926, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'jack', 0.46320035330198406, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'lucy', 0.2651020283994786, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'john', 0.42467241545664147, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'tom', 0.3695905136678498, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'tom', 0.15269122123348644, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'jack', 0.6755688670583248, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'jack', 0.39064306179528907, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'john', 0.36479296691952023, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'lucy', 0.5069249157662691, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'tom', 0.4785315495532231, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'dean', 0.7582526218052175, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.42064109605717914, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'dean', 0.5587757581237022, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'lucy', 0.3561686564964428, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'tom', 0.7101688305173135, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'dean', 0.6518061375522985, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'tom', 0.7564485884156583, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'tom', 0.36531347293134464, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'jack', 0.5201689359070235, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'john', 0.7138792929290383, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'tom', 0.9751003716333827, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'tom', 0.5281906318027629, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'tom', 0.6291356541485003, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'jack', 0.1938712974807698, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'john', 0.6267850210775459, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'tom', 0.4469970592043767, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'lucy', 0.7690659124175409, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'jack', 0.13335067838090386, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'jack', 0.2966621725922035, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'john', 0.5740481445089863, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'alice', 0.838028890036331, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'jack', 0.8094354537628714, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'alice', 0.5552924586108698, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'jack', 0.49150373927678315, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'dean', 0.7264346889377966, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'alice', 0.9292830287297702, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'dean', 0.3905616258240767, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.15912349648571666, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'alice', 0.6030082006630102, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'lucy', 0.8712354035243679, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.7685306377211826, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'john', 0.2869913942171415, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'john', 0.7142615166855639, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'tom', 0.5625978475154423, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'jack', 0.13611601734791123, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'alice', 0.6977333962685311, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'jack', 0.35140477709778295, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'john', 0.8805119222967716, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'john', 0.7014124236538637, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'alice', 0.12759538003439375, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'john', 0.7515403792213445, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'lucy', 0.03700239289885987, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'tom', 0.31674618364630946, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'dean', 0.4491378834800146, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'tom', 0.6742764131652571, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'lucy', 0.5286362221140248, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'alice', 0.007890326473113496, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'alice', 0.8046560540950831, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'tom', 0.7198364371127147, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'tom', 0.7400546712169153, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'jack', 0.16859870460868698, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'lucy', 0.8462852684569557, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'john', 0.010211452005474353, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'alice', 0.8617802368201087, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'jack', 0.21667479046797633, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'john', 0.8667689615468714, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'jack', 0.16140709875863557, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'dean', 0.16713368182304666, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'lucy', 0.8957484629768053, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'tom', 0.457835758220534, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'jack', 0.9435170960198477, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'jack', 0.9699253608913104, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'john', 0.2309897429566834, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'lucy', 0.7879705066452681, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'john', 0.20795869239817255, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'dean', 0.4110352469382019, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'jack', 0.4979592772533561, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'dean', 0.18810865430947044, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'tom', 0.5001240246982048, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'jack', 0.08341934160029707, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'lucy', 0.04812784841651041, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'alice', 0.4655982693269717, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'dean', 0.8539357978460663, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'john', 0.9649541785823592, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'john', 0.8243635648047365, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'john', 0.929949719929735, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'john', 0.055983276861168996, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'tom', 0.07845430274829746, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'alice', 0.28257674222099116, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'dean', 0.1578419214960578, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'dean', 0.7853118484860825, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'lucy', 0.20790127125904156, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'tom', 0.8650538395535204, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'dean', 0.902116091225815, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'lucy', 0.48542770770171373, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'jack', 0.16725337150113984, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'lucy', 0.3157444453259486, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'tom', 0.565727220131555, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'jack', 0.2531688065358064, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'lucy', 0.9191434620980499, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'jack', 0.9224628853942058, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'jack', 0.3256288410730337, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'jack', 0.9709152566761661, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'dean', 0.9794173893522709, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'alice', 0.16582064407977237, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'alice', 0.2652519246960059, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'alice', 0.04092489871261762, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'jack', 0.3020444893927522, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'john', 0.4655412764350543, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'dean', 0.9226436424888846, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'jack', 0.4707663393012884, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'lucy', 0.3277970119243966, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'tom', 0.4730675479071551, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'jack', 0.10261940477901954, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'alice', 0.4148892373198616, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'john', 0.2877219827348403, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'tom', 0.16212409974675845, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'tom', 0.9567425121214822, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'lucy', 0.19795350030679149, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'john', 0.6954199597749198, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'alice', 0.32884293488801164, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'john', 0.4789917995407148, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-22', 'lucy', 0.0698927593996298, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'john', 0.3352267723792438, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'tom', 0.8085116661598726, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'john', 0.17515060210353794, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'dean', 0.6006963088370202, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'alice', 0.8794167536704468, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.04091469320757368, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'tom', 0.6709116812690366, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'john', 0.4850646101328463, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'tom', 0.547488212623346, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'dean', 0.6301717145008927, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'lucy', 0.06123370093612068, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'alice', 0.2545600223228257, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'john', 0.28355287519210803, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'dean', 0.3231348374147818, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'tom', 0.4585172495754063, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'john', 0.7893945285152268, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'john', 0.6810596014794181, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'john', 0.7136031244915907, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'jack', 0.259734039051829, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'jack', 0.7759518703827996, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'john', 0.06288891046833589, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'dean', 0.8242980461154241, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'tom', 0.36590300307021595, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'lucy', 0.20254092528445444, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'tom', 0.5427356081880325, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'dean', 0.1467846603517391, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'john', 0.8975527268892767, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'dean', 0.3483541520806722, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'alice', 0.6922544855316723, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'tom', 0.3690185253006011, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'tom', 0.7564541265683148, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-22', 'tom', 0.3634152133342695, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'tom', 0.33740378933701987, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'lucy', 0.7942640738315301, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'jack', 0.7894896778233523, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'jack', 0.7153281477198108, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'tom', 0.5546359859065261, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'john', 0.7727157385809087, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'dean', 0.8707097754747494, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'john', 0.3873936520764878, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'alice', 0.7590305068820566, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'john', 0.512826935863365, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'john', 0.19120284727846926, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'dean', 0.5382693105670825, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'john', 0.826241649014955, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'lucy', 0.6133080470571559, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'jack', 0.6452862617544055, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'lucy', 0.3025772179023586, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'lucy', 0.0004709864550322962, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'dean', 0.024816355013726588, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-04', 'alice', 0.8407500495605565, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'alice', 0.8420879584266481, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'lucy', 0.2719224735814776, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'tom', 0.8939712577294938, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'dean', 0.8086189323362379, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'tom', 0.6063415085381448, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'tom', 0.39783242658234674, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'tom', 0.6085577206028068, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'tom', 0.5154289424127074, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'john', 0.878436600887031, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'john', 0.5577906295015223, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'lucy', 0.1143260282925247, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'jack', 0.312756557275364, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'john', 0.05548807854726956, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'tom', 0.12140791431139175, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.23897628700410234, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'lucy', 0.22223137342481392, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'john', 0.12379891645900953, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'john', 0.33729146112854247, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.8816768640060831, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-19', 'jack', 0.6301700633426532, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-07', 'alice', 0.4566295223861714, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'john', 0.1777378523933678, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'tom', 0.8163769471165477, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'tom', 0.4380805149704541, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'alice', 0.2987018822475964, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'dean', 0.6726495645391617, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'alice', 0.8394327461109705, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-22', 'dean', 0.820512945501936, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'tom', 0.1580105370757261, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-20', 'jack', 0.9961450897279505, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-03', 'john', 0.6574891890500061, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'john', 0.5201205570085158, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'alice', 0.2445069633928285, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-23', 'john', 0.3155229654901067, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'jack', 0.3665971881269575, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'john', 0.5544977915912215, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'tom', 0.15978771803015113, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'lucy', 0.038128748344929186, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'tom', 0.49026304025118594, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'dean', 0.5166802080526571, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'alice', 0.22568230066042194, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-12', 'john', 0.9888634109849955, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'jack', 0.21022365182102054, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-22', 'john', 0.47052993358031114, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'dean', 0.25686122383263454, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'tom', 0.18929054223320718, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'jack', 0.7925339862375451, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-28', 'john', 0.12613308249498645, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'jack', 0.7381524971311578, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-06', 'alice', 0.08639585437319919, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-13', 'tom', 0.9519897106846164, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'jack', 0.33446548574801926, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'jack', 0.40667134603483324, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-30', 'jack', 0.17100718420628735, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-14', 'lucy', 0.4445585525686886, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'tom', 0.47372916928883013, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'john', 0.19826861093848824, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-27', 'john', 0.13679268112019338, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-16', 'tom', 0.9805515708224516, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'dean', 0.4738376165601095, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'dean', 0.5739441073158964, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'alice', 0.8428505498030564, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'lucy', 0.32655416551155336, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-26', 'tom', 0.7055736367780644, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-08', 'tom', 0.9621355090189875, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-01', 'jack', 0.9665339161730553, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'dean', 0.44309781869697995, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-22', 'tom', 0.8651220802537761, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'lucy', 0.6451892308277741, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-24', 'dean', 0.056797307451316725, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'lucy', 0.6847604118085596, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-17', 'jack', 0.13428051757364667, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-11', 'lucy', 0.9814797176951834, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-29', 'tom', 0.7386074051153445, 'p3');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-15', 'alice', 0.4825297824657663, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'alice', 0.06608870508231235, 'p5');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-18', 'lucy', 0.6278253028988848, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-09', 'alice', 0.6705580511822682, 'p1');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-21', 'alice', 0.8131712486302015, 'p2');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-11-25', 'lucy', 0.8124302447925607, 'p4');
INSERT INTO `s2_stay_time_statis` VALUES ('2024-12-02', 'lucy', 0.039935860913407284, 'p2');

-- ----------------------------
-- Table structure for s2_system_config
-- ----------------------------
DROP TABLE IF EXISTS `s2_system_config`;
CREATE TABLE `s2_system_config`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `admin` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系统管理员',
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '配置项',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_system_config
-- ----------------------------
INSERT INTO `s2_system_config` VALUES (1, 'admin', '[{\"candidateValues\":[\"IN_MEMORY\",\"OPEN_AI\",\"OLLAMA\",\"DASHSCOPE\",\"QIANFAN\",\"ZHIPU\",\"AZURE\"],\"comment\":\"接口协议\",\"dataType\":\"list\",\"defaultValue\":\"IN_MEMORY\",\"description\":\"\",\"module\":\"嵌入模型配置\",\"name\":\"s2.embedding.model.provider\",\"value\":\"IN_MEMORY\"},{\"comment\":\"BaseUrl\",\"dataType\":\"string\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.model.provider\",\"setDefaultValue\":{\"OPEN_AI\":\"https://api.openai.com/v1\",\"OLLAMA\":\"http://localhost:11434\",\"AZURE\":\"https://your-resource-name.openai.azure.com/\",\"DASHSCOPE\":\"https://dashscope.aliyuncs.com/api/v1\",\"QIANFAN\":\"https://aip.baidubce.com\",\"ZHIPU\":\"https://open.bigmodel.cn/\"},\"show\":{\"includesValue\":[\"OPEN_AI\",\"OLLAMA\",\"AZURE\",\"DASHSCOPE\",\"QIANFAN\",\"ZHIPU\"]}}],\"description\":\"\",\"module\":\"嵌入模型配置\",\"name\":\"s2.embedding.model.base.url\",\"value\":\"\"},{\"comment\":\"ApiKey\",\"dataType\":\"password\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.model.provider\",\"setDefaultValue\":{\"OPEN_AI\":\"demo\",\"AZURE\":\"demo\",\"DASHSCOPE\":\"demo\",\"QIANFAN\":\"demo\",\"ZHIPU\":\"demo\"},\"show\":{\"includesValue\":[\"OPEN_AI\",\"AZURE\",\"DASHSCOPE\",\"QIANFAN\",\"ZHIPU\"]}}],\"description\":\"\",\"module\":\"嵌入模型配置\",\"name\":\"s2.embedding.model.api.key\",\"value\":\"\"},{\"comment\":\"SecretKey\",\"dataType\":\"password\",\"defaultValue\":\"demo\",\"dependencies\":[{\"name\":\"s2.embedding.model.provider\",\"setDefaultValue\":{\"QIANFAN\":\"demo\"},\"show\":{\"includesValue\":[\"QIANFAN\"]}}],\"description\":\"\",\"module\":\"嵌入模型配置\",\"name\":\"s2.embedding.model.secretKey\",\"value\":\"demo\"},{\"comment\":\"ModelName\",\"dataType\":\"string\",\"defaultValue\":\"bge-small-zh\",\"dependencies\":[{\"name\":\"s2.embedding.model.provider\",\"setDefaultValue\":{\"IN_MEMORY\":\"bge-small-zh\",\"OPEN_AI\":\"text-embedding-ada-002\",\"OLLAMA\":\"all-minilm\",\"AZURE\":\"text-embedding-ada-002\",\"DASHSCOPE\":\"text-embedding-v2\",\"QIANFAN\":\"Embedding-V1\",\"ZHIPU\":\"embedding-2\"},\"show\":{\"includesValue\":[\"IN_MEMORY\",\"OPEN_AI\",\"OLLAMA\",\"AZURE\",\"DASHSCOPE\",\"QIANFAN\",\"ZHIPU\"]}}],\"description\":\"\",\"module\":\"嵌入模型配置\",\"name\":\"s2.embedding.model.name\",\"value\":\"bge-small-zh\"},{\"comment\":\"模型路径\",\"dataType\":\"string\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.model.provider\",\"setDefaultValue\":{\"IN_MEMORY\":\"\"},\"show\":{\"includesValue\":[\"IN_MEMORY\"]}}],\"description\":\"\",\"module\":\"嵌入模型配置\",\"name\":\"s2.embedding.model.path\",\"value\":\"\"},{\"comment\":\"词汇表路径\",\"dataType\":\"string\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.model.provider\",\"setDefaultValue\":{\"IN_MEMORY\":\"\"},\"show\":{\"includesValue\":[\"IN_MEMORY\"]}}],\"description\":\"\",\"module\":\"嵌入模型配置\",\"name\":\"s2.embedding.model.vocabulary.path\",\"value\":\"\"},{\"candidateValues\":[\"IN_MEMORY\",\"MILVUS\",\"CHROMA\",\"PGVECTOR\"],\"comment\":\"向量库类型\",\"dataType\":\"list\",\"defaultValue\":\"IN_MEMORY\",\"description\":\"目前支持四种类型：IN_MEMORY、MILVUS、CHROMA、PGVECTOR\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.provider\",\"value\":\"IN_MEMORY\"},{\"comment\":\"BaseUrl\",\"dataType\":\"string\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.store.provider\",\"setDefaultValue\":{\"MILVUS\":\"http://localhost:19530\",\"CHROMA\":\"http://localhost:8000\",\"PGVECTOR\":\"127.0.0.1\"},\"show\":{\"includesValue\":[\"MILVUS\",\"CHROMA\",\"PGVECTOR\"]}}],\"description\":\"\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.base.url\",\"value\":\"\"},{\"comment\":\"端口\",\"dataType\":\"number\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.store.provider\",\"setDefaultValue\":{\"PGVECTOR\":\"54333\"},\"show\":{\"includesValue\":[\"PGVECTOR\"]}}],\"description\":\"\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.post\",\"value\":\"\"},{\"comment\":\"用户名\",\"dataType\":\"string\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.store.provider\",\"setDefaultValue\":{\"MILVUS\":\"milvus\",\"PGVECTOR\":\"pgvector\"},\"show\":{\"includesValue\":[\"MILVUS\",\"PGVECTOR\"]}}],\"description\":\"\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.user\",\"value\":\"\"},{\"comment\":\"密码\",\"dataType\":\"password\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.store.provider\",\"setDefaultValue\":{\"MILVUS\":\"milvus\"},\"show\":{\"includesValue\":[\"MILVUS\"]}}],\"description\":\"\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.password\",\"value\":\"\"},{\"comment\":\"ApiKey\",\"dataType\":\"password\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.store.provider\",\"setDefaultValue\":{\"MILVUS\":\"demo\",\"PGVECTOR\":\"demo\"},\"show\":{\"includesValue\":[\"MILVUS\",\"PGVECTOR\"]}}],\"description\":\"\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.api.key\",\"value\":\"\"},{\"comment\":\"DatabaseName\",\"dataType\":\"string\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.store.provider\",\"setDefaultValue\":{\"MILVUS\":\"\",\"PGVECTOR\":\"postgres\"},\"show\":{\"includesValue\":[\"MILVUS\",\"PGVECTOR\"]}}],\"description\":\"\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.databaseName\",\"value\":\"\"},{\"comment\":\"持久化路径\",\"dataType\":\"string\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.store.provider\",\"setDefaultValue\":{\"IN_MEMORY\":\"\"},\"show\":{\"includesValue\":[\"IN_MEMORY\"]}}],\"description\":\"默认不持久化，如需持久化请填写持久化路径。注意：如果变更了向量模型需删除该路径下已保存的文件或修改持久化路径\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.persist.path\",\"value\":\"\"},{\"comment\":\"超时时间(秒)\",\"dataType\":\"number\",\"defaultValue\":\"60\",\"description\":\"\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.timeout\",\"value\":\"60\"},{\"comment\":\"纬度\",\"dataType\":\"number\",\"defaultValue\":\"\",\"dependencies\":[{\"name\":\"s2.embedding.store.provider\",\"setDefaultValue\":{\"MILVUS\":\"384\",\"PGVECTOR\":\"768\"},\"show\":{\"includesValue\":[\"MILVUS\",\"PGVECTOR\"]}}],\"description\":\"\",\"module\":\"向量数据库配置\",\"name\":\"s2.embedding.store.dimension\",\"value\":\"\"},{\"comment\":\"是否将Mapper探测识别到的维度值提供给大模型\",\"dataType\":\"bool\",\"defaultValue\":\"true\",\"description\":\"为了数据安全考虑, 这里可进行开关选择\",\"module\":\"语义解析配置\",\"name\":\"s2.parser.linking.value.enable\",\"value\":\"true\"},{\"comment\":\"few-shot样例个数\",\"dataType\":\"number\",\"defaultValue\":\"3\",\"description\":\"样例越多效果可能越好，但token消耗越大\",\"module\":\"语义解析配置\",\"name\":\"s2.parser.few-shot.number\",\"value\":\"5\"},{\"comment\":\"self-consistency执行个数\",\"dataType\":\"number\",\"defaultValue\":\"1\",\"description\":\"执行越多效果可能越好，但token消耗越大\",\"module\":\"语义解析配置\",\"name\":\"s2.parser.self-consistency.number\",\"value\":\"1\"},{\"comment\":\"解析结果展示个数\",\"dataType\":\"number\",\"defaultValue\":\"3\",\"description\":\"前端展示的解析个数\",\"module\":\"语义解析配置\",\"name\":\"s2.parser.show.count\",\"value\":\"3\"}]');

-- ----------------------------
-- Table structure for s2_tag
-- ----------------------------
DROP TABLE IF EXISTS `s2_tag`;
CREATE TABLE `s2_tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_tag
-- ----------------------------
INSERT INTO `s2_tag` VALUES (1, 1, 'DIMENSION', '2024-12-10 09:46:50', 'admin', '2024-12-10 09:46:50', 'admin', NULL);
INSERT INTO `s2_tag` VALUES (2, 5, 'DIMENSION', '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', NULL);
INSERT INTO `s2_tag` VALUES (3, 6, 'DIMENSION', '2024-12-10 09:46:59', 'admin', '2024-12-10 09:46:59', 'admin', NULL);
INSERT INTO `s2_tag` VALUES (4, 7, 'DIMENSION', '2024-12-10 09:46:59', 'admin', '2024-12-10 09:46:59', 'admin', NULL);
INSERT INTO `s2_tag` VALUES (5, 8, 'DIMENSION', '2024-12-10 09:46:59', 'admin', '2024-12-10 09:46:59', 'admin', NULL);
INSERT INTO `s2_tag` VALUES (6, 5, 'METRIC', '2024-12-10 09:46:59', 'admin', '2024-12-10 09:46:59', 'admin', NULL);

-- ----------------------------
-- Table structure for s2_tag_object
-- ----------------------------
DROP TABLE IF EXISTS `s2_tag_object`;
CREATE TABLE `s2_tag_object`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `domain_id` bigint NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '名称',
  `biz_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '英文名称',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态',
  `sensitive_level` tinyint NOT NULL DEFAULT 0 COMMENT '敏感级别',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建人',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `ext` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '标签对象表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_tag_object
-- ----------------------------
INSERT INTO `s2_tag_object` VALUES (1, 1, '用户', 'user', NULL, 1, 0, '2024-12-10 09:46:49', 'admin', '2024-12-10 09:46:49', 'admin', '');
INSERT INTO `s2_tag_object` VALUES (2, 2, '歌手', 'singer', NULL, 1, 0, '2024-12-10 09:46:58', 'admin', '2024-12-10 09:46:58', 'admin', '');

-- ----------------------------
-- Table structure for s2_term
-- ----------------------------
DROP TABLE IF EXISTS `s2_term`;
CREATE TABLE `s2_term`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `domain_id` bigint NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `alias` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `related_metrics` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `related_dimensions` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '术语表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_term
-- ----------------------------
INSERT INTO `s2_term` VALUES (1, 1, '近期', '指近10天', '[\"近一段时间\"]', '[]', '[]', '2024-12-10 09:46:53', 'admin', '2024-12-10 09:46:53', 'admin');
INSERT INTO `s2_term` VALUES (2, 1, '核心用户', '用户为tom和lucy', '[\"VIP用户\"]', '[]', '[]', '2024-12-10 09:46:53', 'admin', '2024-12-10 09:46:53', 'admin');

-- ----------------------------
-- Table structure for s2_user
-- ----------------------------
DROP TABLE IF EXISTS `s2_user`;
CREATE TABLE `s2_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `salt` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_admin` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_user
-- ----------------------------
INSERT INTO `s2_user` VALUES (1, 'admin', 'admin', 'c3VwZXJzb25pY0BiaWNvbdktJJYWw6A3rEmBUPzbn/6DNeYnD+y3mAwDKEMS3KVT', 'jGl25bVBBBW96Qi9Te4V3w==', 'admin@xx.com', 1);
INSERT INTO `s2_user` VALUES (2, 'jack', 'jack', 'c3VwZXJzb25pY0BiaWNvbWxGalmwa0h/trkh/3CWOYMDiku0Op1VmOfESIKmN0HG', 'MWERWefm/3hD6kYndF6JIg==', 'jack@xx.com', NULL);
INSERT INTO `s2_user` VALUES (3, 'tom', 'tom', 'c3VwZXJzb25pY0BiaWNvbVWv0CZ6HzeX8GRUpw0C8NSaQ+0hE/dAcmzRpCFwAqxK', '4WCPdcXXgT89QDHLML+3hg==', 'tom@xx.com', NULL);
INSERT INTO `s2_user` VALUES (4, 'lucy', 'lucy', 'c3VwZXJzb25pY0BiaWNvbc7Ychfu99lPL7rLmCkf/vgF4RASa4Z++Mxo1qlDCpci', '3Jnpqob6uDoGLP9eCAg5Fw==', 'lucy@xx.com', 1);
INSERT INTO `s2_user` VALUES (5, 'alice', 'alice', 'c3VwZXJzb25pY0BiaWNvbe9Z4F2/DVIfAJoN1HwUTuH1KgVuiusvfh7KkWYQSNHk', 'K9gGyX8OAK8aH8Myj6djqQ==', 'alice@xx.com', NULL);

-- ----------------------------
-- Table structure for s2_user_department
-- ----------------------------
DROP TABLE IF EXISTS `s2_user_department`;
CREATE TABLE `s2_user_department`  (
  `user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_user_department
-- ----------------------------
INSERT INTO `s2_user_department` VALUES ('jack', 'HR');
INSERT INTO `s2_user_department` VALUES ('jack', 'HR');
INSERT INTO `s2_user_department` VALUES ('tom', 'sales');
INSERT INTO `s2_user_department` VALUES ('lucy', 'marketing');
INSERT INTO `s2_user_department` VALUES ('john', 'strategy');
INSERT INTO `s2_user_department` VALUES ('alice', 'sales');
INSERT INTO `s2_user_department` VALUES ('dean', 'marketing');

-- ----------------------------
-- Table structure for s2_user_token
-- ----------------------------
DROP TABLE IF EXISTS `s2_user_token`;
CREATE TABLE `s2_user_token`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `expire_time` bigint NOT NULL,
  `token` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `expire_date_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_username`(`name` ASC, `user_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户令牌信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer`  (
  `singer_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `act_area` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `song_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `js_play_cnt` bigint NULL DEFAULT NULL,
  `down_cnt` bigint NULL DEFAULT NULL,
  `favor_cnt` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of singer
-- ----------------------------
INSERT INTO `singer` VALUES ('周杰伦', '港台', '青花瓷', '国风', 1000000, 1000000, 1000000);
INSERT INTO `singer` VALUES ('陈奕迅', '港台', '爱情转移', '流行', 1000000, 1000000, 1000000);
INSERT INTO `singer` VALUES ('林俊杰', '港台', '美人鱼', '流行', 1000000, 1000000, 1000000);
INSERT INTO `singer` VALUES ('张碧晨', '内地', '光的方向', '流行', 1000000, 1000000, 1000000);
INSERT INTO `singer` VALUES ('程响', '内地', '人间烟火', '国风', 1000000, 1000000, 1000000);
INSERT INTO `singer` VALUES ('Taylor Swift', '欧美', 'Love Story', '流行', 1000000, 1000000, 1000000);

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `imp_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `song_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `artist_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `f_id` bigint NULL DEFAULT NULL,
  `g_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rating` int NULL DEFAULT NULL,
  `languages` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `releasedate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `resolution` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES ('2024-12-10', 'Tumi 长袍 尼罗布', 'Shrikanta', '印度', 1, 'tagore', 8, '孟加拉语', '2011-08-28', 1080);
INSERT INTO `song` VALUES ('2024-12-10', '舒克诺 帕塔尔 努普尔 帕埃', 'Prity', '孟加拉国', 2, 'nazrul', 5, '孟加拉语', '1997-09-21', 512);
INSERT INTO `song` VALUES ('2024-12-10', '阿米·奥帕尔·霍伊', 'Farida', '孟加拉国', 3, '民间', 7, '孟加拉语', '2001-04-07', 320);
INSERT INTO `song` VALUES ('2024-12-10', '我的爱', 'Enrique', '美国', 4, '蓝调', 6, '英文', '2007-01-24', 1080);
INSERT INTO `song` VALUES ('2024-12-10', '打败它', 'Michel', '英国', 5, '流行', 8, '英文', '2002-03-17', 720);
INSERT INTO `song` VALUES ('2024-12-10', '阿杰伊阿卡什', 'Topu', '印度', 6, '现代', 10, '孟加拉语', '2004-03-27', 320);

SET FOREIGN_KEY_CHECKS = 1;
