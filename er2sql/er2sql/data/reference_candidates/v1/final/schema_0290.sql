-- Source: https://github.com/demiankatz/Geeby-Deeby/blob/20839a68f2a5af2946564dc7d9e040ef2d862aa4/data/mysql.sql?raw=true
-- Tables detected: 85 | FK/REFERENCES mentions: 121
CREATE TABLE "Authorities" (
    "Authority_ID" int NOT NULL AUTO_INCREMENT,
    "Authority_Name" TEXT NOT NULL,
    PRIMARY KEY ("Authority_ID")
);

CREATE TABLE "Categories" (
    "Category_ID" int NOT NULL AUTO_INCREMENT,
    "Category" TEXT NOT NULL,
    "Description" text,
    PRIMARY KEY ("Category_ID")
);

CREATE TABLE "Citations" (
    "Citation_ID" int NOT NULL AUTO_INCREMENT,
    "Citation" text NOT NULL,
    PRIMARY KEY ("Citation_ID")
);

CREATE TABLE "Cities" (
    "City_ID" int NOT NULL AUTO_INCREMENT,
    "City_Name" TEXT NOT NULL,
    PRIMARY KEY ("City_ID")
);

CREATE TABLE "Cities_URIs" (
    "Sequence_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "City_ID" int NOT NULL,
    "Predicate_ID" int NOT NULL,
    "URI" varchar(2048) NOT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("City_ID") REFERENCES "Cities" ("City_ID"),
    FOREIGN KEY ("Predicate_ID") REFERENCES "Predicates" ("Predicate_ID")
);

