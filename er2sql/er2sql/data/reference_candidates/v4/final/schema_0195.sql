-- Source: https://github.com/dqlovepp/codeFragment/blob/f20f6e75e400e5480b039c42e06c934c3a037654/findmeWeb/fm.sql?raw=true
-- Tables detected: 22 | FK/REFERENCES mentions: 1
CREATE TABLE "fanmi_address" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "member_id" INTEGER unsigned NOT NULL,
    "shr_name" varchar(30) NOT NULL,
    "shr_province" varchar(30) NOT NULL,
    "shr_city" varchar(30) NOT NULL,
    "shr_area" varchar(30) NOT NULL,
    "shr_address" varchar(30) NOT NULL,
    "shr_phone" varchar(30) NOT NULL,
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_admin" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "username" varchar(30) NOT NULL,
    "password" char(32) NOT NULL,
    "role_id" INTEGER unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

CREATE TABLE "fanmi_attribute" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "attr_name" varchar(30) NOT NULL,
    "attr_type" enum('单选','唯一') NOT NULL DEFAULT '唯一',
    "attr_option_value" varchar(300) NOT NULL DEFAULT '',
    "type_id" INTEGER unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_brand" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "brand_name" varchar(30) NOT NULL,
    "site_url" varchar(150) NOT NULL DEFAULT '',
    "brand_logo" varchar(150) NOT NULL DEFAULT '',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_cart" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "goods_id" INTEGER unsigned NOT NULL,
    "member_id" INTEGER unsigned NOT NULL,
    "gaid" varchar(30) NOT NULL DEFAULT '',
    "gastr" varchar(150) NOT NULL DEFAULT '',
    "goods_number" int unsigned NOT NULL DEFAULT '1',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_category" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "cat_name" varchar(30) NOT NULL,
    "parent_id" INTEGER unsigned NOT NULL DEFAULT '0',
    "price_section" SMALLINT unsigned NOT NULL DEFAULT '5',
    "cat_keywords" varchar(300) NOT NULL DEFAULT '',
    "cat_description" varchar(300) NOT NULL DEFAULT '',
    "attr_id" varchar(150) NOT NULL DEFAULT '',
    "rec_id" varchar(150) NOT NULL DEFAULT '',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_goods" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "goods_name" varchar(30) NOT NULL,
    "sm_logo" varchar(150) NOT NULL DEFAULT '',
    "mid_logo" varchar(150) NOT NULL DEFAULT '',
    "big_logo" varchar(150) NOT NULL DEFAULT '',
    "logo" varchar(150) NOT NULL DEFAULT '',
    "cat_id" INTEGER unsigned NOT NULL DEFAULT '0',
    "brand_id" INTEGER unsigned NOT NULL DEFAULT '0',
    "market_price" decimal(10,2) NOT NULL DEFAULT '0.00',
    "shop_price" decimal(10,2) NOT NULL DEFAULT '0.00',
    "is_on_sale" enum('是','否') NOT NULL DEFAULT '是',
    "goods_desc" text,
    "type_id" INTEGER unsigned NOT NULL DEFAULT '0',
    "rec_id" varchar(150) NOT NULL DEFAULT '',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_goods_attr" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "goods_id" INTEGER unsigned NOT NULL DEFAULT '0',
    "attr_id" INTEGER unsigned NOT NULL DEFAULT '0',
    "attr_value" varchar(150) NOT NULL DEFAULT '',
    "attr_price" decimal(10,2) NOT NULL DEFAULT '0.00',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_goods_number" (
    "goods_id" INTEGER unsigned NOT NULL DEFAULT '0',
    "goods_number" int unsigned NOT NULL DEFAULT '0',
    "goodsattr_id" varchar(150) NOT NULL DEFAULT ''
) ;

