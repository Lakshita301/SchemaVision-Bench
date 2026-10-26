-- Source: https://github.com/mogobiz/mogobiz-core/blob/094cda6f5eb91753b380cb2693e2168704cfb4e2/scripts/oracle/create.sql?raw=true
-- Tables detected: 69 | FK/REFERENCES mentions: 196

create table account (id number(19,0) not null, account_type varchar2(255 char), active number(1,0) not null, autosign number(1,0) not null, birthdate timestamp, civility varchar2(255 char), company_fk number(19,0), date_created timestamp not null, email varchar2(255 char) not null unique, external_id varchar2(255 char), first_name varchar2(255 char), last_name varchar2(255 char), last_updated timestamp not null, location_fk number(19,0), login varchar2(255 char) not null unique, password varchar2(255 char) not null, phone varchar2(255 char), token varchar2(255 char), token_secret varchar2(255 char), uuid varchar2(255 char) not null, primary key (id));

create table account_xrole (roles_fk number(19,0), role_id number(19,0));

create table album (id number(19,0) not null, company_fk number(19,0), date_created timestamp not null, description varchar2(255 char), last_updated timestamp not null, name varchar2(255 char) not null, uuid varchar2(255 char) not null, primary key (id));

create table b_o_cart (id number(19,0) not null, buyer varchar2(255 char) not null, company_fk number(19,0) not null, currency_code varchar2(255 char) not null, currency_rate double precision not null, xdate timestamp not null, date_created timestamp not null, last_updated timestamp not null, price number(19,0) not null, status varchar2(255 char) not null, transaction_uuid varchar2(255 char) not null unique, uuid varchar2(255 char) not null, primary key (id));