CREATE TABLE "Collections" (
    "Series_ID" int NOT NULL DEFAULT '0',
    "Item_ID" int NOT NULL DEFAULT '0',
    "User_ID" int NOT NULL DEFAULT '0',
    "Collection_Status" enum('have','want','extra') NOT NULL DEFAULT 'have',
    "Collection_Note" TEXT,
    PRIMARY KEY ("Series_ID","Item_ID","User_ID","Collection_Status"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items"("Item_ID"),
    FOREIGN KEY ("User_ID") REFERENCES "Users"("User_ID")
);

CREATE TABLE "Countries" (
    "Country_ID" int NOT NULL AUTO_INCREMENT,
    "Country_Name" TEXT NOT NULL,
    PRIMARY KEY ("Country_ID")
);

CREATE TABLE "Countries_URIs" (
    "Sequence_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Country_ID" int NOT NULL,
    "Predicate_ID" int NOT NULL,
    "URI" varchar(2048) NOT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Country_ID") REFERENCES "Countries" ("Country_ID"),
    FOREIGN KEY ("Predicate_ID") REFERENCES "Predicates" ("Predicate_ID")
);

CREATE TABLE "Editions" (
    "Edition_ID" int NOT NULL AUTO_INCREMENT,
    "Edition_Name" TEXT NOT NULL,
    "Item_ID" int NOT NULL DEFAULT '0',
    "Series_ID" int DEFAULT NULL,
    "Volume" int NOT NULL DEFAULT '0',
    "Position" int NOT NULL DEFAULT '0',
    "Replacement_Number" int NOT NULL DEFAULT '0',
    "Preferred_Item_AltName_ID" bigint DEFAULT NULL,
    "Preferred_Series_AltName_ID" bigint unsigned DEFAULT NULL,
    "Edition_Length" TEXT,
    "Edition_Endings" TEXT,
    "Edition_Description" text,
    "Preferred_Series_Publisher_ID" int DEFAULT NULL,
    "Parent_Edition_ID" int DEFAULT NULL,
    "Position_In_Parent" int DEFAULT NULL,
    "Extent_In_Parent" text,
    "Item_Display_Order" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Edition_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items"("Item_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("Preferred_Item_AltName_ID") REFERENCES "Items_AltTitles" ("Sequence_ID"),
    FOREIGN KEY ("Preferred_Series_AltName_ID") REFERENCES "Series_AltTitles" ("Sequence_ID"),
    FOREIGN KEY ("Preferred_Series_Publisher_ID") REFERENCES "Series_Publishers" ("Series_Publisher_ID"),
    FOREIGN KEY ("Parent_Edition_ID") REFERENCES "Editions" ("Edition_ID")
);

CREATE TABLE "Editions_Attributes" (
    "Editions_Attribute_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Editions_Attribute_Name" varchar(255) NOT NULL,
    "Editions_Attribute_RDF_Property" varchar(255),
    "Allow_HTML" smallint NOT NULL DEFAULT '0',
    "Copy_To_Clone" smallint NOT NULL DEFAULT '0',
    "Display_Priority" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Editions_Attribute_ID")
);

CREATE TABLE "Editions_Attributes_Values" (
    "Edition_ID" int NOT NULL DEFAULT '0',
    "Editions_Attribute_ID" bigint unsigned NOT NULL DEFAULT '0',
    "Editions_Attribute_Value" TEXT NOT NULL,
    PRIMARY KEY ("Edition_ID", "Editions_Attribute_ID"),
    FOREIGN KEY ("Edition_ID") REFERENCES "Editions" ("Edition_ID"),
    FOREIGN KEY ("Editions_Attribute_ID") REFERENCES "Editions_Attributes" ("Editions_Attribute_ID")
);

CREATE TABLE "Editions_Credits" (
    "Edition_ID" int NOT NULL DEFAULT '0',
    "Person_ID" int NOT NULL DEFAULT '0',
    "Role_ID" int NOT NULL DEFAULT '0',
    "Position" int DEFAULT NULL,
    "Note_ID" int DEFAULT NULL,
    PRIMARY KEY ("Edition_ID","Person_ID","Role_ID"),
    FOREIGN KEY ("Edition_ID") REFERENCES "Editions" ("Edition_ID"),
    FOREIGN KEY ("Person_ID") REFERENCES "People" ("Person_ID"),
    FOREIGN KEY ("Role_ID") REFERENCES "Roles" ("Role_ID"),
    FOREIGN KEY ("Note_ID") REFERENCES "Notes" ("Note_ID")
);

CREATE TABLE "Editions_Full_Text" (
    "Sequence_ID" int NOT NULL AUTO_INCREMENT,
    "Full_Text_Source_ID" int NOT NULL DEFAULT '0',
    "Edition_ID" int NOT NULL DEFAULT '0',
    "Full_Text_URL" TEXT NOT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Full_Text_Source_ID") REFERENCES "Full_Text_Sources" ("Full_Text_Source_ID"),
    FOREIGN KEY ("Edition_ID") REFERENCES "Editions" ("Edition_ID")
);

CREATE TABLE "Editions_Full_Text_Attributes" (
    "Editions_Full_Text_Attribute_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Editions_Full_Text_Attribute_Name" varchar(255) NOT NULL,
    "Editions_Full_Text_Attribute_RDF_Property" varchar(255),
    "Allow_HTML" smallint NOT NULL DEFAULT '0',
    "Display_Priority" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Editions_Full_Text_Attribute_ID")
);

CREATE TABLE "Editions_Full_Text_Attributes_Values" (
    "Editions_Full_Text_ID" int NOT NULL DEFAULT '0',
    "Editions_Full_Text_Attribute_ID" bigint unsigned NOT NULL DEFAULT '0',
    "Editions_Full_Text_Attribute_Value" TEXT NOT NULL,
    PRIMARY KEY ("Editions_Full_Text_ID", "Editions_Full_Text_Attribute_ID"),
    FOREIGN KEY ("Editions_Full_Text_ID") REFERENCES "Editions_Full_Text" ("Sequence_ID"),
    FOREIGN KEY ("Editions_Full_Text_Attribute_ID") REFERENCES "Editions_Full_Text_Attributes" ("Editions_Full_Text_Attribute_ID")
);

CREATE TABLE "Editions_Images" (
    "Sequence_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Edition_ID" int NOT NULL DEFAULT '0',
    "Image_Path" TEXT,
    "Thumb_Path" TEXT,
    "IIIF_URI" TEXT,
    "Position" int DEFAULT NULL,
    "Note_ID" int DEFAULT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Edition_ID") REFERENCES "Editions" ("Edition_ID"),
    FOREIGN KEY ("Note_ID") REFERENCES "Notes" ("Note_ID")
);

CREATE TABLE "Editions_ISBNs" (
    "Sequence_ID" int NOT NULL AUTO_INCREMENT,
    "Edition_ID" int NOT NULL DEFAULT '0',
    "ISBN" char(10) DEFAULT NULL,
    "Note_ID" int DEFAULT NULL,
    "ISBN13" char(13) DEFAULT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Edition_ID") REFERENCES "Editions" ("Edition_ID"),
    FOREIGN KEY ("Note_ID") REFERENCES "Notes" ("Note_ID")
);

CREATE TABLE "Editions_OCLC_Numbers" (
    "Sequence_ID" int NOT NULL AUTO_INCREMENT,
    "Edition_ID" int NOT NULL DEFAULT '0',
    "OCLC_Number" TEXT NOT NULL,
    "Note_ID" int DEFAULT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Edition_ID") REFERENCES "Editions" ("Edition_ID"),
    FOREIGN KEY ("Note_ID") REFERENCES "Notes" ("Note_ID")
);

CREATE TABLE "Editions_Platforms" (
    "Edition_ID" int NOT NULL DEFAULT '0',
    "Platform_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Edition_ID","Platform_ID"),
    FOREIGN KEY ("Edition_ID") REFERENCES "Editions" ("Edition_ID"),
    FOREIGN KEY ("Platform_ID") REFERENCES "Platforms" ("Platform_ID")
);