CREATE TABLE "fanmi_goods_pic" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "sm_logo" varchar(150) NOT NULL DEFAULT '',
    "mid_logo" varchar(150) NOT NULL DEFAULT '',
    "logo" varchar(150) NOT NULL DEFAULT '',
    "goods_id" INTEGER unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_history" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "member_id" INTEGER unsigned NOT NULL,
    "goods_id" INTEGER unsigned NOT NULL,
    "view_count" int unsigned DEFAULT '0',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_member" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "username" varchar(30) NOT NULL,
    "email" varchar(150) NOT NULL,
    "password" char(32) NOT NULL,
    "email_code" char(13) NOT NULL,
    "email_code_time" int unsigned NOT NULL,
    "jifen" int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_member_level" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "level_name" varchar(30) NOT NULL,
    "top" int unsigned NOT NULL DEFAULT '0',
    "bottom" int unsigned NOT NULL DEFAULT '0',
    "rate" int unsigned NOT NULL DEFAULT '100',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_member_price" (
    "price" decimal(10,2) NOT NULL DEFAULT '0.00',
    "level_id" INTEGER unsigned NOT NULL DEFAULT '0',
    "goods_id" INTEGER unsigned NOT NULL DEFAULT '0'
) ;

CREATE TABLE "fanmi_order" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "member_id" INTEGER unsigned NOT NULL,
    "addtime" TIMESTAMP NOT NULL,
    "shr_name" varchar(30) NOT NULL,
    "shr_province" varchar(30) NOT NULL,
    "shr_city" varchar(30) NOT NULL,
    "shr_area" varchar(30) NOT NULL,
    "shr_address" varchar(30) NOT NULL,
    "shr_phone" varchar(30) NOT NULL,
    "pay_status" SMALLINT unsigned NOT NULL DEFAULT '0',
    "post_status" SMALLINT unsigned NOT NULL DEFAULT '0',
    "order_status" SMALLINT unsigned NOT NULL DEFAULT '0',
    "post_method" varchar(30) NOT NULL DEFAULT '',
    "pay_method" varchar(30) NOT NULL DEFAULT '',
    "total_price" decimal(10,2) NOT NULL DEFAULT '0.00',
    "return_status" SMALLINT NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

CREATE TABLE "fanmi_order_goods" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "member_id" INTEGER unsigned NOT NULL,
    "order_id" INTEGER unsigned NOT NULL,
    "goods_id" INTEGER unsigned NOT NULL,
    "goodsattr_id" varchar(150) NOT NULL DEFAULT '',
    "price" decimal(10,2) NOT NULL DEFAULT '0.00',
    "goods_number" int unsigned NOT NULL DEFAULT '1',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_privilege" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "pri_name" varchar(30) NOT NULL,
    "module_name" varchar(30) NOT NULL,
    "controller_name" varchar(30) NOT NULL,
    "action_name" varchar(30) NOT NULL,
    "parent_id" INTEGER unsigned NOT NULL DEFAULT '0',
    "pri_level" SMALLINT unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ;

CREATE TABLE "fanmi_recommend" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "rec_name" varchar(150) NOT NULL,
    "rec_type" enum('商品','分类') NOT NULL,
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_remark" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "member_id" INTEGER unsigned NOT NULL,
    "goods_id" INTEGER unsigned NOT NULL,
    "content" varchar(300) NOT NULL,
    "addtime" TIMESTAMP NOT NULL,
    "stars" SMALLINT unsigned NOT NULL DEFAULT '5',
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_role" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "role_name" varchar(30) NOT NULL,
    "pri_id" varchar(150) NOT NULL DEFAULT '',
    PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ;

CREATE TABLE "fanmi_type" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "type_name" varchar(30) NOT NULL,
    PRIMARY KEY ("id")
) ;