create table b_o_cart_item (id number(19,0) not null, b_o_cart_fk number(19,0) not null, code varchar2(255 char) not null unique, date_created timestamp not null, end_date timestamp, end_price number(19,0) not null, hidden number(1,0) not null, last_updated timestamp not null, price number(19,0) not null, quantity number(10,0) not null, start_date timestamp, tax float not null, ticket_type_fk number(19,0) not null, total_end_price number(19,0) not null, total_price number(19,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table b_o_cart_item_b_o_product (b_o_products_fk number(19,0), boproduct_id number(19,0));

create table b_o_product (id number(19,0) not null, acquittement number(1,0) not null, date_created timestamp not null, last_updated timestamp not null, price number(19,0) not null, principal number(1,0) not null, product_fk number(19,0), uuid varchar2(255 char) not null, primary key (id));

create table b_o_product_consumption (consumptions_fk number(19,0), consumption_id number(19,0));

create table b_o_ticket_type (id number(19,0) not null, age number(10,0) not null, b_o_product_fk number(19,0) not null, birthdate timestamp, date_created timestamp not null, email varchar2(255 char), end_date timestamp, firstname varchar2(255 char), last_updated timestamp not null, lastname varchar2(255 char), phone varchar2(255 char), price number(19,0) not null, qrcode clob, qrcode_content clob, quantity number(10,0) not null, short_code varchar2(255 char), start_date timestamp, ticket_type varchar2(255 char), uuid varchar2(255 char) not null, primary key (id));

create table brand (id number(19,0) not null, company_fk number(19,0) not null, date_created timestamp not null, description clob, facebooksite varchar2(255 char), hide number(1,0) not null, ibeacon_fk number(19,0), last_updated timestamp not null, name varchar2(255 char) not null, parent_fk number(19,0), twitter varchar2(255 char), uuid varchar2(255 char) not null, website varchar2(255 char), primary key (id));

create table brand_property (id number(19,0) not null, brand_fk number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, name varchar2(255 char) not null, uuid varchar2(255 char) not null, value varchar2(255 char), primary key (id));

create table category (id number(19,0) not null, catalog_fk number(19,0), company_fk number(19,0) not null, date_created timestamp not null, deleted number(1,0) not null, description clob, external_code varchar2(255 char), google_category varchar2(255 char), hide number(1,0) not null, ibeacon_fk number(19,0), keywords varchar2(255 char), last_updated timestamp not null, name varchar2(255 char) not null, parent_fk number(19,0), position number(10,0) not null, sanitized_name varchar2(255 char), uuid varchar2(255 char) not null, primary key (id));

create table company (id number(19,0) not null, aes_password varchar2(255 char) not null, api_key varchar2(255 char), code varchar2(255 char) not null, country_code varchar2(255 char), currency_code varchar2(255 char), date_created timestamp not null, default_language varchar2(255 char) not null, email varchar2(255 char), external_code varchar2(255 char), gakey varchar2(255 char), google_content_fk number(19,0), google_env_fk number(19,0), handling_time number(10,0), last_updated timestamp not null, location_fk number(19,0), map_provider varchar2(255 char), name varchar2(255 char) not null, online_validation number(1,0) not null, phone varchar2(255 char), refund_policy varchar2(255 char), return_policy number(10,0), ship_from_fk number(19,0), shipping_carriers_fedex number(1,0), shipping_carriers_ups number(1,0), shipping_international number(1,0) not null, start_date timestamp, stop_date timestamp, temp_session_id varchar2(255 char), uuid varchar2(255 char) not null, website varchar2(255 char), weight_unit varchar2(255 char), primary key (id));

create table company_property (id number(19,0) not null, company_fk number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, name varchar2(255 char) not null, uuid varchar2(255 char) not null, value varchar2(255 char) not null, primary key (id));

create table consumption (id number(19,0) not null, b_o_ticket_type_fk number(19,0), xdate timestamp not null, date_created timestamp not null, last_updated timestamp not null, uuid varchar2(255 char) not null, primary key (id));

create table coupon (id number(19,0) not null, active number(1,0) not null, anonymous number(1,0) not null, catalog_wise number(1,0) not null, code varchar2(255 char) not null unique, company_fk number(19,0) not null, date_created timestamp not null, description clob, end_date timestamp, for_sale number(1,0) not null, last_updated timestamp not null, name varchar2(255 char) not null, number_of_uses number(19,0), reduction_sold_fk number(19,0), start_date timestamp, uuid varchar2(255 char) not null, primary key (id));

create table coupon_category (categories_fk number(19,0), category_id number(19,0));

create table coupon_product (products_fk number(19,0), product_id number(19,0));

create table coupon_reduction_rule (rules_fk number(19,0), reduction_rule_id number(19,0));

create table coupon_ticket_type (ticket_types_fk number(19,0), ticket_type_id number(19,0));

create table date_period (id number(19,0) not null, date_created timestamp not null, end_date timestamp not null, last_updated timestamp not null, product_fk number(19,0), start_date timestamp not null, uuid varchar2(255 char) not null, primary key (id));

create table es_env (id number(19,0) not null, active number(1,0) not null, company_fk number(19,0) not null, cron_expr varchar2(255 char) not null, date_created timestamp not null, extra clob, idx varchar2(255 char), last_updated timestamp not null, name varchar2(255 char) not null, running number(1,0) not null, url varchar2(255 char) not null, uuid varchar2(255 char) not null, primary key (id));

create table event (id number(19,0) not null, xdate timestamp not null, date_created timestamp not null, description clob, last_updated timestamp not null, product_fk number(19,0), resource_fk number(19,0), user_fk number(19,0) not null, uuid varchar2(255 char) not null, xtype varchar2(255 char) not null, primary key (id));

create table event_period_sale (id number(19,0) not null, date_created timestamp not null, event_date timestamp, event_start_time timestamp, last_updated timestamp not null, nb_ticket_sold number(19,0) not null, product_fk number(19,0), uuid varchar2(255 char) not null, primary key (id));

create table external_account (id number(19,0) not null, account_type varchar2(255 char) not null, date_created timestamp not null, external_id varchar2(255 char), last_updated timestamp not null, login varchar2(255 char) not null, token varchar2(255 char), token_secret varchar2(255 char), user_fk number(19,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table external_auth_login (id number(19,0) not null, account_type varchar2(255 char) not null, birth_date varchar2(255 char), city varchar2(255 char), country varchar2(255 char), date_created timestamp not null, email varchar2(255 char), external_id varchar2(255 char), first_name varchar2(255 char), gender varchar2(255 char), instant timestamp, last_name varchar2(255 char), last_updated timestamp not null, login varchar2(255 char) not null, mobile varchar2(255 char), postal_code varchar2(255 char), road1 varchar2(255 char), road2 varchar2(255 char), road3 varchar2(255 char), road4 varchar2(255 char), token varchar2(255 char), token_secret varchar2(255 char), uuid varchar2(255 char) not null, primary key (id));

create table feature (id number(19,0) not null, category_fk number(19,0), date_created timestamp not null, domain varchar2(255 char), external_code varchar2(255 char), hide number(1,0) not null, last_updated timestamp not null, name varchar2(255 char) not null, position number(10,0) not null, product_fk number(19,0), uuid varchar2(255 char) not null, value varchar2(255 char), primary key (id));

create table google_category (id number(19,0) not null, date_created timestamp not null, lang varchar2(255 char) not null, last_updated timestamp not null, name varchar2(255 char) not null, parent_path varchar2(512 char), path varchar2(512 char) not null, uuid varchar2(255 char) not null, primary key (id));

create table google_content (id number(19,0) not null, account_id varchar2(255 char) not null, account_login varchar2(255 char) not null, account_password varchar2(255 char) not null, account_type varchar2(255 char) not null, date_created timestamp not null, google_search number(1,0) not null, last_updated timestamp not null, uuid varchar2(255 char) not null, primary key (id));

create table google_env (id number(19,0) not null, active number(1,0) not null, client_id varchar2(255 char), client_secret varchar2(255 char), client_token varchar2(255 char), cron_expr varchar2(255 char) not null, date_created timestamp not null, dry_run number(1,0) not null, extra clob, last_updated timestamp not null, merchant_id varchar2(255 char) not null, merchant_url varchar2(255 char), running number(1,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table google_variation_mapping (id number(19,0) not null, company_fk number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, mappings varchar2(255 char) not null, type_fk number(19,0), uuid varchar2(255 char) not null, value_fk number(19,0), primary key (id));

create table google_variation_type (id number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, uuid varchar2(255 char) not null, xtype varchar2(255 char) not null unique, primary key (id));

create table google_variation_value (id number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, type_fk number(19,0) not null, uuid varchar2(255 char) not null, value varchar2(255 char) not null unique, primary key (id));

create table ibeacon (id number(19,0) not null, active number(1,0) not null, company_fk number(19,0) not null, date_created timestamp not null, end_date timestamp not null, last_updated timestamp not null, major varchar2(255 char) not null, minor varchar2(255 char) not null, name varchar2(255 char) not null, start_date timestamp not null, uuid varchar2(255 char) not null, primary key (id));

create table intra_day_period (id number(19,0) not null, date_created timestamp not null, end_date timestamp, last_updated timestamp not null, product_fk number(19,0), start_date timestamp, uuid varchar2(255 char) not null, weekday1 number(1,0) not null, weekday2 number(1,0) not null, weekday3 number(1,0) not null, weekday4 number(1,0) not null, weekday5 number(1,0) not null, weekday6 number(1,0) not null, weekday7 number(1,0) not null, primary key (id));

create table local_tax_rate (id number(19,0) not null, active number(1,0) not null, country_code varchar2(255 char), date_created timestamp not null, last_updated timestamp not null, rate float not null, state_code varchar2(255 char), uuid varchar2(255 char) not null, primary key (id));

create table location (id number(19,0) not null, city varchar2(255 char), country_code varchar2(255 char) not null, date_created timestamp not null, last_updated timestamp not null, latitude double precision, longitude double precision, postal_code varchar2(255 char), road1 varchar2(255 char), road2 varchar2(255 char), road3 varchar2(255 char), road_num varchar2(255 char), state varchar2(255 char), uuid varchar2(255 char) not null, class varchar2(255 char) not null, description varchar2(255 char), detail clob, external_id varchar2(255 char), is_main number(1,0), max_price float, min_price float, name varchar2(255 char), picture varchar2(255 char), picture_type varchar2(255 char), poi_type_fk number(19,0), source varchar2(255 char), video varchar2(255 char), visibility varchar2(255 char), primary key (id));

create table pending_email_confirmation (id number(19,0) not null, version number(19,0) not null, confirmation_event varchar2(80 char), confirmation_token varchar2(80 char) not null unique, email_address varchar2(80 char) not null, timestamp timestamp not null, user_token varchar2(500 char), primary key (id));

create table permission (id number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, possible_actions varchar2(255 char) not null, type varchar2(255 char) not null, uuid varchar2(255 char) not null, primary key (id));

create table poi_type (id number(19,0) not null, code varchar2(255 char) not null, date_created timestamp not null, icon_fk number(19,0), last_updated timestamp not null, uuid varchar2(255 char) not null, xtype varchar2(255 char) not null unique, primary key (id));

create table product (id number(19,0) not null, availability_date timestamp, brand_fk number(19,0), calendar_type varchar2(255 char), category_fk number(19,0) not null, code varchar2(255 char) not null, company_fk number(19,0) not null, creation_fk number(19,0), date_created timestamp not null, deleted number(1,0) not null, description clob, description_as_text clob, external_code varchar2(255 char), hide number(1,0) not null, ibeacon_fk number(19,0), keywords varchar2(255 char), last_updated timestamp not null, modification_date timestamp, name varchar2(255 char) not null, nb_sales number(19,0) not null, picture varchar2(255 char), poi_fk number(19,0), price number(19,0) not null, sanitized_name varchar2(255 char) not null, seller_fk number(19,0), shipping_fk number(19,0), start_date timestamp, start_feature_date timestamp, state varchar2(255 char), stock_display number(1,0), stop_date timestamp, stop_feature_date timestamp, tax_rate_fk number(19,0), uuid varchar2(255 char) not null, xtype varchar2(255 char) not null, primary key (id));

create table product2_resource (id number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, position number(10,0) not null, product_fk number(19,0) not null, resource_fk number(19,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table product_property (id number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, name varchar2(255 char) not null, product_fk number(19,0) not null, uuid varchar2(255 char) not null, value varchar2(255 char), primary key (id));

create table product_tag (tags_fk number(19,0), tag_id number(19,0));

create table reduction_rule (id number(19,0) not null, date_created timestamp not null, discount varchar2(255 char), last_updated timestamp not null, quantity_max number(19,0), quantity_min number(19,0), uuid varchar2(255 char) not null, x_purchased number(19,0), xtype varchar2(255 char) not null, y_offered number(19,0), primary key (id));

create table reduction_sold (id number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, sold number(19,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table role_permission (id number(19,0) not null, actions varchar2(255 char) not null, date_created timestamp not null, last_updated timestamp not null, permission_fk number(19,0) not null, role_fk number(19,0) not null, target varchar2(255 char) not null, uuid varchar2(255 char) not null, primary key (id));

create table seller (id number(19,0) not null, admin number(1,0) not null, agent number(1,0) not null, sell number(1,0) not null, validator number(1,0) not null, primary key (id));

create table seller_company (companies_fk number(19,0), company_id number(19,0));

create table shipping (id number(19,0) not null, amount number(19,0) not null, date_created timestamp not null, depth number(19,0) not null, free number(1,0) not null, height number(19,0) not null, last_updated timestamp not null, linear_unit varchar2(255 char) not null, uuid varchar2(255 char) not null, weight number(19,0) not null, weight_unit varchar2(255 char) not null, width number(19,0) not null, primary key (id));

create table shipping_carriers (id number(19,0) not null, fedex number(1,0) not null, ups number(1,0) not null, primary key (id));

create table shipping_rule (id number(19,0) not null, company_fk number(19,0), country_code varchar2(255 char) not null, date_created timestamp not null, last_updated timestamp not null, max_amount number(19,0) not null, min_amount number(19,0) not null, price varchar2(255 char) not null, uuid varchar2(255 char) not null, primary key (id));

create table stock (id number(19,0) not null, stock number(19,0), stock_out_selling number(1,0) not null, stock_unlimited number(1,0) not null, primary key (id));

create table stock_calendar (id number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, product_fk number(19,0) not null, sold number(19,0) not null, start_date timestamp, stock number(19,0) not null, ticket_type_fk number(19,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table suggestion (id number(19,0) not null, date_created timestamp not null, discount varchar2(255 char), last_updated timestamp not null, pack_fk number(19,0) not null, position number(10,0) not null, product_fk number(19,0) not null, required number(1,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table tag (id number(19,0) not null, date_created timestamp not null, ibeacon_fk number(19,0), last_updated timestamp not null, name varchar2(255 char) not null, uuid varchar2(255 char) not null, primary key (id));

create table tax_rate (id number(19,0) not null, company_fk number(19,0), date_created timestamp not null, last_updated timestamp not null, name varchar2(255 char) not null, uuid varchar2(255 char) not null, primary key (id));

create table tax_rate_local_tax_rate (local_tax_rates_fk number(19,0), local_tax_rate_id number(19,0));

create table ticket_type (id number(19,0) not null, availability_date timestamp, date_created timestamp not null, description clob, external_code varchar2(255 char), gtin varchar2(255 char), last_updated timestamp not null, max_order number(10,0) not null, min_order number(10,0) not null, mpn varchar2(255 char), name varchar2(255 char) not null, nb_sales number(19,0) not null, picture_fk number(19,0), position number(10,0), price number(19,0) not null, product_fk number(19,0) not null, sku varchar2(255 char) not null, start_date timestamp, stock_stock number(19,0), stock_stock_out_selling number(1,0), stock_stock_unlimited number(1,0), stop_date timestamp, uuid varchar2(255 char) not null, variation1_fk number(19,0), variation2_fk number(19,0), variation3_fk number(19,0), xprivate number(1,0), primary key (id));

create table token (id number(19,0) not null, client_id varchar2(255 char) not null, date_created timestamp not null, expires_in number(10,0) not null, last_updated timestamp not null, redirect_u_r_i varchar2(255 char) not null, scope varchar2(255 char), state varchar2(255 char), user_fk number(19,0) not null, uuid varchar2(255 char) not null, value varchar2(255 char) not null, primary key (id));

create table user_permission (id number(19,0) not null, actions varchar2(255 char) not null, date_created timestamp not null, last_updated timestamp not null, permission_fk number(19,0) not null, target varchar2(255 char) not null, user_fk number(19,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table user_property (id number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, name varchar2(255 char) not null, user_fk number(19,0) not null, uuid varchar2(255 char) not null, value varchar2(255 char), primary key (id));

create table uuid_data (id number(19,0) not null, date_created timestamp not null, expire_date timestamp not null, last_updated timestamp not null, payload clob, uuid varchar2(255 char) not null, xtype varchar2(255 char) not null, primary key (id));

create table variation (id number(19,0) not null, category_fk number(19,0), date_created timestamp not null, external_code varchar2(255 char), google_variation_type varchar2(255 char), hide number(1,0) not null, last_updated timestamp not null, name varchar2(255 char) not null, position number(10,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table variation_value (id number(19,0) not null, date_created timestamp not null, external_code varchar2(255 char), google_variation_value varchar2(255 char), last_updated timestamp not null, position number(10,0) not null, uuid varchar2(255 char) not null, value varchar2(255 char) not null, variation_fk number(19,0) not null, primary key (id));

create table xcatalog (id number(19,0) not null, activation_date timestamp not null, channels varchar2(255 char), company_fk number(19,0) not null, date_created timestamp not null, deleted number(1,0) not null, description clob, external_code varchar2(255 char), last_updated timestamp not null, name varchar2(255 char) not null, social number(1,0) not null, uuid varchar2(255 char) not null, primary key (id));

create table xresource (id number(19,0) not null, account_type varchar2(255 char), active number(1,0) not null, album_fk number(19,0), code varchar2(255 char), company_fk number(19,0), content clob, content_type varchar2(255 char), creation_fk number(19,0), date_created timestamp not null, deleted number(1,0) not null, description clob, external_code varchar2(255 char), last_updated timestamp not null, name varchar2(255 char), poi_fk number(19,0), sanitized_name varchar2(255 char) not null, small_picture varchar2(255 char), uploaded number(1,0) not null, url varchar2(255 char), uuid varchar2(255 char) not null, xtype varchar2(255 char) not null, primary key (id));

create table xrole (id number(19,0) not null, date_created timestamp not null, last_updated timestamp not null, name varchar2(255 char) not null, uuid varchar2(255 char) not null, primary key (id));

create table xtranslation (id number(19,0) not null, company_id number(19,0) not null, date_created timestamp not null, lang varchar2(255 char) not null, last_updated timestamp not null, target number(19,0) not null, type varchar2(255 char), uuid varchar2(255 char) not null, value clob not null, primary key (id));

-- Foreign keys added via ALTER TABLE:
alter table account add constraint FKB9D38A2D4BE157D4 foreign key (location_fk) references location;

alter table account add constraint FKB9D38A2D602DCF9 foreign key (company_fk) references company;

alter table account_xrole add constraint FKE0E95C5C722BA4BD foreign key (roles_fk) references account;

alter table account_xrole add constraint FKE0E95C5CD411C165 foreign key (role_id) references xrole;

alter table album add constraint FK5897E6F602DCF9 foreign key (company_fk) references company;

alter table b_o_cart add constraint FK28764B6D602DCF9 foreign key (company_fk) references company;

alter table b_o_cart_item add constraint FK6C2D04A583966C6F foreign key (b_o_cart_fk) references b_o_cart;

alter table b_o_cart_item_b_o_product add constraint FK9CBD90E89ADC15EF foreign key (boproduct_id) references b_o_product;

alter table b_o_cart_item_b_o_product add constraint FK9CBD90E8D5BC215E foreign key (b_o_products_fk) references b_o_cart_item;

alter table b_o_product add constraint FK6A96FD8255ECAFB9 foreign key (product_fk) references product;

alter table b_o_product_consumption add constraint FK7DEB1C5E482BBE0F foreign key (consumption_id) references consumption;

alter table b_o_product_consumption add constraint FK7DEB1C5EC732E1A3 foreign key (consumptions_fk) references b_o_product;

alter table b_o_ticket_type add constraint FK929693A0AA1CE819 foreign key (b_o_product_fk) references b_o_product;

alter table brand add constraint FK59A4B87388BBDF6 foreign key (parent_fk) references brand;

alter table brand add constraint FK59A4B879ECA6F9 foreign key (ibeacon_fk) references ibeacon;

alter table brand add constraint FK59A4B87602DCF9 foreign key (company_fk) references company;

alter table brand_property add constraint FKC8B7CB8DBBA1B1F9 foreign key (brand_fk) references brand;

alter table category add constraint FK302BCFE7ACA6B63 foreign key (parent_fk) references category;

alter table category add constraint FK302BCFE9ECA6F9 foreign key (ibeacon_fk) references ibeacon;

alter table category add constraint FK302BCFEA332E779 foreign key (catalog_fk) references xcatalog;

alter table category add constraint FK302BCFE602DCF9 foreign key (company_fk) references company;

alter table company add constraint FK38A73C7D4BE157D4 foreign key (location_fk) references location;

alter table company add constraint FK38A73C7D95DE64BC foreign key (ship_from_fk) references location;

alter table company add constraint FK38A73C7D66C87106 foreign key (google_content_fk) references google_content;

alter table company add constraint FK38A73C7DE9DA1D86 foreign key (google_env_fk) references google_env;

alter table company_property add constraint FKDBCB8F57602DCF9 foreign key (company_fk) references company;

alter table consumption add constraint FKCD71F39B3F4326A2 foreign key (b_o_ticket_type_fk) references b_o_ticket_type;

alter table coupon add constraint FKAF42D826B59D3920 foreign key (reduction_sold_fk) references reduction_sold;

alter table coupon add constraint FKAF42D826602DCF9 foreign key (company_fk) references company;

alter table coupon_category add constraint FK9DBEE0F7E2497A99 foreign key (categories_fk) references coupon;

alter table coupon_category add constraint FK9DBEE0F75B0C66E5 foreign key (category_id) references category;

alter table coupon_product add constraint FK8730C5D69035CA51 foreign key (products_fk) references coupon;

alter table coupon_product add constraint FK8730C5D655ECB00F foreign key (product_id) references product;

alter table coupon_reduction_rule add constraint FK3BE2B281169FC5DE foreign key (rules_fk) references coupon;

alter table coupon_reduction_rule add constraint FK3BE2B2818AF42876 foreign key (reduction_rule_id) references reduction_rule;

alter table coupon_ticket_type add constraint FKC1AC11F4504E2EF foreign key (ticket_types_fk) references coupon;

alter table coupon_ticket_type add constraint FKC1AC11F42FDE5D9E foreign key (ticket_type_id) references ticket_type;

alter table date_period add constraint FK4A56237255ECAFB9 foreign key (product_fk) references product;

alter table es_env add constraint FKB2DABDDC602DCF9 foreign key (company_fk) references company;

alter table event add constraint FK5C6729A793C84EF foreign key (user_fk) references account;

alter table event add constraint FK5C6729A31A24C8F foreign key (resource_fk) references xresource;

alter table event add constraint FK5C6729A55ECAFB9 foreign key (product_fk) references product;

alter table event_period_sale add constraint FK22F2DE055ECAFB9 foreign key (product_fk) references product;

alter table external_account add constraint FK5A0D99B9793C84EF foreign key (user_fk) references account;

alter table feature add constraint FKC5A27AF65B0C668F foreign key (category_fk) references category;

alter table feature add constraint FKC5A27AF655ECAFB9 foreign key (product_fk) references product;

alter table google_variation_mapping add constraint FK60362A1CF0CF6B53 foreign key (type_fk) references google_variation_type;

alter table google_variation_mapping add constraint FK60362A1C602DCF9 foreign key (company_fk) references company;

alter table google_variation_mapping add constraint FK60362A1CFD6CB975 foreign key (value_fk) references google_variation_value;

alter table google_variation_value add constraint FKF3469E3FF0CF6B53 foreign key (type_fk) references google_variation_type;

alter table ibeacon add constraint FK5F6619ED602DCF9 foreign key (company_fk) references company;

alter table intra_day_period add constraint FKF581D04555ECAFB9 foreign key (product_fk) references product;

alter table location add constraint FK714F9FB59319BF09 foreign key (poi_type_fk) references poi_type;

alter table poi_type add constraint FK1AF5740F49BA7844 foreign key (icon_fk) references xresource;

alter table product add constraint FKED8DCCEF5B0C668F foreign key (category_fk) references category;

alter table product add constraint FKED8DCCEFA797D6B4 foreign key (creation_fk) references event;

alter table product add constraint FKED8DCCEFBBA1B1F9 foreign key (brand_fk) references brand;

alter table product add constraint FKED8DCCEFA99249AF foreign key (seller_fk) references seller;

alter table product add constraint FKED8DCCEFF333CFD0 foreign key (tax_rate_fk) references tax_rate;

alter table product add constraint FKED8DCCEFBF86FC94 foreign key (poi_fk) references location;

alter table product add constraint FKED8DCCEF9ECA6F9 foreign key (ibeacon_fk) references ibeacon;

alter table product add constraint FKED8DCCEF602DCF9 foreign key (company_fk) references company;

alter table product add constraint FKED8DCCEF1EE8688F foreign key (shipping_fk) references shipping;

alter table product2_resource add constraint FK8AABBAA31A24C8F foreign key (resource_fk) references xresource;

alter table product2_resource add constraint FK8AABBAA55ECAFB9 foreign key (product_fk) references product;

alter table product_property add constraint FK61FB5F2555ECAFB9 foreign key (product_fk) references product;

alter table product_tag add constraint FKA71CAC4A912A004F foreign key (tags_fk) references product;

alter table product_tag add constraint FKA71CAC4A4347CEAF foreign key (tag_id) references tag;

alter table role_permission add constraint FKBD40D538D411C10F foreign key (role_fk) references xrole;

alter table role_permission add constraint FKBD40D538F3E69A2F foreign key (permission_fk) references permission;

alter table seller add constraint FKC9FF4F7F8201A451 foreign key (id) references account;

alter table seller_company add constraint FKCC6A43BD602DD4F foreign key (company_id) references company;

alter table seller_company add constraint FKCC6A43BD3E1049D3 foreign key (companies_fk) references seller;

alter table shipping_rule add constraint FK2062CEED602DCF9 foreign key (company_fk) references company;

alter table stock_calendar add constraint FK89EECE472FDE5D48 foreign key (ticket_type_fk) references ticket_type;

alter table stock_calendar add constraint FK89EECE4755ECAFB9 foreign key (product_fk) references product;

alter table suggestion add constraint FK4763CA04BD55124F foreign key (pack_fk) references product;

alter table suggestion add constraint FK4763CA0455ECAFB9 foreign key (product_fk) references product;

alter table tag add constraint FK1BF9A9ECA6F9 foreign key (ibeacon_fk) references ibeacon;

alter table tax_rate add constraint FKEF7A58F4602DCF9 foreign key (company_fk) references company;

alter table tax_rate_local_tax_rate add constraint FK859561F3982D71D foreign key (local_tax_rate_id) references local_tax_rate;

alter table tax_rate_local_tax_rate add constraint FK859561F3279E7339 foreign key (local_tax_rates_fk) references tax_rate;

alter table ticket_type add constraint FK158DE48D8AC3CD9F foreign key (picture_fk) references xresource;

alter table ticket_type add constraint FK158DE48D6255814E foreign key (variation2_fk) references variation_value;

alter table ticket_type add constraint FK158DE48D6255F5AD foreign key (variation3_fk) references variation_value;

alter table ticket_type add constraint FK158DE48D62550CEF foreign key (variation1_fk) references variation_value;

alter table ticket_type add constraint FK158DE48D55ECAFB9 foreign key (product_fk) references product;

alter table token add constraint FK696B9F9793C84EF foreign key (user_fk) references account;

alter table user_permission add constraint FK30BA72C3793C84EF foreign key (user_fk) references account;

alter table user_permission add constraint FK30BA72C3F3E69A2F foreign key (permission_fk) references permission;

alter table user_property add constraint FKC7D137C9793C84EF foreign key (user_fk) references account;

alter table variation add constraint FKFB1DA2135B0C668F foreign key (category_fk) references category;

alter table variation_value add constraint FKB8BB7C45284D93F9 foreign key (variation_fk) references variation;

alter table xcatalog add constraint FKD2AC68A1602DCF9 foreign key (company_fk) references company;

alter table xresource add constraint FK6BBFCC86A797D6B4 foreign key (creation_fk) references event;

alter table xresource add constraint FK6BBFCC86BF86FC94 foreign key (poi_fk) references location;

alter table xresource add constraint FK6BBFCC86602DCF9 foreign key (company_fk) references company;

alter table xresource add constraint FK6BBFCC861865E8F9 foreign key (album_fk) references album;