CREATE TABLE "Editions_Product_Codes" (
    "Sequence_ID" int NOT NULL AUTO_INCREMENT,
    "Edition_ID" int NOT NULL DEFAULT '0',
    "Product_Code" TEXT NOT NULL,
    "Note_ID" int DEFAULT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Edition_ID") REFERENCES "Editions" ("Edition_ID"),
    FOREIGN KEY ("Note_ID") REFERENCES "Notes" ("Note_ID")
);

CREATE TABLE "Editions_Release_Dates" (
    "Edition_ID" int NOT NULL DEFAULT '0',
    "Year" int NOT NULL DEFAULT '0',
    "Month" int NOT NULL DEFAULT '0',
    "Day" int NOT NULL DEFAULT '0',
    "Note_ID" int DEFAULT NULL,
    PRIMARY KEY ("Edition_ID","Month","Day","Year"),
    FOREIGN KEY ("Edition_ID") REFERENCES "Editions" ("Edition_ID"),
    FOREIGN KEY ("Note_ID") REFERENCES "Notes" ("Note_ID")
);

CREATE TABLE "FAQ_Categories" (
    "FAQ_Category_ID" int NOT NULL DEFAULT '0',
    "FAQ_Category_Name" TEXT,
    PRIMARY KEY ("FAQ_Category_ID")
);

CREATE TABLE "FAQs" (
    "FAQ_Category_ID" int NOT NULL DEFAULT '0',
    "FAQ_ID" int NOT NULL DEFAULT '0',
    "FAQ_Name" TEXT,
    "FAQ_Body" text,
    PRIMARY KEY ("FAQ_Category_ID","FAQ_ID"),
    FOREIGN KEY ("FAQ_Category_ID") REFERENCES "FAQ_Categories" ("FAQ_Category_ID")
);

CREATE TABLE "File_Types" (
    "File_Type_ID" int NOT NULL AUTO_INCREMENT,
    "File_Type" TEXT NOT NULL,
    PRIMARY KEY ("File_Type_ID")
);

CREATE TABLE "Files" (
    "File_ID" int NOT NULL AUTO_INCREMENT,
    "File_Name" TEXT,
    "File_Path" TEXT,
    "Description" text,
    "File_Type_ID" int DEFAULT NULL,
    PRIMARY KEY ("File_ID"),
    FOREIGN KEY ("File_Type_ID") REFERENCES "File_Types" ("File_Type_ID")
);

CREATE TABLE "Full_Text_Sources" (
    "Full_Text_Source_ID" int NOT NULL AUTO_INCREMENT,
    "Full_Text_Source_Name" TEXT,
    PRIMARY KEY ("Full_Text_Source_ID")
);

CREATE TABLE "Items" (
    "Item_ID" int NOT NULL AUTO_INCREMENT,
    "Item_Name" text NOT NULL,
    "Item_Errata" text,
    "Item_Thanks" TEXT,
    "Material_Type_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Item_ID")
);

CREATE TABLE "Items_Adaptations" (
    "Source_Item_ID" int NOT NULL DEFAULT '0',
    "Adapted_Item_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Source_Item_ID","Adapted_Item_ID"),
    FOREIGN KEY ("Source_Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Adapted_Item_ID") REFERENCES "Items" ("Item_ID")
);

CREATE TABLE "Items_AltTitles" (
    "Item_ID" int NOT NULL DEFAULT '0',
    "Item_AltName" text NOT NULL,
    "Note_ID" int DEFAULT NULL,
    "Sequence_ID" bigint NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Note_ID") REFERENCES "Notes" ("Note_ID")
);