CREATE TABLE "fanmi_yinxiang" (
    "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
    "goods_id" INTEGER unsigned NOT NULL,
    "yx_name" varchar(30) NOT NULL,
    "yx_count" int unsigned NOT NULL,
    PRIMARY KEY ("id")
) ;
ALTER TABLE "fanmi_attribute" ADD CONSTRAINT "fanmi_attribute_ibfk_1" FOREIGN KEY ("type_id") REFERENCES "fanmi_type" ("id") ON DELETE CASCADE;
CREATE INDEX ON "fanmi_attribute" ("type_id");
CREATE INDEX ON "fanmi_goods" ("shop_price");
COMMENT ON COLUMN "fanmi_address"."id" IS 'id';
COMMENT ON COLUMN "fanmi_address"."member_id" IS '会员的ID';
COMMENT ON COLUMN "fanmi_address"."shr_name" IS '收货人姓名';
COMMENT ON COLUMN "fanmi_address"."shr_province" IS '收货人省';
COMMENT ON COLUMN "fanmi_address"."shr_city" IS '收货人市';
COMMENT ON COLUMN "fanmi_address"."shr_area" IS '收货人地区';
COMMENT ON COLUMN "fanmi_address"."shr_address" IS '收货人详细地址';
COMMENT ON COLUMN "fanmi_address"."shr_phone" IS '收货人手机';
COMMENT ON COLUMN "fanmi_admin"."id" IS 'id';
COMMENT ON COLUMN "fanmi_admin"."username" IS '用户名';
COMMENT ON COLUMN "fanmi_admin"."password" IS '密码';
COMMENT ON COLUMN "fanmi_admin"."role_id" IS '角色的id';
COMMENT ON COLUMN "fanmi_attribute"."id" IS 'id';
COMMENT ON COLUMN "fanmi_attribute"."attr_name" IS '属性名称';
COMMENT ON COLUMN "fanmi_attribute"."attr_type" IS '属性类型';
COMMENT ON COLUMN "fanmi_attribute"."attr_option_value" IS '属性可选值';
COMMENT ON COLUMN "fanmi_attribute"."type_id" IS '类型id';
COMMENT ON COLUMN "fanmi_brand"."id" IS 'id';
COMMENT ON COLUMN "fanmi_brand"."brand_name" IS '品牌名称';
COMMENT ON COLUMN "fanmi_brand"."site_url" IS '官方网站';
COMMENT ON COLUMN "fanmi_brand"."brand_logo" IS '图片的LOGO';
COMMENT ON COLUMN "fanmi_cart"."id" IS 'id';
COMMENT ON COLUMN "fanmi_cart"."goods_id" IS '商品的id';
COMMENT ON COLUMN "fanmi_cart"."member_id" IS '会员的ID';
COMMENT ON COLUMN "fanmi_cart"."gaid" IS '商品属性的id';
COMMENT ON COLUMN "fanmi_cart"."gastr" IS '商品属性的字符串';
COMMENT ON COLUMN "fanmi_cart"."goods_number" IS '商品的数量';
COMMENT ON COLUMN "fanmi_category"."id" IS 'id';
COMMENT ON COLUMN "fanmi_category"."cat_name" IS '分类名称';
COMMENT ON COLUMN "fanmi_category"."parent_id" IS '上级分类的id';
COMMENT ON COLUMN "fanmi_category"."price_section" IS '价格区间';
COMMENT ON COLUMN "fanmi_category"."cat_keywords" IS '页面的关键字';
COMMENT ON COLUMN "fanmi_category"."cat_description" IS '页面的描述';
COMMENT ON COLUMN "fanmi_category"."attr_id" IS '筛选属性id,多个用，隔开';
COMMENT ON COLUMN "fanmi_category"."rec_id" IS '推荐位的ID，多个用，隔开';
COMMENT ON COLUMN "fanmi_goods"."id" IS 'id';
COMMENT ON COLUMN "fanmi_goods"."goods_name" IS '商品名称';
COMMENT ON COLUMN "fanmi_goods"."sm_logo" IS '小图';
COMMENT ON COLUMN "fanmi_goods"."mid_logo" IS '中图';
COMMENT ON COLUMN "fanmi_goods"."big_logo" IS '大图';
COMMENT ON COLUMN "fanmi_goods"."logo" IS '原图';
COMMENT ON COLUMN "fanmi_goods"."cat_id" IS '分类ID';
COMMENT ON COLUMN "fanmi_goods"."brand_id" IS '品牌ID';
COMMENT ON COLUMN "fanmi_goods"."market_price" IS '市场价';
COMMENT ON COLUMN "fanmi_goods"."shop_price" IS '本店价';
COMMENT ON COLUMN "fanmi_goods"."is_on_sale" IS '是否上架';
COMMENT ON COLUMN "fanmi_goods"."goods_desc" IS '商品描述';
COMMENT ON COLUMN "fanmi_goods"."type_id" IS '商品类型id';
COMMENT ON COLUMN "fanmi_goods"."rec_id" IS '推荐位的ID，多个用，隔开';
COMMENT ON COLUMN "fanmi_goods_attr"."id" IS 'id';
COMMENT ON COLUMN "fanmi_goods_attr"."goods_id" IS '商品的id';
COMMENT ON COLUMN "fanmi_goods_attr"."attr_id" IS '属性id';
COMMENT ON COLUMN "fanmi_goods_attr"."attr_value" IS '属性值';
COMMENT ON COLUMN "fanmi_goods_attr"."attr_price" IS '属性的价格';
COMMENT ON COLUMN "fanmi_goods_number"."goods_id" IS '商品的id';
COMMENT ON COLUMN "fanmi_goods_number"."goods_number" IS '商品数量';
COMMENT ON COLUMN "fanmi_goods_number"."goodsattr_id" IS '商品属性ID，如果有多个属性用,隔开';
COMMENT ON COLUMN "fanmi_goods_pic"."id" IS 'id';
COMMENT ON COLUMN "fanmi_goods_pic"."sm_logo" IS '小图';
COMMENT ON COLUMN "fanmi_goods_pic"."mid_logo" IS '中图';
COMMENT ON COLUMN "fanmi_goods_pic"."logo" IS '原图';
COMMENT ON COLUMN "fanmi_goods_pic"."goods_id" IS '商品的id';
COMMENT ON COLUMN "fanmi_history"."id" IS 'id';
COMMENT ON COLUMN "fanmi_history"."member_id" IS '会员的id';
COMMENT ON COLUMN "fanmi_history"."goods_id" IS '商品的id';
COMMENT ON COLUMN "fanmi_history"."view_count" IS '浏览的次数';
COMMENT ON COLUMN "fanmi_member"."id" IS 'id';
COMMENT ON COLUMN "fanmi_member"."username" IS '用户名';
COMMENT ON COLUMN "fanmi_member"."email" IS 'email';
COMMENT ON COLUMN "fanmi_member"."password" IS '密码';
COMMENT ON COLUMN "fanmi_member"."email_code" IS 'email验证码,如果这个字段为空，代表已经验证过了';
COMMENT ON COLUMN "fanmi_member"."email_code_time" IS '验证码生成的时间';
COMMENT ON COLUMN "fanmi_member"."jifen" IS '会员的积分';
COMMENT ON COLUMN "fanmi_member_level"."id" IS 'id';
COMMENT ON COLUMN "fanmi_member_level"."level_name" IS '级别名称';
COMMENT ON COLUMN "fanmi_member_level"."top" IS '积分上限';
COMMENT ON COLUMN "fanmi_member_level"."bottom" IS '积分下限';
COMMENT ON COLUMN "fanmi_member_level"."rate" IS '折扣';
COMMENT ON COLUMN "fanmi_member_price"."price" IS '价格';
COMMENT ON COLUMN "fanmi_member_price"."level_id" IS '会员级别id';
COMMENT ON COLUMN "fanmi_member_price"."goods_id" IS '商品的id';
COMMENT ON COLUMN "fanmi_order"."id" IS 'id';
COMMENT ON COLUMN "fanmi_order"."member_id" IS '会员的ID';
COMMENT ON COLUMN "fanmi_order"."addtime" IS '下单时间';
COMMENT ON COLUMN "fanmi_order"."shr_name" IS '收货人姓名';
COMMENT ON COLUMN "fanmi_order"."shr_province" IS '收货人省';
COMMENT ON COLUMN "fanmi_order"."shr_city" IS '收货人市';
COMMENT ON COLUMN "fanmi_order"."shr_area" IS '收货人地区';
COMMENT ON COLUMN "fanmi_order"."shr_address" IS '收货人详细地址';
COMMENT ON COLUMN "fanmi_order"."shr_phone" IS '收货人手机';
COMMENT ON COLUMN "fanmi_order"."pay_status" IS '支付状态,0:未支付 1：已支付';
COMMENT ON COLUMN "fanmi_order"."post_status" IS '发货状态， 0：未发货， 1：已发化 2：已收货';
COMMENT ON COLUMN "fanmi_order"."order_status" IS '定单状态 0：未确认 1：已确认 2：已完成 3.申请退货 4.退货成功';
COMMENT ON COLUMN "fanmi_order"."post_method" IS '发货方式';
COMMENT ON COLUMN "fanmi_order"."pay_method" IS '支付方式';
COMMENT ON COLUMN "fanmi_order"."total_price" IS '定单总价';
COMMENT ON COLUMN "fanmi_order"."return_status" IS '退货记录0:不退货,1:退货中,2:已经退货';
COMMENT ON COLUMN "fanmi_order_goods"."id" IS 'id';
COMMENT ON COLUMN "fanmi_order_goods"."member_id" IS '会员的ID';
COMMENT ON COLUMN "fanmi_order_goods"."order_id" IS '定单的ID';
COMMENT ON COLUMN "fanmi_order_goods"."goods_id" IS '商品的ID';
COMMENT ON COLUMN "fanmi_order_goods"."goodsattr_id" IS '商品属性ID';
COMMENT ON COLUMN "fanmi_order_goods"."price" IS '商品价格';
COMMENT ON COLUMN "fanmi_order_goods"."goods_number" IS '购买的数量';
COMMENT ON COLUMN "fanmi_privilege"."id" IS 'id';
COMMENT ON COLUMN "fanmi_privilege"."pri_name" IS '权限名称';
COMMENT ON COLUMN "fanmi_privilege"."module_name" IS '对应的模块名';
COMMENT ON COLUMN "fanmi_privilege"."controller_name" IS '对应的控制器名';
COMMENT ON COLUMN "fanmi_privilege"."action_name" IS '对应的方法名';
COMMENT ON COLUMN "fanmi_privilege"."parent_id" IS '上级权限的id';
COMMENT ON COLUMN "fanmi_privilege"."pri_level" IS '权限的级别。0：一级 1：二级';
COMMENT ON COLUMN "fanmi_recommend"."id" IS 'id';
COMMENT ON COLUMN "fanmi_recommend"."rec_name" IS '推荐位名称';
COMMENT ON COLUMN "fanmi_recommend"."rec_type" IS '推荐位的类型';
COMMENT ON COLUMN "fanmi_remark"."id" IS 'id';
COMMENT ON COLUMN "fanmi_remark"."member_id" IS '会员的id';
COMMENT ON COLUMN "fanmi_remark"."goods_id" IS '商品的id';
COMMENT ON COLUMN "fanmi_remark"."content" IS '评论的内容';
COMMENT ON COLUMN "fanmi_remark"."addtime" IS '评论的时间';
COMMENT ON COLUMN "fanmi_remark"."stars" IS '打分';
COMMENT ON COLUMN "fanmi_role"."id" IS 'id';
COMMENT ON COLUMN "fanmi_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "fanmi_role"."pri_id" IS '权限的ID，如果有多个权限就用,隔开，如1,3,4';
COMMENT ON COLUMN "fanmi_type"."id" IS 'id';
COMMENT ON COLUMN "fanmi_type"."type_name" IS '类型名称';
COMMENT ON COLUMN "fanmi_yinxiang"."id" IS 'id';
COMMENT ON COLUMN "fanmi_yinxiang"."goods_id" IS '商品的id';
COMMENT ON COLUMN "fanmi_yinxiang"."yx_name" IS '印象';
COMMENT ON COLUMN "fanmi_yinxiang"."yx_count" IS '印象次数';
COMMENT ON TABLE "fanmi_yinxiang" IS '印象';
COMMENT ON TABLE "fanmi_type" IS '商品类型';
COMMENT ON TABLE "fanmi_role" IS '角色';
COMMENT ON TABLE "fanmi_remark" IS '评论';
COMMENT ON TABLE "fanmi_recommend" IS '推荐位';
COMMENT ON TABLE "fanmi_privilege" IS '权限';
COMMENT ON TABLE "fanmi_order_goods" IS '定单商品';
COMMENT ON TABLE "fanmi_order" IS '定单基本信息';
COMMENT ON TABLE "fanmi_member_price" IS '会员价格';
COMMENT ON TABLE "fanmi_member_level" IS '会员级别';
COMMENT ON TABLE "fanmi_member" IS '会员';
COMMENT ON TABLE "fanmi_history" IS '浏览历史';
COMMENT ON TABLE "fanmi_goods_pic" IS '商品图片';
COMMENT ON TABLE "fanmi_goods_number" IS '商品库存';
COMMENT ON TABLE "fanmi_goods_attr" IS '商品属性';
COMMENT ON TABLE "fanmi_goods" IS '商品表';
COMMENT ON TABLE "fanmi_category" IS '商品分类';
COMMENT ON TABLE "fanmi_cart" IS '购物车';
COMMENT ON TABLE "fanmi_brand" IS '商品品牌';
COMMENT ON TABLE "fanmi_attribute" IS '属性表';
COMMENT ON TABLE "fanmi_admin" IS '管理员';
COMMENT ON TABLE "fanmi_address" IS '收货人';
