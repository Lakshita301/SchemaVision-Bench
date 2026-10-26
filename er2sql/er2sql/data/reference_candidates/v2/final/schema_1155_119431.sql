-- Source: https://github.com/MLDroid/MysqlDBsForICCTA/blob/04edf947a66ccc79b8daca34feb48e06275e6f3d/DrebinCCSqlFilesAfterICCLinks/cc_731.sql?raw=true
-- Tables detected: 36 | FK constraints: 36
CREATE TABLE "ActionStrings" (
    "id" int NOT NULL AUTO_INCREMENT,
    "st" varchar(191) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "st" ("st"),
    KEY "st_idx" ("st") USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Aliases" (
    "id" int NOT NULL AUTO_INCREMENT,
    "component_id" int NOT NULL,
    "target_id" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "component_id" ("component_id"),
    KEY "target_id" ("target_id"),
    CONSTRAINT "Aliases_ibfk_1" FOREIGN KEY ("component_id") REFERENCES "Components" ("id"),
    CONSTRAINT "Aliases_ibfk_2" FOREIGN KEY ("target_id") REFERENCES "Components" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Applications" (
    "id" int NOT NULL AUTO_INCREMENT,
    "app" varchar(512) COLLATE utf8mb4_bin NOT NULL,
    "version" int DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "CategoryStrings" (
    "id" int NOT NULL AUTO_INCREMENT,
    "st" varchar(191) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "st" ("st"),
    KEY "st_idx" ("st") USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Classes" (
    "id" int NOT NULL AUTO_INCREMENT,
    "app_id" int NOT NULL,
    "class" varchar(191) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    KEY "class_idx" ("class") USING HASH,
    KEY "app_id_idx" ("app_id") USING HASH,
    CONSTRAINT "Classes_ibfk_1" FOREIGN KEY ("app_id") REFERENCES "Applications" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "ComponentExtras" (
    "id" int NOT NULL AUTO_INCREMENT,
    "component_id" int NOT NULL,
    "extra" varchar(512) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    KEY "component_id" ("component_id"),
    CONSTRAINT "ComponentExtras_ibfk_1" FOREIGN KEY ("component_id") REFERENCES "Components" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Components" (
    "id" int NOT NULL AUTO_INCREMENT,
    "class_id" int NOT NULL,
    "kind" char(1) COLLATE utf8mb4_bin NOT NULL,
    "exported" SMALLINT NOT NULL,
    "permission" int DEFAULT NULL,
    "missing" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "class_id" ("class_id"),
    KEY "permission" ("permission"),
    CONSTRAINT "Components_ibfk_1" FOREIGN KEY ("class_id") REFERENCES "Classes" ("id") ON DELETE CASCADE,
    CONSTRAINT "Components_ibfk_2" FOREIGN KEY ("permission") REFERENCES "PermissionStrings" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "ExitPointComponents" (
    "id" int NOT NULL AUTO_INCREMENT,
    "exit_id" int NOT NULL,
    "component_id" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "exit_id" ("exit_id"),
    KEY "component_id" ("component_id"),
    CONSTRAINT "ExitPointComponents_ibfk_1" FOREIGN KEY ("exit_id") REFERENCES "ExitPoints" ("id") ON DELETE CASCADE,
    CONSTRAINT "ExitPointComponents_ibfk_2" FOREIGN KEY ("component_id") REFERENCES "Components" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "ExitPoints" (
    "id" int NOT NULL AUTO_INCREMENT,
    "class_id" int NOT NULL,
    "method" varchar(512) COLLATE utf8mb4_bin NOT NULL,
    "instruction" INTEGER NOT NULL,
    "exit_kind" char(1) COLLATE utf8mb4_bin NOT NULL,
    "missing" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "class_id" ("class_id"),
    CONSTRAINT "ExitPoints_ibfk_1" FOREIGN KEY ("class_id") REFERENCES "Classes" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Extras" (
    "id" int NOT NULL AUTO_INCREMENT,
    "method" varchar(512) NOT NULL,
    "type" varchar(512) DEFAULT NULL,
    "extra" varchar(512) NOT NULL,
    "reserved" varchar(512) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "IActions" (
    "id" int NOT NULL AUTO_INCREMENT,
    "intent_id" int NOT NULL,
    "action" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "intent_id" ("intent_id"),
    KEY "action" ("action"),
    CONSTRAINT "IActions_ibfk_1" FOREIGN KEY ("intent_id") REFERENCES "Intents" ("id") ON DELETE CASCADE,
    CONSTRAINT "IActions_ibfk_2" FOREIGN KEY ("action") REFERENCES "ActionStrings" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "ICategories" (
    "id" int NOT NULL AUTO_INCREMENT,
    "intent_id" int NOT NULL,
    "category" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "intent_id" ("intent_id"),
    KEY "category" ("category"),
    CONSTRAINT "ICategories_ibfk_1" FOREIGN KEY ("intent_id") REFERENCES "Intents" ("id") ON DELETE CASCADE,
    CONSTRAINT "ICategories_ibfk_2" FOREIGN KEY ("category") REFERENCES "CategoryStrings" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IClasses" (
    "id" int NOT NULL AUTO_INCREMENT,
    "intent_id" int NOT NULL,
    "class" varchar(512) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    KEY "intent_id" ("intent_id"),
    CONSTRAINT "IClasses_ibfk_1" FOREIGN KEY ("intent_id") REFERENCES "Intents" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IData" (
    "id" int NOT NULL AUTO_INCREMENT,
    "intent_id" int NOT NULL,
    "data" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "intent_id" ("intent_id"),
    KEY "data" ("data"),
    CONSTRAINT "IData_ibfk_1" FOREIGN KEY ("intent_id") REFERENCES "Intents" ("id") ON DELETE CASCADE,
    CONSTRAINT "IData_ibfk_2" FOREIGN KEY ("data") REFERENCES "UriData" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IExtras" (
    "id" int NOT NULL AUTO_INCREMENT,
    "intent_id" int NOT NULL,
    "extra" varchar(512) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    KEY "intent_id" ("intent_id"),
    CONSTRAINT "IExtras_ibfk_1" FOREIGN KEY ("intent_id") REFERENCES "Intents" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IFActions" (
    "id" int NOT NULL AUTO_INCREMENT,
    "filter_id" int NOT NULL,
    "action" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "filter_id" ("filter_id"),
    KEY "action_idx" ("action") USING HASH,
    CONSTRAINT "IFActions_ibfk_1" FOREIGN KEY ("filter_id") REFERENCES "IntentFilters" ("id") ON DELETE CASCADE,
    CONSTRAINT "IFActions_ibfk_2" FOREIGN KEY ("action") REFERENCES "ActionStrings" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IFCategories" (
    "id" int NOT NULL AUTO_INCREMENT,
    "filter_id" int NOT NULL,
    "category" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "filter_id" ("filter_id"),
    KEY "category_idx" ("category") USING HASH,
    CONSTRAINT "IFCategories_ibfk_1" FOREIGN KEY ("filter_id") REFERENCES "IntentFilters" ("id") ON DELETE CASCADE,
    CONSTRAINT "IFCategories_ibfk_2" FOREIGN KEY ("category") REFERENCES "CategoryStrings" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IFData" (
    "id" int NOT NULL AUTO_INCREMENT,
    "filter_id" int DEFAULT NULL,
    "scheme" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    "host" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    "port" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    "path" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    "type" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    "subtype" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "filter_id" ("filter_id"),
    CONSTRAINT "IFData_ibfk_1" FOREIGN KEY ("filter_id") REFERENCES "IntentFilters" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IFMimeTypes" (
    "id" int NOT NULL AUTO_INCREMENT,
    "filter_id" int NOT NULL,
    "type" varchar(512) NOT NULL,
    "subtype" varchar(512) NOT NULL,
    PRIMARY KEY ("id"),
    KEY "filter_id" ("filter_id"),
    KEY "type_idx" ("type","subtype"),
    CONSTRAINT "IFMimeTypes_ibfk_1" FOREIGN KEY ("filter_id") REFERENCES "IntentFilters" ("id") ON DELETE CASCADE
);

CREATE TABLE "IMimeTypes" (
    "id" int NOT NULL AUTO_INCREMENT,
    "intent_id" int NOT NULL,
    "type" varchar(191) COLLATE utf8mb4_bin NOT NULL,
    "subtype" varchar(191) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    KEY "intent_id" ("intent_id"),
    KEY "type_idx" ("type"),
    KEY "subtype_idx" ("subtype"),
    CONSTRAINT "IMimeTypes_ibfk_1" FOREIGN KEY ("intent_id") REFERENCES "Intents" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IPackages" (
    "id" int NOT NULL AUTO_INCREMENT,
    "intent_id" int NOT NULL,
    "package" varchar(512) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    KEY "intent_id" ("intent_id"),
    CONSTRAINT "IPackages_ibfk_1" FOREIGN KEY ("intent_id") REFERENCES "Intents" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IccStmts" (
    "id" int NOT NULL AUTO_INCREMENT,
    "exit_id" int NOT NULL,
    "stmt_id" int NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "IntentFilters" (
    "id" int NOT NULL AUTO_INCREMENT,
    "component_id" int NOT NULL,
    "alias" SMALLINT DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "c_id_idx" ("component_id") USING HASH,
    CONSTRAINT "IntentFilters_ibfk_1" FOREIGN KEY ("component_id") REFERENCES "Components" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "IntentPermissions" (
    "id" int NOT NULL AUTO_INCREMENT,
    "exit_id" int NOT NULL,
    "i_permission" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "exit_id" ("exit_id"),
    KEY "i_permission" ("i_permission"),
    CONSTRAINT "IntentPermissions_ibfk_1" FOREIGN KEY ("exit_id") REFERENCES "ExitPoints" ("id") ON DELETE CASCADE,
    CONSTRAINT "IntentPermissions_ibfk_2" FOREIGN KEY ("i_permission") REFERENCES "PermissionStrings" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Intents" (
    "id" int NOT NULL AUTO_INCREMENT,
    "exit_id" int NOT NULL,
    "implicit" SMALLINT NOT NULL,
    "alias" SMALLINT NOT NULL,
    PRIMARY KEY ("id"),
    KEY "exit_id" ("exit_id"),
    CONSTRAINT "Intents_ibfk_1" FOREIGN KEY ("exit_id") REFERENCES "ExitPoints" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Links" (
    "id" int NOT NULL AUTO_INCREMENT,
    "intent_id" int NOT NULL,
    "component_id" int NOT NULL,
    "type" int DEFAULT '0',
    "reserved" varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "PAuthorities" (
    "id" int NOT NULL AUTO_INCREMENT,
    "provider_id" int NOT NULL,
    "authority" varchar(512) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    KEY "provider_id" ("provider_id"),
    CONSTRAINT "PAuthorities_ibfk_1" FOREIGN KEY ("provider_id") REFERENCES "Providers" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Paths" (
    "id" int NOT NULL AUTO_INCREMENT,
    "app_id" int NOT NULL,
    "source" int NOT NULL,
    "sink" int NOT NULL,
    "paths" text,
    "type" varchar(512) NOT NULL,
    "icc" int NOT NULL,
    "reserved" varchar(512) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "PermissionStrings" (
    "id" int NOT NULL AUTO_INCREMENT,
    "st" varchar(191) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "st" ("st"),
    KEY "st_idx" ("st") USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Permissions" (
    "id" int NOT NULL,
    "level" char(1) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY ("id","level"),
    CONSTRAINT "Permissions_ibfk_1" FOREIGN KEY ("id") REFERENCES "PermissionStrings" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "ProviderLinks" (
    "id" int NOT NULL AUTO_INCREMENT,
    "src_component_id" int NOT NULL,
    "dest_component_id" int NOT NULL,
    "reserved" varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Providers" (
    "id" int NOT NULL AUTO_INCREMENT,
    "component_id" int NOT NULL,
    "grant_uri_permissions" SMALLINT NOT NULL,
    "read_permission" varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
    "write_permission" varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "component_id" ("component_id"),
    CONSTRAINT "Providers_ibfk_1" FOREIGN KEY ("component_id") REFERENCES "Components" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Stmts" (
    "id" int NOT NULL AUTO_INCREMENT,
    "stmt" varchar(512) NOT NULL,
    "method" varchar(512) NOT NULL,
    "class_id" int NOT NULL,
    "jimpleIndex" int NOT NULL,
    "isIcc" SMALLINT NOT NULL,
    "type" varchar(512) NOT NULL,
    "reserved" varchar(512) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "UriData" (
    "id" int NOT NULL AUTO_INCREMENT,
    "scheme" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    "ssp" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    "uri" TEXT COLLATE utf8mb4_bin,
    "path" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    "query" varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
    "authority" varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "Uris" (
    "id" int NOT NULL AUTO_INCREMENT,
    "exit_id" int NOT NULL,
    "data" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "exit_id" ("exit_id"),
    KEY "data" ("data"),
    CONSTRAINT "Uris_ibfk_1" FOREIGN KEY ("exit_id") REFERENCES "ExitPoints" ("id") ON DELETE CASCADE,
    CONSTRAINT "Uris_ibfk_2" FOREIGN KEY ("data") REFERENCES "UriData" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE "UsesPermissions" (
    "id" int NOT NULL AUTO_INCREMENT,
    "app_id" int NOT NULL,
    "uses_permission" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "app_id" ("app_id"),
    KEY "uses_permission_idx" ("uses_permission") USING HASH,
    CONSTRAINT "UsesPermissions_ibfk_1" FOREIGN KEY ("app_id") REFERENCES "Applications" ("id") ON DELETE CASCADE,
    CONSTRAINT "UsesPermissions_ibfk_2" FOREIGN KEY ("uses_permission") REFERENCES "PermissionStrings" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