CREATE TABLE "Items_Attributes" (
    "Items_Attribute_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Items_Attribute_Name" varchar(255) NOT NULL,
    "Items_Attribute_RDF_Property" varchar(255),
    "Allow_HTML" smallint NOT NULL DEFAULT '0',
    "Display_Priority" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Items_Attribute_ID")
);

CREATE TABLE "Items_Attributes_Values" (
    "Item_ID" int NOT NULL DEFAULT '0',
    "Items_Attribute_ID" bigint unsigned NOT NULL DEFAULT '0',
    "Items_Attribute_Value" TEXT NOT NULL,
    PRIMARY KEY ("Item_ID", "Items_Attribute_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Items_Attribute_ID") REFERENCES "Items_Attributes" ("Items_Attribute_ID")
);

CREATE TABLE "Items_Bibliography" (
    "Item_ID" int NOT NULL DEFAULT '0',
    "Bib_Item_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Item_ID","Bib_Item_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Bib_Item_ID") REFERENCES "Items" ("Item_ID")
);

CREATE TABLE "Items_Creators" (
    "Item_Creator_ID" int NOT NULL AUTO_INCREMENT,
    "Item_ID" int NOT NULL DEFAULT '0',
    "Person_ID" int NOT NULL DEFAULT '0',
    "Role_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Item_Creator_ID"),
    UNIQUE KEY ("Item_ID", "Person_ID", "Role_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Person_ID") REFERENCES "People" ("Person_ID"),
    FOREIGN KEY ("Role_ID") REFERENCES "Roles" ("Role_ID")
);

CREATE TABLE "Items_Creators_Citations" (
    "Item_Creator_ID" int NOT NULL DEFAULT '0',
    "Citation_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Item_Creator_ID", "Citation_ID"),
    FOREIGN KEY ("Item_Creator_ID") REFERENCES "Items_Creators" ("Item_Creator_ID"),
    FOREIGN KEY ("Citation_ID") REFERENCES "Citations" ("Citation_ID")
);

CREATE TABLE "Items_Descriptions" (
    "Item_ID" int NOT NULL DEFAULT '0',
    "Source" enum('LC','Cover','User','Ad') NOT NULL DEFAULT 'User',
    "Description" text NOT NULL,
    PRIMARY KEY ("Item_ID","Source"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID")
);

CREATE TABLE "Items_Files" (
    "Item_ID" int NOT NULL DEFAULT '0',
    "File_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Item_ID","File_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("File_ID") REFERENCES "Files" ("File_ID")
);

CREATE TABLE "Items_In_Collections" (
    "Item_ID" int NOT NULL DEFAULT '0',
    "Collection_Item_ID" int NOT NULL DEFAULT '0',
    "Position" int NOT NULL DEFAULT '0',
    "Note_ID" int DEFAULT NULL,
    PRIMARY KEY ("Item_ID","Collection_Item_ID","Position"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Collection_Item_ID") REFERENCES "Items" ("Item_ID")
);

CREATE TABLE "Items_Links" (
    "Item_ID" int NOT NULL DEFAULT '0',
    "Link_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Item_ID","Link_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Link_ID") REFERENCES "Links" ("Link_ID")
);

CREATE TABLE "Items_Relationships" (
    "Items_Relationship_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Items_Relationship_Name" varchar(255) NOT NULL,
    "Items_Relationship_RDF_Property" varchar(255),
    "Display_Priority" int NOT NULL DEFAULT '0',
    "Items_Inverse_Relationship_Name" varchar(255),
    "Items_Inverse_Relationship_RDF_Property" varchar(255),
    "Inverse_Display_Priority" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Items_Relationship_ID")
);

CREATE TABLE "Items_Relationships_Values" (
    "Subject_Item_ID" int NOT NULL DEFAULT '0',
    "Items_Relationship_ID" bigint unsigned NOT NULL DEFAULT '0',
    "Object_Item_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Subject_Item_ID", "Items_Relationship_ID", "Object_Item_ID"),
    FOREIGN KEY ("Subject_Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Items_Relationship_ID") REFERENCES "Items_Relationships" ("Items_Relationship_ID"),
    FOREIGN KEY ("Object_Item_ID") REFERENCES "Items" ("Item_ID")
);

