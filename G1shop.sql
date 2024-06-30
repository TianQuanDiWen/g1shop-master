/*
 Navicat Premium Data Transfer

 Source Server         : cdb-rtisxlky.cd.tencentcdb.com_10095
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-rtisxlky.cd.tencentcdb.com:10095
 Source Schema         : G1shop

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 28/08/2021 14:54:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for afterSale
-- ----------------------------
DROP TABLE IF EXISTS `afterSale`;
CREATE TABLE `afterSale`  (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) NOT NULL,
  `order_id` int(64) NOT NULL,
  `money` decimal(64, 0) NULL DEFAULT NULL,
  `remarks` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sale_user`(`user_id`) USING BTREE,
  INDEX `sale_order`(`order_id`) USING BTREE,
  CONSTRAINT `sale_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sale_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of afterSale
-- ----------------------------
INSERT INTO `afterSale` VALUES (3, 1, 74, 0, '不好用！', 1);
INSERT INTO `afterSale` VALUES (4, 1, 74, 100, '尽快退款', 2);
INSERT INTO `afterSale` VALUES (5, 1, 74, 0, '未付款！', 3);
INSERT INTO `afterSale` VALUES (6, 1, 76, 0, '不好用', 1);
INSERT INTO `afterSale` VALUES (7, 1, 76, 0, '未付款', 3);
INSERT INTO `afterSale` VALUES (8, 9, 81, 1000, '老是卡顿！', 2);
INSERT INTO `afterSale` VALUES (9, 297, 82, 0, '商品损坏！', 1);
INSERT INTO `afterSale` VALUES (10, 295, 83, 0, '不好用！', 1);
INSERT INTO `afterSale` VALUES (11, 1, 83, 0, '未付款！', 3);
INSERT INTO `afterSale` VALUES (12, 1, 84, 0, '不好用', 1);
INSERT INTO `afterSale` VALUES (13, 1, 84, 0, '未付款', 3);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int(36) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) NULL DEFAULT NULL,
  `goods_id` int(22) NULL DEFAULT NULL,
  `goods_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` decimal(10, 2) NULL DEFAULT NULL,
  `goods_num` int(36) NULL DEFAULT NULL,
  `goods_img` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `pk_user`(`user_id`) USING BTREE,
  INDEX `pk_goods`(`goods_id`) USING BTREE,
  CONSTRAINT `pk_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int(22) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_price` decimal(10, 2) NOT NULL,
  `goods_introduce` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `goods_img` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 'Note 9 Pro', 1699.00, '一亿像素夜景相机，120Hz六档变速高刷', '2021-05-30 21:10:45', 'products/1/0007.jpg', 1);
INSERT INTO `goods` VALUES (2, 'Note 9 ', 1399.00, '天玑 800U处理器，5000mAh电', '2021-05-30 21:12:33', 'products/1/0008.jpg', 1);
INSERT INTO `goods` VALUES (3, 'Note 9 4G', 1200.00, '6000mAh长续航', '2021-05-30 21:14:43', 'products/1/0009.jpg', 1);
INSERT INTO `goods` VALUES (4, '小米10 至尊版', 5400.00, '120X 变焦/120W秒充/120Hz屏幕', '2021-05-30 21:16:12', 'products/1/0010.jpg', 1);
INSERT INTO `goods` VALUES (5, 'Redmi K30S 至尊纪念版', 2699.00, '144Hz[7档]变速高刷屏', '2021-05-30 21:16:54', 'products/1/0011.jpg', 1);
INSERT INTO `goods` VALUES (6, 'Redmi K30 至尊纪念版', 2199.00, '120Hz弹出全面屏，天玑1000+旗舰处理器', '2021-05-30 21:16:56', 'products/1/0012.jpg', 1);
INSERT INTO `goods` VALUES (7, '腾讯黑鲨3S ', 4199.00, '骁龙865处理器，120Hz刷新率', '2021-05-30 21:16:58', 'products/1/0013.jpg', 1);
INSERT INTO `goods` VALUES (8, 'Redmi 9A', 699.00, '5000mAh长循环大电量，6.53\"超大护眼屏幕', '2021-05-30 21:16:59', 'products/1/0014.jpg', 1);
INSERT INTO `goods` VALUES (9, 'Redmi 8', 899.00, '5000mAh超长续航', '2021-05-30 21:17:00', 'products/1/0015.jpg', 1);
INSERT INTO `goods` VALUES (10, 'Redmi 8A', 799.00, '5000mAh超长续航', '2021-05-30 21:17:03', 'products/1/0016.jpg', 1);
INSERT INTO `goods` VALUES (11, '小米平板4 Plus ', 2200.00, '10英寸 LTE版 4GB+128GB 黑', '2021-05-30 22:45:44', 'products/2/0020.jpg', 2);
INSERT INTO `goods` VALUES (12, '小米游戏本', 9999.00, '全金属机身，采用第七代酷睿i7标压处理器', '2021-06-16 20:39:57', 'products/4/0021.jpg', 4);
INSERT INTO `goods` VALUES (13, 'Redmi 红米电视 70英寸', 3599.00, '70英寸震撼巨屏，4K画质，细腻如真', '2021-05-30 22:46:26', 'products/3/0017.jpg', 3);
INSERT INTO `goods` VALUES (14, '小米全面屏电视E32C', 999.00, '全面屏设计，人工智能系统', '2021-05-30 22:46:28', 'products/3/0018.jpg', 3);
INSERT INTO `goods` VALUES (15, '小米全面屏电视E55A', 2399.00, '全面屏设计，人工智能系统', '2021-05-30 22:46:34', 'products/3/0019.jpg', 3);
INSERT INTO `goods` VALUES (16, 'Air 12.5\" m3 4G 128G 银色', 3599.00, '全高清屏幕 / 长续航全金属 / 超窄边框', '2021-05-30 22:47:05', 'products/4/0001.jpg', 4);
INSERT INTO `goods` VALUES (18, '品家手持挂烫机', 129.00, '熨衣不伤衣丨除菌除螨丨轻巧便携', '2021-05-30 22:47:27', 'products/5/0002.jpg', 5);
INSERT INTO `goods` VALUES (19, '品家风冷对开门冰箱', 2499.00, '风冷无霜不结冰 / 环绕立体出风，长久锁水保鲜', '2021-05-30 22:47:42', 'products/5/0003.jpg', 5);
INSERT INTO `goods` VALUES (20, 'Redmi 红米电视 70英寸', 3599.00, '70英寸震撼巨屏，4K画质，细腻如真', '2021-05-30 22:47:44', 'products/3/0017.jpg', 5);
INSERT INTO `goods` VALUES (21, '小米全面屏电视E32C', 999.00, '全面屏设计，人工智能系统', '2021-05-30 22:47:45', 'products/3/0018.jpg', 5);
INSERT INTO `goods` VALUES (22, '小米全面屏电视E55A', 2399.00, '全面屏设计，人工智能系统', '2021-05-30 22:47:49', 'products/3/0019.jpg', 5);
INSERT INTO `goods` VALUES (23, '品家料理机', 169.00, '6叶搅拌刀头 / 安全按压启动 / 轻巧机身', '2021-05-30 22:48:11', 'products/9/0030.jpg', 5);
INSERT INTO `goods` VALUES (24, '小米路由器4A', 169.00, '双核 CPU | 千兆网口 | 高增益 4 天线', '2021-05-30 22:48:14', 'products/6/0022.jpg', 6);
INSERT INTO `goods` VALUES (25, '小米AIoT路由器 AX3600', 699.00, 'Wi-Fi 6 豪华旗舰 5G时代路由先锋', '2021-05-30 22:48:15', 'products/6/0023.jpg', 6);
INSERT INTO `goods` VALUES (26, '小米路由器 AX1800', 359.00, '高通5核企业级芯片 / 4路独立信号放大器 / 256MB大内存 / 全屋覆盖WiFi ', '2021-05-30 22:48:17', 'products/6/0024.jpg', 6);
INSERT INTO `goods` VALUES (27, '一品全自动智能门锁', 2099.00, '疾速全自动锁体 | 多维半导体指纹 | 7种开锁方式 ', '2021-05-30 22:48:28', 'products/7/0025.jpg', 7);
INSERT INTO `goods` VALUES (28, '一品智能摄像机', 199.00, '高清画质，守护家的每一面', '2021-05-30 22:48:28', 'products/7/0026.jpg', 7);
INSERT INTO `goods` VALUES (29, '小爱触屏音箱', 199.00, '爱奇艺视频 I QQ音乐曲库 I 海量优质有声读物', '2021-05-30 22:48:29', 'products/7/0027.jpg', 7);
INSERT INTO `goods` VALUES (30, '品家驱蚊器 智能版', 69.00, '智能操控 / 一键循环定时 / 长效驱蚊 / 室内自由摆放 / 无加热设计', '2021-05-30 22:48:30', 'products/9/0029.jpg', 7);
INSERT INTO `goods` VALUES (31, '品家料理机', 169.00, '6叶搅拌刀头 / 安全按压启动 / 轻巧机身', '2021-05-30 22:48:32', 'products/9/0030.jpg', 7);
INSERT INTO `goods` VALUES (32, '一品移动电源3 20000mAh 超级闪充版', 299.00, '20000mAh大容量 / 可上飞机 / 三口同时输出', '2021-05-30 22:48:48', 'products/8/0004.jpg', 8);
INSERT INTO `goods` VALUES (33, '品家魔方转换器', 59.00, '方形设计 / 三USB充电口 / 小巧便携 / 多重安全保护', '2021-05-30 22:49:03', 'products/8/0006.jpg', 8);
INSERT INTO `goods` VALUES (34, '小爱触屏音箱', 199.00, '爱奇艺视频 I QQ音乐曲库 I 海量优质有声读物', '2021-05-30 22:49:05', 'products/7/0027.jpg', 8);
INSERT INTO `goods` VALUES (35, '一品智能摄像机', 199.00, '高清画质，守护家的每一面', '2021-05-30 22:49:06', 'products/7/0025.jpg', 8);
INSERT INTO `goods` VALUES (36, '手机USB micro 数据线', 15.00, '环保材质 ／ 实用设计 ／ 稳定传输 ／ 轻巧方便', '2021-05-30 22:49:07', 'products/8/0028.jpg', 8);
INSERT INTO `goods` VALUES (37, 'HITH智能足浴按摩器', 399.00, '3D自动按摩，舒适恒温足浴，便捷移动排水，双重漏电保护', '2021-05-30 22:49:13', 'products/9/0005.jpg', 9);
INSERT INTO `goods` VALUES (38, '品家驱蚊器 智能版', 69.00, '智能操控 / 一键循环定时 / 长效驱蚊 / 室内自由摆放 / 无加热设计', '2021-05-30 22:49:14', 'products/9/0029.jpg', 9);
INSERT INTO `goods` VALUES (39, '品家料理机', 169.00, '6叶搅拌刀头 / 安全按压启动 / 轻巧机身', '2021-05-30 22:49:42', 'products/9/0030.jpg', 9);
INSERT INTO `goods` VALUES (107, '红色皮箱', 280.00, '时尚 耐用', '2021-06-21 18:34:24', 'pixiang.jpg', 10);
INSERT INTO `goods` VALUES (110, '小米小背包', 29.00, '城市休闲 / 简约设计 / 多容量选择 / 防泼水', '2021-06-16 20:19:59', 'products/10/beibao.jpg', 10);
INSERT INTO `goods` VALUES (111, '生生不息果冻色单肩包', 99.00, '潮酷 | 百搭 | 轻盈 | 实用', '2021-06-16 20:24:17', 'products/10/beibao.jpg', 10);
INSERT INTO `goods` VALUES (112, '小米净水器S1 800G', 1589.00, '800G超大通量，制水速度翻一倍', '2021-06-16 20:27:17', 'products/9/jingshuiqi.jpg', 9);
INSERT INTO `goods` VALUES (113, '8H Milan智能电动床Pro', 5099.00, '首创偏硬睡感电动床，升级四电机，小爱米家APP控制，免费安装', '2021-06-16 21:11:54', 'products/10/diandongchuang.jpg', 10);
INSERT INTO `goods` VALUES (114, '小米路由器AX9000', 999.00, '三频电竞路由器', '2021-06-16 20:33:41', 'products/6/luyouqi.jpg', 6);
INSERT INTO `goods` VALUES (115, '小米笔记本Pro 14', 5949.00, '2.5K超视网膜原色屏，120Hz高刷新率', '2021-06-16 21:11:10', 'products/4/bijiben.png', 4);
INSERT INTO `goods` VALUES (116, 'Redmibook Pro 15 锐龙版', 4799.00, '3.2K 超清视网膜全面屏 | 微米级一体精雕工艺', '2021-06-16 20:43:09', 'products/4/redmibijiben.jpg', 4);
INSERT INTO `goods` VALUES (117, '小米电视大师 82英寸', 11999.00, '超画质巨幕/星幕锐影/10.7亿原色/120Hz MEMC/AI大师引擎/HDR大满贯/杜比全景声/四核A73处理器', '2021-06-16 20:51:33', 'products/3/dianshi.jpg', 3);
INSERT INTO `goods` VALUES (118, '华为平板M6', 2499.00, '8.4英寸高能版影音娱乐游戏学习平板电脑6GB+128GB WIFI（幻影红）', '2021-06-16 20:59:37', 'products/2/hongpingban.jpg', 2);
INSERT INTO `goods` VALUES (119, '三星Galaxy Tab A7', 1099.00, '10.4英寸2K全面屏影音娱乐网课学习办公平板电脑(32G/Wi-Fi/7040mAh电池/SM-T500)遐想灰', '2021-06-16 21:01:54', 'products/2/sanxingpingban.jpg', 2);
INSERT INTO `goods` VALUES (120, 'Apple iPad 10.2英寸', 3999.00, '2020年新款 128G WLAN版/Retina显示屏/A12仿生芯片MYLF2CH/A）金色', '2021-06-16 21:03:32', 'products/2/ipad.jpg', 2);
INSERT INTO `goods` VALUES (124, '手机', 6999.00, '...', '2021-06-17 14:00:00', 'pixiang.jpg', 10);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(64) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) NOT NULL,
  `order_receiver` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trans_type` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_date` date NOT NULL,
  `order_state` int(10) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_code` int(24) NOT NULL,
  `tel_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarks` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `item_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `pk_order`(`user_id`) USING BTREE,
  CONSTRAINT `pk_order` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (74, 1, '行如火', '微信', '顺丰', '2021-06-10', 2, '郑州大学', 410000, '13523468456', '111', 2, 3);
INSERT INTO `order` VALUES (75, 1, '行如火', '微信', '顺丰', '2021-06-10', 2, '郑州大学', 410000, '13523468456', '1111111', NULL, 1);
INSERT INTO `order` VALUES (76, 1, '行如火', '微信', '圆通', '2021-06-16', 2, '郑州大学', 410000, '13523468456', '尽快发货！', 4, 2);
INSERT INTO `order` VALUES (77, 1, '行如火', '微信', '顺丰', '2021-06-16', 2, '郑州大学', 410000, '13523468456', '***', NULL, 2);
INSERT INTO `order` VALUES (78, 1, '行如火', '微信', '顺丰', '2021-06-16', 2, '郑州大学', 410000, '13523468456', '+++', NULL, 3);
INSERT INTO `order` VALUES (81, 9, '行如火', '微信', '圆通', '2021-06-16', 2, '郑州大学', 410000, '13523468456', '...', 1, 4);
INSERT INTO `order` VALUES (82, 297, '行如火', '微信', '圆通', '2021-06-16', 2, '郑州大学', 410000, '13523468456', '正常发货，轻拿轻放', 1, 2);
INSERT INTO `order` VALUES (83, 295, '行如火', '微信', '圆通', '2021-06-17', 2, '郑州大学', 410000, '13523468456', '....', 4, 2);
INSERT INTO `order` VALUES (84, 1, '行如火', '微信', '顺丰', '2021-06-17', 2, '郑州大学', 410000, '13523468456', 'ee', 4, 2);

-- ----------------------------
-- Table structure for orderItem
-- ----------------------------
DROP TABLE IF EXISTS `orderItem`;
CREATE TABLE `orderItem`  (
  `item_id` int(22) NOT NULL AUTO_INCREMENT,
  `order_id` int(64) NOT NULL,
  `goods_id` int(22) NOT NULL,
  `goods_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` decimal(10, 2) NULL DEFAULT NULL,
  `goods_num` int(36) NULL DEFAULT NULL,
  `goods_img` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `item_order`(`order_id`) USING BTREE,
  INDEX `item_goods`(`goods_id`) USING BTREE,
  CONSTRAINT `item_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderItem
-- ----------------------------
INSERT INTO `orderItem` VALUES (21, 74, 6, 'Redmi K30 至尊纪念版', 2199.00, 1, 'products/1/0012.jpg');
INSERT INTO `orderItem` VALUES (22, 74, 8, 'Redmi 9A', 699.00, 1, 'products/1/0014.jpg');
INSERT INTO `orderItem` VALUES (23, 74, 34, '小爱触屏音箱', 199.00, 1, 'products/7/0027.jpg');
INSERT INTO `orderItem` VALUES (24, 75, 3, 'Note 9 4G', 1200.00, 1, 'products/1/0009.jpg');
INSERT INTO `orderItem` VALUES (25, 76, 9, 'Redmi 8', 899.00, 2, 'products/1/0015.jpg');
INSERT INTO `orderItem` VALUES (26, 76, 113, '8H Milan智能电动床Pro', 5099.00, 1, 'products/10/diandongchuang.jpg');
INSERT INTO `orderItem` VALUES (27, 77, 114, '小米路由器AX9000', 999.00, 1, 'products/6/luyouqi.jpg');
INSERT INTO `orderItem` VALUES (28, 77, 7, '腾讯黑鲨3S ', 4199.00, 1, 'products/1/0013.jpg');
INSERT INTO `orderItem` VALUES (29, 78, 120, 'Apple iPad 10.2英寸', 3999.00, 1, 'products/2/ipad.jpg');
INSERT INTO `orderItem` VALUES (30, 78, 111, '生生不息果冻色单肩包', 99.00, 1, 'products/10/beibao.jpg');
INSERT INTO `orderItem` VALUES (31, 78, 26, '小米路由器 AX1800', 359.00, 1, 'products/6/0024.jpg');
INSERT INTO `orderItem` VALUES (32, 81, 4, '小米10 至尊版', 5400.00, 1, 'products/1/0010.jpg');
INSERT INTO `orderItem` VALUES (33, 81, 7, '腾讯黑鲨3S ', 4199.00, 1, 'products/1/0013.jpg');
INSERT INTO `orderItem` VALUES (34, 81, 13, 'Redmi 红米电视 70英寸', 3599.00, 2, 'products/3/0017.jpg');
INSERT INTO `orderItem` VALUES (35, 81, 26, '小米路由器 AX1800', 359.00, 1, 'products/6/0024.jpg');
INSERT INTO `orderItem` VALUES (36, 82, 9, 'Redmi 8', 899.00, 1, 'products/1/0015.jpg');
INSERT INTO `orderItem` VALUES (37, 82, 3, 'Note 9 4G', 1200.00, 1, 'products/1/0009.jpg');
INSERT INTO `orderItem` VALUES (38, 83, 9, 'Redmi 8', 899.00, 1, 'products/1/0015.jpg');
INSERT INTO `orderItem` VALUES (39, 83, 118, '华为平板M6', 2499.00, 2, 'products/2/hongpingban.jpg');
INSERT INTO `orderItem` VALUES (40, 84, 5, 'Redmi K30S 至尊纪念版', 2699.00, 5, 'products/1/0011.jpg');
INSERT INTO `orderItem` VALUES (41, 84, 8, 'Redmi 9A', 699.00, 1, 'products/1/0014.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(16) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `actual_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `licence_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `licence_type` int(10) NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(10) NULL DEFAULT NULL,
  `level` int(10) NULL DEFAULT NULL,
  `status` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 302 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'lyp', '123456', '刘', '郑州', '123456789', '450000', '4105211984061365333', 2, '15136289598', 'caoq@163.com', 2, 5, 2);
INSERT INTO `user` VALUES (2, 'xxx', 'yyy', 'zzz', 'dd', '123', '456', '789', 1, '123456', 'email', 1, 4, 2);
INSERT INTO `user` VALUES (9, '大会员', '123456', '刘', '河南', '北京大学', '4100000', '410212454548881', 0, '123654789', '44545454554@qq.com', 1, 3, 2);
INSERT INTO `user` VALUES (285, '行如火', '123456', '刘', '成都', '北京大学', '4100000', '410212454548881', 0, '123456789', '@qq.com', 1, 2, 1);
INSERT INTO `user` VALUES (286, '哈哈哈', '555', '刘', '厦门', '北京大学', '4100000', '410212454548881', 0, '123456789', '@qq.com', 1, 2, 1);
INSERT INTO `user` VALUES (287, '1111', '22222', '刘', '深圳', '北京大学', '4100000', '410212454548881', 0, '123456789', '@qq.com', 1, 2, 1);
INSERT INTO `user` VALUES (288, '123456', '123456', '刘', '上海', '郑州大学', '410000', '123456789', 0, '13523468456', '401141591@qq.com', 1, 1, 1);
INSERT INTO `user` VALUES (289, '会员', '123456', '刘', '郑州', '北京大学', '4100000', '410212454548881', 0, '13523468456', '401141591@qq.com', 1, 5, 1);
INSERT INTO `user` VALUES (290, 'hs', '123456', '黄', '郑州', '郑州', '123456', '410123456', 0, '13193750162', '@qq.com', 1, 4, 1);
INSERT INTO `user` VALUES (291, 'admin', 'aaa', 'aaa', 'aaa', '北京大学', '4100000', '410212454548881', 0, '50162', 'aaa', 1, 1, 2);
INSERT INTO `user` VALUES (293, '铜牌会员', '123456', '铜牌', '上海', '北京大学', '4100000', '410212454548881', 0, '12634845661', '123456789@qq.com', 1, 1, 2);
INSERT INTO `user` VALUES (294, '银牌会员', '123456', '银牌', '北京', '北京大学', '4100000', '410212454548881', 0, '12634845661', '123456789@qq.com', 1, 2, 2);
INSERT INTO `user` VALUES (295, '金牌会员', '123456', '金牌', '武汉', '北京大学', '4100111', '410212454548881', 2, '12634845661', '123456789@qq.com', 1, 3, 2);
INSERT INTO `user` VALUES (296, '白金会员', '123456', '白金', '天津', '北京大学', '4100000', '410212454548881', 2, '12634845661', '123456789@qq.com', 1, 4, 2);
INSERT INTO `user` VALUES (297, '钻石会员', '123456', '钻石', '香港', '北京大学', '4100000', '410212454548881', 1, '12634845661', '123456789@qq.com', 1, 5, 2);
INSERT INTO `user` VALUES (300, 'test', '123456', 'test', '重庆', '北京大学', '4100000', '410212454548881', 0, '13523468456', '401141591@qq.com', 1, 1, 1);
INSERT INTO `user` VALUES (301, '冻结', '123456', '钻石', '广州', '重庆大学', '4100000', '410212454548881', 2, '1234567895', '111', 1, 5, 1);

SET FOREIGN_KEY_CHECKS = 1;
