-- Source: https://github.com/jawadkhan918/micandroid/blob/aa51bba4e6c35bbaf9b91cf5a290866e26e96756/lightportald/WebContent/WEB-INF/dbscripts/lightCreatedb.sql?raw=true
-- Tables detected: 70 | FK constraints: 4
CREATE TABLE light_address_book (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    addressgroup varchar(255) default NULL,
    fullname varchar(255) default NULL,
    homephone varchar(255) default NULL,
    workphone varchar(255) default NULL,
    mobilephone varchar(255) default NULL,
    primaryphone int default NULL,
    workemail varchar(255) default NULL,
    personalemail varchar(255) default NULL,
    primaryemail int default NULL,
    homepage varchar(255) default NULL,
    address varchar(255) default NULL,
    city varchar(255) default NULL,
    province varchar(255) default NULL,
    country varchar(255) default NULL,
    postalcode varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_blog (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    postedbyid bigint default NULL,
    categoryid bigint default NULL,
    title varchar(255) default NULL,
    summary TEXT,
    content TEXT,
    status int default NULL,
    score int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_blog_category (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    parentid bigint default NULL,
    name varchar(255) default NULL,
    ctgrdesc varchar(255) default NULL,
    status int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_bookmark (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    url varchar(255) default NULL,
    tagid varchar(255) default NULL,
    tagname varchar(255) default NULL,
    bookmarkdesc TEXT,
    userid bigint default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_bulletin (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    postbyid bigint default NULL,
    subject varchar(255) default NULL,
    content TEXT,
    status int default NULL,
    type int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_calendar (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    starttime int default NULL,
    endtime int default NULL,
    intervaltime int default NULL,
    type int default NULL,
    state int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_calendar_event (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    location varchar(255) default NULL,
    description varchar(255) default NULL,
    startdate date default NULL,
    starttime int default NULL,
    enddate date default NULL,
    endtime int default NULL,
    state int default NULL,
    link varchar(255) default NULL,
    parentid bigint default NULL,
    userid bigint default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_calendar_holiday (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    holiday varchar(255) default NULL,
    name varchar(255) default NULL,
    country varchar(255) default NULL,
    description TEXT,
    link varchar(255) default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_category_ad (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    title varchar(255) default NULL,
    content TEXT,
    status int default NULL,
    category int default NULL,
    country varchar(255) default NULL,
    province varchar(255) default NULL,
    city varchar(255) default NULL,
    adurl varchar(255) default NULL,
    showdate date default NULL,
    effdate date default NULL,
    endeffdate date default NULL,
    score int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_chatting (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    chatname varchar(255) default NULL,
    chatdesc varchar(255) default NULL,
    userid bigint default NULL,
    chattype int default NULL,
    status int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_chatting_record (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    chattingid bigint default NULL,
    userid bigint default NULL,
    displayname varchar(255) default NULL,
    content TEXT,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_chatting_user (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    chattingid bigint default NULL,
    userid bigint default NULL,
    status int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_connection (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    buddyuserid bigint default NULL,
    type int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_feedback (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    subject varchar(255) default NULL,
    content varchar(255) default NULL,
    email varchar(255) default NULL,
    visitcount int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_flash_game (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    link varchar(255) default NULL,
    title varchar(255) default NULL,
    description TEXT,
    instructions TEXT,
    tag varchar(255) default NULL,
    locale varchar(255) default NULL,
    popcount int default NULL,
    width int default NULL,
    height int default NULL,
    postbyid bigint default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_forum (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    ctgrdesc varchar(255) default NULL,
    ownerid bigint default NULL,
    status int default NULL,
    categoryid bigint default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_forum_category (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    ctgrdesc varchar(255) default NULL,
    language varchar(255) default NULL,
    ownerid bigint default NULL,
    status int default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_forum_post (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    topic varchar(255) default NULL,
    content TEXT,
    topid bigint default NULL,
    forumid bigint default NULL,
    categoryid bigint default NULL,
    postbyid bigint default NULL,
    lastpostid bigint default NULL,
    lastpostbyid bigint default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_group (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    displayname varchar(255) default NULL,
    categoryid bigint default NULL,
    openjoin int default NULL,
    hiddengroup int default NULL,
    memberinvite int default NULL,
    publicforum int default NULL,
    memberbulletin int default NULL,
    memberimage int default NULL,
    nopicforward int default NULL,
    maturecontent int default NULL,
    country varchar(255) default NULL,
    province varchar(255) default NULL,
    city varchar(255) default NULL,
    postalcode varchar(255) default NULL,
    shortdesc varchar(255) default NULL,
    description TEXT,
    uri varchar(255) default NULL,
    photourl varchar(255) default NULL,
    photowidth int default NULL,
    photoheight int default NULL,
    caption varchar(255) default NULL,
    songurl varchar(255) default NULL,
    ownerid bigint default NULL,
    leaderid bigint default NULL,
    parentid bigint default NULL,
    viewcount int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_group_category (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_horoscope (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    title varchar(255) default NULL,
    description varchar(255) default NULL,
    startdate varchar(255) default NULL,
    enddate varchar(255) default NULL,
    startmonth int default NULL,
    startday int default NULL,
    endmonth int default NULL,
    endday int default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_horoscope_weekly (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    horoscopeid bigint default NULL,
    language varchar(255) default NULL,
    description TEXT,
    weeknumber int default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_internal_news (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    postbyid bigint default NULL,
    subject varchar(255) default NULL,
    content TEXT,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_keyword (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    keyword varchar(255) default NULL,
    weight int default NULL,
    type int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_message (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    postbyid bigint default NULL,
    subject varchar(255) default NULL,
    content TEXT,
    contentformat int default NULL,
    direction int default NULL,
    status int default NULL,
    event int default NULL,
    type int default NULL,
    eventid bigint default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_micro_blog (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    postbyid bigint default NULL,
    content TEXT,
    status int default NULL,
    score int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_not_keyword (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    word varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_not_word (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    word varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_note (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    color varchar(255) default NULL,
    bgcolor varchar(255) default NULL,
    content TEXT,
    width int default NULL,
    height int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_obj_role (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    description varchar(255) default NULL,
    permission bigint default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_obj_type (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_org_profile (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    language varchar(255) default NULL,
    meta varchar(255) default NULL,
    content TEXT,
    maxcontent TEXT,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_organization (
    id bigint NOT NULL,
    version int NOT NULL,
    webid varchar(255) default NULL,
    title varchar(255) default NULL,
    virtualhost varchar(255) default NULL,
    mx varchar(255) default NULL,
    email varchar(255) default NULL,
    receiveemail varchar(255) default NULL,
    logourl varchar(255) default NULL,
    logoicon varchar(255) default NULL,
    userid bigint default NULL,
    adminid bigint default NULL,
    role varchar(255) default NULL,
    type int default NULL,
    status int default NULL,
    parentid bigint default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_permission (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    description varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_pic_pos_tag (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    toporgid bigint default NULL,
    pictureid bigint default NULL,
    pictureurl varchar(255) default NULL,
    parentid bigint default NULL,
    userid bigint default NULL,
    positionx int default NULL,
    positiony int default NULL,
    tag varchar(255) default NULL,
    type int default NULL,
    objectid bigint default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_pic_pos_tag_item (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    toporgid bigint default NULL,
    tagid bigint default NULL,
    pictureid bigint default NULL,
    userid bigint default NULL,
    name varchar(255) default NULL,
    description TEXT,
    itemowner varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_popular_item (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    link varchar(255) default NULL,
    title varchar(255) default NULL,
    itemdesc TEXT,
    tag varchar(255) default NULL,
    locale varchar(255) default NULL,
    postbyid bigint default NULL,
    popcount int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_portal (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    ownerid varchar(255) default NULL,
    title varchar(255) default NULL,
    theme varchar(255) default NULL,
    bgimage varchar(255) default NULL,
    bgposition varchar(255) default NULL,
    bgrepeat int default NULL,
    headerimage varchar(255) default NULL,
    headerposition varchar(255) default NULL,
    headerrepeat int default NULL,
    headerheight int default NULL,
    textfont varchar(255) default NULL,
    fontsize int default NULL,
    textcolor varchar(255) default NULL,
    transparent int default NULL,
    showsearchbar int default NULL,
    maxshowtabs int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_portal_tab (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    portalid bigint default NULL,
    parentid bigint default NULL,
    label varchar(255) default NULL,
    url varchar(255) default NULL,
    closeable int default NULL,
    editable int default NULL,
    moveable int default NULL,
    allowaddcontent int default NULL,
    color varchar(255) default NULL,
    defaulted int default NULL,
    colbetween int default NULL,
    widths varchar(255) default NULL,
    windowskin varchar(255) default NULL,
    fitscreen int default NULL,
    ownerid varchar(255) default NULL,
    status int default NULL,
    client int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_portlet (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    tabid bigint default NULL,
    columnnumber int default NULL,
    rownumber int default NULL,
    colspan int default NULL,
    label varchar(255) default NULL,
    icon varchar(255) default NULL,
    iconcsssprite varchar(255) default NULL,
    showicon int default NULL,
    client int default NULL,
    url varchar(255) default NULL,
    name varchar(255) default NULL,
    path varchar(255) default NULL,
    closeable int default NULL,
    refreshmode int default NULL,
    editmode int default NULL,
    helpmode int default NULL,
    configmode int default NULL,
    minimized int default NULL,
    maximized int default NULL,
    windowskin varchar(255) default NULL,
    autorefreshed int default NULL,
    periodtime int default NULL,
    shownumber int default NULL,
    showtype int default NULL,
    windowstatus int default NULL,
    portletmode int default NULL,
    type int default NULL,
    allowjs int default NULL,
    pagerefreshed int default NULL,
    parameter varchar(255) default NULL,
    barbgcolor varchar(255) default NULL,
    barfontcolor varchar(255) default NULL,
    contentbgcolor varchar(255) default NULL,
    textcolor varchar(255) default NULL,
    transparent int default NULL,
    margintop int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_portlet_preferences (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    value varchar(255) default NULL,
    status int default NULL,
    portletid bigint default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_portlet_ref (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    keywords varchar(255) default NULL,
    label varchar(255) default NULL,
    icon varchar(255) default NULL,
    iconcsssprite varchar(255) default NULL,
    url varchar(255) default NULL,
    path varchar(255) default NULL,
    subtag varchar(255) default NULL,
    tag varchar(255) default NULL,
    language varchar(255) default NULL,
    refreshmode int default NULL,
    editmode int default NULL,
    helpmode int default NULL,
    configmode int default NULL,
    minimized int default NULL,
    maximized int default NULL,
    windowskin varchar(255) default NULL,
    autorefreshed int default NULL,
    periodtime int default NULL,
    shownumber int default NULL,
    showtype int default NULL,
    windowstatus int default NULL,
    portletmode int default NULL,
    type int default NULL,
    allowjs int default NULL,
    pagerefreshed int default NULL,
    parameter varchar(255) default NULL,
    userid varchar(255) default NULL,
    createdby varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_recommended_item (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    link varchar(255) default NULL,
    title varchar(255) default NULL,
    itemdesc TEXT,
    tag varchar(255) default NULL,
    locale varchar(255) default NULL,
    weight int default NULL,
    readstatus int default NULL,
    personid bigint default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_replication_message (
    id bigint NOT NULL,
    orgid bigint default NULL,
    server varchar(255) default NULL,
    event varchar(255) default NULL,
    classname varchar(255) default NULL,
    classid bigint default NULL,
    message BYTEA,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_role_permission (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    roleid bigint default NULL,
    permissionid bigint default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_sequence_id (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    currentid bigint default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_social_activity (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    content varchar(255) default NULL,
    type int default NULL,
    status int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_subdomain (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    uri varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_subscriber (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    email varchar(255) default NULL,
    type int default NULL,
    status int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_tag_filter (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    tag varchar(255) default NULL,
    regex varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_todo (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    name varchar(255) default NULL,
    description varchar(255) default NULL,
    userid bigint default NULL,
    priority int default NULL,
    status int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    personid bigint default NULL,
    userid varchar(255) default NULL,
    password varchar(255) default NULL,
    displayname varchar(255) default NULL,
    email varchar(255) default NULL,
    birth varchar(255) default NULL,
    gender varchar(255) default NULL,
    language varchar(255) default NULL,
    region varchar(255) default NULL,
    timezone varchar(255) default NULL,
    country varchar(255) default NULL,
    province varchar(255) default NULL,
    city varchar(255) default NULL,
    postalcode varchar(255) default NULL,
    useruri varchar(255) default NULL,
    uritype int default NULL,
    photourl varchar(255) default NULL,
    photowidth int default NULL,
    photoheight int default NULL,
    caption varchar(255) default NULL,
    musicurl varchar(255) default NULL,
    ringtoneurl varchar(255) default NULL,
    videourl varchar(255) default NULL,
    showfriendpicture int default NULL,
    showgrouppicture int default NULL,
    notification int default NULL,
    newsletter int default NULL,
    fqnel int default NULL,
    commentneedapprove int default NULL,
    showbirthtofriend int default NULL,
    blogcommentfriendonly int default NULL,
    profilefriendviewonly int default NULL,
    imprivacy int default NULL,
    nopicforward int default NULL,
    mymusicautoplay int default NULL,
    othermusucautoplay int default NULL,
    defaultpicturestatus int default NULL,
    defaultmusicstatus int default NULL,
    defaultfilestatus int default NULL,
    visitcount int default NULL,
    disabled int default NULL,
    locked int default NULL,
    growkeyword int default NULL,
    showtitletofriends int default NULL,
    currentstatus int default NULL,
    defaultstatus int default NULL,
    permission bigint default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    lastlogindate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_block (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    blockid bigint default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_comment (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    objectid bigint default NULL,
    objecttype int default NULL,
    content TEXT,
    status int default NULL,
    parentid bigint default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_ext_role (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    roleid varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_favourite (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    favouriteid bigint default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_file (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    fileurl varchar(255) default NULL,
    caption varchar(255) default NULL,
    status int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_group (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    groupid bigint default NULL,
    acceptleaderbulletin int default NULL,
    acceptmembersbulletin int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_invite (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    inviteemail varchar(255) default NULL,
    content varchar(255) default NULL,
    status int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_keyword (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    personid bigint default NULL,
    keywordid bigint default NULL,
    weight int default NULL,
    type int default NULL,
    status int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_music (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    musicurl varchar(255) default NULL,
    caption varchar(255) default NULL,
    status int default NULL,
    rankable int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_obj_permission (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    objectid bigint default NULL,
    objecttypeid bigint default NULL,
    permissionid bigint default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_obj_role (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    objectid bigint default NULL,
    objecttypeid bigint default NULL,
    roleid bigint default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_picture (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    toporgid bigint default NULL,
    userid bigint default NULL,
    pictureurl varchar(255) default NULL,
    picturewidth int default NULL,
    pictureheight int default NULL,
    caption varchar(255) default NULL,
    tag varchar(255) default NULL,
    status int default NULL,
    rankable int default NULL,
    score int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_picture_rank (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    pictureid int default NULL,
    rankscore int default NULL,
    rankbyid varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_profile (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    firstname varchar(255) default NULL,
    middlename varchar(255) default NULL,
    lastname varchar(255) default NULL,
    occupation varchar(255) default NULL,
    ethnicity int default NULL,
    bodytype int default NULL,
    height int default NULL,
    registerpurpose int default NULL,
    maritalstatus int default NULL,
    sexualorientation int default NULL,
    religion varchar(255) default NULL,
    hometown varchar(255) default NULL,
    smoker int default NULL,
    drinker int default NULL,
    childrenstatus int default NULL,
    education int default NULL,
    income varchar(255) default NULL,
    headline varchar(255) default NULL,
    aboutme TEXT,
    liketomeet TEXT,
    interests TEXT,
    music TEXT,
    movies TEXT,
    television TEXT,
    books TEXT,
    heroes TEXT,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_user_tag (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    objectid bigint default NULL,
    objecttype int default NULL,
    tag varchar(255) default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_viewed_item (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    link varchar(255) default NULL,
    title varchar(255) default NULL,
    itemdesc TEXT,
    tag varchar(255) default NULL,
    locale varchar(255) default NULL,
    popcount int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_viewed_item_user (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    itemid bigint default NULL,
    personid bigint default NULL,
    popcount int default NULL,
    createdate TIMESTAMP default NULL,
    modifieddate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE light_widget (
    id bigint NOT NULL,
    version int NOT NULL,
    orgid bigint default NULL,
    userid bigint default NULL,
    portletid bigint default NULL,
    title varchar(255) default NULL,
    summary varchar(255) default NULL,
    content TEXT,
    width varchar(255) default NULL,
    height varchar(255) default NULL,
    maxheight varchar(255) default NULL,
    status int default NULL,
    score int default NULL,
    createdate TIMESTAMP default NULL,
    PRIMARY KEY  (id)
);
ALTER TABLE light_forum ADD CONSTRAINT fk7dde7cb85f8bdf18 FOREIGN KEY (categoryid) REFERENCES light_forum_category (id);
ALTER TABLE light_pic_pos_tag ADD CONSTRAINT fk860427d1423d8307 FOREIGN KEY (pictureid) REFERENCES light_user_picture (id);
ALTER TABLE light_pic_pos_tag_item ADD CONSTRAINT fk938d46c1feaf65ed FOREIGN KEY (tagid) REFERENCES light_pic_pos_tag (id);
ALTER TABLE light_user_comment ADD CONSTRAINT fkb4bf2e74dd0dd6c5 FOREIGN KEY (objectid) REFERENCES light_micro_blog (id);
CREATE INDEX ON light_forum (categoryid);
CREATE INDEX ON light_pic_pos_tag (pictureid);
CREATE INDEX ON light_pic_pos_tag_item (tagid);
CREATE INDEX ON light_user_comment (objectid);