CREATE TABLE "Items_Reviews" (
    "Item_ID" int NOT NULL DEFAULT '0',
    "User_ID" int NOT NULL DEFAULT '0',
    "Review" text NOT NULL,
    "Approved" enum('y','n') NOT NULL DEFAULT 'y',
    PRIMARY KEY ("Item_ID","User_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("User_ID") REFERENCES "Users" ("User_ID"),
    KEY "Approved" ("Approved")
);

CREATE TABLE "Items_Tags" (
    "Item_ID" int NOT NULL DEFAULT '0',
    "Tag_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Item_ID","Tag_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Tag_ID") REFERENCES "Tags" ("Tag_ID")
);

CREATE TABLE "Items_Translations" (
    "Source_Item_ID" int NOT NULL DEFAULT '0',
    "Trans_Item_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Source_Item_ID","Trans_Item_ID"),
    FOREIGN KEY ("Source_Item_ID") REFERENCES "Items" ("Item_ID"),
    FOREIGN KEY ("Trans_Item_ID") REFERENCES "Items" ("Item_ID")
);

CREATE TABLE "Languages" (
    "Language_ID" int NOT NULL AUTO_INCREMENT,
    "Language_Name" TEXT NOT NULL,
    PRIMARY KEY ("Language_ID")
);

CREATE TABLE "Link_Types" (
    "Link_Type_ID" int NOT NULL AUTO_INCREMENT,
    "Link_Type" TEXT NOT NULL,
    PRIMARY KEY ("Link_Type_ID")
);

CREATE TABLE "Links" (
    "Link_ID" int NOT NULL AUTO_INCREMENT,
    "Link_Name" TEXT NOT NULL,
    "URL" TEXT NOT NULL,
    "Description" TEXT,
    "Date_Checked" date NOT NULL DEFAULT '0000-00-00',
    "Link_Type_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Link_ID"),
    FOREIGN KEY  ("Link_Type_ID") REFERENCES "Link_Types" ("Link_Type_ID")
);

CREATE TABLE "Material_Types" (
    "Material_Type_ID" int NOT NULL AUTO_INCREMENT,
    "Material_Type_Name" TEXT NOT NULL,
    "Material_Type_Plural_Name" TEXT NOT NULL,
    "Material_Type_RDF_Class" TEXT,
    "Default" smallint NOT NULL DEFAULT '0',
    PRIMARY KEY ("Material_Type_ID")
);

CREATE TABLE "Notes" (
    "Note_ID" int NOT NULL AUTO_INCREMENT,
    "Note" TEXT NOT NULL,
    PRIMARY KEY ("Note_ID")
);

CREATE TABLE "People" (
    "Person_ID" int NOT NULL AUTO_INCREMENT,
    "First_Name" TEXT,
    "Last_Name" TEXT,
    "Extra_Details" TEXT,
    "Biography" text,
    "Authority_ID" int,
    PRIMARY KEY ("Person_ID"),
    FOREIGN KEY ("Authority_ID") REFERENCES "Authorities" ("Authority_ID")
);

CREATE TABLE "People_Bibliography" (
    "Person_ID" int NOT NULL DEFAULT '0',
    "Item_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Person_ID","Item_ID"),
    FOREIGN KEY ("Person_ID") REFERENCES "People" ("Person_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items" ("Item_ID")
);

CREATE TABLE "People_Files" (
    "Person_ID" int NOT NULL DEFAULT '0',
    "File_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Person_ID","File_ID"),
    FOREIGN KEY ("Person_ID") REFERENCES "People" ("Person_ID"),
    FOREIGN KEY ("File_ID") REFERENCES "Files" ("File_ID")
);

CREATE TABLE "People_Links" (
    "Person_ID" int NOT NULL DEFAULT '0',
    "Link_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Person_ID","Link_ID"),
    FOREIGN KEY ("Person_ID") REFERENCES "People" ("Person_ID"),
    FOREIGN KEY ("Link_ID") REFERENCES "Links" ("Link_ID")
);

CREATE TABLE "People_URIs" (
    "Sequence_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Person_ID" int NOT NULL,
    "Predicate_ID" int NOT NULL,
    "URI" varchar(2048) NOT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Person_ID") REFERENCES "People" ("Person_ID"),
    FOREIGN KEY ("Predicate_ID") REFERENCES "Predicates" ("Predicate_ID")
);

CREATE TABLE "Platforms" (
    "Platform_ID" int NOT NULL AUTO_INCREMENT,
    "Platform" TEXT NOT NULL,
    PRIMARY KEY ("Platform_ID")
);

