-- Source: https://github.com/machii28/new-cvj/blob/31f6e484a57b5c3aa6f766e28f83783dcda38901/cvj.sql?raw=true
-- Tables detected: 38 | FK/REFERENCES mentions: 37
CREATE TABLE "admin" (
    "admin_id" varchar(45) NOT NULL,
    "password" varchar(45) DEFAULT NULL,
    "admin_FN" varchar(45) DEFAULT NULL,
    "admin_LN" varchar(45) DEFAULT NULL,
    "email" varchar(45) DEFAULT NULL,
    "contact_no" varchar(45) DEFAULT NULL,
    "address" varchar(255) DEFAULT NULL,
    "status" varchar(45) DEFAULT NULL
);

CREATE TABLE "agency" (
    "agency_id" int NOT NULL AUTO_INCREMENT,
    "agency_name" varchar(45) DEFAULT NULL,
    "address" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("agency_id")
);

CREATE TABLE "billing" (
    "billing_id" int NOT NULL AUTO_INCREMENT,
    "payment_event_name" varchar(45) NOT NULL,
    "price" decimal(10,2) NOT NULL,
    "tax" decimal(10,2) NOT NULL,
    "totalPrice" decimal(10,2) NOT NULL,
    "date" TIMESTAMP NOT NULL,
    "balance" decimal(10,2) NOT NULL,
    "costid" int DEFAULT NULL,
    PRIMARY KEY ("billing_id","payment_event_name"),
    KEY "fk_billing_event1" ("payment_event_name"),
    CONSTRAINT "fk_billing_event1" FOREIGN KEY ("payment_event_name") REFERENCES "event" ("event_name") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "category_ref" (
    "category_no" SMALLINT NOT NULL AUTO_INCREMENT,
    "category_name" varchar(45) NOT NULL,
    PRIMARY KEY ("category_no")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE "client" (
    "client_id" varchar(45) NOT NULL,
    "password" varchar(45) DEFAULT NULL,
    "client_FN" varchar(45) NOT NULL,
    "client_LN" varchar(45) NOT NULL,
    "email" varchar(45) DEFAULT NULL,
    "tel_no" varchar(45) DEFAULT NULL,
    "fax_no" varchar(45) DEFAULT NULL,
    "mob_no" varchar(45) DEFAULT NULL,
    "address" varchar(255) DEFAULT NULL,
    "status" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("client_id")
);

CREATE TABLE "color" (
    "color_id" int NOT NULL AUTO_INCREMENT,
    "color_name" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("color_id")
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE "customer_feedback" (
    "feedback_id" int NOT NULL AUTO_INCREMENT,
    "client_id" varchar(45) NOT NULL,
    "feedback_type" varchar(45) NOT NULL,
    "feedback" TEXT NOT NULL,
    PRIMARY KEY ("feedback_id"),
    KEY "fk_client_feedback_idx" ("client_id"),
    CONSTRAINT "fk_client_feedback" FOREIGN KEY ("client_id") REFERENCES "client" ("client_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "damaged_inventory" (
    "damaged_id" int NOT NULL,
    "quantity" int DEFAULT NULL,
    "datereported" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "event_name" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("damaged_id"),
    KEY "fk_event_name_idx" ("event_name")
);

CREATE TABLE "deployed_inventory" (
    "event_deployed" varchar(100) NOT NULL,
    "inventory_deployed" int NOT NULL,
    "quantity" int NOT NULL,
    "date_deployed" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY ("event_deployed","inventory_deployed"),
    KEY "fk_event_deployment_inventory1_idx" ("inventory_deployed"),
    CONSTRAINT "fk_event_deployment_event1" FOREIGN KEY ("event_deployed") REFERENCES "event" ("event_name") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_event_deployment_inventory1" FOREIGN KEY ("inventory_deployed") REFERENCES "inventory" ("inventory_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "employee" (
    "employee_id" varchar(45) NOT NULL,
    "password" varchar(45) NOT NULL,
    "employee_FN" varchar(45) NOT NULL,
    "employee_LN" varchar(45) NOT NULL,
    "employee_type" varchar(45) NOT NULL,
    "email" varchar(45) NOT NULL,
    "agency_id" int NOT NULL,
    "contact_no" varchar(45) NOT NULL,
    "address" varchar(255) NOT NULL,
    "status" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("employee_id"),
    KEY "fk_employee_agency1_idx" ("agency_id"),
    CONSTRAINT "fk_employee_agency1" FOREIGN KEY ("agency_id") REFERENCES "agency" ("agency_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "employee_event_schedule" (
    "employee_id" varchar(45) NOT NULL,
    "event_assigned" varchar(45) NOT NULL,
    "event_date_time" TIMESTAMP NOT NULL,
    PRIMARY KEY ("event_assigned","employee_id"),
    KEY "fk_employeeID_eventsched_idx" ("employee_id"),
    CONSTRAINT "fk_employeeID_eventsched" FOREIGN KEY ("employee_id") REFERENCES "employee" ("employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_eventassigned_event" FOREIGN KEY ("event_assigned") REFERENCES "event" ("event_name") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "event" (
    "event_name" varchar(45) NOT NULL,
    "reservation_id" int DEFAULT NULL,
    "client_id" varchar(45) DEFAULT NULL,
    "event_start" TIMESTAMP DEFAULT NULL,
    "event_end" TIMESTAMP DEFAULT NULL,
    "event_type" varchar(45) DEFAULT NULL,
    "theme" varchar(45) DEFAULT NULL,
    "others" varchar(45) DEFAULT NULL,
    "totalpax" int DEFAULT NULL,
    "package_id" int DEFAULT NULL,
    "priceperhead" decimal(10,2) DEFAULT NULL,
    "status" varchar(45) DEFAULT NULL,
    "event_detailsAdded" timestamp NULL DEFAULT NULL,
    "inventory_id" int DEFAULT NULL,
    PRIMARY KEY ("event_name"),
    KEY "fk_client_clientID_idx" ("client_id"),
    KEY "fk_reservevenue_reserveID_idx" ("reservation_id"),
    KEY "fk_packageid_event_idx" ("package_id"),
    KEY "fk_inventoryId_idx" ("inventory_id"),
    CONSTRAINT "fk_client_clientID" FOREIGN KEY ("client_id") REFERENCES "client" ("client_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_inventoryId" FOREIGN KEY ("inventory_id") REFERENCES "inventory" ("inventory_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_packageid_event" FOREIGN KEY ("package_id") REFERENCES "package" ("package_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_reservevenue_reserveID" FOREIGN KEY ("reservation_id") REFERENCES "reserve_venue" ("reservation_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "event_costing" (
    "event_costing_id" int NOT NULL AUTO_INCREMENT,
    "event_name" varchar(45) DEFAULT NULL,
    "venue_cost" decimal(10,0) DEFAULT NULL,
    "food" decimal(10,0) DEFAULT NULL,
    "labor" decimal(10,0) DEFAULT NULL,
    "beverage" decimal(10,0) DEFAULT NULL,
    "logistics" decimal(10,0) DEFAULT NULL,
    PRIMARY KEY ("event_costing_id"),
    UNIQUE KEY "event_costing_event_name_uindex" ("event_name"),
    CONSTRAINT "event_costing_event_event_name_fk" FOREIGN KEY ("event_name") REFERENCES "event" ("event_name")
);

CREATE TABLE "event_outsource_item" (
    "event_name" varchar(45) DEFAULT NULL,
    "outsourced_item_id" int DEFAULT NULL,
    "quantity" int DEFAULT NULL,
    "total_price" decimal(10,0) DEFAULT NULL,
    KEY "event_outsource_item_event_event_name_fk" ("event_name"),
    KEY "event_outsource_item_outsourced_item_outsourced_item_id_fk" ("outsourced_item_id"),
    CONSTRAINT "event_outsource_item_event_event_name_fk" FOREIGN KEY ("event_name") REFERENCES "event" ("event_name"),
    CONSTRAINT "event_outsource_item_outsourced_item_outsourced_item_id_fk" FOREIGN KEY ("outsourced_item_id") REFERENCES "outsourced_item" ("outsourced_item_id")
);

CREATE TABLE "ingredient" (
    "ingredient_id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(45) NOT NULL,
    "measure" int DEFAULT NULL,
    PRIMARY KEY ("ingredient_id"),
    KEY "fk_ingredient_measure_ref1_idx" ("measure"),
    CONSTRAINT "fk_ingredient_measure_ref1" FOREIGN KEY ("measure") REFERENCES "measure_ref" ("measure_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "inventory" (
    "inventory_id" int NOT NULL AUTO_INCREMENT,
    "inventory_name" varchar(45) DEFAULT NULL,
    "category" int DEFAULT NULL,
    "quantity" int DEFAULT NULL,
    "threshold" int DEFAULT NULL,
    "last_modified" timestamp NULL DEFAULT NULL,
    "itemSource" varchar(100) DEFAULT NULL,
    "status" int DEFAULT NULL,
    "sku" varchar(255) DEFAULT NULL,
    "date_created" timestamp NULL DEFAULT NULL,
    "price" decimal(9,2) DEFAULT NULL,
    "color" int DEFAULT NULL,
    "size" int DEFAULT NULL,
    PRIMARY KEY ("inventory_id"),
    KEY "fk_inventory_CATEGORY_REF1_idx" ("category"),
    KEY "fk_inventory_color_idx" ("color"),
    KEY "fk_inventory_size_idx" ("size"),
    CONSTRAINT "fk_inventory_color" FOREIGN KEY ("color") REFERENCES "color" ("color_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_inventory_size" FOREIGN KEY ("size") REFERENCES "size" ("size_id") ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE "inventory_audit" (
    "audit" int NOT NULL AUTO_INCREMENT,
    "inventory_id" int NOT NULL,
    "changes_made" varchar(255) NOT NULL,
    "audit_date" timestamp NULL DEFAULT NULL,
    "last_modified" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    "reason" varchar(255) NOT NULL,
    "reason_extra" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("audit","inventory_id"),
    KEY "fk_inventory_audit_inventory2_idx" ("inventory_id"),
    CONSTRAINT "fk_inventory_audit_inventory2" FOREIGN KEY ("inventory_id") REFERENCES "inventory" ("inventory_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "inventory_returned" (
    "event_returned" varchar(45) NOT NULL,
    "returned_id" int NOT NULL,
    "quantity" int NOT NULL,
    "date_returned" TIMESTAMP NOT NULL,
    PRIMARY KEY ("returned_id","event_returned"),
    KEY "fk_inventory_deployed_event1_idx" ("event_returned"),
    CONSTRAINT "fk_inventory_deployed_event1" FOREIGN KEY ("event_returned") REFERENCES "event" ("event_name") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_inventory_deployed_inventory1" FOREIGN KEY ("returned_id") REFERENCES "inventory" ("inventory_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "items" (
    "item_id" int NOT NULL,
    "item_name" varchar(45) NOT NULL,
    "package_id" int NOT NULL,
    "rawmaterial_id" int NOT NULL,
    PRIMARY KEY ("item_id"),
    KEY "fk_items_package1_idx" ("package_id"),
    KEY "fk_items_rawmaterial1_idx" ("rawmaterial_id"),
    CONSTRAINT "fk_items_package1" FOREIGN KEY ("package_id") REFERENCES "package" ("package_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_items_rawmaterial1" FOREIGN KEY ("rawmaterial_id") REFERENCES "rawmaterial" ("rawmaterial_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "lost_inventory" (
    "lost_id" int NOT NULL,
    "quantity" int NOT NULL,
    "date_reported" TIMESTAMP NOT NULL,
    "event_name" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("lost_id"),
    KEY "fk_event_name_idx" ("event_name"),
    CONSTRAINT "" FOREIGN KEY ("lost_id") REFERENCES "inventory" ("inventory_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_event_name_lost" FOREIGN KEY ("event_name") REFERENCES "event" ("event_name") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "material" (
    "material_id" int NOT NULL AUTO_INCREMENT,
    "material_name" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("material_id")
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE "measure_ref" (
    "measure_id" int NOT NULL AUTO_INCREMENT,
    "measure" varchar(45) NOT NULL,
    "name" varchar(45) NOT NULL,
    PRIMARY KEY ("measure_id")
);

CREATE TABLE "migrations" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "migration" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "batch" int NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "month_ref" (
    "month_no" int NOT NULL,
    "month_name" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("month_no"),
    CONSTRAINT "fk_month_ref_sales_report1" FOREIGN KEY ("month_no") REFERENCES "sales_report" ("MONTH") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "outsourced_item" (
    "outsourced_item_id" int NOT NULL AUTO_INCREMENT,
    "item_name" varchar(200) DEFAULT NULL,
    "supplier_id" int DEFAULT NULL,
    PRIMARY KEY ("outsourced_item_id"),
    KEY "outsourced_item_supplier_supplier_id_fk" ("supplier_id"),
    CONSTRAINT "outsourced_item_supplier_supplier_id_fk" FOREIGN KEY ("supplier_id") REFERENCES "supplier" ("supplier_id")
);

CREATE TABLE "package" (
    "package_id" int NOT NULL AUTO_INCREMENT,
    "package_name" varchar(65) NOT NULL,
    "price" decimal(10,2) NOT NULL,
    PRIMARY KEY ("package_id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "payment" (
    "payment_id" int unsigned NOT NULL AUTO_INCREMENT,
    "billing_id" int NOT NULL,
    "date_paid" TIMESTAMP NOT NULL,
    "payment_amount" decimal(10,2) NOT NULL,
    "modeofpayment" varchar(45) DEFAULT NULL,
    "ref_number" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("payment_id","billing_id"),
    KEY "fk_payment_billing1_idx" ("billing_id"),
    CONSTRAINT "fk_payment_billing1" FOREIGN KEY ("billing_id") REFERENCES "billing" ("billing_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "rawmaterial" (
    "rawmaterial_id" int NOT NULL AUTO_INCREMENT,
    "ingredient_id" int NOT NULL,
    "name" varchar(45) NOT NULL DEFAULT 'Generic Brand',
    "quantity" int NOT NULL DEFAULT '0',
    "measure" int NOT NULL,
    "piece" int DEFAULT '0',
    "ordertype" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("rawmaterial_id"),
    KEY "fk_rawmaterial_ingredient1_idx" ("ingredient_id"),
    KEY "fk_rawmaterial_measure_ref1_idx" ("measure"),
    CONSTRAINT "fk_rawmaterial_ingredient1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredient" ("ingredient_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_rawmaterial_measure_ref1" FOREIGN KEY ("measure") REFERENCES "measure_ref" ("measure_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "rawmaterial_audit" (
    "audit_id" int NOT NULL AUTO_INCREMENT,
    "rawmaterial_id" int NOT NULL,
    "quantity" int NOT NULL,
    "date" date NOT NULL,
    "reason" varchar(45) NOT NULL,
    PRIMARY KEY ("audit_id","rawmaterial_id"),
    KEY "fk_rawmaterial_audit_rawmaterial1" ("rawmaterial_id"),
    CONSTRAINT "fk_rawmaterial_audit_rawmaterial1" FOREIGN KEY ("rawmaterial_id") REFERENCES "rawmaterial" ("rawmaterial_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "recipe" (
    "recipe_id" int NOT NULL AUTO_INCREMENT,
    "recipe_name" varchar(255) NOT NULL,
    "type" varchar(45) NOT NULL,
    "package_id" int DEFAULT NULL,
    PRIMARY KEY ("recipe_id"),
    KEY "fk_recipe_package1_idx" ("package_id"),
    CONSTRAINT "fk_recipe_package1" FOREIGN KEY ("package_id") REFERENCES "package" ("package_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "recipe_items" (
    "recipe_id" int NOT NULL,
    "ingredient_id" int NOT NULL,
    "quantity" int NOT NULL,
    "measure" int NOT NULL,
    PRIMARY KEY ("ingredient_id","recipe_id"),
    KEY "fk_recipe_items_measure_ref1_idx" ("measure"),
    KEY "fk_recipe_items_ingredient1_idx" ("ingredient_id"),
    KEY "fk_recipe_items_recipe1" ("recipe_id"),
    CONSTRAINT "fk_recipe_items_ingredient1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredient" ("ingredient_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_recipe_items_measure_ref1" FOREIGN KEY ("measure") REFERENCES "measure_ref" ("measure_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_recipe_items_recipe1" FOREIGN KEY ("recipe_id") REFERENCES "recipe" ("recipe_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "recipe_steps" (
    "recipe_id" int NOT NULL,
    "step_no" int NOT NULL,
    "step_desc" TEXT,
    PRIMARY KEY ("recipe_id","step_no"),
    CONSTRAINT "fk_recipe_steps_recipe1" FOREIGN KEY ("recipe_id") REFERENCES "recipe" ("recipe_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "reserve_venue" (
    "reservation_id" int NOT NULL,
    "venue" varchar(45) DEFAULT NULL,
    "hallnumber" int DEFAULT NULL,
    "numberOfPax" int DEFAULT NULL,
    "reservation_date_time" TIMESTAMP DEFAULT NULL,
    "reservation_detailsAdded" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("reservation_id")
);

CREATE TABLE "sales_report" (
    "NoOfSales" int NOT NULL,
    "TotalSales" decimal(10,2) DEFAULT NULL,
    "MONTH" int NOT NULL,
    "YEAR" int NOT NULL,
    PRIMARY KEY ("MONTH","YEAR")
);

CREATE TABLE "size" (
    "size_id" int NOT NULL AUTO_INCREMENT,
    "size_name" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("size_id"),
    CONSTRAINT "fk_size" FOREIGN KEY ("size_id") REFERENCES "inventory" ("inventory_id") ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE "subcategory_ref" (
    "category_no" SMALLINT NOT NULL,
    "subcategory" SMALLINT NOT NULL AUTO_INCREMENT,
    "subcategory_name" varchar(45) NOT NULL,
    PRIMARY KEY ("subcategory"),
    KEY "fk_subcategory_ref_category_ref1_idx" ("category_no"),
    CONSTRAINT "fk_subcategory_ref_category_ref1" FOREIGN KEY ("category_no") REFERENCES "category_ref" ("category_no") ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE "supplier" (
    "supplier_id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(200) DEFAULT NULL,
    "email" varchar(200) DEFAULT NULL,
    "address" varchar(200) DEFAULT NULL,
    PRIMARY KEY ("supplier_id")
);

CREATE TABLE "users" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "userType" int DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "verified" SMALLINT DEFAULT NULL,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
