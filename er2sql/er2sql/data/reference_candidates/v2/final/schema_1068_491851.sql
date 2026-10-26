-- Source: https://github.com/Boomuup/chayun.com/blob/3893bcd631c7671d62f4bb038a6674297584d7d6/db_tea-v3.sql?raw=true
-- Tables detected: 10 | FK constraints: 7
CREATE TABLE "address"  (
    "id" int NOT NULL AUTO_INCREMENT,
    "uid" int NOT NULL COMMENT '用户id,外键',
    "name" varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
    "phone" varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话\r\n',
    "province" varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
    "city" varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
    "district" varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
    "detailinfo" varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
    PRIMARY KEY ("id") USING BTREE,
    INDEX "foreign_key_to_user"("uid") USING BTREE,
    CONSTRAINT "foreign_key_to_user" FOREIGN KEY ("uid") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE "admin"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT '管理员id',
    "name" varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
    "password" varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
    "email" varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
    "role" int NOT NULL DEFAULT 0 COMMENT '1代表超级管理员，0代表普通管理管理员',
    "status" int NOT NULL DEFAULT 1 COMMENT '状态',
    "login_num" int NOT NULL DEFAULT 0 COMMENT '登录次数',
    "last_login" int NOT NULL DEFAULT 0 COMMENT '上一次登录的时间',
    "create_time" int NOT NULL COMMENT '创建时间',
    "update_time" int NOT NULL COMMENT '更新时间',
    PRIMARY KEY ("id") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE "banner"  (
    "id" int NOT NULL AUTO_INCREMENT,
    "picture" varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    "url" varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    "status" int NOT NULL,
    "create_time" int NULL DEFAULT 0,
    "update_time" int NULL DEFAULT 0,
    PRIMARY KEY ("id") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE "cart"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT '购物车id',
    "uid" int NOT NULL COMMENT '用户id',
    "shopid" int NOT NULL COMMENT '商品',
    "num" int NOT NULL COMMENT '数量',
    "create_time" int NULL DEFAULT 0,
    "update_time" int NULL DEFAULT 0,
    PRIMARY KEY ("id") USING BTREE,
    INDEX "uid"("uid") USING BTREE,
    CONSTRAINT "cart_ibfk_1" FOREIGN KEY ("uid") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE "category"  (
    "cid" int NOT NULL AUTO_INCREMENT COMMENT '分类id',
    "cname" varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
    "pid" int NOT NULL DEFAULT 0 COMMENT '父级id',
    "status" int NOT NULL DEFAULT 1 COMMENT '状态1启用0禁用',
    "create_time" int NOT NULL DEFAULT 0 COMMENT '创建时间',
    PRIMARY KEY ("cid") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE "comment"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT '评论id',
    "shopid" int NOT NULL COMMENT '商品id',
    "uid" int NOT NULL COMMENT '用户id',
    "orderid" int NOT NULL COMMENT '订单id',
    "score" int NOT NULL COMMENT '评分',
    "desc" varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
    "comment_time" int NOT NULL COMMENT '评论时间',
    "picture" varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述',
    "reply" varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家回复',
    "reply_time" int NULL DEFAULT NULL COMMENT '回复时间',
    "isreply" int NULL DEFAULT 0 COMMENT '是否回复',
    PRIMARY KEY ("id") USING BTREE,
    INDEX "foreign_key_for_orders"("orderid") USING BTREE,
    CONSTRAINT "foreign_key_for_orders" FOREIGN KEY ("orderid") REFERENCES "orders" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE "goods"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT '商品id',
    "cate_id" int NOT NULL COMMENT '分类id',
    "goods_name" varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
    "cost" float(8, 2) NOT NULL COMMENT '成本价',
    "original" float(8, 2) NOT NULL COMMENT '原价',
    "price" float(8, 2) NOT NULL COMMENT '现售价',
    "weight" int NOT NULL COMMENT '重量',
    "unit" varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
    "store" int NOT NULL COMMENT '库存',
    "sales" int NOT NULL DEFAULT 0 COMMENT '销量',
    "status" int NOT NULL DEFAULT 1 COMMENT '0为下架1为上架',
    "hot" int NOT NULL DEFAULT 0 COMMENT '是否热销',
    "softdel" int NOT NULL DEFAULT 0 COMMENT '软删除标志',
    "introduction" varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
    "picture" varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
    "content" text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品描述',
    "create_time" int NOT NULL DEFAULT 0 COMMENT '创建时间',
    "update_time" int NOT NULL DEFAULT 0 COMMENT '修改时间',
    PRIMARY KEY ("id") USING BTREE,
    INDEX "cate_id"("cate_id") USING BTREE,
    CONSTRAINT "goods_ibfk_1" FOREIGN KEY ("cate_id") REFERENCES "category" ("cid") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE "orders"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT '自增id',
    "shopid" int NOT NULL COMMENT '商品id',
    "uid" int NOT NULL COMMENT '用户id',
    "addressid" int NOT NULL COMMENT '地址id',
    "num" int NOT NULL COMMENT '商品数量',
    "total" float(12, 2) NOT NULL COMMENT '总价',
    "ordernumber" char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
    "status" SMALLINT NOT NULL DEFAULT 0 COMMENT '订单状态，0未发货，1已发货，2待评价，3交易完成',
    "create_time" int NULL DEFAULT NULL COMMENT '交易时间',
    "softdelete" int NULL DEFAULT 0 COMMENT '软删除',
    PRIMARY KEY ("id") USING BTREE,
    INDEX "foreign_to_user"("uid") USING BTREE,
    INDEX "foreign_to_goods"("shopid") USING BTREE,
    INDEX "foreign_to_address"("addressid") USING BTREE,
    CONSTRAINT "foreign_to_address" FOREIGN KEY ("addressid") REFERENCES "address" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "foreign_to_goods" FOREIGN KEY ("shopid") REFERENCES "goods" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "foreign_to_user" FOREIGN KEY ("uid") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE "smscode"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT '主键',
    "phone" varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
    "code" int NOT NULL COMMENT '验证码',
    "sendtime" int NOT NULL COMMENT '发送时间',
    "expiration" int NOT NULL COMMENT '过期时间',
    PRIMARY KEY ("id") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE "user"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT '用户id',
    "username" varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
    "password" varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
    "email" varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
    "phone" varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
    "icon" varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像url',
    "login_time" int NULL DEFAULT NULL COMMENT '登录时间',
    "create_time" int NULL DEFAULT 0 COMMENT '创建时间',
    "update_time" int NULL DEFAULT 0 COMMENT '修改时间',
    "status" int NULL DEFAULT 1 COMMENT '状态',
    PRIMARY KEY ("id") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
