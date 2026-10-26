-- Source: https://github.com/laxminagaral/Maldorkar-Resort/blob/8d8620caf2ae2fd79c49e763d9c3bf77f202466f/resort.sql?raw=true
-- Tables detected: 19 | FK constraints: 11
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "auth_group" (
    "id" int NOT NULL,
    "name" varchar(150) NOT NULL
);

CREATE TABLE "auth_group_permissions" (
    "id" int NOT NULL,
    "group_id" int NOT NULL,
    "permission_id" int NOT NULL
);

CREATE TABLE "auth_permission" (
    "id" int NOT NULL,
    "name" varchar(255) NOT NULL,
    "content_type_id" int NOT NULL,
    "codename" varchar(100) NOT NULL
);

CREATE TABLE "auth_user" (
    "id" int NOT NULL,
    "password" varchar(128) NOT NULL,
    "last_login" TIMESTAMP(6) DEFAULT NULL,
    "is_superuser" SMALLINT NOT NULL,
    "username" varchar(150) NOT NULL,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(150) NOT NULL,
    "email" varchar(254) NOT NULL,
    "is_staff" SMALLINT NOT NULL,
    "is_active" SMALLINT NOT NULL,
    "date_joined" TIMESTAMP(6) NOT NULL
);

CREATE TABLE "auth_user_groups" (
    "id" int NOT NULL,
    "user_id" int NOT NULL,
    "group_id" int NOT NULL
);

CREATE TABLE "auth_user_user_permissions" (
    "id" int NOT NULL,
    "user_id" int NOT NULL,
    "permission_id" int NOT NULL
);

CREATE TABLE "django_admin_log" (
    "id" int NOT NULL,
    "action_time" TIMESTAMP(6) NOT NULL,
    "object_id" TEXT DEFAULT NULL,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint UNSIGNED NOT NULL CHECK ("action_flag" >= 0),
    "change_message" TEXT NOT NULL,
    "content_type_id" int DEFAULT NULL,
    "user_id" int NOT NULL
);

CREATE TABLE "django_content_type" (
    "id" int NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL
);

CREATE TABLE "django_migrations" (
    "id" int NOT NULL,
    "app" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "applied" TIMESTAMP(6) NOT NULL
);

CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL,
    "session_data" TEXT NOT NULL,
    "expire_date" TIMESTAMP(6) NOT NULL
);

CREATE TABLE "resortapp_activity" (
    "id" int NOT NULL,
    "name" varchar(100) NOT NULL,
    "description" varchar(100) NOT NULL,
    "photo" varchar(100) NOT NULL
);

CREATE TABLE "resortapp_booking" (
    "id" int NOT NULL,
    "booking_date" TIMESTAMP(6) NOT NULL,
    "checkin_date" TIMESTAMP(6) NOT NULL,
    "checkout_date" TIMESTAMP(6) NOT NULL,
    "number_of_people" int NOT NULL,
    "booking_amount" DOUBLE PRECISION NOT NULL,
    "paid_status" varchar(100) NOT NULL,
    "mode_of_payment" varchar(60) NOT NULL,
    "booking_status" varchar(1) NOT NULL,
    "customer_id" int NOT NULL,
    "package_id" int NOT NULL
);

CREATE TABLE "resortapp_customer" (
    "id" int NOT NULL,
    "customer_name" varchar(200) NOT NULL,
    "date_of_birth" TIMESTAMP(6) NOT NULL,
    "email" varchar(50) NOT NULL,
    "mobile" varchar(128) NOT NULL,
    "city" varchar(200) NOT NULL,
    "pincode" int NOT NULL
);

CREATE TABLE "resortapp_designation" (
    "id" int NOT NULL,
    "designation_name" varchar(60) NOT NULL,
    "description" varchar(200) NOT NULL
);

CREATE TABLE "resortapp_employee" (
    "id" int NOT NULL,
    "designation_id" int NOT NULL,
    "name" varchar(100) NOT NULL,
    "address" varchar(100) NOT NULL,
    "phone_number" varchar(128) NOT NULL,
    "salary" DOUBLE PRECISION NOT NULL
);

CREATE TABLE "resortapp_enquiry" (
    "id" int NOT NULL,
    "enquiry_date" TIMESTAMP(6) NOT NULL,
    "name" varchar(100) NOT NULL,
    "address" varchar(100) NOT NULL,
    "mobile" varchar(128) NOT NULL,
    "email" varchar(100) NOT NULL,
    "number_of_adults" int NOT NULL,
    "number_of_children" int NOT NULL,
    "enquiry_status" varchar(100) NOT NULL
);

CREATE TABLE "resortapp_food" (
    "id" int NOT NULL,
    "food_name" varchar(200) NOT NULL,
    "food_category" varchar(100) NOT NULL,
    "food_type" varchar(100) NOT NULL,
    "price_per_unit" DOUBLE PRECISION NOT NULL
);

CREATE TABLE "resortapp_package_details" (
    "id" int NOT NULL,
    "package_name" varchar(100) NOT NULL,
    "description" varchar(100) NOT NULL,
    "amount_per_head" int NOT NULL
);

CREATE TABLE "resortapp_purchase_details" (
    "id" int NOT NULL,
    "purchase_date" TIMESTAMP(6) NOT NULL,
    "purchase_description" varchar(100) NOT NULL,
    "purchase_amount" DOUBLE PRECISION NOT NULL
);


                           

ALTER TABLE "auth_group_permissions"
  ADD CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id"),
  ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id");

ALTER TABLE "auth_permission"
  ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id");

ALTER TABLE "auth_user_groups"
  ADD CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id"),
  ADD CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id");

ALTER TABLE "auth_user_user_permissions"
  ADD CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id"),
  ADD CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id");

ALTER TABLE "django_admin_log"
  ADD CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id"),
  ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id");

ALTER TABLE "resortapp_booking"
  ADD CONSTRAINT "resortapp_booking_customer_id_dc22b0e3_fk_resortapp_customer_id" FOREIGN KEY ("customer_id") REFERENCES "resortapp_customer" ("id"),
  ADD CONSTRAINT "resortapp_booking_package_id_55316033_fk_resortapp" FOREIGN KEY ("package_id") REFERENCES "resortapp_package_details" ("id");
