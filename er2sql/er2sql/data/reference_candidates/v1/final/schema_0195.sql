-- Source: https://github.com/dqlovepp/codeFragment/blob/f20f6e75e400e5480b039c42e06c934c3a037654/findmeWeb/fm.sql?raw=true
-- Tables detected: 22 | FK/REFERENCES mentions: 1
CREATE TABLE "fanmi_address" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "member_id" INTEGER unsigned NOT NULL COMMENT '会员的ID',
    "shr_name" varchar(30) NOT NULL COMMENT '收货人姓名',
    "shr_province" varchar(30) NOT NULL COMMENT '收货人省',
    "shr_city" varchar(30) NOT NULL COMMENT '收货人市',
    "shr_area" varchar(30) NOT NULL COMMENT '收货人地区',
    "shr_address" varchar(30) NOT NULL COMMENT '收货人详细地址',
    "shr_phone" varchar(30) NOT NULL COMMENT '收货人手机',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收货人';

CREATE TABLE "fanmi_admin" (
    "id" int unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "username" varchar(30) NOT NULL COMMENT '用户名',
    "password" char(32) NOT NULL COMMENT '密码',
    "role_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '角色的id',
    PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

CREATE TABLE "fanmi_attribute" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "attr_name" varchar(30) NOT NULL COMMENT '属性名称',
    "attr_type" enum('单选','唯一') NOT NULL DEFAULT '唯一' COMMENT '属性类型',
    "attr_option_value" varchar(300) NOT NULL DEFAULT '' COMMENT '属性可选值',
    "type_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
    PRIMARY KEY ("id"),
    KEY "type_id" ("type_id"),
    CONSTRAINT "fanmi_attribute_ibfk_1" FOREIGN KEY ("type_id") REFERENCES "fanmi_type" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='属性表';

CREATE TABLE "fanmi_brand" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "brand_name" varchar(30) NOT NULL COMMENT '品牌名称',
    "site_url" varchar(150) NOT NULL DEFAULT '' COMMENT '官方网站',
    "brand_logo" varchar(150) NOT NULL DEFAULT '' COMMENT '图片的LOGO',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品品牌';

CREATE TABLE "fanmi_cart" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "goods_id" INTEGER unsigned NOT NULL COMMENT '商品的id',
    "member_id" INTEGER unsigned NOT NULL COMMENT '会员的ID',
    "gaid" varchar(30) NOT NULL DEFAULT '' COMMENT '商品属性的id',
    "gastr" varchar(150) NOT NULL DEFAULT '' COMMENT '商品属性的字符串',
    "goods_number" int unsigned NOT NULL DEFAULT '1' COMMENT '商品的数量',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车';

CREATE TABLE "fanmi_category" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "cat_name" varchar(30) NOT NULL COMMENT '分类名称',
    "parent_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '上级分类的id',
    "price_section" SMALLINT unsigned NOT NULL DEFAULT '5' COMMENT '价格区间',
    "cat_keywords" varchar(300) NOT NULL DEFAULT '' COMMENT '页面的关键字',
    "cat_description" varchar(300) NOT NULL DEFAULT '' COMMENT '页面的描述',
    "attr_id" varchar(150) NOT NULL DEFAULT '' COMMENT '筛选属性id,多个用，隔开',
    "rec_id" varchar(150) NOT NULL DEFAULT '' COMMENT '推荐位的ID，多个用，隔开',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品分类';

CREATE TABLE "fanmi_goods" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "goods_name" varchar(30) NOT NULL COMMENT '商品名称',
    "sm_logo" varchar(150) NOT NULL DEFAULT '' COMMENT '小图',
    "mid_logo" varchar(150) NOT NULL DEFAULT '' COMMENT '中图',
    "big_logo" varchar(150) NOT NULL DEFAULT '' COMMENT '大图',
    "logo" varchar(150) NOT NULL DEFAULT '' COMMENT '原图',
    "cat_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
    "brand_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '品牌ID',
    "market_price" decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
    "shop_price" decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
    "is_on_sale" enum('是','否') NOT NULL DEFAULT '是' COMMENT '是否上架',
    "goods_desc" text COMMENT '商品描述',
    "type_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '商品类型id',
    "rec_id" varchar(150) NOT NULL DEFAULT '' COMMENT '推荐位的ID，多个用，隔开',
    PRIMARY KEY ("id"),
    KEY "shop_price" ("shop_price")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品表';

CREATE TABLE "fanmi_goods_attr" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "goods_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '商品的id',
    "attr_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
    "attr_value" varchar(150) NOT NULL DEFAULT '' COMMENT '属性值',
    "attr_price" decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '属性的价格',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品属性';

CREATE TABLE "fanmi_goods_number" (
    "goods_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '商品的id',
    "goods_number" int unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
    "goodsattr_id" varchar(150) NOT NULL DEFAULT '' COMMENT '商品属性ID，如果有多个属性用,隔开'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品库存';

CREATE TABLE "fanmi_goods_pic" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "sm_logo" varchar(150) NOT NULL DEFAULT '' COMMENT '小图',
    "mid_logo" varchar(150) NOT NULL DEFAULT '' COMMENT '中图',
    "logo" varchar(150) NOT NULL DEFAULT '' COMMENT '原图',
    "goods_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '商品的id',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品图片';

CREATE TABLE "fanmi_history" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "member_id" INTEGER unsigned NOT NULL COMMENT '会员的id',
    "goods_id" INTEGER unsigned NOT NULL COMMENT '商品的id',
    "view_count" int unsigned DEFAULT '0' COMMENT '浏览的次数',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='浏览历史';

CREATE TABLE "fanmi_member" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "username" varchar(30) NOT NULL COMMENT '用户名',
    "email" varchar(150) NOT NULL COMMENT 'email',
    "password" char(32) NOT NULL COMMENT '密码',
    "email_code" char(13) NOT NULL COMMENT 'email验证码,如果这个字段为空，代表已经验证过了',
    "email_code_time" int unsigned NOT NULL COMMENT '验证码生成的时间',
    "jifen" int unsigned NOT NULL DEFAULT '0' COMMENT '会员的积分',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员';

CREATE TABLE "fanmi_member_level" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "level_name" varchar(30) NOT NULL COMMENT '级别名称',
    "top" int unsigned NOT NULL DEFAULT '0' COMMENT '积分上限',
    "bottom" int unsigned NOT NULL DEFAULT '0' COMMENT '积分下限',
    "rate" int unsigned NOT NULL DEFAULT '100' COMMENT '折扣',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员级别';

CREATE TABLE "fanmi_member_price" (
    "price" decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
    "level_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '会员级别id',
    "goods_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '商品的id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员价格';

CREATE TABLE "fanmi_order" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "member_id" INTEGER unsigned NOT NULL COMMENT '会员的ID',
    "addtime" TIMESTAMP NOT NULL COMMENT '下单时间',
    "shr_name" varchar(30) NOT NULL COMMENT '收货人姓名',
    "shr_province" varchar(30) NOT NULL COMMENT '收货人省',
    "shr_city" varchar(30) NOT NULL COMMENT '收货人市',
    "shr_area" varchar(30) NOT NULL COMMENT '收货人地区',
    "shr_address" varchar(30) NOT NULL COMMENT '收货人详细地址',
    "shr_phone" varchar(30) NOT NULL COMMENT '收货人手机',
    "pay_status" SMALLINT unsigned NOT NULL DEFAULT '0' COMMENT '支付状态,0:未支付 1：已支付',
    "post_status" SMALLINT unsigned NOT NULL DEFAULT '0' COMMENT '发货状态， 0：未发货， 1：已发化 2：已收货',
    "order_status" SMALLINT unsigned NOT NULL DEFAULT '0' COMMENT '定单状态 0：未确认 1：已确认 2：已完成 3.申请退货 4.退货成功',
    "post_method" varchar(30) NOT NULL DEFAULT '' COMMENT '发货方式',
    "pay_method" varchar(30) NOT NULL DEFAULT '' COMMENT '支付方式',
    "total_price" decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定单总价',
    "return_status" SMALLINT NOT NULL DEFAULT '0' COMMENT '退货记录0:不退货,1:退货中,2:已经退货',
    PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='定单基本信息';

CREATE TABLE "fanmi_order_goods" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "member_id" INTEGER unsigned NOT NULL COMMENT '会员的ID',
    "order_id" INTEGER unsigned NOT NULL COMMENT '定单的ID',
    "goods_id" INTEGER unsigned NOT NULL COMMENT '商品的ID',
    "goodsattr_id" varchar(150) NOT NULL DEFAULT '' COMMENT '商品属性ID',
    "price" decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
    "goods_number" int unsigned NOT NULL DEFAULT '1' COMMENT '购买的数量',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='定单商品';

CREATE TABLE "fanmi_privilege" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "pri_name" varchar(30) NOT NULL COMMENT '权限名称',
    "module_name" varchar(30) NOT NULL COMMENT '对应的模块名',
    "controller_name" varchar(30) NOT NULL COMMENT '对应的控制器名',
    "action_name" varchar(30) NOT NULL COMMENT '对应的方法名',
    "parent_id" INTEGER unsigned NOT NULL DEFAULT '0' COMMENT '上级权限的id',
    "pri_level" SMALLINT unsigned NOT NULL DEFAULT '0' COMMENT '权限的级别。0：一级 1：二级',
    PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='权限';

CREATE TABLE "fanmi_recommend" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "rec_name" varchar(150) NOT NULL COMMENT '推荐位名称',
    "rec_type" enum('商品','分类') NOT NULL COMMENT '推荐位的类型',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐位';

CREATE TABLE "fanmi_remark" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "member_id" INTEGER unsigned NOT NULL COMMENT '会员的id',
    "goods_id" INTEGER unsigned NOT NULL COMMENT '商品的id',
    "content" varchar(300) NOT NULL COMMENT '评论的内容',
    "addtime" TIMESTAMP NOT NULL COMMENT '评论的时间',
    "stars" SMALLINT unsigned NOT NULL DEFAULT '5' COMMENT '打分',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论';

CREATE TABLE "fanmi_role" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "role_name" varchar(30) NOT NULL COMMENT '角色名称',
    "pri_id" varchar(150) NOT NULL DEFAULT '' COMMENT '权限的ID，如果有多个权限就用,隔开，如1,3,4',
    PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

CREATE TABLE "fanmi_type" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "type_name" varchar(30) NOT NULL COMMENT '类型名称',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型';

CREATE TABLE "fanmi_yinxiang" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    "goods_id" INTEGER unsigned NOT NULL COMMENT '商品的id',
    "yx_name" varchar(30) NOT NULL COMMENT '印象',
    "yx_count" int unsigned NOT NULL COMMENT '印象次数',
    PRIMARY KEY ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='印象';