CREATE TABLE "Predicates" (
    "Predicate_ID" int NOT NULL AUTO_INCREMENT,
    "Predicate" varchar(2048) NOT NULL,
    "Predicate_Abbrev" varchar(256) NOT NULL,
    PRIMARY KEY ("Predicate_ID")
);

CREATE TABLE "Pseudonyms" (
    "Real_Person_ID" int NOT NULL DEFAULT '0',
    "Pseudo_Person_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Real_Person_ID","Pseudo_Person_ID"),
    FOREIGN KEY ("Real_Person_ID") REFERENCES "People" ("Person_ID"),
    FOREIGN KEY ("Pseudo_Person_ID") REFERENCES "People" ("Person_ID")
);

CREATE TABLE "Publishers" (
    "Publisher_ID" int NOT NULL AUTO_INCREMENT,
    "Publisher_Name" TEXT NOT NULL,
    PRIMARY KEY ("Publisher_ID")
);

CREATE TABLE "Publishers_Addresses" (
    "Address_ID" int NOT NULL AUTO_INCREMENT,
    "Publisher_ID" int NOT NULL,
    "Country_ID" int NOT NULL,
    "City_ID" int DEFAULT NULL,
    "Street" TEXT DEFAULT '',
    PRIMARY KEY ("Address_ID"),
    FOREIGN KEY ("Publisher_ID") REFERENCES "Publishers" ("Publisher_ID"),
    FOREIGN KEY ("Country_ID") REFERENCES "Countries" ("Country_ID"),
    FOREIGN KEY ("City_ID") REFERENCES "Cities" ("City_ID")
);

CREATE TABLE "Publishers_Imprints" (
    "Imprint_ID" int NOT NULL AUTO_INCREMENT,
    "Publisher_ID" int NOT NULL,
    "Imprint_Name" TEXT NOT NULL,
    PRIMARY KEY ("Imprint_ID"),
    FOREIGN KEY ("Publisher_ID") REFERENCES "Publishers" ("Publisher_ID")
);

CREATE TABLE "Publishers_URIs" (
    "Sequence_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Publisher_ID" int NOT NULL,
    "Predicate_ID" int NOT NULL,
    "URI" varchar(2048) NOT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Publisher_ID") REFERENCES "Publishers" ("Publisher_ID"),
    FOREIGN KEY ("Predicate_ID") REFERENCES "Predicates" ("Predicate_ID")
);

CREATE TABLE "Recent_Reviews" (
    "Added" date NOT NULL DEFAULT '0000-00-00',
    "User_ID" int NOT NULL DEFAULT '0',
    "Item_ID" int NOT NULL DEFAULT '0',
    "Type" enum('item','series') NOT NULL DEFAULT 'item',
    PRIMARY KEY ("User_ID","Item_ID"),
    FOREIGN KEY ("User_ID") REFERENCES "Users"("User_ID")
);

CREATE TABLE "Roles" (
    "Role_ID" int NOT NULL AUTO_INCREMENT,
    "Role_Name" TEXT NOT NULL,
    "Item_Creator_Predicate" varchar(2048) DEFAULT NULL,
    "Edition_Credit_Predicate" varchar(2048) DEFAULT NULL,
    PRIMARY KEY ("Role_ID")
);

CREATE TABLE "Series" (
    "Series_ID" int NOT NULL AUTO_INCREMENT,
    "Series_Name" TEXT NOT NULL,
    "Series_Description" text,
    "Language_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Series_ID"),
    FOREIGN KEY ("Language_ID") REFERENCES "Languages" ("Language_ID")
);

CREATE TABLE "Series_AltTitles" (
    "Series_ID" int NOT NULL DEFAULT '0',
    "Series_AltName" TEXT NOT NULL,
    "Note_ID" int DEFAULT NULL,
    "Sequence_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series" ("Series_ID"),
    FOREIGN KEY ("Note_ID") REFERENCES "Notes" ("Note_ID")
);

CREATE TABLE "Series_Attributes" (
    "Series_Attribute_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Series_Attribute_Name" varchar(255) NOT NULL,
    "Series_Attribute_RDF_Property" varchar(255),
    "Allow_HTML" smallint NOT NULL DEFAULT '0',
    "Display_Priority" int NOT NULL DEFAULT '0',
    "Value_Link" varchar(2048) DEFAULT NULL,
    PRIMARY KEY ("Series_Attribute_ID")
);

