-- Source: https://github.com/jawadkhan918/micandroid/blob/aa51bba4e6c35bbaf9b91cf5a290866e26e96756/lightportald/WebContent/WEB-INF/dbscripts/lightCreatedb.sql?raw=true
-- Tables detected: 70 | FK constraints: 4
CREATE TABLE "light_address_book" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "addressGroup" varchar(255) collate utf8_unicode_ci default NULL,
    "fullName" varchar(255) collate utf8_unicode_ci default NULL,
    "homePhone" varchar(255) collate utf8_unicode_ci default NULL,
    "workPhone" varchar(255) collate utf8_unicode_ci default NULL,
    "mobilePhone" varchar(255) collate utf8_unicode_ci default NULL,
    "primaryPhone" int default NULL,
    "workEmail" varchar(255) collate utf8_unicode_ci default NULL,
    "personalEmail" varchar(255) collate utf8_unicode_ci default NULL,
    "primaryEmail" int default NULL,
    "homePage" varchar(255) collate utf8_unicode_ci default NULL,
    "address" varchar(255) collate utf8_unicode_ci default NULL,
    "city" varchar(255) collate utf8_unicode_ci default NULL,
    "province" varchar(255) collate utf8_unicode_ci default NULL,
    "country" varchar(255) collate utf8_unicode_ci default NULL,
    "postalCode" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_blog" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "postedById" bigint default NULL,
    "categoryId" bigint default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "summary" TEXT collate utf8_unicode_ci,
    "content" TEXT collate utf8_unicode_ci,
    "status" int default NULL,
    "score" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_blog_category" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "parentId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "ctgrDesc" varchar(255) collate utf8_unicode_ci default NULL,
    "status" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_bookmark" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "url" varchar(255) collate utf8_unicode_ci default NULL,
    "tagId" varchar(255) collate utf8_unicode_ci default NULL,
    "tagName" varchar(255) collate utf8_unicode_ci default NULL,
    "bookmarkDesc" TEXT collate utf8_unicode_ci,
    "userId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_bulletin" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "postById" bigint default NULL,
    "subject" varchar(255) collate utf8_unicode_ci default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "status" int default NULL,
    "type" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_calendar" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "startTime" int default NULL,
    "endTime" int default NULL,
    "intervalTime" int default NULL,
    "type" int default NULL,
    "state" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_calendar_event" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "location" varchar(255) collate utf8_unicode_ci default NULL,
    "description" varchar(255) collate utf8_unicode_ci default NULL,
    "startDate" date default NULL,
    "startTime" int default NULL,
    "endDate" date default NULL,
    "endTime" int default NULL,
    "state" int default NULL,
    "link" varchar(255) collate utf8_unicode_ci default NULL,
    "parentId" bigint default NULL,
    "userId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_calendar_holiday" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "holiday" varchar(255) collate utf8_unicode_ci default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "country" varchar(255) collate utf8_unicode_ci default NULL,
    "description" TEXT collate utf8_unicode_ci,
    "link" varchar(255) collate utf8_unicode_ci default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_category_ad" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "status" int default NULL,
    "category" int default NULL,
    "country" varchar(255) collate utf8_unicode_ci default NULL,
    "province" varchar(255) collate utf8_unicode_ci default NULL,
    "city" varchar(255) collate utf8_unicode_ci default NULL,
    "adUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "showDate" date default NULL,
    "effDate" date default NULL,
    "endEffDate" date default NULL,
    "score" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_chatting" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "chatName" varchar(255) collate utf8_unicode_ci default NULL,
    "chatDesc" varchar(255) collate utf8_unicode_ci default NULL,
    "userId" bigint default NULL,
    "chatType" int default NULL,
    "status" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_chatting_record" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "chattingId" bigint default NULL,
    "userId" bigint default NULL,
    "displayName" varchar(255) collate utf8_unicode_ci default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_chatting_user" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "chattingId" bigint default NULL,
    "userId" bigint default NULL,
    "status" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_connection" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "buddyUserId" bigint default NULL,
    "type" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_feedback" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "subject" varchar(255) collate utf8_unicode_ci default NULL,
    "content" varchar(255) collate utf8_unicode_ci default NULL,
    "email" varchar(255) collate utf8_unicode_ci default NULL,
    "visitCount" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_flash_game" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "link" varchar(255) collate utf8_unicode_ci default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "description" TEXT collate utf8_unicode_ci,
    "instructions" TEXT collate utf8_unicode_ci,
    "tag" varchar(255) collate utf8_unicode_ci default NULL,
    "locale" varchar(255) collate utf8_unicode_ci default NULL,
    "popCount" int default NULL,
    "width" int default NULL,
    "height" int default NULL,
    "postById" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_forum" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "ctgrDesc" varchar(255) collate utf8_unicode_ci default NULL,
    "ownerId" bigint default NULL,
    "status" int default NULL,
    "categoryId" bigint default NULL,
    PRIMARY KEY  ("id"),
    KEY "FK7DDE7CB85F8BDF18" ("categoryId"),
    CONSTRAINT "FK7DDE7CB85F8BDF18" FOREIGN KEY ("categoryId") REFERENCES "light_forum_category" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_forum_category" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "ctgrDesc" varchar(255) collate utf8_unicode_ci default NULL,
    "language" varchar(255) collate utf8_unicode_ci default NULL,
    "ownerId" bigint default NULL,
    "status" int default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_forum_post" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "topic" varchar(255) collate utf8_unicode_ci default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "topId" bigint default NULL,
    "forumId" bigint default NULL,
    "categoryId" bigint default NULL,
    "postById" bigint default NULL,
    "lastPostId" bigint default NULL,
    "lastPostById" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_group" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "displayName" varchar(255) collate utf8_unicode_ci default NULL,
    "categoryId" bigint default NULL,
    "openJoin" int default NULL,
    "hiddenGroup" int default NULL,
    "memberInvite" int default NULL,
    "publicForum" int default NULL,
    "memberBulletin" int default NULL,
    "memberImage" int default NULL,
    "noPicForward" int default NULL,
    "matureContent" int default NULL,
    "country" varchar(255) collate utf8_unicode_ci default NULL,
    "province" varchar(255) collate utf8_unicode_ci default NULL,
    "city" varchar(255) collate utf8_unicode_ci default NULL,
    "postalCode" varchar(255) collate utf8_unicode_ci default NULL,
    "shortDesc" varchar(255) collate utf8_unicode_ci default NULL,
    "description" TEXT collate utf8_unicode_ci,
    "uri" varchar(255) collate utf8_unicode_ci default NULL,
    "photoUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "photoWidth" int default NULL,
    "photoHeight" int default NULL,
    "caption" varchar(255) collate utf8_unicode_ci default NULL,
    "songUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "ownerId" bigint default NULL,
    "leaderId" bigint default NULL,
    "parentId" bigint default NULL,
    "viewCount" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_group_category" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_horoscope" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "description" varchar(255) collate utf8_unicode_ci default NULL,
    "startDate" varchar(255) collate utf8_unicode_ci default NULL,
    "endDate" varchar(255) collate utf8_unicode_ci default NULL,
    "startMonth" int default NULL,
    "startDay" int default NULL,
    "endMonth" int default NULL,
    "endDay" int default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_horoscope_weekly" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "horoscopeId" bigint default NULL,
    "language" varchar(255) collate utf8_unicode_ci default NULL,
    "description" TEXT collate utf8_unicode_ci,
    "weekNumber" int default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_internal_news" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "postById" bigint default NULL,
    "subject" varchar(255) collate utf8_unicode_ci default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_keyword" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "keyword" varchar(255) collate utf8_unicode_ci default NULL,
    "weight" int default NULL,
    "type" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_message" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "postById" bigint default NULL,
    "subject" varchar(255) collate utf8_unicode_ci default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "contentFormat" int default NULL,
    "direction" int default NULL,
    "status" int default NULL,
    "event" int default NULL,
    "type" int default NULL,
    "eventId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_micro_blog" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "postById" bigint default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "status" int default NULL,
    "score" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_not_keyword" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "word" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_not_word" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "word" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_note" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "color" varchar(255) collate utf8_unicode_ci default NULL,
    "bgColor" varchar(255) collate utf8_unicode_ci default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "width" int default NULL,
    "height" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_obj_role" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "description" varchar(255) collate utf8_unicode_ci default NULL,
    "permission" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_obj_type" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_org_profile" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "language" varchar(255) collate utf8_unicode_ci default NULL,
    "meta" varchar(255) collate utf8_unicode_ci default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "maxContent" TEXT collate utf8_unicode_ci,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_organization" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "webId" varchar(255) collate utf8_unicode_ci default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "virtualHost" varchar(255) collate utf8_unicode_ci default NULL,
    "mx" varchar(255) collate utf8_unicode_ci default NULL,
    "email" varchar(255) collate utf8_unicode_ci default NULL,
    "receiveEmail" varchar(255) collate utf8_unicode_ci default NULL,
    "logoUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "logoIcon" varchar(255) collate utf8_unicode_ci default NULL,
    "userId" bigint default NULL,
    "adminId" bigint default NULL,
    "role" varchar(255) collate utf8_unicode_ci default NULL,
    "type" int default NULL,
    "status" int default NULL,
    "parentId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_permission" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "description" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_pic_pos_tag" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "topOrgId" bigint default NULL,
    "pictureId" bigint default NULL,
    "pictureUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "parentId" bigint default NULL,
    "userId" bigint default NULL,
    "positionX" int default NULL,
    "positionY" int default NULL,
    "tag" varchar(255) collate utf8_unicode_ci default NULL,
    "type" int default NULL,
    "objectId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id"),
    KEY "FK860427D1423D8307" ("pictureId"),
    CONSTRAINT "FK860427D1423D8307" FOREIGN KEY ("pictureId") REFERENCES "light_user_picture" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_pic_pos_tag_item" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "topOrgId" bigint default NULL,
    "tagId" bigint default NULL,
    "pictureId" bigint default NULL,
    "userId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "description" TEXT collate utf8_unicode_ci,
    "itemOwner" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id"),
    KEY "FK938D46C1FEAF65ED" ("tagId"),
    CONSTRAINT "FK938D46C1FEAF65ED" FOREIGN KEY ("tagId") REFERENCES "light_pic_pos_tag" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_popular_item" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "link" varchar(255) collate utf8_unicode_ci default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "itemDesc" TEXT collate utf8_unicode_ci,
    "tag" varchar(255) collate utf8_unicode_ci default NULL,
    "locale" varchar(255) collate utf8_unicode_ci default NULL,
    "postById" bigint default NULL,
    "popCount" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_portal" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "ownerId" varchar(255) collate utf8_unicode_ci default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "theme" varchar(255) collate utf8_unicode_ci default NULL,
    "bgImage" varchar(255) collate utf8_unicode_ci default NULL,
    "bgPosition" varchar(255) collate utf8_unicode_ci default NULL,
    "bgRepeat" int default NULL,
    "headerImage" varchar(255) collate utf8_unicode_ci default NULL,
    "headerPosition" varchar(255) collate utf8_unicode_ci default NULL,
    "headerRepeat" int default NULL,
    "headerHeight" int default NULL,
    "textFont" varchar(255) collate utf8_unicode_ci default NULL,
    "fontSize" int default NULL,
    "textColor" varchar(255) collate utf8_unicode_ci default NULL,
    "transparent" int default NULL,
    "showSearchBar" int default NULL,
    "maxShowTabs" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_portal_tab" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "portalId" bigint default NULL,
    "parentId" bigint default NULL,
    "label" varchar(255) collate utf8_unicode_ci default NULL,
    "url" varchar(255) collate utf8_unicode_ci default NULL,
    "closeable" int default NULL,
    "editable" int default NULL,
    "moveable" int default NULL,
    "allowAddContent" int default NULL,
    "color" varchar(255) collate utf8_unicode_ci default NULL,
    "defaulted" int default NULL,
    "colBetween" int default NULL,
    "widths" varchar(255) collate utf8_unicode_ci default NULL,
    "windowSkin" varchar(255) collate utf8_unicode_ci default NULL,
    "fitScreen" int default NULL,
    "ownerId" varchar(255) collate utf8_unicode_ci default NULL,
    "status" int default NULL,
    "client" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_portlet" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "tabId" bigint default NULL,
    "columnNumber" int default NULL,
    "rowNumber" int default NULL,
    "colspan" int default NULL,
    "label" varchar(255) collate utf8_unicode_ci default NULL,
    "icon" varchar(255) collate utf8_unicode_ci default NULL,
    "iconCssSprite" varchar(255) collate utf8_unicode_ci default NULL,
    "showIcon" int default NULL,
    "client" int default NULL,
    "url" varchar(255) collate utf8_unicode_ci default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "path" varchar(255) collate utf8_unicode_ci default NULL,
    "closeable" int default NULL,
    "refreshMode" int default NULL,
    "editMode" int default NULL,
    "helpMode" int default NULL,
    "configMode" int default NULL,
    "minimized" int default NULL,
    "maximized" int default NULL,
    "windowSkin" varchar(255) collate utf8_unicode_ci default NULL,
    "autoRefreshed" int default NULL,
    "periodTime" int default NULL,
    "showNumber" int default NULL,
    "showType" int default NULL,
    "windowStatus" int default NULL,
    "portletMode" int default NULL,
    "type" int default NULL,
    "allowJS" int default NULL,
    "pageRefreshed" int default NULL,
    "parameter" varchar(255) collate utf8_unicode_ci default NULL,
    "barBgColor" varchar(255) collate utf8_unicode_ci default NULL,
    "barFontColor" varchar(255) collate utf8_unicode_ci default NULL,
    "contentBgColor" varchar(255) collate utf8_unicode_ci default NULL,
    "textColor" varchar(255) collate utf8_unicode_ci default NULL,
    "transparent" int default NULL,
    "marginTop" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_portlet_preferences" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "value" varchar(255) collate utf8_unicode_ci default NULL,
    "status" int default NULL,
    "portletId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_portlet_ref" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "keywords" varchar(255) collate utf8_unicode_ci default NULL,
    "label" varchar(255) collate utf8_unicode_ci default NULL,
    "icon" varchar(255) collate utf8_unicode_ci default NULL,
    "iconCssSprite" varchar(255) collate utf8_unicode_ci default NULL,
    "url" varchar(255) collate utf8_unicode_ci default NULL,
    "path" varchar(255) collate utf8_unicode_ci default NULL,
    "subTag" varchar(255) collate utf8_unicode_ci default NULL,
    "tag" varchar(255) collate utf8_unicode_ci default NULL,
    "language" varchar(255) collate utf8_unicode_ci default NULL,
    "refreshMode" int default NULL,
    "editMode" int default NULL,
    "helpMode" int default NULL,
    "configMode" int default NULL,
    "minimized" int default NULL,
    "maximized" int default NULL,
    "windowSkin" varchar(255) collate utf8_unicode_ci default NULL,
    "autoRefreshed" int default NULL,
    "periodTime" int default NULL,
    "showNumber" int default NULL,
    "showType" int default NULL,
    "windowStatus" int default NULL,
    "portletMode" int default NULL,
    "type" int default NULL,
    "allowJS" int default NULL,
    "pageRefreshed" int default NULL,
    "parameter" varchar(255) collate utf8_unicode_ci default NULL,
    "userId" varchar(255) collate utf8_unicode_ci default NULL,
    "createdBy" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_recommended_item" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "link" varchar(255) collate utf8_unicode_ci default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "itemDesc" TEXT collate utf8_unicode_ci,
    "tag" varchar(255) collate utf8_unicode_ci default NULL,
    "locale" varchar(255) collate utf8_unicode_ci default NULL,
    "weight" int default NULL,
    "readStatus" int default NULL,
    "personId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_replication_message" (
    "id" bigint NOT NULL,
    "orgId" bigint default NULL,
    "server" varchar(255) collate utf8_unicode_ci default NULL,
    "event" varchar(255) collate utf8_unicode_ci default NULL,
    "className" varchar(255) collate utf8_unicode_ci default NULL,
    "classId" bigint default NULL,
    "message" BYTEA,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_role_permission" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "roleId" bigint default NULL,
    "permissionId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_sequence_id" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "currentId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_social_activity" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "content" varchar(255) collate utf8_unicode_ci default NULL,
    "type" int default NULL,
    "status" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_subdomain" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "uri" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_subscriber" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "email" varchar(255) collate utf8_unicode_ci default NULL,
    "type" int default NULL,
    "status" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_tag_filter" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "tag" varchar(255) collate utf8_unicode_ci default NULL,
    "regex" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_todo" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "name" varchar(255) collate utf8_unicode_ci default NULL,
    "description" varchar(255) collate utf8_unicode_ci default NULL,
    "userId" bigint default NULL,
    "priority" int default NULL,
    "status" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "personId" bigint default NULL,
    "userId" varchar(255) collate utf8_unicode_ci default NULL,
    "password" varchar(255) collate utf8_unicode_ci default NULL,
    "displayName" varchar(255) collate utf8_unicode_ci default NULL,
    "email" varchar(255) collate utf8_unicode_ci default NULL,
    "birth" varchar(255) collate utf8_unicode_ci default NULL,
    "gender" varchar(255) collate utf8_unicode_ci default NULL,
    "language" varchar(255) collate utf8_unicode_ci default NULL,
    "region" varchar(255) collate utf8_unicode_ci default NULL,
    "timeZone" varchar(255) collate utf8_unicode_ci default NULL,
    "country" varchar(255) collate utf8_unicode_ci default NULL,
    "province" varchar(255) collate utf8_unicode_ci default NULL,
    "city" varchar(255) collate utf8_unicode_ci default NULL,
    "postalCode" varchar(255) collate utf8_unicode_ci default NULL,
    "userUri" varchar(255) collate utf8_unicode_ci default NULL,
    "uriType" int default NULL,
    "photoUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "photoWidth" int default NULL,
    "photoHeight" int default NULL,
    "caption" varchar(255) collate utf8_unicode_ci default NULL,
    "musicUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "ringToneUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "videoUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "showFriendPicture" int default NULL,
    "showGroupPicture" int default NULL,
    "notification" int default NULL,
    "newsLetter" int default NULL,
    "fqNel" int default NULL,
    "commentNeedApprove" int default NULL,
    "showBirthToFriend" int default NULL,
    "blogCommentFriendOnly" int default NULL,
    "profileFriendViewOnly" int default NULL,
    "imprivacy" int default NULL,
    "noPicForward" int default NULL,
    "myMusicAutoPlay" int default NULL,
    "otherMusucAutoPlay" int default NULL,
    "defaultPictureStatus" int default NULL,
    "defaultMusicStatus" int default NULL,
    "defaultFileStatus" int default NULL,
    "visitCount" int default NULL,
    "disabled" int default NULL,
    "locked" int default NULL,
    "growKeyword" int default NULL,
    "showTitleToFriends" int default NULL,
    "currentStatus" int default NULL,
    "defaultStatus" int default NULL,
    "permission" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    "lastLoginDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_block" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "blockId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_comment" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "objectId" bigint default NULL,
    "objectType" int default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "status" int default NULL,
    "parentId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id"),
    KEY "FKB4BF2E74DD0DD6C5" ("objectId"),
    CONSTRAINT "FKB4BF2E74DD0DD6C5" FOREIGN KEY ("objectId") REFERENCES "light_micro_blog" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_ext_role" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "roleId" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_favourite" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "favouriteId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_file" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "fileUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "caption" varchar(255) collate utf8_unicode_ci default NULL,
    "status" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_group" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "groupId" bigint default NULL,
    "acceptLeaderBulletin" int default NULL,
    "acceptMembersBulletin" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_invite" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "inviteEmail" varchar(255) collate utf8_unicode_ci default NULL,
    "content" varchar(255) collate utf8_unicode_ci default NULL,
    "status" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_keyword" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "personId" bigint default NULL,
    "keywordId" bigint default NULL,
    "weight" int default NULL,
    "type" int default NULL,
    "status" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_music" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "musicUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "caption" varchar(255) collate utf8_unicode_ci default NULL,
    "status" int default NULL,
    "rankable" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_obj_permission" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "objectId" bigint default NULL,
    "objectTypeId" bigint default NULL,
    "permissionId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_obj_role" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "objectId" bigint default NULL,
    "objectTypeId" bigint default NULL,
    "roleId" bigint default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_picture" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "topOrgId" bigint default NULL,
    "userId" bigint default NULL,
    "pictureUrl" varchar(255) collate utf8_unicode_ci default NULL,
    "pictureWidth" int default NULL,
    "pictureHeight" int default NULL,
    "caption" varchar(255) collate utf8_unicode_ci default NULL,
    "tag" varchar(255) collate utf8_unicode_ci default NULL,
    "status" int default NULL,
    "rankable" int default NULL,
    "score" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_picture_rank" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "pictureId" int default NULL,
    "rankScore" int default NULL,
    "rankById" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_profile" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "firstName" varchar(255) collate utf8_unicode_ci default NULL,
    "middleName" varchar(255) collate utf8_unicode_ci default NULL,
    "lastName" varchar(255) collate utf8_unicode_ci default NULL,
    "occupation" varchar(255) collate utf8_unicode_ci default NULL,
    "ethnicity" int default NULL,
    "bodyType" int default NULL,
    "height" int default NULL,
    "registerPurpose" int default NULL,
    "maritalStatus" int default NULL,
    "sexualOrientation" int default NULL,
    "religion" varchar(255) collate utf8_unicode_ci default NULL,
    "hometown" varchar(255) collate utf8_unicode_ci default NULL,
    "smoker" int default NULL,
    "drinker" int default NULL,
    "childrenStatus" int default NULL,
    "education" int default NULL,
    "income" varchar(255) collate utf8_unicode_ci default NULL,
    "headline" varchar(255) collate utf8_unicode_ci default NULL,
    "aboutMe" TEXT collate utf8_unicode_ci,
    "likeToMeet" TEXT collate utf8_unicode_ci,
    "interests" TEXT collate utf8_unicode_ci,
    "music" TEXT collate utf8_unicode_ci,
    "movies" TEXT collate utf8_unicode_ci,
    "television" TEXT collate utf8_unicode_ci,
    "books" TEXT collate utf8_unicode_ci,
    "heroes" TEXT collate utf8_unicode_ci,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_user_tag" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "objectId" bigint default NULL,
    "objectType" int default NULL,
    "tag" varchar(255) collate utf8_unicode_ci default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_viewed_item" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "link" varchar(255) collate utf8_unicode_ci default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "itemDesc" TEXT collate utf8_unicode_ci,
    "tag" varchar(255) collate utf8_unicode_ci default NULL,
    "locale" varchar(255) collate utf8_unicode_ci default NULL,
    "popCount" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_viewed_item_user" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "itemId" bigint default NULL,
    "personId" bigint default NULL,
    "popCount" int default NULL,
    "createDate" TIMESTAMP default NULL,
    "modifiedDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "light_widget" (
    "id" bigint NOT NULL,
    "version" int NOT NULL,
    "orgId" bigint default NULL,
    "userId" bigint default NULL,
    "portletId" bigint default NULL,
    "title" varchar(255) collate utf8_unicode_ci default NULL,
    "summary" varchar(255) collate utf8_unicode_ci default NULL,
    "content" TEXT collate utf8_unicode_ci,
    "width" varchar(255) collate utf8_unicode_ci default NULL,
    "height" varchar(255) collate utf8_unicode_ci default NULL,
    "maxHeight" varchar(255) collate utf8_unicode_ci default NULL,
    "status" int default NULL,
    "score" int default NULL,
    "createDate" TIMESTAMP default NULL,
    PRIMARY KEY  ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
