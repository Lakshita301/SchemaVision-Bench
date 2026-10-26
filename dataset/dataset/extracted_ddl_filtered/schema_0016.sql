-- Source: https://github.com/lanecatm/Data_Analysis_Process_Modeling_Platform/blob/b2b0e273800974d2cd9d946b80c5837d62cd22e3/isdsp_backup.sql?raw=true
-- Tables detected: 49 | FK/REFERENCES mentions: 1

CREATE TABLE `caseinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `CaseName` varchar(50) DEFAULT NULL,
  `KeyWords` varchar(100) DEFAULT NULL,
  `InitiatorID` int(11) DEFAULT NULL,
  `InitiatorDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

CREATE TABLE `department_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `parent_department_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `layer` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `vice_manager_id` int(11) DEFAULT NULL,
  `duty` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_department_informations_on_manager_id` (`manager_id`),
  KEY `index_department_informations_on_parent_department_id` (`parent_department_id`),
  KEY `index_department_informations_on_vice_manager_id` (`vice_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `javaclassmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationID` int(11) NOT NULL DEFAULT '0',
  `ClassName` varchar(50) DEFAULT NULL,
  `ClassURL` mediumtext,
  `MethodName` varchar(100) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `InputSchemaID` int(11) DEFAULT NULL,
  `OutputSchemaID` int(11) DEFAULT NULL,
  `InputXMLID` int(11) DEFAULT NULL,
  `OutputXMLID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `packageinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PackageID` int(11) NOT NULL DEFAULT '0',
  `PackageName` varchar(50) DEFAULT NULL,
  `Description` mediumtext,
  `DurationUnit` varchar(1) DEFAULT NULL,
  `CostUnit` float DEFAULT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `GoalOWLURI` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `person_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technical_post` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `process_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_information_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `creater_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_shared` tinyint(1) DEFAULT NULL,
  `parent_case_id` int(11) DEFAULT NULL,
  `persistent` tinyint(1) DEFAULT NULL,
  `state` text COLLATE utf8_unicode_ci,
  `case_type` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `process_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_process_informations_on_creater_id` (`creater_id`),
  KEY `index_process_informations_on_parent_case_id` (`parent_case_id`),
  KEY `index_process_informations_on_process_id` (`process_id`),
  KEY `index_process_informations_on_process_type_and_process_id` (`process_type`),
  KEY `index_process_informations_on_user_id` (`user_id`),
  KEY `index_process_informations_on_workflow_information_id` (`workflow_information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `processactivityinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ActivityID` int(11) NOT NULL DEFAULT '0',
  `ActivityName` varchar(50) DEFAULT NULL,
  `ActivityType` smallint(6) DEFAULT NULL,
  `ActivityImplementation` smallint(6) DEFAULT NULL,
  `Layer` smallint(6) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `ChoiceManager` tinyint(1) DEFAULT NULL,
  `StartTime` float DEFAULT NULL,
  `Duration` float DEFAULT NULL,
  `IconID` int(11) DEFAULT NULL,
  `ActivityURL` tinytext,
  `MultiPersonMode` int(11) DEFAULT NULL,
  `SubmitPersonNumber` int(11) DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  `TWCID` int(11) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `isCallback` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

CREATE TABLE `processactivityinputmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL,
  `ActivityID` int(11) NOT NULL,
  `DataflowID` int(11) NOT NULL,
  `InputSchema` mediumtext,
  `InputXML` mediumtext,
  `XSLT` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

CREATE TABLE `processactivityinvokingapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ActivityID` int(11) NOT NULL DEFAULT '0',
  `ApplicationID` int(11) NOT NULL DEFAULT '0',
  `InvocationType` smallint(6) DEFAULT NULL,
  `InputXMLID` int(11) DEFAULT NULL,
  `OutputXMLID` int(11) DEFAULT NULL,
  `ActualStartDate` datetime DEFAULT NULL,
  `ActualEndDate` datetime DEFAULT NULL,
  `Result` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `processapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ApplicationID` smallint(6) NOT NULL DEFAULT '0',
  `Description` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

CREATE TABLE `processcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ConditionID` int(11) NOT NULL DEFAULT '0',
  `ConditionRepresentation` varchar(200) DEFAULT NULL,
  `ConditionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `processcontrolflowcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '0',
  `ControlFlowID` smallint(6) NOT NULL DEFAULT '0',
  `ConditionID` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

CREATE TABLE `processevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `EventRepresentation` longtext,
  `ExpressionforParse` longtext,
  `EventType` smallint(6) DEFAULT NULL,
  `LogicType` smallint(6) DEFAULT NULL,
  `ActivityID` int(11) DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  `ActiveTime` datetime DEFAULT NULL,
  `EventName` varchar(20) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

CREATE TABLE `processflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ModelType` smallint(6) NOT NULL DEFAULT '0',
  `ProcessID` varchar(50) NOT NULL DEFAULT '0',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) DEFAULT NULL,
  `Type` smallint(6) NOT NULL DEFAULT '0',
  `FromObjectType` smallint(6) NOT NULL DEFAULT '0',
  `ObjectId1` int(11) NOT NULL DEFAULT '0',
  `ToObjectType` smallint(6) NOT NULL DEFAULT '0',
  `ObjectID2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

CREATE TABLE `processflowobjectcontrol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `Privilege` smallint(6) DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  `ActiveTime` datetime DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

CREATE TABLE `processflowobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DroolsRuleID` int(11) NOT NULL DEFAULT '0',
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `FromActivityID` int(11) NOT NULL DEFAULT '0',
  `ToActivityID` int(11) NOT NULL DEFAULT '0',
  `XSLTO2M` longtext,
  `XSLTM2I` longtext,
  `OXMLID` int(11) DEFAULT NULL,
  `MXMLID` int(11) DEFAULT NULL,
  `IXMLID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

CREATE TABLE `processinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ProcessName` varchar(50) DEFAULT NULL,
  `Source` smallint(6) DEFAULT NULL,
  `CaseType` smallint(6) DEFAULT NULL,
  `ParentCaseID` varchar(50) DEFAULT NULL,
  `MaximalLayer` smallint(6) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Persistent` tinyint(1) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `DurationUnit` varchar(1) DEFAULT NULL,
  `CostUnit` float DEFAULT NULL,
  `TWCID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

CREATE TABLE `processinherentvariable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `ObjectName` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `ValueType` smallint(6) DEFAULT NULL,
  `InitialValue` varchar(50) DEFAULT NULL,
  `Value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

CREATE TABLE `processlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL,
  `log` text,
  `starttime` bigint(20) DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `idletime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

CREATE TABLE `processobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `ObjectName` varchar(50) DEFAULT NULL,
  `ISInput` tinyint(1) DEFAULT NULL,
  `ISOutput` tinyint(1) DEFAULT NULL,
  `ISVisible` tinyint(1) DEFAULT NULL,
  `ObjectType` smallint(6) DEFAULT NULL,
  `Scope` smallint(6) DEFAULT NULL,
  `PackageObjectID` smallint(6) DEFAULT NULL,
  `State` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

CREATE TABLE `processprocessecarule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `RuleID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `ConditionID` int(11) NOT NULL DEFAULT '0',
  `ActionExpression` varchar(200) DEFAULT NULL,
  `Probability` float DEFAULT NULL,
  `ProbabilityCoefficient` float DEFAULT NULL,
  `ActiveTime` datetime DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

CREATE TABLE `processrepeatedinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) DEFAULT NULL,
  `RepeatedType` smallint(6) DEFAULT NULL,
  `RepeatedID1` int(11) DEFAULT NULL,
  `RepeatedID2` int(11) DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Parameter1` varchar(50) DEFAULT NULL,
  `Parameter2` varchar(50) DEFAULT NULL,
  `Parameter3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `shared_process_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` int(11) DEFAULT NULL,
  `edit_department_id` int(11) DEFAULT NULL,
  `execute_department_id` int(11) DEFAULT NULL,
  `delete_department_id` int(11) DEFAULT NULL,
  `is_shared_sample_input` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shared_process_privileges_on_delete_department_id` (`delete_department_id`),
  KEY `index_shared_process_privileges_on_edit_department_id` (`edit_department_id`),
  KEY `index_shared_process_privileges_on_execute_department_id` (`execute_department_id`),
  KEY `index_shared_process_privileges_on_process_id` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `systemapplicationinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationID` int(11) NOT NULL DEFAULT '0',
  `Description` longtext,
  `ApplicationName` varchar(100) DEFAULT NULL,
  `ApplicationType` smallint(6) DEFAULT NULL,
  `InputSchemaID` int(11) DEFAULT NULL,
  `OutputSchemaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `systemschema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SchemaID` int(11) NOT NULL DEFAULT '0',
  `SchemaName` varchar(100) DEFAULT NULL,
  `description` mediumtext,
  `SchemaText` mediumtext,
  `SchemaType` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `systemxmldocument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectID` int(11) DEFAULT NULL,
  `ObjectName` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `FromSchemaID` int(11) DEFAULT NULL,
  `XML` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `test_algorithms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `param1` int(11) DEFAULT NULL,
  `param2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `param3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_information_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_algorithms_on_process_information_id` (`process_information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `uplaod_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `path` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `process_information_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_uplaod_files_on_process_information_id` (`process_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `upload_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `path` text,
  `process_information_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_upload_files_on_process_information_id` (`process_information_id`),
  CONSTRAINT `fk_rails_858c62fab4` FOREIGN KEY (`process_information_id`) REFERENCES `process_informations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE TABLE `workflow_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `workflow_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `score` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `comment_parent_id` int(11) DEFAULT NULL,
  `workflow_information_id` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_comments_on_author_id` (`author_id`),
  KEY `index_workflow_comments_on_comment_parent_id` (`comment_parent_id`),
  KEY `index_workflow_comments_on_process_id` (`process_id`),
  KEY `index_workflow_comments_on_workflow_information_id` (`workflow_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `workflow_information_and_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_information_id` int(11) DEFAULT NULL,
  `workflow_tag_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_information_and_tags_on_workflow_information_id` (`workflow_information_id`),
  KEY `index_workflow_information_and_tags_on_workflow_tag_id` (`workflow_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `workflow_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` text COLLATE utf8_unicode_ci,
  `detial_description` text COLLATE utf8_unicode_ci,
  `version_name` text COLLATE utf8_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `last_editor_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `persistent` tinyint(1) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `most_possible_duration` int(11) DEFAULT NULL,
  `minimal_duration` int(11) DEFAULT NULL,
  `maximal_duration` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_informations_on_author_id` (`author_id`),
  KEY `index_workflow_informations_on_category_id` (`category_id`),
  KEY `index_workflow_informations_on_last_editor_id` (`last_editor_id`),
  KEY `index_workflow_informations_on_tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `workflow_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_information_id` int(11) DEFAULT NULL,
  `edit_department_id` int(11) DEFAULT NULL,
  `execute_department_id` int(11) DEFAULT NULL,
  `delete_department_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_privileges_on_delete_department_id` (`delete_department_id`),
  KEY `index_workflow_privileges_on_edit_department_id` (`edit_department_id`),
  KEY `index_workflow_privileges_on_execute_department_id` (`execute_department_id`),
  KEY `index_workflow_privileges_on_workflow_information_id` (`workflow_information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `workflow_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `workflowactivityinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) DEFAULT NULL,
  `ActivityID` int(11) DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  `Layer` smallint(6) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `IsComposite` tinyint(1) DEFAULT NULL,
  `Description` mediumtext,
  `ChoiceManager` tinyint(1) NOT NULL,
  `ActivityType` smallint(6) DEFAULT NULL,
  `ActivityImplementation` smallint(6) DEFAULT NULL,
  `StartTime` float DEFAULT NULL,
  `Duration` float DEFAULT NULL,
  `IconID` smallint(6) DEFAULT NULL,
  `ActivityURL` mediumtext,
  `MultiPersonMode` smallint(6) DEFAULT NULL,
  `SubmitPersonNumber` smallint(6) DEFAULT NULL,
  `TWCID` int(11) DEFAULT NULL,
  `IsCallback` tinyint(1) DEFAULT NULL,
  `ObjectList` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowactivityinputmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL,
  `ActivityID` int(11) NOT NULL,
  `DataflowID` int(11) NOT NULL,
  `InputSchema` mediumtext,
  `InputXML` mediumtext,
  `XSLT` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowactivityinvokingapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `ActivityID` int(11) NOT NULL DEFAULT '0',
  `ApplicationID` int(11) NOT NULL DEFAULT '0',
  `InvocationType` smallint(6) DEFAULT NULL,
  `InputSchemaID` int(11) DEFAULT NULL,
  `OutputSchemaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `ApplicationID` smallint(6) NOT NULL DEFAULT '0',
  `Description` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `ConditionID` int(11) NOT NULL DEFAULT '0',
  `ConditionRepresentation` varchar(200) DEFAULT NULL,
  `ConditionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `workflowcontrolflowcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` smallint(6) NOT NULL DEFAULT '0',
  `ControlFlowID` smallint(6) NOT NULL DEFAULT '0',
  `ConditionID` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `EventName` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `EventRepresentation` longtext,
  `EventType` smallint(6) DEFAULT NULL,
  `LogicType` smallint(6) DEFAULT NULL,
  `ActivityID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ModelType` smallint(6) NOT NULL DEFAULT '0',
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) DEFAULT NULL,
  `Type` smallint(6) NOT NULL DEFAULT '0',
  `FromObjectType` smallint(6) NOT NULL DEFAULT '0',
  `ObjectId1` int(11) NOT NULL DEFAULT '0',
  `ToObjectType` smallint(6) NOT NULL DEFAULT '0',
  `ObjectID2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowflowobjectcontrol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `ObjectID` smallint(6) NOT NULL DEFAULT '0',
  `Privilege` smallint(6) DEFAULT NULL,
  `ObjectType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowflowobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `DroolsRuleID` int(11) DEFAULT NULL,
  `FromActivityID` int(11) DEFAULT NULL,
  `ToActivityID` int(11) DEFAULT NULL,
  `XSLTO2M` longtext,
  `XSLTM2I` longtext,
  `OXMLID` int(11) DEFAULT NULL,
  `MXMLID` int(11) DEFAULT NULL,
  `IXMLID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowinherentvariable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `ObjectName` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `ValueType` smallint(6) DEFAULT NULL,
  `InitialValue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` varchar(50) DEFAULT NULL,
  `ObjectID` int(11) DEFAULT NULL,
  `ObjectName` varchar(100) DEFAULT NULL,
  `ISInput` tinyint(1) DEFAULT NULL,
  `ISOutput` tinyint(1) DEFAULT NULL,
  `ISVisible` tinyint(1) DEFAULT NULL,
  `ObjectType` smallint(6) DEFAULT NULL,
  `Scope` smallint(6) DEFAULT NULL,
  `PackageObjectID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `workflowprocessecarule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `RuleID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `ConditionID` int(11) NOT NULL DEFAULT '0',
  `ActionExpression` varchar(200) DEFAULT NULL,
  `Probability` float DEFAULT NULL,
  `ProbabilityCoefficient` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