CREATE TABLE "Series_Attributes_Values" (
    "Series_ID" int NOT NULL DEFAULT '0',
    "Series_Attribute_ID" bigint unsigned NOT NULL DEFAULT '0',
    "Series_Attribute_Value" TEXT NOT NULL,
    PRIMARY KEY ("Series_ID", "Series_Attribute_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series" ("Series_ID"),
    FOREIGN KEY ("Series_Attribute_ID") REFERENCES "Series_Attributes" ("Series_Attribute_ID")
);

CREATE TABLE "Series_Bibliography" (
    "Series_ID" int NOT NULL DEFAULT '0',
    "Item_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Series_ID","Item_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("Item_ID") REFERENCES "Items"("Item_ID")
);

CREATE TABLE "Series_Categories" (
    "Series_ID" int NOT NULL DEFAULT '0',
    "Category_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Series_ID","Category_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("Category_ID") REFERENCES "Categories"("Category_ID")
);

CREATE TABLE "Series_Files" (
    "Series_ID" int NOT NULL DEFAULT '0',
    "File_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Series_ID","File_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("File_ID") REFERENCES "Files"("File_ID")
);

CREATE TABLE "Series_Links" (
    "Series_ID" int NOT NULL DEFAULT '0',
    "Link_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Series_ID","Link_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("Link_ID") REFERENCES "Links"("Link_ID")
);

CREATE TABLE "Series_Material_Types" (
    "Series_ID" int NOT NULL DEFAULT '0',
    "Material_Type_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Series_ID","Material_Type_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("Material_Type_ID") REFERENCES "Material_Types"("Material_Type_ID")
);

CREATE TABLE "Series_Publishers" (
    "Series_Publisher_ID" int NOT NULL AUTO_INCREMENT,
    "Series_ID" int NOT NULL DEFAULT '0',
    "Publisher_ID" int NOT NULL DEFAULT '0',
    "Note_ID" int DEFAULT NULL,
    "Imprint_ID" int DEFAULT NULL,
    "Address_ID" int DEFAULT NULL,
    PRIMARY KEY ("Series_Publisher_ID"),
    KEY "SERIES" ("Series_ID"),
    KEY "PUBLISHER" ("Publisher_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("Publisher_ID") REFERENCES "Publishers"("Publisher_ID"),
    FOREIGN KEY ("Note_ID") REFERENCES "Notes"("Note_ID"),
    FOREIGN KEY ("Imprint_ID") REFERENCES "Publishers_Imprints"("Imprint_ID"),
    FOREIGN KEY ("Address_ID") REFERENCES "Publishers_Addresses"("Address_ID")
);

CREATE TABLE "Series_Relationships" (
    "Series_Relationship_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Series_Relationship_Name" varchar(255) NOT NULL,
    "Series_Relationship_RDF_Property" varchar(255),
    "Display_Priority" int NOT NULL DEFAULT '0',
    "Series_Inverse_Relationship_Name" varchar(255),
    "Series_Inverse_Relationship_RDF_Property" varchar(255),
    "Inverse_Display_Priority" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Series_Relationship_ID")
);

CREATE TABLE "Series_Relationships_Values" (
    "Subject_Series_ID" int NOT NULL DEFAULT '0',
    "Series_Relationship_ID" bigint unsigned NOT NULL DEFAULT '0',
    "Object_Series_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Subject_Series_ID", "Series_Relationship_ID", "Object_Series_ID"),
    FOREIGN KEY ("Subject_Series_ID") REFERENCES "Series" ("Series_ID"),
    FOREIGN KEY ("Series_Relationship_ID") REFERENCES "Series_Relationships" ("Series_Relationship_ID"),
    FOREIGN KEY ("Object_Series_ID") REFERENCES "Series" ("Series_ID")
);

CREATE TABLE "Series_Reviews" (
    "Series_ID" int NOT NULL DEFAULT '0',
    "User_ID" int NOT NULL DEFAULT '0',
    "Review" text NOT NULL,
    "Approved" enum('y','n') NOT NULL DEFAULT 'y',
    PRIMARY KEY ("Series_ID","User_ID"),
    FOREIGN KEY ("Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("User_ID") REFERENCES "Users"("User_ID")
);

CREATE TABLE "Series_Translations" (
    "Source_Series_ID" int NOT NULL DEFAULT '0',
    "Trans_Series_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Source_Series_ID","Trans_Series_ID"),
    FOREIGN KEY ("Source_Series_ID") REFERENCES "Series"("Series_ID"),
    FOREIGN KEY ("Trans_Series_ID") REFERENCES "Series"("Series_ID")
);

CREATE TABLE "Tag_Types" (
    "Tag_Type_ID" int NOT NULL AUTO_INCREMENT,
    "Tag_Type" TEXT NOT NULL,
    PRIMARY KEY ("Tag_Type_ID")
);

CREATE TABLE "Tags" (
    "Tag_ID" int NOT NULL AUTO_INCREMENT,
    "Tag" TEXT NOT NULL,
    "Tag_Type_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Tag_ID"),
    FOREIGN KEY ("Tag_Type_ID") REFERENCES "Tag_Types" ("Tag_Type_ID")
);

CREATE TABLE "Tags_Attributes" (
    "Tags_Attribute_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Tags_Attribute_Name" varchar(255) NOT NULL,
    "Tags_Attribute_RDF_Property" varchar(255),
    "Allow_HTML" smallint NOT NULL DEFAULT '0',
    "Display_Priority" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Tags_Attribute_ID")
);

CREATE TABLE "Tags_Attributes_Values" (
    "Tag_ID" int NOT NULL DEFAULT '0',
    "Tags_Attribute_ID" bigint unsigned NOT NULL DEFAULT '0',
    "Tags_Attribute_Value" TEXT NOT NULL,
    PRIMARY KEY ("Tag_ID", "Tags_Attribute_ID"),
    FOREIGN KEY ("Tag_ID") REFERENCES "Tags" ("Tag_ID"),
    FOREIGN KEY ("Tags_Attribute_ID") REFERENCES "Tags_Attributes" ("Tags_Attribute_ID")
);

CREATE TABLE "Tags_Relationships" (
    "Tags_Relationship_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Tags_Relationship_Name" varchar(255) NOT NULL,
    "Tags_Relationship_RDF_Property" varchar(255),
    "Display_Priority" int NOT NULL DEFAULT '0',
    "Tags_Inverse_Relationship_Name" varchar(255),
    "Tags_Inverse_Relationship_RDF_Property" varchar(255),
    "Inverse_Display_Priority" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Tags_Relationship_ID")
);

CREATE TABLE "Tags_Relationships_Values" (
    "Subject_Tag_ID" int NOT NULL DEFAULT '0',
    "Tags_Relationship_ID" bigint unsigned NOT NULL DEFAULT '0',
    "Object_Tag_ID" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("Subject_Tag_ID", "Tags_Relationship_ID", "Object_Tag_ID"),
    FOREIGN KEY ("Subject_Tag_ID") REFERENCES "Tags" ("Tag_ID"),
    FOREIGN KEY ("Tags_Relationship_ID") REFERENCES "Tags_Relationships" ("Tags_Relationship_ID"),
    FOREIGN KEY ("Object_Tag_ID") REFERENCES "Tags" ("Tag_ID")
);

CREATE TABLE "Tags_URIs" (
    "Sequence_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "Tag_ID" int NOT NULL,
    "Predicate_ID" int NOT NULL,
    "URI" varchar(2048) NOT NULL,
    PRIMARY KEY ("Sequence_ID"),
    FOREIGN KEY ("Tag_ID") REFERENCES "Tags" ("Tag_ID"),
    FOREIGN KEY ("Predicate_ID") REFERENCES "Predicates" ("Predicate_ID")
);

CREATE TABLE "User_Groups" (
    "User_Group_ID" int NOT NULL AUTO_INCREMENT,
    "Group_Name" TEXT NOT NULL,
    "Content_Editor" SMALLINT NOT NULL DEFAULT 0,
    "User_Editor" SMALLINT NOT NULL DEFAULT 0,
    "Approver" SMALLINT NOT NULL DEFAULT 0,
    "Data_Manager" SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY ("User_Group_ID")
);

CREATE TABLE "Users" (
    "User_ID" int NOT NULL AUTO_INCREMENT,
    "Username" TEXT NOT NULL,
    "Password_Hash" TEXT NOT NULL,
    "Name" TEXT NOT NULL,
    "Address" TEXT,
    "Person_ID" int DEFAULT NULL,
    "User_Group_ID" int DEFAULT NULL,
    "Join_Reason" text DEFAULT NULL,
    "Last_Login" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("User_ID"),
    FOREIGN KEY ("User_Group_ID") REFERENCES "User_Groups" ("User_Group_ID")
);
