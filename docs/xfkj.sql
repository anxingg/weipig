# Host: 192.168.10.100  (Version 5.7.13)
# Date: 2016-09-23 15:09:09
# Generator: MySQL-Front 5.3  (Build 5.39)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "jbpm4_deployment"
#

DROP TABLE IF EXISTS `jbpm4_deployment`;
CREATE TABLE `jbpm4_deployment` (
  `DBID_` bigint(20) NOT NULL,
  `NAME_` longtext,
  `TIMESTAMP_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_deployment"
#


#
# Structure for table "jbpm4_deployprop"
#

DROP TABLE IF EXISTS `jbpm4_deployprop`;
CREATE TABLE `jbpm4_deployprop` (
  `DBID_` bigint(20) NOT NULL,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `OBJNAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `STRINGVAL_` varchar(255) DEFAULT NULL,
  `LONGVAL_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_deployprop"
#


#
# Structure for table "jbpm4_execution"
#

DROP TABLE IF EXISTS `jbpm4_execution`;
CREATE TABLE `jbpm4_execution` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ACTIVITYNAME_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `HISACTINST_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `INSTANCE_` bigint(20) DEFAULT NULL,
  `SUPEREXEC_` bigint(20) DEFAULT NULL,
  `SUBPROCINST_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`),
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `IDX_EXEC_PARENT` (`PARENT_`),
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `FK_EXEC_PARENT` (`PARENT_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_execution"
#


#
# Structure for table "jbpm4_hist_actinst"
#

DROP TABLE IF EXISTS `jbpm4_hist_actinst`;
CREATE TABLE `jbpm4_hist_actinst` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSITION_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HTI_HTASK` (`HTASK_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HTI_HTASK` (`HTASK_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_hist_actinst"
#


#
# Structure for table "jbpm4_hist_detail"
#

DROP TABLE IF EXISTS `jbpm4_hist_detail`;
CREATE TABLE `jbpm4_hist_detail` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HPROCIIDX_` int(11) DEFAULT NULL,
  `HACTI_` bigint(20) DEFAULT NULL,
  `HACTIIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  `HTASKIDX_` int(11) DEFAULT NULL,
  `HVAR_` bigint(20) DEFAULT NULL,
  `HVARIDX_` int(11) DEFAULT NULL,
  `MESSAGE_` longtext,
  `OLD_STR_` varchar(255) DEFAULT NULL,
  `NEW_STR_` varchar(255) DEFAULT NULL,
  `OLD_INT_` int(11) DEFAULT NULL,
  `NEW_INT_` int(11) DEFAULT NULL,
  `OLD_TIME_` datetime DEFAULT NULL,
  `NEW_TIME_` datetime DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HDET_HVAR` (`HVAR_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HTASK` (`HTASK_`),
  KEY `IDX_HDET_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HVAR` (`HVAR_`),
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HTASK` (`HTASK_`),
  KEY `FK_HDETAIL_HACTI` (`HACTI_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_hist_detail"
#


#
# Structure for table "jbpm4_hist_procinst"
#

DROP TABLE IF EXISTS `jbpm4_hist_procinst`;
CREATE TABLE `jbpm4_hist_procinst` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ENDACTIVITY_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_hist_procinst"
#


#
# Structure for table "jbpm4_hist_task"
#

DROP TABLE IF EXISTS `jbpm4_hist_task`;
CREATE TABLE `jbpm4_hist_task` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `OUTCOME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HSUPERT_SUB` (`SUPERTASK_`),
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_hist_task"
#


#
# Structure for table "jbpm4_hist_var"
#

DROP TABLE IF EXISTS `jbpm4_hist_var`;
CREATE TABLE `jbpm4_hist_var` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `PROCINSTID_` varchar(255) DEFAULT NULL,
  `EXECUTIONID_` varchar(255) DEFAULT NULL,
  `VARNAME_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HVAR_HTASK` (`HTASK_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HTASK` (`HTASK_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_hist_var"
#


#
# Structure for table "jbpm4_id_group"
#

DROP TABLE IF EXISTS `jbpm4_id_group`;
CREATE TABLE `jbpm4_id_group` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`),
  KEY `FK_GROUP_PARENT` (`PARENT_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_id_group"
#


#
# Structure for table "jbpm4_id_membership"
#

DROP TABLE IF EXISTS `jbpm4_id_membership`;
CREATE TABLE `jbpm4_id_membership` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_MEM_GROUP` (`GROUP_`),
  KEY `IDX_MEM_USER` (`USER_`),
  KEY `FK_MEM_GROUP` (`GROUP_`),
  KEY `FK_MEM_USER` (`USER_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_id_membership"
#


#
# Structure for table "jbpm4_id_user"
#

DROP TABLE IF EXISTS `jbpm4_id_user`;
CREATE TABLE `jbpm4_id_user` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  `GIVENNAME_` varchar(255) DEFAULT NULL,
  `FAMILYNAME_` varchar(255) DEFAULT NULL,
  `BUSINESSEMAIL_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_id_user"
#


#
# Structure for table "jbpm4_job"
#

DROP TABLE IF EXISTS `jbpm4_job`;
CREATE TABLE `jbpm4_job` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKEXPTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int(11) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `CFG_` bigint(20) DEFAULT NULL,
  `SIGNAL_` varchar(255) DEFAULT NULL,
  `EVENT_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`),
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`),
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`),
  KEY `IDX_JOB_CFG` (`CFG_`),
  KEY `IDX_JOB_EXE` (`EXECUTION_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_JOB_CFG` (`CFG_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_job"
#


#
# Structure for table "jbpm4_lob"
#

DROP TABLE IF EXISTS `jbpm4_lob`;
CREATE TABLE `jbpm4_lob` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `NAME_` longtext,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_lob"
#


#
# Structure for table "jbpm4_participation"
#

DROP TABLE IF EXISTS `jbpm4_participation`;
CREATE TABLE `jbpm4_participation` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `GROUPID_` varchar(255) DEFAULT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_PART_TASK` (`TASK_`),
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_PART_TASK` (`TASK_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_participation"
#


#
# Structure for table "jbpm4_property"
#

DROP TABLE IF EXISTS `jbpm4_property`;
CREATE TABLE `jbpm4_property` (
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_property"
#

/*!40000 ALTER TABLE `jbpm4_property` DISABLE KEYS */;
INSERT INTO `jbpm4_property` VALUES ('next.dbid',0,'1');
/*!40000 ALTER TABLE `jbpm4_property` ENABLE KEYS */;

#
# Structure for table "jbpm4_swimlane"
#

DROP TABLE IF EXISTS `jbpm4_swimlane`;
CREATE TABLE `jbpm4_swimlane` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`),
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_swimlane"
#


#
# Structure for table "jbpm4_task"
#

DROP TABLE IF EXISTS `jbpm4_task`;
CREATE TABLE `jbpm4_task` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `FORM_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROGRESS_` int(11) DEFAULT NULL,
  `SIGNALLING_` bit(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKDEFNAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`),
  KEY `FK_TASK_SWIML` (`SWIMLANE_`),
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_task"
#


#
# Structure for table "jbpm4_variable"
#

DROP TABLE IF EXISTS `jbpm4_variable`;
CREATE TABLE `jbpm4_variable` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CONVERTER_` varchar(255) DEFAULT NULL,
  `HIST_` bit(1) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `LOB_` bigint(20) DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `CLASSNAME_` varchar(255) DEFAULT NULL,
  `LONG_VALUE_` bigint(20) DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  `TEXT_VALUE_` longtext,
  `EXESYS_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`),
  KEY `IDX_VAR_TASK` (`TASK_`),
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_EXESYS` (`EXESYS_`),
  KEY `FK_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_TASK` (`TASK_`),
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "jbpm4_variable"
#


#
# Structure for table "log"
#

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `action` varchar(64) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `log_content` varchar(255) DEFAULT NULL,
  `log_type` int(11) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sys_name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

#
# Data for table "log"
#

/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,1,NULL,'2016-08-29 09:53:53','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(2,1,NULL,'2016-08-29 09:55:47','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(3,1,NULL,'2016-08-29 13:40:57','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(4,1,NULL,'2016-08-29 13:52:52','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(5,1,NULL,'2016-08-29 13:56:11','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(6,1,NULL,'2016-08-29 14:36:19','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(7,1,NULL,'2016-08-29 14:38:27','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(8,1,NULL,'2016-08-29 14:40:34','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(9,1,NULL,'2016-08-29 14:49:24','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(10,1,NULL,'2016-08-29 14:53:25','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(11,1,NULL,'2016-08-29 15:25:27','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(12,1,NULL,'2016-08-29 15:30:06','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(13,1,NULL,'2016-08-29 15:35:27','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(14,1,NULL,'2016-08-29 16:38:46','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(15,1,NULL,'2016-08-29 17:39:14','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(16,1,NULL,'2016-08-30 18:01:30','192.168.10.30',NULL,0,NULL,1,'user',2,'????','xyoa3.0',0,2,NULL),(17,1,NULL,'2016-08-30 18:03:33','192.168.10.25',NULL,0,NULL,1,'user',2,'????','xyoa3.0',0,2,NULL),(18,1,NULL,'2016-08-31 10:20:03','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(19,1,NULL,'2016-08-31 10:35:36','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(20,1,NULL,'2016-08-31 11:15:33','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(21,1,NULL,'2016-08-31 11:23:41','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(22,1,NULL,'2016-08-31 11:31:52','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(23,1,NULL,'2016-08-31 13:42:30','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(24,1,NULL,'2016-08-31 13:49:07','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(25,1,NULL,'2016-08-31 13:51:19','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(26,1,NULL,'2016-08-31 13:52:57','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(27,1,NULL,'2016-08-31 14:27:21','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(28,1,NULL,'2016-08-31 15:27:38','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(29,1,NULL,'2016-08-31 15:36:23','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(30,1,NULL,'2016-08-31 15:38:38','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(31,1,NULL,'2016-08-31 16:08:13','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(32,1,NULL,'2016-08-31 16:39:43','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(33,1,NULL,'2016-08-31 16:58:43','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(34,1,NULL,'2016-08-31 17:10:25','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(35,1,NULL,'2016-08-31 17:53:00','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(36,1,NULL,'2016-08-31 18:02:19','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(37,1,NULL,'2016-09-01 09:44:34','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(38,1,NULL,'2016-09-01 10:06:15','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(39,1,NULL,'2016-09-01 10:16:03','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(40,1,NULL,'2016-09-01 10:44:12','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(41,1,NULL,'2016-09-01 10:46:41','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(42,1,NULL,'2016-09-01 11:19:06','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(43,1,NULL,'2016-09-01 14:15:15','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(44,1,NULL,'2016-09-01 14:42:18','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(45,1,NULL,'2016-09-01 17:02:51','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(46,1,NULL,'2016-09-01 18:30:21','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(47,1,NULL,'2016-09-01 18:37:58','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(48,1,NULL,'2016-09-01 19:13:27','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(49,1,NULL,'2016-09-02 09:17:53','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(50,1,NULL,'2016-09-02 09:21:51','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(51,1,NULL,'2016-09-02 09:31:59','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(52,1,NULL,'2016-09-02 10:05:12','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(53,1,NULL,'2016-09-02 11:13:54','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(54,1,NULL,'2016-09-02 13:52:56','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(55,1,NULL,'2016-09-02 14:13:00','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(56,1,NULL,'2016-09-02 14:35:26','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(57,1,NULL,'2016-09-02 15:07:07','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(58,1,NULL,'2016-09-02 15:46:30','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(59,1,NULL,'2016-09-02 16:41:10','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(60,1,NULL,'2016-09-02 18:11:36','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(61,1,NULL,'2016-09-02 18:26:41','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(62,1,NULL,'2016-09-02 18:27:08','192.168.10.24',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(63,1,NULL,'2016-09-02 18:47:46','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(64,1,NULL,'2016-09-02 18:48:48','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(65,1,NULL,'2016-09-02 19:24:59','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(66,1,NULL,'2016-09-02 19:54:01','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(67,1,NULL,'2016-09-02 19:54:16','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(68,1,NULL,'2016-09-02 19:58:42','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(69,17,NULL,'2016-09-02 20:03:49','0:0:0:0:0:0:0:1',NULL,0,NULL,1,'user',33,'登录成功','xyoa3.0',0,33,'潘博'),(70,1,NULL,'2016-09-05 15:25:32','192.168.10.26',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(71,1,NULL,'2016-09-05 16:57:42','192.168.10.26',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(72,1,NULL,'2016-09-08 15:47:05','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(73,1,NULL,'2016-09-08 18:01:44','192.168.10.50',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(74,1,NULL,'2016-09-08 18:01:45','192.168.10.50',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(75,1,NULL,'2016-09-08 18:14:37','192.168.10.50',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(76,17,NULL,'2016-09-08 18:17:45','192.168.10.25',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(77,17,NULL,'2016-09-08 18:24:21','192.168.10.50',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(78,-1,NULL,'2016-09-14 14:11:05','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,NULL),(79,-1,NULL,'2016-09-14 14:12:44','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(80,17,NULL,'2016-09-14 14:49:41','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(81,-1,NULL,'2016-09-14 14:52:40','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(82,17,NULL,'2016-09-14 14:54:43','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(83,17,NULL,'2016-09-14 14:56:26','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,NULL),(84,-1,NULL,'2016-09-14 14:57:25','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(85,-1,NULL,'2016-09-14 14:58:19','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(86,17,NULL,'2016-09-14 15:15:16','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,'系统管理员'),(87,-1,NULL,'2016-09-14 15:17:06','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(88,17,NULL,'2016-09-14 15:17:14','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,'系统管理员'),(89,-1,NULL,'2016-09-14 15:33:01','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(90,-1,NULL,'2016-09-14 15:52:07','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(91,17,NULL,'2016-09-14 15:52:15','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,'系统管理员'),(92,17,NULL,'2016-09-14 16:14:18','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,'系统管理员'),(93,-1,NULL,'2016-09-14 16:14:31','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(94,17,NULL,'2016-09-14 16:20:24','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,'系统管理员'),(95,-1,NULL,'2016-09-14 16:35:18','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(96,17,NULL,'2016-09-14 16:37:08','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,'系统管理员'),(97,-1,NULL,'2016-09-19 17:34:59','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'系统管理员'),(98,NULL,NULL,'2016-09-22 11:51:39','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'潘博'),(99,NULL,NULL,'2016-09-22 11:52:48','192.168.10.30',NULL,0,NULL,1,'user',2,'登录成功','xyoa3.0',0,2,'张三'),(100,NULL,NULL,'2016-09-22 13:52:17','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'潘博'),(101,NULL,NULL,'2016-09-22 17:29:59','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'潘博'),(102,NULL,NULL,'2016-09-22 17:33:10','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'潘博'),(103,NULL,NULL,'2016-09-23 08:46:11','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'潘博'),(104,NULL,NULL,'2016-09-23 08:48:54','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'潘博'),(105,NULL,NULL,'2016-09-23 10:21:00','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'11'),(106,NULL,NULL,'2016-09-23 14:37:47','192.168.10.30',NULL,0,NULL,1,'user',1,'登录成功','xyoa3.0',0,1,'11');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;

#
# Structure for table "tb_admin_user"
#

DROP TABLE IF EXISTS `tb_admin_user`;
CREATE TABLE `tb_admin_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) DEFAULT NULL,
  `login_pass` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `user_state` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "tb_admin_user"
#

INSERT INTO `tb_admin_user` VALUES (1,'panbo','e10adc3949ba59abbe56e057f20f883e','11','15838369365',1,0,0,'2016-09-22 11:45:40','2016-09-23 09:20:43'),(2,'zhangsan','e10adc3949ba59abbe56e057f20f883e','张三','15838369366',0,0,0,'2016-09-22 11:46:26','2016-09-22 11:46:29'),(3,'lisi','e10adc3949ba59abbe56e057f20f883e','22222','15838369365',0,0,0,'2016-09-23 09:52:17',NULL);

#
# Structure for table "tb_admin_user_company"
#

DROP TABLE IF EXISTS `tb_admin_user_company`;
CREATE TABLE `tb_admin_user_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "tb_admin_user_company"
#

INSERT INTO `tb_admin_user_company` VALUES (1,2,17),(2,2,30);

#
# Structure for table "tb_area"
#

DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
  `ID` int(11) DEFAULT NULL,
  `CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CITY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `isRealName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_area"
#

/*!40000 ALTER TABLE `tb_area` DISABLE KEYS */;
INSERT INTO `tb_area` VALUES (990,'131081000000','霸州市','county','1','y','131000000000',0),(991,'131082000000','三河市','county','1','y','131000000000',0),(992,'131121000000','枣强县','county','1','y','131100000000',0),(993,'131122000000','武邑县','county','1','y','131100000000',0),(994,'131123000000','武强县','county','1','y','131100000000',0),(995,'131124000000','饶阳县','county','1','y','131100000000',0),(996,'131125000000','安平县','county','1','y','131100000000',0),(997,'131126000000','故城县','county','1','y','131100000000',0),(998,'131127000000','景县','county','1','y','131100000000',0),(999,'131128000000','阜城县','county','1','y','131100000000',0),(1000,'131181000000','冀州市','county','1','y','131100000000',0),(1001,'131182000000','深州市','county','1','y','131100000000',0),(1002,'140106000000','迎泽区','county','1','y','140100000000',0),(1003,'140107000000','杏花岭区','county','1','y','140100000000',0),(1004,'140108000000','尖草坪区','county','1','y','140100000000',0),(1005,'140109000000','万柏林区','county','1','y','140100000000',0),(1006,'140110000000','晋源区','county','1','y','140100000000',0),(1007,'140121000000','清徐县','county','1','y','140100000000',0),(1008,'140122000000','阳曲县','county','1','y','140100000000',0),(1009,'140123000000','娄烦县','county','1','y','140100000000',0),(1010,'140181000000','古交市','county','1','y','140100000000',0),(1011,'140203000000','矿区','county','1','y','140200000000',0),(1012,'140211000000','南郊区','county','1','y','140200000000',0),(1013,'140212000000','新荣区','county','1','y','140200000000',0),(1014,'140221000000','阳高县','county','1','y','140200000000',0),(1015,'140222000000','天镇县','county','1','y','140200000000',0),(1016,'140223000000','广灵县','county','1','y','140200000000',0),(1017,'140224000000','灵丘县','county','1','y','140200000000',0),(1018,'140225000000','浑源县','county','1','y','140200000000',0),(1019,'140226000000','左云县','county','1','y','140200000000',0),(1020,'140227000000','大同县','county','1','y','140200000000',0),(1021,'140303000000','矿区','county','1','y','140300000000',0),(1022,'140311000000','郊区','county','1','y','140300000000',0),(1023,'140321000000','平定县','county','1','y','140300000000',0),(1024,'140322000000','盂县','county','1','y','140300000000',0),(1025,'140411000000','郊区','county','1','y','140400000000',0),(1026,'140421000000','长治县','county','1','y','140400000000',0),(1027,'140423000000','襄垣县','county','1','y','140400000000',0),(1028,'140424000000','屯留县','county','1','y','140400000000',0),(1029,'140425000000','平顺县','county','1','y','140400000000',0),(1030,'140426000000','黎城县','county','1','y','140400000000',0),(1031,'140427000000','壶关县','county','1','y','140400000000',0),(1032,'140428000000','长子县','county','1','y','140400000000',0),(1033,'140429000000','武乡县','county','1','y','140400000000',0),(1034,'140430000000','沁县','county','1','y','140400000000',0),(1035,'140431000000','沁源县','county','1','y','140400000000',0),(1036,'140481000000','潞城市','county','1','y','140400000000',0),(1037,'140502000000','城区','county','1','y','140500000000',0),(1038,'140521000000','沁水县','county','1','y','140500000000',0),(1039,'140522000000','阳城县','county','1','y','140500000000',0),(1040,'140524000000','陵川县','county','1','y','140500000000',0),(1041,'140525000000','泽州县','county','1','y','140500000000',0),(1042,'140581000000','高平市','county','1','y','140500000000',0),(1043,'140603000000','平鲁区','county','1','y','140600000000',0),(1044,'140621000000','山阴县','county','1','y','140600000000',0),(1045,'140622000000','应县','county','1','y','140600000000',0),(1046,'140623000000','右玉县','county','1','y','140600000000',0),(1047,'140624000000','怀仁县','county','1','y','140600000000',0),(1048,'140721000000','榆社县','county','1','y','140700000000',0),(1049,'140722000000','左权县','county','1','y','140700000000',0),(1050,'140723000000','和顺县','county','1','y','140700000000',0),(1051,'140724000000','昔阳县','county','1','y','140700000000',0),(1052,'140725000000','寿阳县','county','1','y','140700000000',0),(1053,'140726000000','太谷县','county','1','y','140700000000',0),(1054,'140727000000','祁县','county','1','y','140700000000',0),(1055,'140728000000','平遥县','county','1','y','140700000000',0),(1056,'140729000000','灵石县','county','1','y','140700000000',0),(1057,'140781000000','介休市','county','1','y','140700000000',0),(1058,'140821000000','临猗县','county','1','y','140800000000',0),(1059,'140822000000','万荣县','county','1','y','140800000000',0),(1060,'140823000000','闻喜县','county','1','y','140800000000',0),(1061,'140824000000','稷山县','county','1','y','140800000000',0),(1062,'140825000000','新绛县','county','1','y','140800000000',0),(1063,'140826000000','绛县','county','1','y','140800000000',0),(1064,'140827000000','垣曲县','county','1','y','140800000000',0),(1065,'140828000000','夏县','county','1','y','140800000000',0),(1066,'140829000000','平陆县','county','1','y','140800000000',0),(1067,'140830000000','芮城县','county','1','y','140800000000',0),(1068,'140881000000','永济市','county','1','y','140800000000',0),(1069,'140882000000','河津市','county','1','y','140800000000',0),(1070,'140921000000','定襄县','county','1','y','140900000000',0),(1071,'140922000000','五台县','county','1','y','140900000000',0),(1072,'140923000000','代县','county','1','y','140900000000',0),(1073,'140924000000','繁峙县','county','1','y','140900000000',0),(1074,'140925000000','宁武县','county','1','y','140900000000',0),(1075,'140926000000','静乐县','county','1','y','140900000000',0),(1076,'140927000000','神池县','county','1','y','140900000000',0),(1077,'140928000000','五寨县','county','1','y','140900000000',0),(1078,'140929000000','岢岚县','county','1','y','140900000000',0),(1079,'140930000000','河曲县','county','1','y','140900000000',0),(1080,'140931000000','保德县','county','1','y','140900000000',0),(1081,'140932000000','偏关县','county','1','y','140900000000',0),(1082,'140981000000','原平市','county','1','y','140900000000',0),(1083,'141021000000','曲沃县','county','1','y','141000000000',0),(1084,'141022000000','翼城县','county','1','y','141000000000',0),(1085,'141023000000','襄汾县','county','1','y','141000000000',0),(1086,'141024000000','洪洞县','county','1','y','141000000000',0),(1087,'141025000000','古县','county','1','y','141000000000',0),(1088,'141026000000','安泽县','county','1','y','141000000000',0),(1089,'141027000000','浮山县','county','1','y','141000000000',0),(1090,'141028000000','吉县','county','1','y','141000000000',0),(1091,'141029000000','乡宁县','county','1','y','141000000000',0),(1092,'141030000000','大宁县','county','1','y','141000000000',0),(1093,'141031000000','隰县','county','1','y','141000000000',0),(1094,'141032000000','永和县','county','1','y','141000000000',0),(1095,'141033000000','蒲县','county','1','y','141000000000',0),(1096,'141034000000','汾西县','county','1','y','141000000000',0),(1097,'141081000000','侯马市','county','1','y','141000000000',0),(1098,'141082000000','霍州市','county','1','y','141000000000',0),(1099,'141121000000','文水县','county','1','y','141100000000',0),(1100,'141122000000','交城县','county','1','y','141100000000',0),(1101,'141123000000','兴县','county','1','y','141100000000',0),(1102,'141124000000','临县','county','1','y','141100000000',0),(1103,'141125000000','柳林县','county','1','y','141100000000',0),(1104,'141126000000','石楼县','county','1','y','141100000000',0),(1105,'141127000000','岚县','county','1','y','141100000000',0),(1106,'141128000000','方山县','county','1','y','141100000000',0),(1107,'141129000000','中阳县','county','1','y','141100000000',0),(1108,'141130000000','交口县','county','1','y','141100000000',0),(1109,'141181000000','孝义市','county','1','y','141100000000',0),(1110,'141182000000','汾阳市','county','1','y','141100000000',0),(1111,'150103000000','回民区','county','1','y','150100000000',0),(1112,'150104000000','玉泉区','county','1','y','150100000000',0),(1113,'150105000000','赛罕区','county','1','y','150100000000',0),(1114,'150121000000','土默特左旗','county','1','y','150100000000',0),(1115,'150122000000','托克托县','county','1','y','150100000000',0),(1116,'150123000000','和林格尔县','county','1','y','150100000000',0),(1117,'150124000000','清水河县','county','1','y','150100000000',0),(1118,'150125000000','武川县','county','1','y','150100000000',0),(1119,'150203000000','昆都仑区','county','1','y','150200000000',0),(1120,'150204000000','青山区','county','1','y','150200000000',0),(1121,'150205000000','石拐区','county','1','y','150200000000',0),(1122,'150206000000','白云鄂博矿区','county','1','y','150200000000',0),(1123,'150207000000','九原区','county','1','y','150200000000',0),(1124,'150221000000','土默特右旗','county','1','y','150200000000',0),(1125,'150222000000','固阳县','county','1','y','150200000000',0),(1126,'150223000000','达尔罕茂明安联合旗','county','1','y','150200000000',0),(1127,'150303000000','海南区','county','1','y','150300000000',0),(1128,'150304000000','乌达区','county','1','y','150300000000',0),(1129,'150403000000','元宝山区','county','1','y','150400000000',0),(1130,'150404000000','松山区','county','1','y','150400000000',0),(1131,'150421000000','阿鲁科尔沁旗','county','1','y','150400000000',0),(1132,'150422000000','巴林左旗','county','1','y','150400000000',0),(1133,'150423000000','巴林右旗','county','1','y','150400000000',0),(1134,'150424000000','林西县','county','1','y','150400000000',0),(1135,'150425000000','克什克腾旗','county','1','y','150400000000',0),(1136,'150426000000','翁牛特旗','county','1','y','150400000000',0),(1137,'150428000000','喀喇沁旗','county','1','y','150400000000',0),(1138,'150429000000','宁城县','county','1','y','150400000000',0),(1139,'150430000000','敖汉旗','county','1','y','150400000000',0),(1140,'150521000000','科尔沁左翼中旗','county','1','y','150500000000',0),(1141,'150522000000','科尔沁左翼后旗','county','1','y','150500000000',0),(1142,'150523000000','开鲁县','county','1','y','150500000000',0),(1143,'150524000000','库伦旗','county','1','y','150500000000',0),(1144,'150525000000','奈曼旗','county','1','y','150500000000',0),(1145,'150526000000','扎鲁特旗','county','1','y','150500000000',0),(1146,'150581000000','霍林郭勒市','county','1','y','150500000000',0),(1147,'150621000000','达拉特旗','county','1','y','150600000000',0),(1148,'150622000000','准格尔旗','county','1','y','150600000000',0),(1149,'150623000000','鄂托克前旗','county','1','y','150600000000',0),(1150,'150624000000','鄂托克旗','county','1','y','150600000000',0),(1151,'150625000000','杭锦旗','county','1','y','150600000000',0),(1152,'150626000000','乌审旗','county','1','y','150600000000',0),(1153,'150627000000','伊金霍洛旗','county','1','y','150600000000',0),(1154,'150721000000','阿荣旗','county','1','y','150700000000',0),(1155,'150722000000','莫力达瓦达斡尔族自治旗','county','1','y','150700000000',0),(1156,'150723000000','鄂伦春自治旗','county','1','y','150700000000',0),(1157,'150724000000','鄂温克族自治旗','county','1','y','150700000000',0),(1158,'150725000000','陈巴尔虎旗','county','1','y','150700000000',0),(1159,'150726000000','新巴尔虎左旗','county','1','y','150700000000',0),(1160,'150727000000','新巴尔虎右旗','county','1','y','150700000000',0),(1161,'150781000000','满洲里市','county','1','y','150700000000',0),(1162,'150782000000','牙克石市','county','1','y','150700000000',0),(1163,'150783000000','扎兰屯市','county','1','y','150700000000',0),(1164,'150784000000','额尔古纳市','county','1','y','150700000000',0),(1165,'150785000000','根河市','county','1','y','150700000000',0),(1166,'150821000000','五原县','county','1','y','150800000000',0),(1167,'150822000000','磴口县','county','1','y','150800000000',0),(1168,'150823000000','乌拉特前旗','county','1','y','150800000000',0),(1169,'150824000000','乌拉特中旗','county','1','y','150800000000',0),(1170,'150825000000','乌拉特后旗','county','1','y','150800000000',0),(1171,'150826000000','杭锦后旗','county','1','y','150800000000',0),(1172,'150921000000','卓资县','county','1','y','150900000000',0),(1173,'150922000000','化德县','county','1','y','150900000000',0),(1174,'150923000000','商都县','county','1','y','150900000000',0),(1175,'150924000000','兴和县','county','1','y','150900000000',0),(1176,'150925000000','凉城县','county','1','y','150900000000',0),(1177,'150926000000','察哈尔右翼前旗','county','1','y','150900000000',0),(1178,'150927000000','察哈尔右翼中旗','county','1','y','150900000000',0),(1179,'150928000000','察哈尔右翼后旗','county','1','y','150900000000',0),(1180,'150929000000','四子王旗','county','1','y','150900000000',0),(1181,'150981000000','丰镇市','county','1','y','150900000000',0),(1182,'152202000000','阿尔山市','county','1','y','152200000000',0),(1183,'152221000000','科尔沁右翼前旗','county','1','y','152200000000',0),(1184,'152222000000','科尔沁右翼中旗','county','1','y','152200000000',0),(1185,'152223000000','扎赉特旗','county','1','y','152200000000',0),(1186,'152224000000','突泉县','county','1','y','152200000000',0),(1187,'152502000000','锡林浩特市','county','1','y','152500000000',0),(1188,'152522000000','阿巴嘎旗','county','1','y','152500000000',0),(1189,'152523000000','苏尼特左旗','county','1','y','152500000000',0),(1190,'152524000000','苏尼特右旗','county','1','y','152500000000',0),(1191,'152525000000','东乌珠穆沁旗','county','1','y','152500000000',0),(1192,'152526000000','西乌珠穆沁旗','county','1','y','152500000000',0),(1193,'152527000000','太仆寺旗','county','1','y','152500000000',0),(1194,'152528000000','镶黄旗','county','1','y','152500000000',0),(1195,'152529000000','正镶白旗','county','1','y','152500000000',0),(1196,'152530000000','正蓝旗','county','1','y','152500000000',0),(1197,'152531000000','多伦县','county','1','y','152500000000',0),(1198,'152922000000','阿拉善右旗','county','1','y','152900000000',0),(1199,'152923000000','额济纳旗','county','1','y','152900000000',0),(1200,'210103000000','沈河区','county','1','y','210100000000',0),(1201,'210104000000','大东区','county','1','y','210100000000',0),(1202,'210105000000','皇姑区','county','1','y','210100000000',0),(1203,'210106000000','铁西区','county','1','y','210100000000',0),(1204,'210111000000','苏家屯区','county','1','y','210100000000',0),(1205,'210112000000','东陵区','county','1','y','210100000000',0),(1206,'210113000000','沈北新区','county','1','y','210100000000',0),(1207,'210114000000','于洪区','county','1','y','210100000000',0),(1208,'210122000000','辽中县','county','1','y','210100000000',0),(1209,'210123000000','康平县','county','1','y','210100000000',0),(1210,'210124000000','法库县','county','1','y','210100000000',0),(1211,'210181000000','新民市','county','1','y','210100000000',0),(1212,'210203000000','西岗区','county','1','y','210200000000',0),(1213,'210204000000','沙河口区','county','1','y','210200000000',0),(1214,'210211000000','甘井子区','county','1','y','210200000000',0),(1215,'210212000000','旅顺口区','county','1','y','210200000000',0),(1216,'210213000000','金州区','county','1','y','210200000000',0),(1217,'210224000000','长海县','county','1','y','210200000000',0),(1218,'210281000000','瓦房店市','county','1','y','210200000000',0),(1219,'210282000000','普兰店市','county','1','y','210200000000',0),(1220,'210283000000','庄河市','county','1','y','210200000000',0),(1221,'210303000000','铁西区','county','1','y','210300000000',0),(1222,'210304000000','立山区','county','1','y','210300000000',0),(1223,'210311000000','千山区','county','1','y','210300000000',0),(1224,'210321000000','台安县','county','1','y','210300000000',0),(1225,'210323000000','岫岩满族自治县','county','1','y','210300000000',0),(1226,'210381000000','海城市','county','1','y','210300000000',0),(1227,'210403000000','东洲区','county','1','y','210400000000',0),(1228,'210404000000','望花区','county','1','y','210400000000',0),(1229,'210411000000','顺城区','county','1','y','210400000000',0),(1230,'210421000000','抚顺县','county','1','y','210400000000',0),(1231,'210422000000','新宾满族自治县','county','1','y','210400000000',0),(1232,'210423000000','清原满族自治县','county','1','y','210400000000',0),(1233,'210503000000','溪湖区','county','1','y','210500000000',0),(1234,'210504000000','明山区','county','1','y','210500000000',0),(1235,'210505000000','南芬区','county','1','y','210500000000',0),(1236,'210521000000','本溪满族自治县','county','1','y','210500000000',0),(1237,'210522000000','桓仁满族自治县','county','1','y','210500000000',0),(1238,'210603000000','振兴区','county','1','y','210600000000',0),(1239,'210604000000','振安区','county','1','y','210600000000',0),(1240,'210624000000','宽甸满族自治县','county','1','y','210600000000',0),(1241,'210681000000','东港市','county','1','y','210600000000',0),(1242,'210682000000','凤城市','county','1','y','210600000000',0),(1243,'210703000000','凌河区','county','1','y','210700000000',0),(1244,'210711000000','太和区','county','1','y','210700000000',0),(1245,'210726000000','黑山县','county','1','y','210700000000',0),(1246,'210727000000','义县','county','1','y','210700000000',0),(1247,'210781000000','凌海市','county','1','y','210700000000',0),(1248,'210782000000','北镇市','county','1','y','210700000000',0),(1249,'210803000000','西市区','county','1','y','210800000000',0),(1250,'210804000000','鲅鱼圈区','county','1','y','210800000000',0),(1251,'210811000000','老边区','county','1','y','210800000000',0),(1252,'210881000000','盖州市','county','1','y','210800000000',0),(1253,'210882000000','大石桥市','county','1','y','210800000000',0),(1254,'210903000000','新邱区','county','1','y','210900000000',0),(1255,'210904000000','太平区','county','1','y','210900000000',0),(1256,'210905000000','清河门区','county','1','y','210900000000',0),(1257,'210911000000','细河区','county','1','y','210900000000',0),(1258,'210921000000','阜新蒙古族自治县','county','1','y','210900000000',0),(1259,'210922000000','彰武县','county','1','y','210900000000',0),(1260,'211003000000','文圣区','county','1','y','211000000000',0),(1261,'211004000000','宏伟区','county','1','y','211000000000',0),(1262,'211005000000','弓长岭区','county','1','y','211000000000',0),(1263,'211011000000','太子河区','county','1','y','211000000000',0),(1264,'211021000000','辽阳县','county','1','y','211000000000',0),(1265,'211081000000','灯塔市','county','1','y','211000000000',0),(1266,'211103000000','兴隆台区','county','1','y','211100000000',0),(1267,'211121000000','大洼县','county','1','y','211100000000',0),(1268,'211122000000','盘山县','county','1','y','211100000000',0),(1269,'211204000000','清河区','county','1','y','211200000000',0),(1270,'211221000000','铁岭县','county','1','y','211200000000',0),(1271,'211223000000','西丰县','county','1','y','211200000000',0),(1272,'211224000000','昌图县','county','1','y','211200000000',0),(1273,'211281000000','调兵山市','county','1','y','211200000000',0),(1274,'211282000000','开原市','county','1','y','211200000000',0),(1275,'211303000000','龙城区','county','1','y','211300000000',0),(1276,'211321000000','朝阳县','county','1','y','211300000000',0),(1277,'211322000000','建平县','county','1','y','211300000000',0),(1278,'211324000000','喀喇沁左翼蒙古族自治县','county','1','y','211300000000',0),(1279,'211381000000','北票市','county','1','y','211300000000',0),(1280,'211382000000','凌源市','county','1','y','211300000000',0),(1281,'211403000000','龙港区','county','1','y','211400000000',0),(1282,'211404000000','南票区','county','1','y','211400000000',0),(1283,'211421000000','绥中县','county','1','y','211400000000',0),(1284,'211422000000','建昌县','county','1','y','211400000000',0),(1285,'211481000000','兴城市','county','1','y','211400000000',0),(1286,'220103000000','宽城区','county','1','y','220100000000',0),(1287,'220104000000','朝阳区','county','1','y','220100000000',0),(1288,'220105000000','二道区','county','1','y','220100000000',0),(1289,'220106000000','绿园区','county','1','y','220100000000',0),(1290,'220112000000','双阳区','county','1','y','220100000000',0),(1291,'220122000000','农安县','county','1','y','220100000000',0),(1292,'220181000000','九台市','county','1','y','220100000000',0),(1293,'220182000000','榆树市','county','1','y','220100000000',0),(1294,'220183000000','德惠市','county','1','y','220100000000',0),(1295,'220203000000','龙潭区','county','1','y','220200000000',0),(1296,'220204000000','船营区','county','1','y','220200000000',0),(1297,'220211000000','丰满区','county','1','y','220200000000',0),(1298,'220221000000','永吉县','county','1','y','220200000000',0),(1299,'220281000000','蛟河市','county','1','y','220200000000',0),(1300,'220282000000','桦甸市','county','1','y','220200000000',0),(1301,'220283000000','舒兰市','county','1','y','220200000000',0),(1302,'220284000000','磐石市','county','1','y','220200000000',0),(1303,'220303000000','铁东区','county','1','y','220300000000',0),(1304,'220322000000','梨树县','county','1','y','220300000000',0),(1305,'220323000000','伊通满族自治县','county','1','y','220300000000',0),(1306,'220381000000','公主岭市','county','1','y','220300000000',0),(1307,'220382000000','双辽市','county','1','y','220300000000',0),(1308,'220403000000','西安区','county','1','y','220400000000',0),(1309,'220421000000','东丰县','county','1','y','220400000000',0),(1310,'220422000000','东辽县','county','1','y','220400000000',0),(1311,'220503000000','二道江区','county','1','y','220500000000',0),(1312,'220521000000','通化县','county','1','y','220500000000',0),(1313,'220523000000','辉南县','county','1','y','220500000000',0),(1314,'220524000000','柳河县','county','1','y','220500000000',0),(1315,'220581000000','梅河口市','county','1','y','220500000000',0),(1316,'220582000000','集安市','county','1','y','220500000000',0),(1317,'220605000000','江源区','county','1','y','220600000000',0),(1318,'220621000000','抚松县','county','1','y','220600000000',0),(1319,'220622000000','靖宇县','county','1','y','220600000000',0),(1320,'220623000000','长白朝鲜族自治县','county','1','y','220600000000',0),(1321,'220681000000','临江市','county','1','y','220600000000',0),(1322,'220721000000','前郭尔罗斯蒙古族自治县','county','1','y','220700000000',0),(1323,'220722000000','长岭县','county','1','y','220700000000',0),(1324,'220723000000','乾安县','county','1','y','220700000000',0),(1325,'220724000000','扶余县','county','1','y','220700000000',0),(1326,'220821000000','镇赉县','county','1','y','220800000000',0),(1327,'220822000000','通榆县','county','1','y','220800000000',0),(1328,'220881000000','洮南市','county','1','y','220800000000',0),(1329,'220882000000','大安市','county','1','y','220800000000',0),(1330,'222402000000','图们市','county','1','y','222400000000',0),(1331,'222403000000','敦化市','county','1','y','222400000000',0),(1332,'222404000000','珲春市','county','1','y','222400000000',0),(1333,'222405000000','龙井市','county','1','y','222400000000',0),(1334,'222406000000','和龙市','county','1','y','222400000000',0),(1335,'222424000000','汪清县','county','1','y','222400000000',0),(1336,'222426000000','安图县','county','1','y','222400000000',0),(1337,'230103000000','南岗区','county','1','y','230100000000',0),(1338,'230104000000','道外区','county','1','y','230100000000',0),(1339,'230108000000','平房区','county','1','y','230100000000',0),(1340,'230109000000','松北区','county','1','y','230100000000',0),(1341,'230110000000','香坊区','county','1','y','230100000000',0),(1342,'230111000000','呼兰区','county','1','y','230100000000',0),(1343,'230112000000','阿城区','county','1','y','230100000000',0),(1344,'230123000000','依兰县','county','1','y','230100000000',0),(1345,'230124000000','方正县','county','1','y','230100000000',0),(1346,'230125000000','宾县','county','1','y','230100000000',0),(1347,'230126000000','巴彦县','county','1','y','230100000000',0),(1348,'230127000000','木兰县','county','1','y','230100000000',0),(1349,'230128000000','通河县','county','1','y','230100000000',0),(1350,'230129000000','延寿县','county','1','y','230100000000',0),(1351,'230182000000','双城市','county','1','y','230100000000',0),(1352,'230183000000','尚志市','county','1','y','230100000000',0),(1353,'230184000000','五常市','county','1','y','230100000000',0),(1354,'230203000000','建华区','county','1','y','230200000000',0),(1355,'230204000000','铁锋区','county','1','y','230200000000',0),(1356,'230205000000','昂昂溪区','county','1','y','230200000000',0),(1357,'230206000000','富拉尔基区','county','1','y','230200000000',0),(1358,'230207000000','碾子山区','county','1','y','230200000000',0),(1359,'230208000000','梅里斯达斡尔族区','county','1','y','230200000000',0),(1360,'230221000000','龙江县','county','1','y','230200000000',0),(1361,'230223000000','依安县','county','1','y','230200000000',0),(1362,'230224000000','泰来县','county','1','y','230200000000',0),(1363,'230225000000','甘南县','county','1','y','230200000000',0),(1364,'230227000000','富裕县','county','1','y','230200000000',0),(1365,'230229000000','克山县','county','1','y','230200000000',0),(1366,'230230000000','克东县','county','1','y','230200000000',0),(1367,'230231000000','拜泉县','county','1','y','230200000000',0),(1368,'230281000000','讷河市','county','1','y','230200000000',0),(1369,'230303000000','恒山区','county','1','y','230300000000',0),(1370,'230304000000','滴道区','county','1','y','230300000000',0),(1371,'230305000000','梨树区','county','1','y','230300000000',0),(1372,'230306000000','城子河区','county','1','y','230300000000',0),(1373,'230307000000','麻山区','county','1','y','230300000000',0),(1374,'230321000000','鸡东县','county','1','y','230300000000',0),(1375,'230381000000','虎林市','county','1','y','230300000000',0),(1376,'230382000000','密山市','county','1','y','230300000000',0),(1377,'230403000000','工农区','county','1','y','230400000000',0),(1378,'230404000000','南山区','county','1','y','230400000000',0),(1379,'230405000000','兴安区','county','1','y','230400000000',0),(1380,'230406000000','东山区','county','1','y','230400000000',0),(1381,'230407000000','兴山区','county','1','y','230400000000',0),(1382,'230421000000','萝北县','county','1','y','230400000000',0),(1383,'230422000000','绥滨县','county','1','y','230400000000',0),(1384,'230503000000','岭东区','county','1','y','230500000000',0),(1385,'230505000000','四方台区','county','1','y','230500000000',0),(1386,'230506000000','宝山区','county','1','y','230500000000',0),(1387,'230521000000','集贤县','county','1','y','230500000000',0),(1388,'230522000000','友谊县','county','1','y','230500000000',0),(1389,'230523000000','宝清县','county','1','y','230500000000',0),(1390,'230524000000','饶河县','county','1','y','230500000000',0),(1391,'230603000000','龙凤区','county','1','y','230600000000',0),(1392,'230604000000','让胡路区','county','1','y','230600000000',0),(1393,'230605000000','红岗区','county','1','y','230600000000',0),(1394,'230606000000','大同区','county','1','y','230600000000',0),(1395,'230621000000','肇州县','county','1','y','230600000000',0),(1396,'230622000000','肇源县','county','1','y','230600000000',0),(1397,'230623000000','林甸县','county','1','y','230600000000',0),(1398,'230624000000','杜尔伯特蒙古族自治县','county','1','y','230600000000',0),(1399,'230703000000','南岔区','county','1','y','230700000000',0),(1400,'230704000000','友好区','county','1','y','230700000000',0),(1401,'230705000000','西林区','county','1','y','230700000000',0),(1402,'230706000000','翠峦区','county','1','y','230700000000',0),(1403,'230707000000','新青区','county','1','y','230700000000',0),(1404,'230708000000','美溪区','county','1','y','230700000000',0),(1405,'230709000000','金山屯区','county','1','y','230700000000',0),(1406,'230710000000','五营区','county','1','y','230700000000',0),(1407,'230711000000','乌马河区','county','1','y','230700000000',0),(1408,'230712000000','汤旺河区','county','1','y','230700000000',0),(1409,'230713000000','带岭区','county','1','y','230700000000',0),(1410,'230714000000','乌伊岭区','county','1','y','230700000000',0),(1411,'230715000000','红星区','county','1','y','230700000000',0),(1412,'230716000000','上甘岭区','county','1','y','230700000000',0),(1413,'230722000000','嘉荫县','county','1','y','230700000000',0),(1414,'230781000000','铁力市','county','1','y','230700000000',0),(1415,'230804000000','前进区','county','1','y','230800000000',0),(1416,'230805000000','东风区','county','1','y','230800000000',0),(1417,'230811000000','郊区','county','1','y','230800000000',0),(1418,'230822000000','桦南县','county','1','y','230800000000',0),(1419,'230826000000','桦川县','county','1','y','230800000000',0),(1420,'230828000000','汤原县','county','1','y','230800000000',0),(1421,'230833000000','抚远县','county','1','y','230800000000',0),(1422,'230881000000','同江市','county','1','y','230800000000',0),(1423,'230882000000','富锦市','county','1','y','230800000000',0),(1424,'230903000000','桃山区','county','1','y','230900000000',0),(1425,'230904000000','茄子河区','county','1','y','230900000000',0),(1426,'230921000000','勃利县','county','1','y','230900000000',0),(1427,'231003000000','阳明区','county','1','y','231000000000',0),(1428,'231004000000','爱民区','county','1','y','231000000000',0),(1429,'231005000000','西安区','county','1','y','231000000000',0),(1430,'231024000000','东宁县','county','1','y','231000000000',0),(1431,'231025000000','林口县','county','1','y','231000000000',0),(1432,'231081000000','绥芬河市','county','1','y','231000000000',0),(1433,'231083000000','海林市','county','1','y','231000000000',0),(1434,'231084000000','宁安市','county','1','y','231000000000',0),(1435,'231085000000','穆棱市','county','1','y','231000000000',0),(1436,'231121000000','嫩江县','county','1','y','231100000000',0),(1437,'231123000000','逊克县','county','1','y','231100000000',0),(1438,'231124000000','孙吴县','county','1','y','231100000000',0),(1439,'231181000000','北安市','county','1','y','231100000000',0),(1440,'231182000000','五大连池市','county','1','y','231100000000',0),(1441,'231221000000','望奎县','county','1','y','231200000000',0),(1442,'231222000000','兰西县','county','1','y','231200000000',0),(1443,'231223000000','青冈县','county','1','y','231200000000',0),(1444,'231224000000','庆安县','county','1','y','231200000000',0),(1445,'231225000000','明水县','county','1','y','231200000000',0),(1446,'231226000000','绥棱县','county','1','y','231200000000',0),(1447,'231281000000','安达市','county','1','y','231200000000',0),(1448,'231282000000','肇东市','county','1','y','231200000000',0),(1449,'231283000000','海伦市','county','1','y','231200000000',0),(1450,'232702000000','松岭区','county','1','y','232700000000',0),(1451,'232703000000','新林区','county','1','y','232700000000',0),(1452,'232704000000','呼中区','county','1','y','232700000000',0),(1453,'232721000000','呼玛县','county','1','y','232700000000',0),(1454,'232722000000','塔河县','county','1','y','232700000000',0),(1455,'232723000000','漠河县','county','1','y','232700000000',0),(1456,'310104000000','徐汇区','county','1','y','31',0),(1457,'310105000000','长宁区','county','1','y','31',0),(1458,'310106000000','静安区','county','1','y','31',0),(1459,'310107000000','普陀区','county','1','y','31',0),(1460,'310108000000','闸北区','county','1','y','31',0),(1461,'310109000000','虹口区','county','1','y','31',0),(1462,'310110000000','杨浦区','county','1','y','31',0),(1463,'310112000000','闵行区','county','1','y','31',0),(1464,'310113000000','宝山区','county','1','y','31',0),(1465,'310114000000','嘉定区','county','1','y','31',0),(1466,'310115000000','浦东新区','county','1','y','31',0),(1467,'310116000000','金山区','county','1','y','31',0),(1468,'310117000000','松江区','county','1','y','31',0),(1469,'310118000000','青浦区','county','1','y','31',0),(1470,'310120000000','奉贤区','county','1','y','31',0),(1471,'320103000000','白下区','county','1','y','320100000000',0),(1472,'320104000000','秦淮区','county','1','y','320100000000',0),(1473,'320105000000','建邺区','county','1','y','320100000000',0),(1474,'320106000000','鼓楼区','county','1','y','320100000000',0),(1475,'320107000000','下关区','county','1','y','320100000000',0),(1476,'320111000000','浦口区','county','1','y','320100000000',0),(1477,'320113000000','栖霞区','county','1','y','320100000000',0),(1478,'320114000000','雨花台区','county','1','y','320100000000',0),(1479,'320115000000','江宁区','county','1','y','320100000000',0),(1480,'320116000000','六合区','county','1','y','320100000000',0),(1481,'320124000000','溧水县','county','1','y','320100000000',0),(1482,'320125000000','高淳县','county','1','y','320100000000',0),(1483,'320203000000','南长区','county','1','y','320200000000',0),(1484,'320204000000','北塘区','county','1','y','320200000000',0),(1485,'320205000000','锡山区','county','1','y','320200000000',0),(1486,'320206000000','惠山区','county','1','y','320200000000',0),(1487,'320211000000','滨湖区','county','1','y','320200000000',0),(1488,'320281000000','江阴市','county','1','y','320200000000',0),(1489,'320282000000','宜兴市','county','1','y','320200000000',0),(1490,'320303000000','云龙区','county','1','y','320300000000',0),(1491,'320305000000','贾汪区','county','1','y','320300000000',0),(1492,'320311000000','泉山区','county','1','y','320300000000',0),(1493,'320312000000','铜山区','county','1','y','320300000000',0),(1494,'320321000000','丰县','county','1','y','320300000000',0),(1495,'320322000000','沛县','county','1','y','320300000000',0),(1496,'320324000000','睢宁县','county','1','y','320300000000',0),(1497,'320381000000','新沂市','county','1','y','320300000000',0),(1498,'320382000000','邳州市','county','1','y','320300000000',0),(1499,'320404000000','钟楼区','county','1','y','320400000000',0),(1500,'320405000000','戚墅堰区','county','1','y','320400000000',0),(1501,'320411000000','新北区','county','1','y','320400000000',0),(1502,'320412000000','武进区','county','1','y','320400000000',0),(1503,'320481000000','溧阳市','county','1','y','320400000000',0),(1504,'320482000000','金坛市','county','1','y','320400000000',0),(1505,'320503000000','平江区','county','1','y','320500000000',0),(1506,'320504000000','金阊区','county','1','y','320500000000',0),(1507,'320505000000','虎丘区','county','1','y','320500000000',0),(1508,'320506000000','吴中区','county','1','y','320500000000',0),(1509,'320507000000','相城区','county','1','y','320500000000',0),(1510,'320581000000','常熟市','county','1','y','320500000000',0),(1511,'320582000000','张家港市','county','1','y','320500000000',0),(1512,'320583000000','昆山市','county','1','y','320500000000',0),(1513,'320584000000','吴江市','county','1','y','320500000000',0),(1514,'320585000000','太仓市','county','1','y','320500000000',0),(1515,'320611000000','港闸区','county','1','y','320600000000',0),(1516,'320612000000','通州区','county','1','y','320600000000',0),(1517,'320621000000','海安县','county','1','y','320600000000',0),(1518,'320623000000','如东县','county','1','y','320600000000',0),(1519,'320681000000','启东市','county','1','y','320600000000',0),(1520,'320682000000','如皋市','county','1','y','320600000000',0),(1521,'320684000000','海门市','county','1','y','320600000000',0),(1522,'320705000000','新浦区','county','1','y','320700000000',0),(1523,'320706000000','海州区','county','1','y','320700000000',0),(1524,'320721000000','赣榆县','county','1','y','320700000000',0),(1525,'320722000000','东海县','county','1','y','320700000000',0),(1526,'320723000000','灌云县','county','1','y','320700000000',0),(1527,'320724000000','灌南县','county','1','y','320700000000',0),(1528,'320803000000','楚州区','county','1','y','320800000000',0),(1529,'320804000000','淮阴区','county','1','y','320800000000',0),(1530,'320811000000','清浦区','county','1','y','320800000000',0),(1531,'320826000000','涟水县','county','1','y','320800000000',0),(1532,'320829000000','洪泽县','county','1','y','320800000000',0),(1533,'320830000000','盱眙县','county','1','y','320800000000',0),(1534,'320831000000','金湖县','county','1','y','320800000000',0),(1535,'320903000000','盐都区','county','1','y','320900000000',0),(1536,'320921000000','响水县','county','1','y','320900000000',0),(1537,'320922000000','滨海县','county','1','y','320900000000',0),(1538,'320923000000','阜宁县','county','1','y','320900000000',0),(1539,'320924000000','射阳县','county','1','y','320900000000',0),(1540,'320925000000','建湖县','county','1','y','320900000000',0),(1541,'320981000000','东台市','county','1','y','320900000000',0),(1542,'320982000000','大丰市','county','1','y','320900000000',0),(1543,'321003000000','邗江区','county','1','y','321000000000',0),(1544,'321012000000','江都区','county','1','y','321000000000',0),(1545,'321023000000','宝应县','county','1','y','321000000000',0),(1546,'321081000000','仪征市','county','1','y','321000000000',0),(1547,'321084000000','高邮市','county','1','y','321000000000',0),(1548,'321111000000','润州区','county','1','y','321100000000',0),(1549,'321112000000','丹徒区','county','1','y','321100000000',0),(1550,'321181000000','丹阳市','county','1','y','321100000000',0),(1551,'321182000000','扬中市','county','1','y','321100000000',0),(1552,'321183000000','句容市','county','1','y','321100000000',0),(1553,'321203000000','高港区','county','1','y','321200000000',0),(1554,'321281000000','兴化市','county','1','y','321200000000',0),(1555,'321282000000','靖江市','county','1','y','321200000000',0),(1556,'321283000000','泰兴市','county','1','y','321200000000',0),(1557,'321284000000','姜堰市','county','1','y','321200000000',0),(1558,'321311000000','宿豫区','county','1','y','321300000000',0),(1559,'321322000000','沭阳县','county','1','y','321300000000',0),(1560,'321323000000','泗阳县','county','1','y','321300000000',0),(1561,'321324000000','泗洪县','county','1','y','321300000000',0),(1562,'330103000000','下城区','county','1','y','330100000000',0),(1563,'330104000000','江干区','county','1','y','330100000000',0),(1564,'330105000000','拱墅区','county','1','y','330100000000',0),(1565,'330106000000','西湖区','county','1','y','330100000000',0),(1566,'330108000000','滨江区','county','1','y','330100000000',0),(1567,'330109000000','萧山区','county','1','y','330100000000',0),(1568,'330110000000','余杭区','county','1','y','330100000000',0),(1569,'330122000000','桐庐县','county','1','y','330100000000',0),(1570,'330127000000','淳安县','county','1','y','330100000000',0),(1571,'330182000000','建德市','county','1','y','330100000000',0),(1572,'330183000000','富阳市','county','1','y','330100000000',0),(1573,'330185000000','临安市','county','1','y','330100000000',0),(1574,'330204000000','江东区','county','1','y','330200000000',0),(1575,'330205000000','江北区','county','1','y','330200000000',0),(1576,'330206000000','北仑区','county','1','y','330200000000',0),(1577,'330211000000','镇海区','county','1','y','330200000000',0),(1578,'330212000000','鄞州区','county','1','y','330200000000',0),(1579,'330225000000','象山县','county','1','y','330200000000',0),(1580,'330226000000','宁海县','county','1','y','330200000000',0),(1581,'330281000000','余姚市','county','1','y','330200000000',0),(1582,'330282000000','慈溪市','county','1','y','330200000000',0),(1583,'330283000000','奉化市','county','1','y','330200000000',0),(1584,'330303000000','龙湾区','county','1','y','330300000000',0),(1585,'330304000000','瓯海区','county','1','y','330300000000',0),(1586,'330322000000','洞头县','county','1','y','330300000000',0),(1587,'330324000000','永嘉县','county','1','y','330300000000',0),(1588,'330326000000','平阳县','county','1','y','330300000000',0),(1589,'330327000000','苍南县','county','1','y','330300000000',0),(1590,'330328000000','文成县','county','1','y','330300000000',0),(1591,'330329000000','泰顺县','county','1','y','330300000000',0),(1592,'330381000000','瑞安市','county','1','y','330300000000',0),(1593,'330382000000','乐清市','county','1','y','330300000000',0),(1594,'330411000000','秀洲区','county','1','y','330400000000',0),(1595,'330421000000','嘉善县','county','1','y','330400000000',0),(1596,'330424000000','海盐县','county','1','y','330400000000',0),(1597,'330481000000','海宁市','county','1','y','330400000000',0),(1598,'330482000000','平湖市','county','1','y','330400000000',0),(1599,'330483000000','桐乡市','county','1','y','330400000000',0),(1600,'330503000000','南浔区','county','1','y','330500000000',0),(1601,'330521000000','德清县','county','1','y','330500000000',0),(1602,'330522000000','长兴县','county','1','y','330500000000',0),(1603,'330523000000','安吉县','county','1','y','330500000000',0),(1604,'330621000000','绍兴县','county','1','y','330600000000',0),(1605,'330624000000','新昌县','county','1','y','330600000000',0),(1606,'330681000000','诸暨市','county','1','y','330600000000',0),(1607,'330682000000','上虞市','county','1','y','330600000000',0),(1608,'330683000000','嵊州市','county','1','y','330600000000',0),(1609,'330703000000','金东区','county','1','y','330700000000',0),(1610,'330723000000','武义县','county','1','y','330700000000',0),(1611,'330726000000','浦江县','county','1','y','330700000000',0),(1612,'330727000000','磐安县','county','1','y','330700000000',0),(1613,'330781000000','兰溪市','county','1','y','330700000000',0),(1614,'330782000000','义乌市','county','1','y','330700000000',0),(1615,'330783000000','东阳市','county','1','y','330700000000',0),(1616,'330784000000','永康市','county','1','y','330700000000',0),(1617,'330803000000','衢江区','county','1','y','330800000000',0),(1618,'330822000000','常山县','county','1','y','330800000000',0),(1619,'330824000000','开化县','county','1','y','330800000000',0),(1620,'330825000000','龙游县','county','1','y','330800000000',0),(1621,'330881000000','江山市','county','1','y','330800000000',0),(1622,'330903000000','普陀区','county','1','y','330900000000',0),(1623,'330921000000','岱山县','county','1','y','330900000000',0),(1624,'330922000000','嵊泗县','county','1','y','330900000000',0),(1625,'331003000000','黄岩区','county','1','y','331000000000',0),(1626,'331004000000','路桥区','county','1','y','331000000000',0),(1627,'331021000000','玉环县','county','1','y','331000000000',0),(1628,'331022000000','三门县','county','1','y','331000000000',0),(1629,'331023000000','天台县','county','1','y','331000000000',0),(1630,'331024000000','仙居县','county','1','y','331000000000',0),(1631,'331081000000','温岭市','county','1','y','331000000000',0),(1632,'331082000000','临海市','county','1','y','331000000000',0),(1633,'331121000000','青田县','county','1','y','331100000000',0),(1634,'331122000000','缙云县','county','1','y','331100000000',0),(1635,'331123000000','遂昌县','county','1','y','331100000000',0),(1636,'331124000000','松阳县','county','1','y','331100000000',0),(1637,'331125000000','云和县','county','1','y','331100000000',0),(1638,'331126000000','庆元县','county','1','y','331100000000',0),(1639,'331127000000','景宁畲族自治县','county','1','y','331100000000',0),(1640,'331181000000','龙泉市','county','1','y','331100000000',0),(1641,'340103000000','庐阳区','county','1','y','340100000000',0),(1642,'340104000000','蜀山区','county','1','y','340100000000',0),(1643,'340111000000','包河区','county','1','y','340100000000',0),(1644,'340121000000','长丰县','county','1','y','340100000000',0),(1645,'340122000000','肥东县','county','1','y','340100000000',0),(1646,'340123000000','肥西县','county','1','y','340100000000',0),(1647,'340124000000','庐江县','county','1','y','340100000000',0),(1648,'340181000000','巢湖市','county','1','y','340100000000',0),(1649,'340203000000','弋江区','county','1','y','340200000000',0),(1650,'340207000000','鸠江区','county','1','y','340200000000',0),(1651,'340208000000','三山区','county','1','y','340200000000',0),(1652,'340221000000','芜湖县','county','1','y','340200000000',0),(1653,'340222000000','繁昌县','county','1','y','340200000000',0),(1654,'340223000000','南陵县','county','1','y','340200000000',0),(1655,'340225000000','无为县','county','1','y','340200000000',0),(1656,'340303000000','蚌山区','county','1','y','340300000000',0),(1657,'340304000000','禹会区','county','1','y','340300000000',0),(1658,'340311000000','淮上区','county','1','y','340300000000',0),(1659,'340321000000','怀远县','county','1','y','340300000000',0),(1660,'340322000000','五河县','county','1','y','340300000000',0),(1661,'340323000000','固镇县','county','1','y','340300000000',0),(1662,'340403000000','田家庵区','county','1','y','340400000000',0),(1663,'340404000000','谢家集区','county','1','y','340400000000',0),(1664,'340405000000','八公山区','county','1','y','340400000000',0),(1665,'340406000000','潘集区','county','1','y','340400000000',0),(1666,'340421000000','凤台县','county','1','y','340400000000',0),(1667,'340503000000','花山区','county','1','y','340500000000',0),(1668,'340504000000','雨山区','county','1','y','340500000000',0),(1669,'340521000000','当涂县','county','1','y','340500000000',0),(1670,'340522000000','含山县','county','1','y','340500000000',0),(1671,'340523000000','和县','county','1','y','340500000000',0),(1672,'340603000000','相山区','county','1','y','340600000000',0),(1673,'340604000000','烈山区','county','1','y','340600000000',0),(1674,'340621000000','濉溪县','county','1','y','340600000000',0),(1675,'340703000000','狮子山区','county','1','y','340700000000',0),(1676,'340711000000','郊区','county','1','y','340700000000',0),(1677,'340721000000','铜陵县','county','1','y','340700000000',0),(1678,'340803000000','大观区','county','1','y','340800000000',0),(1679,'340811000000','宜秀区','county','1','y','340800000000',0),(1680,'340822000000','怀宁县','county','1','y','340800000000',0),(1681,'340823000000','枞阳县','county','1','y','340800000000',0),(1682,'340824000000','潜山县','county','1','y','340800000000',0),(1683,'340825000000','太湖县','county','1','y','340800000000',0),(1684,'340826000000','宿松县','county','1','y','340800000000',0),(1685,'340827000000','望江县','county','1','y','340800000000',0),(1686,'340828000000','岳西县','county','1','y','340800000000',0),(1687,'340881000000','桐城市','county','1','y','340800000000',0),(1688,'341003000000','黄山区','county','1','y','341000000000',0),(1689,'341004000000','徽州区','county','1','y','341000000000',0),(1690,'341021000000','歙县','county','1','y','341000000000',0),(1691,'341022000000','休宁县','county','1','y','341000000000',0),(1692,'341023000000','黟县','county','1','y','341000000000',0),(1693,'341024000000','祁门县','county','1','y','341000000000',0),(1694,'341103000000','南谯区','county','1','y','341100000000',0),(1695,'341122000000','来安县','county','1','y','341100000000',0),(1696,'341124000000','全椒县','county','1','y','341100000000',0),(1697,'341125000000','定远县','county','1','y','341100000000',0),(1698,'341126000000','凤阳县','county','1','y','341100000000',0),(1699,'341181000000','天长市','county','1','y','341100000000',0),(1700,'341182000000','明光市','county','1','y','341100000000',0),(1701,'341203000000','颍东区','county','1','y','341200000000',0),(1702,'341204000000','颍泉区','county','1','y','341200000000',0),(1703,'341221000000','临泉县','county','1','y','341200000000',0),(1704,'341222000000','太和县','county','1','y','341200000000',0),(1705,'341225000000','阜南县','county','1','y','341200000000',0),(1706,'341226000000','颍上县','county','1','y','341200000000',0),(1707,'341282000000','界首市','county','1','y','341200000000',0),(1708,'341321000000','砀山县','county','1','y','341300000000',0),(1709,'341322000000','萧县','county','1','y','341300000000',0),(1710,'341323000000','灵璧县','county','1','y','341300000000',0),(1711,'341324000000','泗县','county','1','y','341300000000',0),(1712,'341503000000','裕安区','county','1','y','341500000000',0),(1713,'341521000000','寿县','county','1','y','341500000000',0),(1714,'341522000000','霍邱县','county','1','y','341500000000',0),(1715,'341523000000','舒城县','county','1','y','341500000000',0),(1716,'341524000000','金寨县','county','1','y','341500000000',0),(1717,'341525000000','霍山县','county','1','y','341500000000',0),(1718,'341621000000','涡阳县','county','1','y','341600000000',0),(1719,'341622000000','蒙城县','county','1','y','341600000000',0),(1720,'341623000000','利辛县','county','1','y','341600000000',0),(1721,'341721000000','东至县','county','1','y','341700000000',0),(1722,'341722000000','石台县','county','1','y','341700000000',0),(1723,'341723000000','青阳县','county','1','y','341700000000',0),(1724,'341821000000','郎溪县','county','1','y','341800000000',0),(1725,'341822000000','广德县','county','1','y','341800000000',0),(1726,'341823000000','泾县','county','1','y','341800000000',0),(1727,'341824000000','绩溪县','county','1','y','341800000000',0),(1728,'341825000000','旌德县','county','1','y','341800000000',0),(1729,'341881000000','宁国市','county','1','y','341800000000',0),(1730,'350103000000','台江区','county','1','y','350100000000',0),(1731,'350104000000','仓山区','county','1','y','350100000000',0),(1732,'350105000000','马尾区','county','1','y','350100000000',0),(1733,'350111000000','晋安区','county','1','y','350100000000',0),(1734,'350121000000','闽侯县','county','1','y','350100000000',0),(1735,'350122000000','连江县','county','1','y','350100000000',0),(1736,'350123000000','罗源县','county','1','y','350100000000',0),(1737,'350124000000','闽清县','county','1','y','350100000000',0),(1738,'350125000000','永泰县','county','1','y','350100000000',0),(1739,'350128000000','平潭县','county','1','y','350100000000',0),(1740,'350181000000','福清市','county','1','y','350100000000',0),(1741,'350182000000','长乐市','county','1','y','350100000000',0),(1742,'350205000000','海沧区','county','1','y','350200000000',0),(1743,'350206000000','湖里区','county','1','y','350200000000',0),(1744,'350211000000','集美区','county','1','y','350200000000',0),(1745,'350212000000','同安区','county','1','y','350200000000',0),(1746,'350213000000','翔安区','county','1','y','350200000000',0),(1747,'350303000000','涵江区','county','1','y','350300000000',0),(1748,'350304000000','荔城区','county','1','y','350300000000',0),(1749,'350305000000','秀屿区','county','1','y','350300000000',0),(1750,'350322000000','仙游县','county','1','y','350300000000',0),(1751,'350403000000','三元区','county','1','y','350400000000',0),(1752,'350421000000','明溪县','county','1','y','350400000000',0),(1753,'350423000000','清流县','county','1','y','350400000000',0),(1754,'350424000000','宁化县','county','1','y','350400000000',0),(1755,'350425000000','大田县','county','1','y','350400000000',0),(1756,'350426000000','尤溪县','county','1','y','350400000000',0),(1757,'350427000000','沙县','county','1','y','350400000000',0),(1758,'350428000000','将乐县','county','1','y','350400000000',0),(1759,'350429000000','泰宁县','county','1','y','350400000000',0),(1760,'350430000000','建宁县','county','1','y','350400000000',0),(1761,'350481000000','永安市','county','1','y','350400000000',0),(1762,'350503000000','丰泽区','county','1','y','350500000000',0),(1763,'350504000000','洛江区','county','1','y','350500000000',0),(1764,'350505000000','泉港区','county','1','y','350500000000',0),(1765,'350521000000','惠安县','county','1','y','350500000000',0),(1766,'350524000000','安溪县','county','1','y','350500000000',0),(1767,'350525000000','永春县','county','1','y','350500000000',0),(1768,'350526000000','德化县','county','1','y','350500000000',0),(1769,'350527000000','金门县','county','1','y','350500000000',0),(1770,'350581000000','石狮市','county','1','y','350500000000',0),(1771,'350582000000','晋江市','county','1','y','350500000000',0),(1772,'350583000000','南安市','county','1','y','350500000000',0),(1773,'350603000000','龙文区','county','1','y','350600000000',0),(1774,'350622000000','云霄县','county','1','y','350600000000',0),(1775,'350623000000','漳浦县','county','1','y','350600000000',0),(1776,'350624000000','诏安县','county','1','y','350600000000',0),(1777,'350625000000','长泰县','county','1','y','350600000000',0),(1778,'350626000000','东山县','county','1','y','350600000000',0),(1779,'350627000000','南靖县','county','1','y','350600000000',0),(1780,'350628000000','平和县','county','1','y','350600000000',0),(1781,'350629000000','华安县','county','1','y','350600000000',0),(1782,'350681000000','龙海市','county','1','y','350600000000',0),(1783,'350721000000','顺昌县','county','1','y','350700000000',0),(1784,'350722000000','浦城县','county','1','y','350700000000',0),(1785,'350723000000','光泽县','county','1','y','350700000000',0),(1786,'350724000000','松溪县','county','1','y','350700000000',0),(1787,'350725000000','政和县','county','1','y','350700000000',0),(1788,'350781000000','邵武市','county','1','y','350700000000',0),(1789,'350782000000','武夷山市','county','1','y','350700000000',0),(1790,'350783000000','建瓯市','county','1','y','350700000000',0),(1791,'350784000000','建阳市','county','1','y','350700000000',0),(1792,'350821000000','长汀县','county','1','y','350800000000',0),(1793,'350822000000','永定县','county','1','y','350800000000',0),(1794,'350823000000','上杭县','county','1','y','350800000000',0),(1795,'350824000000','武平县','county','1','y','350800000000',0),(1796,'350825000000','连城县','county','1','y','350800000000',0),(1797,'350881000000','漳平市','county','1','y','350800000000',0),(1798,'350921000000','霞浦县','county','1','y','350900000000',0),(1799,'350922000000','古田县','county','1','y','350900000000',0),(1800,'350923000000','屏南县','county','1','y','350900000000',0),(1801,'350924000000','寿宁县','county','1','y','350900000000',0),(1802,'350925000000','周宁县','county','1','y','350900000000',0),(1803,'350926000000','柘荣县','county','1','y','350900000000',0),(1804,'350981000000','福安市','county','1','y','350900000000',0),(1805,'350982000000','福鼎市','county','1','y','350900000000',0),(1806,'360103000000','西湖区','county','1','y','360100000000',0),(1807,'360104000000','青云谱区','county','1','y','360100000000',0),(1808,'360105000000','湾里区','county','1','y','360100000000',0),(1809,'360111000000','青山湖区','county','1','y','360100000000',0),(1810,'360121000000','南昌县','county','1','y','360100000000',0),(1811,'360122000000','新建县','county','1','y','360100000000',0),(1812,'360123000000','安义县','county','1','y','360100000000',0),(1813,'360124000000','进贤县','county','1','y','360100000000',0),(1814,'360203000000','珠山区','county','1','y','360200000000',0),(1815,'360222000000','浮梁县','county','1','y','360200000000',0),(1816,'360281000000','乐平市','county','1','y','360200000000',0),(1817,'360313000000','湘东区','county','1','y','360300000000',0),(1818,'360321000000','莲花县','county','1','y','360300000000',0),(1819,'360322000000','上栗县','county','1','y','360300000000',0),(1820,'360323000000','芦溪县','county','1','y','360300000000',0),(1821,'360403000000','浔阳区','county','1','y','360400000000',0),(1822,'360421000000','九江县','county','1','y','360400000000',0),(1823,'360423000000','武宁县','county','1','y','360400000000',0),(1824,'360424000000','修水县','county','1','y','360400000000',0),(1825,'360425000000','永修县','county','1','y','360400000000',0),(1826,'360426000000','德安县','county','1','y','360400000000',0),(1827,'360427000000','星子县','county','1','y','360400000000',0),(1828,'360428000000','都昌县','county','1','y','360400000000',0),(1829,'360429000000','湖口县','county','1','y','360400000000',0),(1830,'360430000000','彭泽县','county','1','y','360400000000',0),(1831,'360481000000','瑞昌市','county','1','y','360400000000',0),(1832,'360482000000','共青城市','county','1','y','360400000000',0),(1833,'360521000000','分宜县','county','1','y','360500000000',0),(1834,'360622000000','余江县','county','1','y','360600000000',0),(1835,'360681000000','贵溪市','county','1','y','360600000000',0),(1836,'360721000000','赣县','county','1','y','360700000000',0),(1837,'360722000000','信丰县','county','1','y','360700000000',0),(1838,'360723000000','大余县','county','1','y','360700000000',0),(1839,'360724000000','上犹县','county','1','y','360700000000',0),(1840,'360725000000','崇义县','county','1','y','360700000000',0),(1841,'360726000000','安远县','county','1','y','360700000000',0),(1842,'360727000000','龙南县','county','1','y','360700000000',0),(1843,'360728000000','定南县','county','1','y','360700000000',0),(1844,'360729000000','全南县','county','1','y','360700000000',0),(1845,'360730000000','宁都县','county','1','y','360700000000',0),(1846,'360731000000','于都县','county','1','y','360700000000',0),(1847,'360732000000','兴国县','county','1','y','360700000000',0),(1848,'360733000000','会昌县','county','1','y','360700000000',0),(1849,'360734000000','寻乌县','county','1','y','360700000000',0),(1850,'360735000000','石城县','county','1','y','360700000000',0),(1851,'360781000000','瑞金市','county','1','y','360700000000',0),(1852,'360782000000','南康市','county','1','y','360700000000',0),(1853,'360803000000','青原区','county','1','y','360800000000',0),(1854,'360821000000','吉安县','county','1','y','360800000000',0),(1855,'360822000000','吉水县','county','1','y','360800000000',0),(1856,'360823000000','峡江县','county','1','y','360800000000',0),(1857,'360824000000','新干县','county','1','y','360800000000',0),(1858,'360825000000','永丰县','county','1','y','360800000000',0),(1859,'360826000000','泰和县','county','1','y','360800000000',0),(1860,'360827000000','遂川县','county','1','y','360800000000',0),(1861,'360828000000','万安县','county','1','y','360800000000',0),(1862,'360829000000','安福县','county','1','y','360800000000',0),(1863,'360830000000','永新县','county','1','y','360800000000',0),(1864,'360881000000','井冈山市','county','1','y','360800000000',0),(1865,'360921000000','奉新县','county','1','y','360900000000',0),(1866,'360922000000','万载县','county','1','y','360900000000',0),(1867,'360923000000','上高县','county','1','y','360900000000',0),(1868,'360924000000','宜丰县','county','1','y','360900000000',0),(1869,'360925000000','靖安县','county','1','y','360900000000',0),(1870,'360926000000','铜鼓县','county','1','y','360900000000',0),(1871,'360981000000','丰城市','county','1','y','360900000000',0),(1872,'360982000000','樟树市','county','1','y','360900000000',0),(1873,'360983000000','高安市','county','1','y','360900000000',0),(1874,'361021000000','南城县','county','1','y','361000000000',0),(1875,'361022000000','黎川县','county','1','y','361000000000',0),(1876,'361023000000','南丰县','county','1','y','361000000000',0),(1877,'361024000000','崇仁县','county','1','y','361000000000',0),(1878,'361025000000','乐安县','county','1','y','361000000000',0),(1879,'361026000000','宜黄县','county','1','y','361000000000',0),(1880,'361027000000','金溪县','county','1','y','361000000000',0),(1881,'361028000000','资溪县','county','1','y','361000000000',0),(1882,'361029000000','东乡县','county','1','y','361000000000',0),(1883,'361030000000','广昌县','county','1','y','361000000000',0),(1884,'361121000000','上饶县','county','1','y','361100000000',0),(1885,'361122000000','广丰县','county','1','y','361100000000',0),(1886,'361123000000','玉山县','county','1','y','361100000000',0),(1887,'361124000000','铅山县','county','1','y','361100000000',0),(1888,'361125000000','横峰县','county','1','y','361100000000',0),(1889,'361126000000','弋阳县','county','1','y','361100000000',0),(1890,'361127000000','余干县','county','1','y','361100000000',0),(1891,'361128000000','鄱阳县','county','1','y','361100000000',0),(1892,'361129000000','万年县','county','1','y','361100000000',0),(1893,'361130000000','婺源县','county','1','y','361100000000',0),(1894,'361181000000','德兴市','county','1','y','361100000000',0),(1895,'370103000000','市中区','county','1','y','370100000000',0),(1896,'370104000000','槐荫区','county','1','y','370100000000',0),(1897,'370105000000','天桥区','county','1','y','370100000000',0),(1898,'370112000000','历城区','county','1','y','370100000000',0),(1899,'370113000000','长清区','county','1','y','370100000000',0),(1900,'370124000000','平阴县','county','1','y','370100000000',0),(1901,'370125000000','济阳县','county','1','y','370100000000',0),(1902,'370126000000','商河县','county','1','y','370100000000',0),(1903,'370181000000','章丘市','county','1','y','370100000000',0),(1904,'370203000000','市北区','county','1','y','370200000000',0),(1905,'370205000000','四方区','county','1','y','370200000000',0),(1906,'370211000000','黄岛区','county','1','y','370200000000',0),(1907,'370212000000','崂山区','county','1','y','370200000000',0),(1908,'370213000000','李沧区','county','1','y','370200000000',0),(1909,'370214000000','城阳区','county','1','y','370200000000',0),(1910,'370281000000','胶州市','county','1','y','370200000000',0),(1911,'370282000000','即墨市','county','1','y','370200000000',0),(1912,'370283000000','平度市','county','1','y','370200000000',0),(1913,'370284000000','胶南市','county','1','y','370200000000',0),(1914,'370285000000','莱西市','county','1','y','370200000000',0),(1915,'370303000000','张店区','county','1','y','370300000000',0),(1916,'370304000000','博山区','county','1','y','370300000000',0),(1917,'370305000000','临淄区','county','1','y','370300000000',0),(1918,'370306000000','周村区','county','1','y','370300000000',0),(1919,'370321000000','桓台县','county','1','y','370300000000',0),(1920,'370322000000','高青县','county','1','y','370300000000',0),(1921,'370323000000','沂源县','county','1','y','370300000000',0),(1922,'370403000000','薛城区','county','1','y','370400000000',0),(1923,'370404000000','峄城区','county','1','y','370400000000',0),(1924,'370405000000','台儿庄区','county','1','y','370400000000',0),(1925,'370406000000','山亭区','county','1','y','370400000000',0),(1926,'370481000000','滕州市','county','1','y','370400000000',0),(1927,'370503000000','河口区','county','1','y','370500000000',0),(1928,'370521000000','垦利县','county','1','y','370500000000',0),(1929,'370522000000','利津县','county','1','y','370500000000',0),(1930,'370523000000','广饶县','county','1','y','370500000000',0),(1931,'370611000000','福山区','county','1','y','370600000000',0),(1932,'370612000000','牟平区','county','1','y','370600000000',0),(1933,'370613000000','莱山区','county','1','y','370600000000',0),(1934,'370634000000','长岛县','county','1','y','370600000000',0),(1935,'370681000000','龙口市','county','1','y','370600000000',0),(1936,'370682000000','莱阳市','county','1','y','370600000000',0),(1937,'370683000000','莱州市','county','1','y','370600000000',0),(1938,'370684000000','蓬莱市','county','1','y','370600000000',0),(1939,'370685000000','招远市','county','1','y','370600000000',0),(1940,'370686000000','栖霞市','county','1','y','370600000000',0),(1941,'370687000000','海阳市','county','1','y','370600000000',0),(1942,'370703000000','寒亭区','county','1','y','370700000000',0),(1943,'370704000000','坊子区','county','1','y','370700000000',0),(1944,'370705000000','奎文区','county','1','y','370700000000',0),(1945,'370724000000','临朐县','county','1','y','370700000000',0),(1946,'370725000000','昌乐县','county','1','y','370700000000',0),(1947,'370781000000','青州市','county','1','y','370700000000',0),(1948,'370782000000','诸城市','county','1','y','370700000000',0),(1949,'370783000000','寿光市','county','1','y','370700000000',0),(1950,'370784000000','安丘市','county','1','y','370700000000',0),(1951,'370785000000','高密市','county','1','y','370700000000',0),(1952,'370786000000','昌邑市','county','1','y','370700000000',0),(1953,'370811000000','任城区','county','1','y','370800000000',0),(1954,'370826000000','微山县','county','1','y','370800000000',0),(1955,'370827000000','鱼台县','county','1','y','370800000000',0),(1956,'370828000000','金乡县','county','1','y','370800000000',0),(1957,'370829000000','嘉祥县','county','1','y','370800000000',0),(1958,'370830000000','汶上县','county','1','y','370800000000',0),(1959,'370831000000','泗水县','county','1','y','370800000000',0),(1960,'370832000000','梁山县','county','1','y','370800000000',0),(1961,'370881000000','曲阜市','county','1','y','370800000000',0),(1962,'370882000000','兖州市','county','1','y','370800000000',0),(1963,'370883000000','邹城市','county','1','y','370800000000',0),(1964,'370911000000','岱岳区','county','1','y','370900000000',0),(1965,'370921000000','宁阳县','county','1','y','370900000000',0),(1966,'370923000000','东平县','county','1','y','370900000000',0),(1967,'370982000000','新泰市','county','1','y','370900000000',0),(1968,'370983000000','肥城市','county','1','y','370900000000',0),(1969,'371081000000','文登市','county','1','y','371000000000',0),(1970,'371082000000','荣成市','county','1','y','371000000000',0),(1971,'371083000000','乳山市','county','1','y','371000000000',0),(1972,'371103000000','岚山区','county','1','y','371100000000',0),(1973,'371121000000','五莲县','county','1','y','371100000000',0),(1974,'371122000000','莒县','county','1','y','371100000000',0),(1975,'371203000000','钢城区','county','1','y','371200000000',0),(1976,'371311000000','罗庄区','county','1','y','371300000000',0),(1977,'371312000000','河东区','county','1','y','371300000000',0),(1978,'371321000000','沂南县','county','1','y','371300000000',0),(1979,'371322000000','郯城县','county','1','y','371300000000',0),(1980,'371323000000','沂水县','county','1','y','371300000000',0),(1981,'371324000000','苍山县','county','1','y','371300000000',0),(1982,'371325000000','费县','county','1','y','371300000000',0),(1983,'371326000000','平邑县','county','1','y','371300000000',0),(1984,'371327000000','莒南县','county','1','y','371300000000',0),(1985,'371328000000','蒙阴县','county','1','y','371300000000',0),(1986,'371329000000','临沭县','county','1','y','371300000000',0),(1987,'371421000000','陵县','county','1','y','371400000000',0),(1988,'371422000000','宁津县','county','1','y','371400000000',0),(1989,'371423000000','庆云县','county','1','y','371400000000',0),(1990,'371424000000','临邑县','county','1','y','371400000000',0),(1991,'371425000000','齐河县','county','1','y','371400000000',0),(1992,'371426000000','平原县','county','1','y','371400000000',0),(1993,'371427000000','夏津县','county','1','y','371400000000',0),(1994,'371428000000','武城县','county','1','y','371400000000',0),(1995,'371481000000','乐陵市','county','1','y','371400000000',0),(1996,'371482000000','禹城市','county','1','y','371400000000',0),(1997,'371521000000','阳谷县','county','1','y','371500000000',0),(1998,'371522000000','莘县','county','1','y','371500000000',0),(1999,'371523000000','茌平县','county','1','y','371500000000',0),(2000,'371524000000','东阿县','county','1','y','371500000000',0),(2001,'371525000000','冠县','county','1','y','371500000000',0),(2002,'371526000000','高唐县','county','1','y','371500000000',0),(2003,'371581000000','临清市','county','1','y','371500000000',0),(2004,'371621000000','惠民县','county','1','y','371600000000',0),(2005,'371622000000','阳信县','county','1','y','371600000000',0),(2006,'371623000000','无棣县','county','1','y','371600000000',0),(2007,'371624000000','沾化县','county','1','y','371600000000',0),(2008,'371625000000','博兴县','county','1','y','371600000000',0),(2009,'371626000000','邹平县','county','1','y','371600000000',0),(2010,'371721000000','曹县','county','1','y','371700000000',0),(2011,'371722000000','单县','county','1','y','371700000000',0),(2012,'371723000000','成武县','county','1','y','371700000000',0),(2013,'371724000000','巨野县','county','1','y','371700000000',0),(2014,'371725000000','郓城县','county','1','y','371700000000',0),(2015,'371726000000','鄄城县','county','1','y','371700000000',0),(2016,'371727000000','定陶县','county','1','y','371700000000',0),(2017,'371728000000','东明县','county','1','y','371700000000',0),(2018,'410103000000','二七区','county','1','y','410100000000',0),(2019,'410104000000','管城回族区','county','1','y','410100000000',0),(2020,'410105000000','金水区','county','1','y','410100000000',0),(2021,'410106000000','上街区','county','1','y','410100000000',0),(2022,'410108000000','惠济区','county','1','y','410100000000',0),(2023,'410122000000','中牟县','county','1','y','410100000000',0),(2024,'410181000000','巩义市','county','1','y','410100000000',0),(2025,'410182000000','荥阳市','county','1','y','410100000000',0),(2026,'410183000000','新密市','county','1','y','410100000000',0),(2027,'410184000000','新郑市','county','1','y','410100000000',0),(2028,'410185000000','登封市','county','1','y','410100000000',0),(2029,'410203000000','顺河回族区','county','1','y','410200000000',0),(2030,'410204000000','鼓楼区','county','1','y','410200000000',0),(2031,'410205000000','禹王台区','county','1','y','410200000000',0),(2032,'410211000000','金明区','county','1','y','410200000000',0),(2033,'410221000000','杞县','county','1','y','410200000000',0),(2034,'410222000000','通许县','county','1','y','410200000000',0),(2035,'410223000000','尉氏县','county','1','y','410200000000',0),(2036,'410224000000','开封县','county','1','y','410200000000',0),(2037,'410225000000','兰考县','county','1','y','410200000000',0),(2038,'410303000000','西工区','county','1','y','410300000000',0),(2039,'410304000000','瀍河回族区','county','1','y','410300000000',0),(2040,'410305000000','涧西区','county','1','y','410300000000',0),(2041,'410306000000','吉利区','county','1','y','410300000000',0),(2042,'410311000000','洛龙区','county','1','y','410300000000',0),(2043,'410322000000','孟津县','county','1','y','410300000000',0),(2044,'410323000000','新安县','county','1','y','410300000000',0),(2045,'410324000000','栾川县','county','1','y','410300000000',0),(2046,'410325000000','嵩县','county','1','y','410300000000',0),(2047,'410326000000','汝阳县','county','1','y','410300000000',0),(2048,'410327000000','宜阳县','county','1','y','410300000000',0),(2049,'410328000000','洛宁县','county','1','y','410300000000',0),(2050,'410329000000','伊川县','county','1','y','410300000000',0),(2051,'410381000000','偃师市','county','1','y','410300000000',0),(2052,'410403000000','卫东区','county','1','y','410400000000',0),(2053,'410404000000','石龙区','county','1','y','410400000000',0),(2054,'410411000000','湛河区','county','1','y','410400000000',0),(2055,'410421000000','宝丰县','county','1','y','410400000000',0),(2056,'410422000000','叶县','county','1','y','410400000000',0),(2057,'410423000000','鲁山县','county','1','y','410400000000',0),(2058,'410425000000','郏县','county','1','y','410400000000',0),(2059,'410481000000','舞钢市','county','1','y','410400000000',0),(2060,'410482000000','汝州市','county','1','y','410400000000',0),(2061,'410503000000','北关区','county','1','y','410500000000',0),(2062,'410505000000','殷都区','county','1','y','410500000000',0),(2063,'410506000000','龙安区','county','1','y','410500000000',0),(2064,'410522000000','安阳县','county','1','y','410500000000',0),(2065,'410523000000','汤阴县','county','1','y','410500000000',0),(2066,'410526000000','滑县','county','1','y','410500000000',0),(2067,'410527000000','内黄县','county','1','y','410500000000',0),(2068,'410581000000','林州市','county','1','y','410500000000',0),(2069,'410603000000','山城区','county','1','y','410600000000',0),(2070,'410611000000','淇滨区','county','1','y','410600000000',0),(2071,'410621000000','浚县','county','1','y','410600000000',0),(2072,'410622000000','淇县','county','1','y','410600000000',0),(2073,'410703000000','卫滨区','county','1','y','410700000000',0),(2074,'410704000000','凤泉区','county','1','y','410700000000',0),(2075,'410711000000','牧野区','county','1','y','410700000000',0),(2076,'410721000000','新乡县','county','1','y','410700000000',0),(2077,'410724000000','获嘉县','county','1','y','410700000000',0),(2078,'410725000000','原阳县','county','1','y','410700000000',0),(2079,'410726000000','延津县','county','1','y','410700000000',0),(2080,'410727000000','封丘县','county','1','y','410700000000',0),(2081,'410728000000','长垣县','county','1','y','410700000000',0),(2082,'410781000000','卫辉市','county','1','y','410700000000',0),(2083,'410782000000','辉县市','county','1','y','410700000000',0),(2084,'410803000000','中站区','county','1','y','410800000000',0),(2085,'410804000000','马村区','county','1','y','410800000000',0),(2086,'410811000000','山阳区','county','1','y','410800000000',0),(2087,'410821000000','修武县','county','1','y','410800000000',0),(2088,'410822000000','博爱县','county','1','y','410800000000',0),(2089,'410823000000','武陟县','county','1','y','410800000000',0),(2090,'410825000000','温县','county','1','y','410800000000',0),(2091,'410882000000','沁阳市','county','1','y','410800000000',0),(2092,'410883000000','孟州市','county','1','y','410800000000',0),(2093,'410922000000','清丰县','county','1','y','410900000000',0),(2094,'410923000000','南乐县','county','1','y','410900000000',0),(2095,'410926000000','范县','county','1','y','410900000000',0),(2096,'410927000000','台前县','county','1','y','410900000000',0),(2097,'410928000000','濮阳县','county','1','y','410900000000',0),(2098,'411023000000','许昌县','county','1','y','411000000000',0),(2099,'411024000000','鄢陵县','county','1','y','411000000000',0),(2100,'411025000000','襄城县','county','1','y','411000000000',0),(2101,'411081000000','禹州市','county','1','y','411000000000',0),(2102,'411082000000','长葛市','county','1','y','411000000000',0),(2103,'411103000000','郾城区','county','1','y','411100000000',0),(2104,'411104000000','召陵区','county','1','y','411100000000',0),(2105,'411121000000','舞阳县','county','1','y','411100000000',0),(2106,'411122000000','临颍县','county','1','y','411100000000',0),(2107,'411221000000','渑池县','county','1','y','411200000000',0),(2108,'411222000000','陕县','county','1','y','411200000000',0),(2109,'411224000000','卢氏县','county','1','y','411200000000',0),(2110,'411281000000','义马市','county','1','y','411200000000',0),(2111,'411282000000','灵宝市','county','1','y','411200000000',0),(2112,'411303000000','卧龙区','county','1','y','411300000000',0),(2113,'411321000000','南召县','county','1','y','411300000000',0),(2114,'411322000000','方城县','county','1','y','411300000000',0),(2115,'411323000000','西峡县','county','1','y','411300000000',0),(2116,'411324000000','镇平县','county','1','y','411300000000',0),(2117,'411325000000','内乡县','county','1','y','411300000000',0),(2118,'411326000000','淅川县','county','1','y','411300000000',0),(2119,'411327000000','社旗县','county','1','y','411300000000',0),(2120,'411328000000','唐河县','county','1','y','411300000000',0),(2121,'411329000000','新野县','county','1','y','411300000000',0),(2122,'411330000000','桐柏县','county','1','y','411300000000',0),(2123,'411381000000','邓州市','county','1','y','411300000000',0),(2124,'411403000000','睢阳区','county','1','y','411400000000',0),(2125,'411421000000','民权县','county','1','y','411400000000',0),(2126,'411422000000','睢县','county','1','y','411400000000',0),(2127,'411423000000','宁陵县','county','1','y','411400000000',0),(2128,'411424000000','柘城县','county','1','y','411400000000',0),(2129,'411425000000','虞城县','county','1','y','411400000000',0),(2130,'411426000000','夏邑县','county','1','y','411400000000',0),(2131,'411481000000','永城市','county','1','y','411400000000',0),(2132,'411503000000','平桥区','county','1','y','411500000000',0),(2133,'411521000000','罗山县','county','1','y','411500000000',0),(2134,'411522000000','光山县','county','1','y','411500000000',0),(2135,'411523000000','新县','county','1','y','411500000000',0),(2136,'411524000000','商城县','county','1','y','411500000000',0),(2137,'411525000000','固始县','county','1','y','411500000000',0),(2138,'411526000000','潢川县','county','1','y','411500000000',0),(2139,'411527000000','淮滨县','county','1','y','411500000000',0),(2140,'411528000000','息县','county','1','y','411500000000',0),(2141,'411621000000','扶沟县','county','1','y','411600000000',0),(2142,'411622000000','西华县','county','1','y','411600000000',0),(2143,'411623000000','商水县','county','1','y','411600000000',0),(2144,'411624000000','沈丘县','county','1','y','411600000000',0),(2145,'411625000000','郸城县','county','1','y','411600000000',0),(2146,'411626000000','淮阳县','county','1','y','411600000000',0),(2147,'411627000000','太康县','county','1','y','411600000000',0),(2148,'411628000000','鹿邑县','county','1','y','411600000000',0),(2149,'411681000000','项城市','county','1','y','411600000000',0),(2150,'411721000000','西平县','county','1','y','411700000000',0),(2151,'411722000000','上蔡县','county','1','y','411700000000',0),(2152,'411723000000','平舆县','county','1','y','411700000000',0),(2153,'411724000000','正阳县','county','1','y','411700000000',0),(2154,'411725000000','确山县','county','1','y','411700000000',0),(2155,'411726000000','泌阳县','county','1','y','411700000000',0),(2156,'411727000000','汝南县','county','1','y','411700000000',0),(2157,'411728000000','遂平县','county','1','y','411700000000',0),(2158,'411729000000','新蔡县','county','1','y','411700000000',0),(2159,'420103000000','江汉区','county','1','y','420100000000',0),(2160,'420104000000','硚口区','county','1','y','420100000000',0),(2161,'420105000000','汉阳区','county','1','y','420100000000',0),(2162,'420106000000','武昌区','county','1','y','420100000000',0),(2163,'420107000000','青山区','county','1','y','420100000000',0),(2164,'420111000000','洪山区','county','1','y','420100000000',0),(2165,'420112000000','东西湖区','county','1','y','420100000000',0),(2166,'420113000000','汉南区','county','1','y','420100000000',0),(2167,'420114000000','蔡甸区','county','1','y','420100000000',0),(2168,'420115000000','江夏区','county','1','y','420100000000',0),(2169,'420116000000','黄陂区','county','1','y','420100000000',0),(2170,'420117000000','新洲区','county','1','y','420100000000',0),(2171,'420203000000','西塞山区','county','1','y','420200000000',0),(2172,'420204000000','下陆区','county','1','y','420200000000',0),(2173,'420205000000','铁山区','county','1','y','420200000000',0),(2174,'420222000000','阳新县','county','1','y','420200000000',0),(2175,'420281000000','大冶市','county','1','y','420200000000',0),(2176,'420303000000','张湾区','county','1','y','420300000000',0),(2177,'420321000000','郧县','county','1','y','420300000000',0),(2178,'420322000000','郧西县','county','1','y','420300000000',0),(2179,'420323000000','竹山县','county','1','y','420300000000',0),(2180,'420324000000','竹溪县','county','1','y','420300000000',0),(2181,'420325000000','房县','county','1','y','420300000000',0),(2182,'420381000000','丹江口市','county','1','y','420300000000',0),(2183,'420503000000','伍家岗区','county','1','y','420500000000',0),(2184,'420504000000','点军区','county','1','y','420500000000',0),(2185,'420505000000','猇亭区','county','1','y','420500000000',0),(2186,'420506000000','夷陵区','county','1','y','420500000000',0),(2187,'420525000000','远安县','county','1','y','420500000000',0),(2188,'420526000000','兴山县','county','1','y','420500000000',0),(2189,'420527000000','秭归县','county','1','y','420500000000',0),(2190,'420528000000','长阳土家族自治县','county','1','y','420500000000',0),(2191,'420529000000','五峰土家族自治县','county','1','y','420500000000',0),(2192,'420581000000','宜都市','county','1','y','420500000000',0),(2193,'420582000000','当阳市','county','1','y','420500000000',0),(2194,'420583000000','枝江市','county','1','y','420500000000',0),(2195,'420606000000','樊城区','county','1','y','420600000000',0),(2196,'420607000000','襄州区','county','1','y','420600000000',0),(2197,'420624000000','南漳县','county','1','y','420600000000',0),(2198,'420625000000','谷城县','county','1','y','420600000000',0),(2199,'420626000000','保康县','county','1','y','420600000000',0),(2200,'420682000000','老河口市','county','1','y','420600000000',0),(2201,'420683000000','枣阳市','county','1','y','420600000000',0),(2202,'420684000000','宜城市','county','1','y','420600000000',0),(2203,'420703000000','华容区','county','1','y','420700000000',0),(2204,'420704000000','鄂城区','county','1','y','420700000000',0),(2205,'420804000000','掇刀区','county','1','y','420800000000',0),(2206,'420821000000','京山县','county','1','y','420800000000',0),(2207,'420822000000','沙洋县','county','1','y','420800000000',0),(2208,'420881000000','钟祥市','county','1','y','420800000000',0),(2209,'420921000000','孝昌县','county','1','y','420900000000',0),(2210,'420922000000','大悟县','county','1','y','420900000000',0),(2211,'420923000000','云梦县','county','1','y','420900000000',0),(2212,'420981000000','应城市','county','1','y','420900000000',0),(2213,'420982000000','安陆市','county','1','y','420900000000',0),(2214,'420984000000','汉川市','county','1','y','420900000000',0),(2215,'421003000000','荆州区','county','1','y','421000000000',0),(2216,'421022000000','公安县','county','1','y','421000000000',0),(2217,'421023000000','监利县','county','1','y','421000000000',0),(2218,'421024000000','江陵县','county','1','y','421000000000',0),(2219,'421081000000','石首市','county','1','y','421000000000',0),(2220,'421083000000','洪湖市','county','1','y','421000000000',0),(2221,'421087000000','松滋市','county','1','y','421000000000',0),(2222,'421121000000','团风县','county','1','y','421100000000',0),(2223,'421122000000','红安县','county','1','y','421100000000',0),(2224,'421123000000','罗田县','county','1','y','421100000000',0),(2225,'421124000000','英山县','county','1','y','421100000000',0),(2226,'421125000000','浠水县','county','1','y','421100000000',0),(2227,'421126000000','蕲春县','county','1','y','421100000000',0),(2228,'421127000000','黄梅县','county','1','y','421100000000',0),(2229,'421181000000','麻城市','county','1','y','421100000000',0),(2230,'421182000000','武穴市','county','1','y','421100000000',0),(2231,'421221000000','嘉鱼县','county','1','y','421200000000',0),(2232,'421222000000','通城县','county','1','y','421200000000',0),(2233,'421223000000','崇阳县','county','1','y','421200000000',0),(2234,'421224000000','通山县','county','1','y','421200000000',0),(2235,'421281000000','赤壁市','county','1','y','421200000000',0),(2236,'421321000000','随县','county','1','y','421300000000',0),(2237,'421381000000','广水市','county','1','y','421300000000',0),(2238,'422802000000','利川市','county','1','y','422800000000',0),(2239,'422822000000','建始县','county','1','y','422800000000',0),(2240,'422823000000','巴东县','county','1','y','422800000000',0),(2241,'422825000000','宣恩县','county','1','y','422800000000',0),(2242,'422826000000','咸丰县','county','1','y','422800000000',0),(2243,'422827000000','来凤县','county','1','y','422800000000',0),(2244,'422828000000','鹤峰县','county','1','y','422800000000',0),(2245,'429005000000','潜江市','county','1','y','42',0),(2246,'429006000000','天门市','county','1','y','42',0),(2247,'429021000000','神农架林区','county','1','y','42',0),(2248,'430103000000','天心区','county','1','y','430100000000',0),(94,'11','北京','province','1','y','0',0),(95,'12','天津','province','1','y','0',0),(96,'13','河北省','province','1','y','0',0),(97,'14','山西','province','1','y','0',0),(98,'15','内蒙古','province','1','y','0',0),(99,'21','辽宁','province','1','y','0',0),(100,'22','吉林','province','1','y','0',0),(101,'23','黑龙江','province','1','y','0',0),(102,'31','上海','province','1','y','0',0),(103,'32','江苏','province','1','y','0',0),(104,'33','浙江','province','1','y','0',0),(105,'34','安徽','province','1','y','0',0),(106,'35','福建','province','1','y','0',0),(107,'36','江西','province','1','y','0',0),(108,'37','山东','province','1','y','0',0),(109,'41','河南省','province','1','y','0',0),(110,'42','湖北','province','1','y','0',0),(111,'43','湖南','province','1','y','0',0),(112,'44','广东','province','1','y','0',0),(113,'45','广西','province','1','y','0',0),(114,'46','海南','province','1','y','0',0),(115,'50','重庆','province','1','y','0',0),(116,'51','四川','province','1','y','0',0),(117,'52','贵州','province','1','y','0',0),(118,'53','云南','province','1','y','0',0),(119,'54','西藏','province','1','y','0',0),(120,'61','陕西','province','1','y','0',0),(121,'62','甘肃','province','1','y','0',0),(122,'63','青海','province','1','y','0',0),(123,'64','宁夏','province','1','y','0',0),(124,'65','新疆','province','1','y','0',0),(125,'110100000000','市辖区','city','1','n','11',1),(126,'120100000000','市辖区','city','1','n','12',1),(127,'130100000000','石家庄市','city','1','y','13',0),(128,'140100000000','太原市','city','1','y','14',0),(129,'150100000000','呼和浩特市','city','1','y','15',0),(130,'210100000000','沈阳市','city','1','y','21',0),(131,'220100000000','长春市','city','1','y','22',0),(132,'230100000000','哈尔滨市','city','1','y','23',0),(133,'310100000000','市辖区','city','1','n','31',1),(134,'320100000000','南京市','city','1','y','32',0),(135,'330100000000','杭州市','city','1','y','33',0),(136,'340100000000','合肥市','city','1','y','34',0),(137,'350100000000','福州市','city','1','y','35',0),(138,'360100000000','南昌市','city','1','y','36',0),(139,'370100000000','济南市','city','1','y','37',0),(140,'410100000000','郑州市','city','1','y','41',0),(141,'420100000000','武汉市','city','1','y','42',0),(142,'430100000000','长沙市','city','1','y','43',0),(143,'440100000000','广州市','city','1','y','44',0),(144,'450100000000','南宁市','city','1','y','45',0),(145,'460100000000','海口市','city','1','y','46',0),(146,'500100000000','市辖区','city','1','n','50',1),(147,'510100000000','成都市','city','1','y','51',0),(148,'520100000000','贵阳市','city','1','y','52',0),(149,'530100000000','昆明市','city','1','y','53',0),(150,'540100000000','拉萨市','city','1','y','54',0),(151,'610100000000','西安市','city','1','y','61',0),(152,'620100000000','兰州市','city','1','y','62',0),(153,'630100000000','西宁市','city','1','y','63',0),(154,'640100000000','银川市','city','1','y','64',0),(155,'650100000000','乌鲁木齐市','city','1','y','65',0),(156,'110200000000','县','city','1','n','11',1),(157,'120200000000','县','city','1','n','12',1),(158,'130200000000','唐山市','city','1','y','13',0),(159,'130300000000','秦皇岛市','city','1','y','13',0),(160,'130400000000','邯郸市','city','1','y','13',0),(161,'130500000000','邢台市','city','1','y','13',0),(162,'130600000000','保定市','city','1','y','13',0),(163,'130700000000','张家口市','city','1','y','13',0),(164,'130800000000','承德市','city','1','y','13',0),(165,'130900000000','沧州市','city','1','y','13',0),(166,'131000000000','廊坊市','city','1','y','13',0),(167,'131100000000','衡水市','city','1','y','13',0),(168,'140200000000','大同市','city','1','y','14',0),(169,'140300000000','阳泉市','city','1','y','14',0),(170,'140400000000','长治市','city','1','y','14',0),(171,'140500000000','晋城市','city','1','y','14',0),(172,'140600000000','朔州市','city','1','y','14',0),(173,'140700000000','晋中市','city','1','y','14',0),(174,'140800000000','运城市','city','1','y','14',0),(175,'140900000000','忻州市','city','1','y','14',0),(176,'141000000000','临汾市','city','1','y','14',0),(177,'141100000000','吕梁市','city','1','y','14',0),(178,'150200000000','包头市','city','1','y','15',0),(179,'150300000000','乌海市','city','1','y','15',0),(180,'150400000000','赤峰市','city','1','y','15',0),(181,'150500000000','通辽市','city','1','y','15',0),(182,'150600000000','鄂尔多斯市','city','1','y','15',0),(183,'150700000000','呼伦贝尔市','city','1','y','15',0),(184,'150800000000','巴彦淖尔市','city','1','y','15',0),(185,'150900000000','乌兰察布市','city','1','y','15',0),(186,'152200000000','兴安盟','city','1','y','15',0),(187,'152500000000','锡林郭勒盟','city','1','y','15',0),(188,'152900000000','阿拉善盟','city','1','y','15',0),(189,'210200000000','大连市','city','1','y','21',0),(190,'210300000000','鞍山市','city','1','y','21',0),(191,'210400000000','抚顺市','city','1','y','21',0),(192,'210500000000','本溪市','city','1','y','21',0),(193,'210600000000','丹东市','city','1','y','21',0),(194,'210700000000','锦州市','city','1','y','21',0),(195,'210800000000','营口市','city','1','y','21',0),(196,'210900000000','阜新市','city','1','y','21',0),(197,'211000000000','辽阳市','city','1','y','21',0),(198,'211100000000','盘锦市','city','1','y','21',0),(199,'211200000000','铁岭市','city','1','y','21',0),(200,'211300000000','朝阳市','city','1','y','21',0),(201,'211400000000','葫芦岛市','city','1','y','21',0),(202,'220200000000','吉林市','city','1','y','22',0),(203,'220300000000','四平市','city','1','y','22',0),(204,'220400000000','辽源市','city','1','y','22',0),(205,'220500000000','通化市','city','1','y','22',0),(206,'220600000000','白山市','city','1','y','22',0),(207,'220700000000','松原市','city','1','y','22',0),(208,'220800000000','白城市','city','1','y','22',0),(209,'222400000000','延边朝鲜族自治州','city','1','y','22',0),(210,'230200000000','齐齐哈尔市','city','1','y','23',0),(211,'230300000000','鸡西市','city','1','y','23',0),(212,'230400000000','鹤岗市','city','1','y','23',0),(213,'230500000000','双鸭山市','city','1','y','23',0),(214,'230600000000','大庆市','city','1','y','23',0),(215,'230700000000','伊春市','city','1','y','23',0),(216,'230800000000','佳木斯市','city','1','y','23',0),(217,'230900000000','七台河市','city','1','y','23',0),(218,'231000000000','牡丹江市','city','1','y','23',0),(219,'231100000000','黑河市','city','1','y','23',0),(220,'231200000000','绥化市','city','1','y','23',0),(221,'232700000000','大兴安岭地区','city','1','y','23',0),(222,'310200000000','县','city','1','n','31',1),(223,'320200000000','无锡市','city','1','y','32',0),(224,'320300000000','徐州市','city','1','y','32',0),(225,'320400000000','常州市','city','1','y','32',0),(226,'320500000000','苏州市','city','1','y','32',0),(227,'320600000000','南通市','city','1','y','32',0),(228,'320700000000','连云港市','city','1','y','32',0),(229,'320800000000','淮安市','city','1','y','32',0),(230,'320900000000','盐城市','city','1','y','32',0),(231,'321000000000','扬州市','city','1','y','32',0),(232,'321100000000','镇江市','city','1','y','32',0),(233,'321200000000','泰州市','city','1','y','32',0),(234,'321300000000','宿迁市','city','1','y','32',0),(235,'330200000000','宁波市','city','1','y','33',0),(236,'330300000000','温州市','city','1','y','33',0),(237,'330400000000','嘉兴市','city','1','y','33',0),(238,'330500000000','湖州市','city','1','y','33',0),(239,'330600000000','绍兴市','city','1','y','33',0),(240,'330700000000','金华市','city','1','y','33',0),(241,'330800000000','衢州市','city','1','y','33',0),(242,'330900000000','舟山市','city','1','y','33',0),(243,'331000000000','台州市','city','1','y','33',0),(244,'331100000000','丽水市','city','1','y','33',0),(245,'340200000000','芜湖市','city','1','y','34',0),(246,'340300000000','蚌埠市','city','1','y','34',0),(247,'340400000000','淮南市','city','1','y','34',0),(248,'340500000000','马鞍山市','city','1','y','34',0),(249,'340600000000','淮北市','city','1','y','34',0),(250,'340700000000','铜陵市','city','1','y','34',0),(251,'340800000000','安庆市','city','1','y','34',0),(252,'341000000000','黄山市','city','1','y','34',0),(253,'341100000000','滁州市','city','1','y','34',0),(254,'341200000000','阜阳市','city','1','y','34',0),(255,'341300000000','宿州市','city','1','y','34',0),(256,'341500000000','六安市','city','1','y','34',0),(257,'341600000000','亳州市','city','1','y','34',0),(258,'341700000000','池州市','city','1','y','34',0),(259,'341800000000','宣城市','city','1','y','34',0),(260,'350200000000','厦门市','city','1','y','35',0),(261,'350300000000','莆田市','city','1','y','35',0),(262,'350400000000','三明市','city','1','y','35',0),(263,'350500000000','泉州市','city','1','y','35',0),(264,'350600000000','漳州市','city','1','y','35',0),(265,'350700000000','南平市','city','1','y','35',0),(266,'350800000000','龙岩市','city','1','y','35',0),(267,'350900000000','宁德市','city','1','y','35',0),(268,'360200000000','景德镇市','city','1','y','36',0),(269,'360300000000','萍乡市','city','1','y','36',0),(270,'360400000000','九江市','city','1','y','36',0),(271,'360500000000','新余市','city','1','y','36',0),(272,'360600000000','鹰潭市','city','1','y','36',0),(273,'360700000000','赣州市','city','1','y','36',0),(274,'360800000000','吉安市','city','1','y','36',0),(275,'360900000000','宜春市','city','1','y','36',0),(276,'361000000000','抚州市','city','1','y','36',0),(277,'361100000000','上饶市','city','1','y','36',0),(278,'370200000000','青岛市','city','1','y','37',0),(279,'370300000000','淄博市','city','1','y','37',0),(280,'370400000000','枣庄市','city','1','y','37',0),(281,'370500000000','东营市','city','1','y','37',0),(282,'370600000000','烟台市','city','1','y','37',0),(283,'370700000000','潍坊市','city','1','y','37',0),(284,'370800000000','济宁市','city','1','y','37',0),(285,'370900000000','泰安市','city','1','y','37',0),(286,'371000000000','威海市','city','1','y','37',0),(287,'371100000000','日照市','city','1','y','37',0),(288,'371200000000','莱芜市','city','1','y','37',0),(289,'371300000000','临沂市','city','1','y','37',0),(290,'371400000000','德州市','city','1','y','37',0),(291,'371500000000','聊城市','city','1','y','37',0),(292,'371600000000','滨州市','city','1','y','37',0),(293,'371700000000','菏泽市','city','1','y','37',0),(294,'410200000000','开封市','city','1','y','41',0),(295,'410300000000','洛阳市','city','1','y','41',0),(296,'410400000000','平顶山市','city','1','y','41',0),(297,'410500000000','安阳市','city','1','y','41',0),(298,'410600000000','鹤壁市','city','1','y','41',0),(299,'410700000000','新乡市','city','1','y','41',0),(300,'410800000000','焦作市','city','1','y','41',0),(301,'410900000000','濮阳市','city','1','y','41',0),(302,'411000000000','许昌市','city','1','y','41',0),(303,'411100000000','漯河市','city','1','y','41',0),(304,'411200000000','三门峡市','city','1','y','41',0),(305,'411300000000','南阳市','city','1','y','41',0),(306,'411400000000','商丘市','city','1','y','41',0),(307,'411500000000','信阳市','city','1','y','41',0),(308,'411600000000','周口市','city','1','y','41',0),(309,'411700000000','驻马店市','city','1','y','41',0),(310,'419000000000','省直辖县级行政区划','city','1','n','41',1),(311,'420200000000','黄石市','city','1','y','42',0),(312,'420300000000','十堰市','city','1','y','42',0),(313,'420500000000','宜昌市','city','1','y','42',0),(314,'420600000000','襄阳市','city','1','y','42',0),(315,'420700000000','鄂州市','city','1','y','42',0),(316,'420800000000','荆门市','city','1','y','42',0),(317,'420900000000','孝感市','city','1','y','42',0),(318,'421000000000','荆州市','city','1','y','42',0),(319,'421100000000','黄冈市','city','1','y','42',0),(320,'421200000000','咸宁市','city','1','y','42',0),(321,'421300000000','随州市','city','1','y','42',0),(322,'422800000000','恩施土家族苗族自治州','city','1','y','42',0),(323,'429000000000','省直辖县级行政区划','city','1','n','42',1),(324,'430200000000','株洲市','city','1','y','43',0),(325,'430300000000','湘潭市','city','1','y','43',0),(326,'430400000000','衡阳市','city','1','y','43',0),(327,'430500000000','邵阳市','city','1','y','43',0),(328,'430600000000','岳阳市','city','1','y','43',0),(329,'430700000000','常德市','city','1','y','43',0),(330,'430800000000','张家界市','city','1','y','43',0),(331,'430900000000','益阳市','city','1','y','43',0),(332,'431000000000','郴州市','city','1','y','43',0),(333,'431100000000','永州市','city','1','y','43',0),(334,'431200000000','怀化市','city','1','y','43',0),(335,'431300000000','娄底市','city','1','y','43',0),(336,'433100000000','湘西土家族苗族自治州','city','1','y','43',0),(337,'440200000000','韶关市','city','1','y','44',0),(338,'440300000000','深圳市','city','1','y','44',0),(339,'440400000000','珠海市','city','1','y','44',0),(340,'440500000000','汕头市','city','1','y','44',0),(341,'440600000000','佛山市','city','1','y','44',0),(342,'440700000000','江门市','city','1','y','44',0),(343,'440800000000','湛江市','city','1','y','44',0),(344,'440900000000','茂名市','city','1','y','44',0),(345,'441200000000','肇庆市','city','1','y','44',0),(346,'441300000000','惠州市','city','1','y','44',0),(347,'441400000000','梅州市','city','1','y','44',0),(348,'441500000000','汕尾市','city','1','y','44',0),(349,'441600000000','河源市','city','1','y','44',0),(350,'441700000000','阳江市','city','1','y','44',0),(351,'441800000000','清远市','city','1','y','44',0),(352,'441900000000','东莞市','city','1','y','44',0),(353,'442000000000','中山市','city','1','y','44',0),(354,'445100000000','潮州市','city','1','y','44',0),(355,'445200000000','揭阳市','city','1','y','44',0),(356,'445300000000','云浮市','city','1','y','44',0),(357,'450200000000','柳州市','city','1','y','45',0),(358,'450300000000','桂林市','city','1','y','45',0),(359,'450400000000','梧州市','city','1','y','45',0),(360,'450500000000','北海市','city','1','y','45',0),(361,'450600000000','防城港市','city','1','y','45',0),(362,'450700000000','钦州市','city','1','y','45',0),(363,'450800000000','贵港市','city','1','y','45',0),(364,'450900000000','玉林市','city','1','y','45',0),(365,'451000000000','百色市','city','1','y','45',0),(366,'451100000000','贺州市','city','1','y','45',0),(367,'451200000000','河池市','city','1','y','45',0),(368,'451300000000','来宾市','city','1','y','45',0),(369,'451400000000','崇左市','city','1','y','45',0),(370,'460200000000','三亚市','city','1','y','46',0),(371,'469000000000','省直辖县级行政区划','city','1','n','46',1),(372,'500200000000','县','city','1','n','50',1),(373,'510300000000','自贡市','city','1','y','51',0),(374,'510400000000','攀枝花市','city','1','y','51',0),(375,'510500000000','泸州市','city','1','y','51',0),(376,'510600000000','德阳市','city','1','y','51',0),(377,'510700000000','绵阳市','city','1','y','51',0),(378,'510800000000','广元市','city','1','y','51',0),(379,'510900000000','遂宁市','city','1','y','51',0),(380,'511000000000','内江市','city','1','y','51',0),(381,'511100000000','乐山市','city','1','y','51',0),(382,'511300000000','南充市','city','1','y','51',0),(383,'511400000000','眉山市','city','1','y','51',0),(384,'511500000000','宜宾市','city','1','y','51',0),(385,'511600000000','广安市','city','1','y','51',0),(386,'511700000000','达州市','city','1','y','51',0),(387,'511800000000','雅安市','city','1','y','51',0),(388,'511900000000','巴中市','city','1','y','51',0),(389,'512000000000','资阳市','city','1','y','51',0),(390,'513200000000','阿坝藏族羌族自治州','city','1','y','51',0),(391,'513300000000','甘孜藏族自治州','city','1','y','51',0),(392,'513400000000','凉山彝族自治州','city','1','y','51',0),(393,'520200000000','六盘水市','city','1','y','52',0),(394,'520300000000','遵义市','city','1','y','52',0),(395,'520400000000','安顺市','city','1','y','52',0),(396,'520500000000','毕节市','city','1','y','52',0),(397,'520600000000','铜仁市','city','1','y','52',0),(398,'522300000000','黔西南布依族苗族自治州','city','1','y','52',0),(399,'522600000000','黔东南苗族侗族自治州','city','1','y','52',0),(400,'522700000000','黔南布依族苗族自治州','city','1','y','52',0),(401,'530300000000','曲靖市','city','1','y','53',0),(402,'530400000000','玉溪市','city','1','y','53',0),(403,'530500000000','保山市','city','1','y','53',0),(404,'530600000000','昭通市','city','1','y','53',0),(405,'530700000000','丽江市','city','1','y','53',0),(406,'530800000000','普洱市','city','1','y','53',0),(407,'530900000000','临沧市','city','1','y','53',0),(408,'532300000000','楚雄彝族自治州','city','1','y','53',0),(409,'532500000000','红河哈尼族彝族自治州','city','1','y','53',0),(410,'532600000000','文山壮族苗族自治州','city','1','y','53',0),(411,'532800000000','西双版纳傣族自治州','city','1','y','53',0),(412,'532900000000','大理白族自治州','city','1','y','53',0),(413,'533100000000','德宏傣族景颇族自治州','city','1','y','53',0),(414,'533300000000','怒江傈僳族自治州','city','1','y','53',0),(415,'533400000000','迪庆藏族自治州','city','1','y','53',0),(416,'542100000000','昌都地区','city','1','y','54',0),(417,'542200000000','山南地区','city','1','y','54',0),(418,'542300000000','日喀则地区','city','1','y','54',0),(419,'542400000000','那曲地区','city','1','y','54',0),(420,'542500000000','阿里地区','city','1','y','54',0),(421,'542600000000','林芝地区','city','1','y','54',0),(422,'610200000000','铜川市','city','1','y','61',0),(423,'610300000000','宝鸡市','city','1','y','61',0),(424,'610400000000','咸阳市','city','1','y','61',0),(425,'610500000000','渭南市','city','1','y','61',0),(426,'610600000000','延安市','city','1','y','61',0),(427,'610700000000','汉中市','city','1','y','61',0),(428,'610800000000','榆林市','city','1','y','61',0),(429,'610900000000','安康市','city','1','y','61',0),(430,'611000000000','商洛市','city','1','y','61',0),(431,'620200000000','嘉峪关市','city','1','y','62',0),(432,'620300000000','金昌市','city','1','y','62',0),(433,'620400000000','白银市','city','1','y','62',0),(434,'620500000000','天水市','city','1','y','62',0),(435,'620600000000','武威市','city','1','y','62',0),(436,'620700000000','张掖市','city','1','y','62',0),(437,'620800000000','平凉市','city','1','y','62',0),(438,'620900000000','酒泉市','city','1','y','62',0),(439,'621000000000','庆阳市','city','1','y','62',0),(440,'621100000000','定西市','city','1','y','62',0),(441,'621200000000','陇南市','city','1','y','62',0),(442,'622900000000','临夏回族自治州','city','1','y','62',0),(443,'623000000000','甘南藏族自治州','city','1','y','62',0),(444,'632100000000','海东地区','city','1','y','63',0),(445,'632200000000','海北藏族自治州','city','1','y','63',0),(446,'632300000000','黄南藏族自治州','city','1','y','63',0),(447,'632500000000','海南藏族自治州','city','1','y','63',0),(448,'632600000000','果洛藏族自治州','city','1','y','63',0),(449,'632700000000','玉树藏族自治州','city','1','y','63',0),(450,'632800000000','海西蒙古族藏族自治州','city','1','y','63',0),(451,'640200000000','石嘴山市','city','1','y','64',0),(452,'640300000000','吴忠市','city','1','y','64',0),(453,'640400000000','固原市','city','1','y','64',0),(454,'640500000000','中卫市','city','1','y','64',0),(455,'650200000000','克拉玛依市','city','1','y','65',0),(456,'652100000000','吐鲁番地区','city','1','y','65',0),(457,'652200000000','哈密地区','city','1','y','65',0),(458,'652300000000','昌吉回族自治州','city','1','y','65',0),(459,'652700000000','博尔塔拉蒙古自治州','city','1','y','65',0),(460,'652800000000','巴音郭楞蒙古自治州','city','1','y','65',0),(461,'652900000000','阿克苏地区','city','1','y','65',0),(462,'653000000000','克孜勒苏柯尔克孜自治州','city','1','y','65',0),(463,'653100000000','喀什地区','city','1','y','65',0),(464,'653200000000','和田地区','city','1','y','65',0),(465,'654000000000','伊犁哈萨克自治州','city','1','y','65',0),(466,'654200000000','塔城地区','city','1','y','65',0),(467,'654300000000','阿勒泰地区','city','1','y','65',0),(468,'659000000000','自治区直辖县级行政区划','city','1','n','65',1),(469,'110101000000','东城区','county','1','y','11',0),(470,'110228000000','密云县','county','1','y','11',0),(471,'120101000000','和平区','county','1','y','12',0),(472,'120221000000','宁河县','county','1','y','12',0),(473,'130102000000','长安区','county','1','y','130100000000',0),(474,'130202000000','路南区','county','1','y','130200000000',0),(475,'130302000000','海港区','county','1','y','130300000000',0),(476,'130402000000','邯山区','county','1','y','130400000000',0),(477,'130502000000','桥东区','county','1','y','130500000000',0),(478,'130602000000','新市区','county','1','y','130600000000',0),(479,'130702000000','桥东区','county','1','y','130700000000',0),(480,'130802000000','双桥区','county','1','y','130800000000',0),(481,'130902000000','新华区','county','1','y','130900000000',0),(482,'131002000000','安次区','county','1','y','131000000000',0),(483,'131102000000','桃城区','county','1','y','131100000000',0),(484,'140105000000','小店区','county','1','y','140100000000',0),(485,'140202000000','城区','county','1','y','140200000000',0),(486,'140302000000','城区','county','1','y','140300000000',0),(487,'140402000000','城区','county','1','y','140400000000',0),(488,'140501000000','晋城市市辖区','county','1','y','140500000000',0),(489,'140602000000','朔城区','county','1','y','140600000000',0),(490,'140702000000','榆次区','county','1','y','140700000000',0),(491,'140802000000','盐湖区','county','1','y','140800000000',0),(492,'140902000000','忻府区','county','1','y','140900000000',0),(493,'141002000000','尧都区','county','1','y','141000000000',0),(494,'141102000000','离石区','county','1','y','141100000000',0),(495,'150102000000','新城区','county','1','y','150100000000',0),(496,'150202000000','东河区','county','1','y','150200000000',0),(497,'150302000000','海勃湾区','county','1','y','150300000000',0),(498,'150402000000','红山区','county','1','y','150400000000',0),(499,'150502000000','科尔沁区','county','1','y','150500000000',0),(500,'150602000000','东胜区','county','1','y','150600000000',0),(501,'150702000000','海拉尔区','county','1','y','150700000000',0),(502,'150802000000','临河区','county','1','y','150800000000',0),(503,'150902000000','集宁区','county','1','y','150900000000',0),(504,'152201000000','乌兰浩特市','county','1','y','152200000000',0),(505,'152501000000','二连浩特市','county','1','y','152500000000',0),(506,'152921000000','阿拉善左旗','county','1','y','152900000000',0),(507,'210102000000','和平区','county','1','y','210100000000',0),(508,'210202000000','中山区','county','1','y','210200000000',0),(509,'210302000000','铁东区','county','1','y','210300000000',0),(510,'210402000000','新抚区','county','1','y','210400000000',0),(511,'210502000000','平山区','county','1','y','210500000000',0),(512,'210602000000','元宝区','county','1','y','210600000000',0),(513,'210702000000','古塔区','county','1','y','210700000000',0),(514,'210802000000','站前区','county','1','y','210800000000',0),(515,'210902000000','海州区','county','1','y','210900000000',0),(516,'211002000000','白塔区','county','1','y','211000000000',0),(517,'211102000000','双台子区','county','1','y','211100000000',0),(518,'211202000000','银州区','county','1','y','211200000000',0),(519,'211302000000','双塔区','county','1','y','211300000000',0),(520,'211402000000','连山区','county','1','y','211400000000',0),(521,'220102000000','南关区','county','1','y','220100000000',0),(522,'220202000000','昌邑区','county','1','y','220200000000',0),(523,'220302000000','铁西区','county','1','y','220300000000',0),(524,'220402000000','龙山区','county','1','y','220400000000',0),(525,'220502000000','东昌区','county','1','y','220500000000',0),(526,'220602000000','八道江区','county','1','y','220600000000',0),(527,'220702000000','宁江区','county','1','y','220700000000',0),(528,'220802000000','洮北区','county','1','y','220800000000',0),(529,'222401000000','延吉市','county','1','y','222400000000',0),(530,'230102000000','道里区','county','1','y','230100000000',0),(531,'230202000000','龙沙区','county','1','y','230200000000',0),(532,'230302000000','鸡冠区','county','1','y','230300000000',0),(533,'230402000000','向阳区','county','1','y','230400000000',0),(534,'230502000000','尖山区','county','1','y','230500000000',0),(535,'230602000000','萨尔图区','county','1','y','230600000000',0),(536,'230702000000','伊春区','county','1','y','230700000000',0),(537,'230803000000','向阳区','county','1','y','230800000000',0),(538,'230902000000','新兴区','county','1','y','230900000000',0),(539,'231002000000','东安区','county','1','y','231000000000',0),(540,'231102000000','爱辉区','county','1','y','231100000000',0),(541,'231202000000','北林区','county','1','y','231200000000',0),(542,'232701000000','加格达奇区','county','1','y','232700000000',0),(543,'310101000000','黄浦区','county','1','y','31',0),(544,'310230000000','崇明县','county','1','y','31',0),(545,'320102000000','玄武区','county','1','y','320100000000',0),(546,'320202000000','崇安区','county','1','y','320200000000',0),(547,'320302000000','鼓楼区','county','1','y','320300000000',0),(548,'320402000000','天宁区','county','1','y','320400000000',0),(549,'320502000000','沧浪区','county','1','y','320500000000',0),(550,'320602000000','崇川区','county','1','y','320600000000',0),(551,'320703000000','连云区','county','1','y','320700000000',0),(552,'320802000000','清河区','county','1','y','320800000000',0),(553,'320902000000','亭湖区','county','1','y','320900000000',0),(554,'321002000000','广陵区','county','1','y','321000000000',0),(555,'321102000000','京口区','county','1','y','321100000000',0),(556,'321202000000','海陵区','county','1','y','321200000000',0),(557,'321302000000','宿城区','county','1','y','321300000000',0),(558,'330102000000','上城区','county','1','y','330100000000',0),(559,'330203000000','海曙区','county','1','y','330200000000',0),(560,'330302000000','鹿城区','county','1','y','330300000000',0),(561,'330402000000','南湖区','county','1','y','330400000000',0),(562,'330502000000','吴兴区','county','1','y','330500000000',0),(563,'330602000000','越城区','county','1','y','330600000000',0),(564,'330702000000','婺城区','county','1','y','330700000000',0),(565,'330802000000','柯城区','county','1','y','330800000000',0);
INSERT INTO `tb_area` VALUES (566,'330902000000','定海区','county','1','y','330900000000',0),(567,'331002000000','椒江区','county','1','y','331000000000',0),(568,'331102000000','莲都区','county','1','y','331100000000',0),(569,'340102000000','瑶海区','county','1','y','340100000000',0),(570,'340202000000','镜湖区','county','1','y','340200000000',0),(571,'340302000000','龙子湖区','county','1','y','340300000000',0),(572,'340402000000','大通区','county','1','y','340400000000',0),(573,'340502000000','金家庄区','county','1','y','340500000000',0),(574,'340602000000','杜集区','county','1','y','340600000000',0),(575,'340702000000','铜官山区','county','1','y','340700000000',0),(576,'340802000000','迎江区','county','1','y','340800000000',0),(577,'341002000000','屯溪区','county','1','y','341000000000',0),(578,'341102000000','琅琊区','county','1','y','341100000000',0),(579,'341202000000','颍州区','county','1','y','341200000000',0),(580,'341302000000','埇桥区','county','1','y','341300000000',0),(581,'341502000000','金安区','county','1','y','341500000000',0),(582,'341602000000','谯城区','county','1','y','341600000000',0),(583,'341702000000','贵池区','county','1','y','341700000000',0),(584,'341802000000','宣州区','county','1','y','341800000000',0),(585,'350102000000','鼓楼区','county','1','y','350100000000',0),(586,'350203000000','思明区','county','1','y','350200000000',0),(587,'350302000000','城厢区','county','1','y','350300000000',0),(588,'350402000000','梅列区','county','1','y','350400000000',0),(589,'350502000000','鲤城区','county','1','y','350500000000',0),(590,'350602000000','芗城区','county','1','y','350600000000',0),(591,'350702000000','延平区','county','1','y','350700000000',0),(592,'350802000000','新罗区','county','1','y','350800000000',0),(593,'350902000000','蕉城区','county','1','y','350900000000',0),(594,'360102000000','东湖区','county','1','y','360100000000',0),(595,'360202000000','昌江区','county','1','y','360200000000',0),(596,'360302000000','安源区','county','1','y','360300000000',0),(597,'360402000000','庐山区','county','1','y','360400000000',0),(598,'360502000000','渝水区','county','1','y','360500000000',0),(599,'360602000000','月湖区','county','1','y','360600000000',0),(600,'360702000000','章贡区','county','1','y','360700000000',0),(601,'360802000000','吉州区','county','1','y','360800000000',0),(602,'360902000000','袁州区','county','1','y','360900000000',0),(603,'361002000000','临川区','county','1','y','361000000000',0),(604,'361102000000','信州区','county','1','y','361100000000',0),(605,'370102000000','历下区','county','1','y','370100000000',0),(606,'370202000000','市南区','county','1','y','370200000000',0),(607,'370302000000','淄川区','county','1','y','370300000000',0),(608,'370402000000','市中区','county','1','y','370400000000',0),(609,'370502000000','东营区','county','1','y','370500000000',0),(610,'370602000000','芝罘区','county','1','y','370600000000',0),(611,'370702000000','潍城区','county','1','y','370700000000',0),(612,'370802000000','市中区','county','1','y','370800000000',0),(613,'370902000000','泰山区','county','1','y','370900000000',0),(614,'371002000000','环翠区','county','1','y','371000000000',0),(615,'371102000000','东港区','county','1','y','371100000000',0),(616,'371202000000','莱城区','county','1','y','371200000000',0),(617,'371302000000','兰山区','county','1','y','371300000000',0),(618,'371402000000','德城区','county','1','y','371400000000',0),(619,'371502000000','东昌府区','county','1','y','371500000000',0),(620,'371602000000','滨城区','county','1','y','371600000000',0),(621,'371702000000','牡丹区','county','1','y','371700000000',0),(622,'410102000000','中原区','county','1','y','410100000000',0),(623,'410202000000','龙亭区','county','1','y','410200000000',0),(624,'410302000000','老城区','county','1','y','410300000000',0),(625,'410402000000','新华区','county','1','y','410400000000',0),(626,'410502000000','文峰区','county','1','y','410500000000',0),(627,'410602000000','鹤山区','county','1','y','410600000000',0),(628,'410702000000','红旗区','county','1','y','410700000000',0),(629,'410802000000','解放区','county','1','y','410800000000',0),(630,'410902000000','华龙区','county','1','y','410900000000',0),(631,'411002000000','魏都区','county','1','y','411000000000',0),(632,'411102000000','源汇区','county','1','y','411100000000',0),(633,'411202000000','湖滨区','county','1','y','411200000000',0),(634,'411302000000','宛城区','county','1','y','411300000000',0),(635,'411402000000','梁园区','county','1','y','411400000000',0),(636,'411502000000','浉河区','county','1','y','411500000000',0),(637,'411602000000','川汇区','county','1','y','411600000000',0),(638,'411702000000','驿城区','county','1','y','411700000000',0),(639,'419001000000','济源市','county','1','y','41',0),(640,'420102000000','江岸区','county','1','y','420100000000',0),(641,'420202000000','黄石港区','county','1','y','420200000000',0),(642,'420302000000','茅箭区','county','1','y','420300000000',0),(643,'420502000000','西陵区','county','1','y','420500000000',0),(644,'420602000000','襄城区','county','1','y','420600000000',0),(645,'420702000000','梁子湖区','county','1','y','420700000000',0),(646,'420802000000','东宝区','county','1','y','420800000000',0),(647,'420902000000','孝南区','county','1','y','420900000000',0),(648,'421002000000','沙市区','county','1','y','421000000000',0),(649,'421102000000','黄州区','county','1','y','421100000000',0),(650,'421202000000','咸安区','county','1','y','421200000000',0),(651,'421303000000','曾都区','county','1','y','421300000000',0),(652,'422801000000','恩施市','county','1','y','422800000000',0),(653,'429004000000','仙桃市','county','1','y','42',0),(654,'430102000000','芙蓉区','county','1','y','430100000000',0),(655,'430202000000','荷塘区','county','1','y','430200000000',0),(656,'430302000000','雨湖区','county','1','y','430300000000',0),(657,'430405000000','珠晖区','county','1','y','430400000000',0),(658,'430502000000','双清区','county','1','y','430500000000',0),(659,'430602000000','岳阳楼区','county','1','y','430600000000',0),(660,'430702000000','武陵区','county','1','y','430700000000',0),(661,'430802000000','永定区','county','1','y','430800000000',0),(662,'430902000000','资阳区','county','1','y','430900000000',0),(663,'431002000000','北湖区','county','1','y','431000000000',0),(664,'431102000000','零陵区','county','1','y','431100000000',0),(665,'431202000000','鹤城区','county','1','y','431200000000',0),(666,'431302000000','娄星区','county','1','y','431300000000',0),(667,'433101000000','吉首市','county','1','y','433100000000',0),(668,'440103000000','荔湾区','county','1','y','440100000000',0),(669,'440203000000','武江区','county','1','y','440200000000',0),(670,'440303000000','罗湖区','county','1','y','440300000000',0),(671,'440402000000','香洲区','county','1','y','440400000000',0),(672,'440507000000','龙湖区','county','1','y','440500000000',0),(673,'440604000000','禅城区','county','1','y','440600000000',0),(674,'440703000000','蓬江区','county','1','y','440700000000',0),(675,'440802000000','赤坎区','county','1','y','440800000000',0),(676,'440902000000','茂南区','county','1','y','440900000000',0),(677,'441202000000','端州区','county','1','y','441200000000',0),(678,'441302000000','惠城区','county','1','y','441300000000',0),(679,'441402000000','梅江区','county','1','y','441400000000',0),(680,'441502000000','城区','county','1','y','441500000000',0),(681,'441602000000','源城区','county','1','y','441600000000',0),(682,'441702000000','江城区','county','1','y','441700000000',0),(683,'441802000000','清城区','county','1','y','441800000000',0),(684,'','东城街道办事处','county','1','y','00000000',0),(685,'','石岐区街道办事处','county','1','y','00000000',0),(686,'445102000000','湘桥区','county','1','y','445100000000',0),(687,'445202000000','榕城区','county','1','y','445200000000',0),(688,'445302000000','云城区','county','1','y','445300000000',0),(689,'450102000000','兴宁区','county','1','y','450100000000',0),(690,'450202000000','城中区','county','1','y','450200000000',0),(691,'450302000000','秀峰区','county','1','y','450300000000',0),(692,'450403000000','万秀区','county','1','y','450400000000',0),(693,'450502000000','海城区','county','1','y','450500000000',0),(694,'450602000000','港口区','county','1','y','450600000000',0),(695,'450702000000','钦南区','county','1','y','450700000000',0),(696,'450802000000','港北区','county','1','y','450800000000',0),(697,'450902000000','玉州区','county','1','y','450900000000',0),(698,'451002000000','右江区','county','1','y','451000000000',0),(699,'451102000000','八步区','county','1','y','451100000000',0),(700,'451202000000','金城江区','county','1','y','451200000000',0),(701,'451302000000','兴宾区','county','1','y','451300000000',0),(702,'451402000000','江洲区','county','1','y','451400000000',0),(703,'460105000000','秀英区','county','1','y','460100000000',0),(704,'','','county','1','y','00000000',0),(705,'469001000000','五指山市','county','1','y','46',0),(706,'500101000000','万州区','county','1','y','50',0),(707,'500223000000','潼南县','county','1','y','50',0),(708,'510104000000','锦江区','county','1','y','510100000000',0),(709,'510302000000','自流井区','county','1','y','510300000000',0),(710,'510402000000','东区','county','1','y','510400000000',0),(711,'510502000000','江阳区','county','1','y','510500000000',0),(712,'510603000000','旌阳区','county','1','y','510600000000',0),(713,'510703000000','涪城区','county','1','y','510700000000',0),(714,'510802000000','利州区','county','1','y','510800000000',0),(715,'510903000000','船山区','county','1','y','510900000000',0),(716,'511002000000','市中区','county','1','y','511000000000',0),(717,'511102000000','市中区','county','1','y','511100000000',0),(718,'511302000000','顺庆区','county','1','y','511300000000',0),(719,'511402000000','东坡区','county','1','y','511400000000',0),(720,'511502000000','翠屏区','county','1','y','511500000000',0),(721,'511602000000','广安区','county','1','y','511600000000',0),(722,'511702000000','通川区','county','1','y','511700000000',0),(723,'511802000000','雨城区','county','1','y','511800000000',0),(724,'511902000000','巴州区','county','1','y','511900000000',0),(725,'512002000000','雁江区','county','1','y','512000000000',0),(726,'513221000000','汶川县','county','1','y','513200000000',0),(727,'513321000000','康定县','county','1','y','513300000000',0),(728,'513401000000','西昌市','county','1','y','513400000000',0),(729,'520102000000','南明区','county','1','y','520100000000',0),(730,'520201000000','钟山区','county','1','y','520200000000',0),(731,'520302000000','红花岗区','county','1','y','520300000000',0),(732,'520402000000','西秀区','county','1','y','520400000000',0),(733,'520502000000','七星关区','county','1','y','520500000000',0),(734,'520602000000','碧江区','county','1','y','520600000000',0),(735,'522301000000','兴义市','county','1','y','522300000000',0),(736,'522601000000','凯里市','county','1','y','522600000000',0),(737,'522701000000','都匀市','county','1','y','522700000000',0),(738,'530102000000','五华区','county','1','y','530100000000',0),(739,'530302000000','麒麟区','county','1','y','530300000000',0),(740,'530402000000','红塔区','county','1','y','530400000000',0),(741,'530502000000','隆阳区','county','1','y','530500000000',0),(742,'530602000000','昭阳区','county','1','y','530600000000',0),(743,'530702000000','古城区','county','1','y','530700000000',0),(744,'530802000000','思茅区','county','1','y','530800000000',0),(745,'530902000000','临翔区','county','1','y','530900000000',0),(746,'532301000000','楚雄市','county','1','y','532300000000',0),(747,'532501000000','个旧市','county','1','y','532500000000',0),(748,'532601000000','文山市','county','1','y','532600000000',0),(749,'532801000000','景洪市','county','1','y','532800000000',0),(750,'532901000000','大理市','county','1','y','532900000000',0),(751,'533102000000','瑞丽市','county','1','y','533100000000',0),(752,'533321000000','泸水县','county','1','y','533300000000',0),(753,'533421000000','香格里拉县','county','1','y','533400000000',0),(754,'540102000000','城关区','county','1','y','540100000000',0),(755,'542121000000','昌都县','county','1','y','542100000000',0),(756,'542221000000','乃东县','county','1','y','542200000000',0),(757,'542301000000','日喀则市','county','1','y','542300000000',0),(758,'542421000000','那曲县','county','1','y','542400000000',0),(759,'542521000000','普兰县','county','1','y','542500000000',0),(760,'542621000000','林芝县','county','1','y','542600000000',0),(761,'610102000000','新城区','county','1','y','610100000000',0),(762,'610202000000','王益区','county','1','y','610200000000',0),(763,'610302000000','渭滨区','county','1','y','610300000000',0),(764,'610402000000','秦都区','county','1','y','610400000000',0),(765,'610502000000','临渭区','county','1','y','610500000000',0),(766,'610602000000','宝塔区','county','1','y','610600000000',0),(767,'610702000000','汉台区','county','1','y','610700000000',0),(768,'610802000000','榆阳区','county','1','y','610800000000',0),(769,'610902000000','汉滨区','county','1','y','610900000000',0),(770,'611002000000','商州区','county','1','y','611000000000',0),(771,'620102000000','城关区','county','1','y','620100000000',0),(772,'','','county','1','y','00000000',0),(773,'620302000000','金川区','county','1','y','620300000000',0),(774,'620402000000','白银区','county','1','y','620400000000',0),(775,'620502000000','秦州区','county','1','y','620500000000',0),(776,'620602000000','凉州区','county','1','y','620600000000',0),(777,'620702000000','甘州区','county','1','y','620700000000',0),(778,'620802000000','崆峒区','county','1','y','620800000000',0),(779,'620902000000','肃州区','county','1','y','620900000000',0),(780,'621002000000','西峰区','county','1','y','621000000000',0),(781,'621102000000','安定区','county','1','y','621100000000',0),(782,'621202000000','武都区','county','1','y','621200000000',0),(783,'622901000000','临夏市','county','1','y','622900000000',0),(784,'623001000000','合作市','county','1','y','623000000000',0),(785,'630102000000','城东区','county','1','y','630100000000',0),(786,'632121000000','平安县','county','1','y','632100000000',0),(787,'632221000000','门源回族自治县','county','1','y','632200000000',0),(788,'632321000000','同仁县','county','1','y','632300000000',0),(789,'632521000000','共和县','county','1','y','632500000000',0),(790,'632621000000','玛沁县','county','1','y','632600000000',0),(791,'632721000000','玉树县','county','1','y','632700000000',0),(792,'632801000000','格尔木市','county','1','y','632800000000',0),(793,'640104000000','兴庆区','county','1','y','640100000000',0),(794,'640202000000','大武口区','county','1','y','640200000000',0),(795,'640302000000','利通区','county','1','y','640300000000',0),(796,'640402000000','原州区','county','1','y','640400000000',0),(797,'640502000000','沙坡头区','county','1','y','640500000000',0),(798,'650102000000','天山区','county','1','y','650100000000',0),(799,'650202000000','独山子区','county','1','y','650200000000',0),(800,'652101000000','吐鲁番市','county','1','y','652100000000',0),(801,'652201000000','哈密市','county','1','y','652200000000',0),(802,'652301000000','昌吉市','county','1','y','652300000000',0),(803,'652701000000','博乐市','county','1','y','652700000000',0),(804,'652801000000','库尔勒市','county','1','y','652800000000',0),(805,'652901000000','阿克苏市','county','1','y','652900000000',0),(806,'653001000000','阿图什市','county','1','y','653000000000',0),(807,'653101000000','喀什市','county','1','y','653100000000',0),(808,'653201000000','和田市','county','1','y','653200000000',0),(809,'654002000000','伊宁市','county','1','y','654000000000',0),(810,'654201000000','塔城市','county','1','y','654200000000',0),(811,'654301000000','阿勒泰市','county','1','y','654300000000',0),(812,'659001000000','石河子市','county','1','y','65',0),(813,'110102000000','西城区','county','1','y','11',0),(814,'110105000000','朝阳区','county','1','y','11',0),(815,'110106000000','丰台区','county','1','y','11',0),(816,'110107000000','石景山区','county','1','y','11',0),(817,'110108000000','海淀区','county','1','y','11',0),(818,'110109000000','门头沟区','county','1','y','11',0),(819,'110111000000','房山区','county','1','y','11',0),(820,'110112000000','通州区','county','1','y','11',0),(821,'110113000000','顺义区','county','1','y','11',0),(822,'110114000000','昌平区','county','1','y','11',0),(823,'110115000000','大兴区','county','1','y','11',0),(824,'110116000000','怀柔区','county','1','y','11',0),(825,'110117000000','平谷区','county','1','y','11',0),(826,'110229000000','延庆县','county','1','y','11',0),(827,'120102000000','河东区','county','1','y','12',0),(828,'120103000000','河西区','county','1','y','12',0),(829,'120104000000','南开区','county','1','y','12',0),(830,'120105000000','河北区','county','1','y','12',0),(831,'120106000000','红桥区','county','1','y','12',0),(832,'120110000000','东丽区','county','1','y','12',0),(833,'120111000000','西青区','county','1','y','12',0),(834,'120112000000','津南区','county','1','y','12',0),(835,'120113000000','北辰区','county','1','y','12',0),(836,'120114000000','武清区','county','1','y','12',0),(837,'120115000000','宝坻区','county','1','y','12',0),(838,'120116000000','滨海新区','county','1','y','12',0),(839,'120223000000','静海县','county','1','y','12',0),(840,'120225000000','蓟县','county','1','y','12',0),(841,'130103000000','桥东区','county','1','y','130100000000',0),(842,'130104000000','桥西区','county','1','y','130100000000',0),(843,'130105000000','新华区','county','1','y','130100000000',0),(844,'130107000000','井陉矿区','county','1','y','130100000000',0),(845,'130108000000','裕华区','county','1','y','130100000000',0),(846,'130121000000','井陉县','county','1','y','130100000000',0),(847,'130123000000','正定县','county','1','y','130100000000',0),(848,'130124000000','栾城县','county','1','y','130100000000',0),(849,'130125000000','行唐县','county','1','y','130100000000',0),(850,'130126000000','灵寿县','county','1','y','130100000000',0),(851,'130127000000','高邑县','county','1','y','130100000000',0),(852,'130128000000','深泽县','county','1','y','130100000000',0),(853,'130129000000','赞皇县','county','1','y','130100000000',0),(854,'130130000000','无极县','county','1','y','130100000000',0),(855,'130131000000','平山县','county','1','y','130100000000',0),(856,'130132000000','元氏县','county','1','y','130100000000',0),(857,'130133000000','赵县','county','1','y','130100000000',0),(858,'130181000000','辛集市','county','1','y','130100000000',0),(859,'130182000000','藁城市','county','1','y','130100000000',0),(860,'130183000000','晋州市','county','1','y','130100000000',0),(861,'130184000000','新乐市','county','1','y','130100000000',0),(862,'130185000000','鹿泉市','county','1','y','130100000000',0),(863,'130203000000','路北区','county','1','y','130200000000',0),(864,'130204000000','古冶区','county','1','y','130200000000',0),(865,'130205000000','开平区','county','1','y','130200000000',0),(866,'130207000000','丰南区','county','1','y','130200000000',0),(867,'130208000000','丰润区','county','1','y','130200000000',0),(868,'130223000000','滦县','county','1','y','130200000000',0),(869,'130224000000','滦南县','county','1','y','130200000000',0),(870,'130225000000','乐亭县','county','1','y','130200000000',0),(871,'130227000000','迁西县','county','1','y','130200000000',0),(872,'130229000000','玉田县','county','1','y','130200000000',0),(873,'130230000000','唐海县','county','1','y','130200000000',0),(874,'130281000000','遵化市','county','1','y','130200000000',0),(875,'130283000000','迁安市','county','1','y','130200000000',0),(876,'130303000000','山海关区','county','1','y','130300000000',0),(877,'130304000000','北戴河区','county','1','y','130300000000',0),(878,'130321000000','青龙满族自治县','county','1','y','130300000000',0),(879,'130322000000','昌黎县','county','1','y','130300000000',0),(880,'130323000000','抚宁县','county','1','y','130300000000',0),(881,'130324000000','卢龙县','county','1','y','130300000000',0),(882,'130403000000','丛台区','county','1','y','130400000000',0),(883,'130404000000','复兴区','county','1','y','130400000000',0),(884,'130406000000','峰峰矿区','county','1','y','130400000000',0),(885,'130421000000','邯郸县','county','1','y','130400000000',0),(886,'130423000000','临漳县','county','1','y','130400000000',0),(887,'130424000000','成安县','county','1','y','130400000000',0),(888,'130425000000','大名县','county','1','y','130400000000',0),(889,'130426000000','涉县','county','1','y','130400000000',0),(890,'130427000000','磁县','county','1','y','130400000000',0),(891,'130428000000','肥乡县','county','1','y','130400000000',0),(892,'130429000000','永年县','county','1','y','130400000000',0),(893,'130430000000','邱县','county','1','y','130400000000',0),(894,'130431000000','鸡泽县','county','1','y','130400000000',0),(895,'130432000000','广平县','county','1','y','130400000000',0),(896,'130433000000','馆陶县','county','1','y','130400000000',0),(897,'130434000000','魏县','county','1','y','130400000000',0),(898,'130435000000','曲周县','county','1','y','130400000000',0),(899,'130481000000','武安市','county','1','y','130400000000',0),(900,'130503000000','桥西区','county','1','y','130500000000',0),(901,'130521000000','邢台县','county','1','y','130500000000',0),(902,'130522000000','临城县','county','1','y','130500000000',0),(903,'130523000000','内丘县','county','1','y','130500000000',0),(904,'130524000000','柏乡县','county','1','y','130500000000',0),(905,'130525000000','隆尧县','county','1','y','130500000000',0),(906,'130526000000','任县','county','1','y','130500000000',0),(907,'130527000000','南和县','county','1','y','130500000000',0),(908,'130528000000','宁晋县','county','1','y','130500000000',0),(909,'130529000000','巨鹿县','county','1','y','130500000000',0),(910,'130530000000','新河县','county','1','y','130500000000',0),(911,'130531000000','广宗县','county','1','y','130500000000',0),(912,'130532000000','平乡县','county','1','y','130500000000',0),(913,'130533000000','威县','county','1','y','130500000000',0),(914,'130534000000','清河县','county','1','y','130500000000',0),(915,'130535000000','临西县','county','1','y','130500000000',0),(916,'130581000000','南宫市','county','1','y','130500000000',0),(917,'130582000000','沙河市','county','1','y','130500000000',0),(918,'130603000000','北市区','county','1','y','130600000000',0),(919,'130604000000','南市区','county','1','y','130600000000',0),(920,'130621000000','满城县','county','1','y','130600000000',0),(921,'130622000000','清苑县','county','1','y','130600000000',0),(922,'130623000000','涞水县','county','1','y','130600000000',0),(923,'130624000000','阜平县','county','1','y','130600000000',0),(924,'130625000000','徐水县','county','1','y','130600000000',0),(925,'130626000000','定兴县','county','1','y','130600000000',0),(926,'130627000000','唐县','county','1','y','130600000000',0),(927,'130628000000','高阳县','county','1','y','130600000000',0),(928,'130629000000','容城县','county','1','y','130600000000',0),(929,'130630000000','涞源县','county','1','y','130600000000',0),(930,'130631000000','望都县','county','1','y','130600000000',0),(931,'130632000000','安新县','county','1','y','130600000000',0),(932,'130633000000','易县','county','1','y','130600000000',0),(933,'130634000000','曲阳县','county','1','y','130600000000',0),(934,'130635000000','蠡县','county','1','y','130600000000',0),(935,'130636000000','顺平县','county','1','y','130600000000',0),(936,'130637000000','博野县','county','1','y','130600000000',0),(937,'130638000000','雄县','county','1','y','130600000000',0),(938,'130681000000','涿州市','county','1','y','130600000000',0),(939,'130682000000','定州市','county','1','y','130600000000',0),(940,'130683000000','安国市','county','1','y','130600000000',0),(941,'130684000000','高碑店市','county','1','y','130600000000',0),(942,'130703000000','桥西区','county','1','y','130700000000',0),(943,'130705000000','宣化区','county','1','y','130700000000',0),(944,'130706000000','下花园区','county','1','y','130700000000',0),(945,'130721000000','宣化县','county','1','y','130700000000',0),(946,'130722000000','张北县','county','1','y','130700000000',0),(947,'130723000000','康保县','county','1','y','130700000000',0),(948,'130724000000','沽源县','county','1','y','130700000000',0),(949,'130725000000','尚义县','county','1','y','130700000000',0),(950,'130726000000','蔚县','county','1','y','130700000000',0),(951,'130727000000','阳原县','county','1','y','130700000000',0),(952,'130728000000','怀安县','county','1','y','130700000000',0),(953,'130729000000','万全县','county','1','y','130700000000',0),(954,'130730000000','怀来县','county','1','y','130700000000',0),(955,'130731000000','涿鹿县','county','1','y','130700000000',0),(956,'130732000000','赤城县','county','1','y','130700000000',0),(957,'130733000000','崇礼县','county','1','y','130700000000',0),(958,'130803000000','双滦区','county','1','y','130800000000',0),(959,'130804000000','鹰手营子矿区','county','1','y','130800000000',0),(960,'130821000000','承德县','county','1','y','130800000000',0),(961,'130822000000','兴隆县','county','1','y','130800000000',0),(962,'130823000000','平泉县','county','1','y','130800000000',0),(963,'130824000000','滦平县','county','1','y','130800000000',0),(964,'130825000000','隆化县','county','1','y','130800000000',0),(965,'130826000000','丰宁满族自治县','county','1','y','130800000000',0),(966,'130827000000','宽城满族自治县','county','1','y','130800000000',0),(967,'130828000000','围场满族蒙古族自治县','county','1','y','130800000000',0),(968,'130903000000','运河区','county','1','y','130900000000',0),(969,'130921000000','沧县','county','1','y','130900000000',0),(970,'130922000000','青县','county','1','y','130900000000',0),(971,'130923000000','东光县','county','1','y','130900000000',0),(972,'130924000000','海兴县','county','1','y','130900000000',0),(973,'130925000000','盐山县','county','1','y','130900000000',0),(974,'130926000000','肃宁县','county','1','y','130900000000',0),(975,'130927000000','南皮县','county','1','y','130900000000',0),(976,'130928000000','吴桥县','county','1','y','130900000000',0),(977,'130929000000','献县','county','1','y','130900000000',0),(978,'130930000000','孟村回族自治县','county','1','y','130900000000',0),(979,'130981000000','泊头市','county','1','y','130900000000',0),(980,'130982000000','任丘市','county','1','y','130900000000',0),(981,'130983000000','黄骅市','county','1','y','130900000000',0),(982,'130984000000','河间市','county','1','y','130900000000',0),(983,'131003000000','广阳区','county','1','y','131000000000',0),(984,'131022000000','固安县','county','1','y','131000000000',0),(985,'131023000000','永清县','county','1','y','131000000000',0),(986,'131024000000','香河县','county','1','y','131000000000',0),(987,'131025000000','大城县','county','1','y','131000000000',0),(988,'131026000000','文安县','county','1','y','131000000000',0),(989,'131028000000','大厂回族自治县','county','1','y','131000000000',0),(2249,'430104000000','岳麓区','county','1','y','430100000000',0),(2250,'430105000000','开福区','county','1','y','430100000000',0),(2251,'430111000000','雨花区','county','1','y','430100000000',0),(2252,'430112000000','望城区','county','1','y','430100000000',0),(2253,'430121000000','长沙县','county','1','y','430100000000',0),(2254,'430124000000','宁乡县','county','1','y','430100000000',0),(2255,'430181000000','浏阳市','county','1','y','430100000000',0),(2256,'430203000000','芦淞区','county','1','y','430200000000',0),(2257,'430204000000','石峰区','county','1','y','430200000000',0),(2258,'430211000000','天元区','county','1','y','430200000000',0),(2259,'430221000000','株洲县','county','1','y','430200000000',0),(2260,'430223000000','攸县','county','1','y','430200000000',0),(2261,'430224000000','茶陵县','county','1','y','430200000000',0),(2262,'430225000000','炎陵县','county','1','y','430200000000',0),(2263,'430281000000','醴陵市','county','1','y','430200000000',0),(2264,'430304000000','岳塘区','county','1','y','430300000000',0),(2265,'430321000000','湘潭县','county','1','y','430300000000',0),(2266,'430381000000','湘乡市','county','1','y','430300000000',0),(2267,'430382000000','韶山市','county','1','y','430300000000',0),(2268,'430406000000','雁峰区','county','1','y','430400000000',0),(2269,'430407000000','石鼓区','county','1','y','430400000000',0),(2270,'430408000000','蒸湘区','county','1','y','430400000000',0),(2271,'430412000000','南岳区','county','1','y','430400000000',0),(2272,'430421000000','衡阳县','county','1','y','430400000000',0),(2273,'430422000000','衡南县','county','1','y','430400000000',0),(2274,'430423000000','衡山县','county','1','y','430400000000',0),(2275,'430424000000','衡东县','county','1','y','430400000000',0),(2276,'430426000000','祁东县','county','1','y','430400000000',0),(2277,'430481000000','耒阳市','county','1','y','430400000000',0),(2278,'430482000000','常宁市','county','1','y','430400000000',0),(2279,'430503000000','大祥区','county','1','y','430500000000',0),(2280,'430511000000','北塔区','county','1','y','430500000000',0),(2281,'430521000000','邵东县','county','1','y','430500000000',0),(2282,'430522000000','新邵县','county','1','y','430500000000',0),(2283,'430523000000','邵阳县','county','1','y','430500000000',0),(2284,'430524000000','隆回县','county','1','y','430500000000',0),(2285,'430525000000','洞口县','county','1','y','430500000000',0),(2286,'430527000000','绥宁县','county','1','y','430500000000',0),(2287,'430528000000','新宁县','county','1','y','430500000000',0),(2288,'430529000000','城步苗族自治县','county','1','y','430500000000',0),(2289,'430581000000','武冈市','county','1','y','430500000000',0),(2290,'430603000000','云溪区','county','1','y','430600000000',0),(2291,'430611000000','君山区','county','1','y','430600000000',0),(2292,'430621000000','岳阳县','county','1','y','430600000000',0),(2293,'430623000000','华容县','county','1','y','430600000000',0),(2294,'430624000000','湘阴县','county','1','y','430600000000',0),(2295,'430626000000','平江县','county','1','y','430600000000',0),(2296,'430681000000','汨罗市','county','1','y','430600000000',0),(2297,'430682000000','临湘市','county','1','y','430600000000',0),(2298,'430703000000','鼎城区','county','1','y','430700000000',0),(2299,'430721000000','安乡县','county','1','y','430700000000',0),(2300,'430722000000','汉寿县','county','1','y','430700000000',0),(2301,'430723000000','澧县','county','1','y','430700000000',0),(2302,'430724000000','临澧县','county','1','y','430700000000',0),(2303,'430725000000','桃源县','county','1','y','430700000000',0),(2304,'430726000000','石门县','county','1','y','430700000000',0),(2305,'430781000000','津市市','county','1','y','430700000000',0),(2306,'430811000000','武陵源区','county','1','y','430800000000',0),(2307,'430821000000','慈利县','county','1','y','430800000000',0),(2308,'430822000000','桑植县','county','1','y','430800000000',0),(2309,'430903000000','赫山区','county','1','y','430900000000',0),(2310,'430921000000','南县','county','1','y','430900000000',0),(2311,'430922000000','桃江县','county','1','y','430900000000',0),(2312,'430923000000','安化县','county','1','y','430900000000',0),(2313,'430981000000','沅江市','county','1','y','430900000000',0),(2314,'431003000000','苏仙区','county','1','y','431000000000',0),(2315,'431021000000','桂阳县','county','1','y','431000000000',0),(2316,'431022000000','宜章县','county','1','y','431000000000',0),(2317,'431023000000','永兴县','county','1','y','431000000000',0),(2318,'431024000000','嘉禾县','county','1','y','431000000000',0),(2319,'431025000000','临武县','county','1','y','431000000000',0),(2320,'431026000000','汝城县','county','1','y','431000000000',0),(2321,'431027000000','桂东县','county','1','y','431000000000',0),(2322,'431028000000','安仁县','county','1','y','431000000000',0),(2323,'431081000000','资兴市','county','1','y','431000000000',0),(2324,'431103000000','冷水滩区','county','1','y','431100000000',0),(2325,'431121000000','祁阳县','county','1','y','431100000000',0),(2326,'431122000000','东安县','county','1','y','431100000000',0),(2327,'431123000000','双牌县','county','1','y','431100000000',0),(2328,'431124000000','道县','county','1','y','431100000000',0),(2329,'431125000000','江永县','county','1','y','431100000000',0),(2330,'431126000000','宁远县','county','1','y','431100000000',0),(2331,'431127000000','蓝山县','county','1','y','431100000000',0),(2332,'431128000000','新田县','county','1','y','431100000000',0),(2333,'431129000000','江华瑶族自治县','county','1','y','431100000000',0),(2334,'431221000000','中方县','county','1','y','431200000000',0),(2335,'431222000000','沅陵县','county','1','y','431200000000',0),(2336,'431223000000','辰溪县','county','1','y','431200000000',0),(2337,'431224000000','溆浦县','county','1','y','431200000000',0),(2338,'431225000000','会同县','county','1','y','431200000000',0),(2339,'431226000000','麻阳苗族自治县','county','1','y','431200000000',0),(2340,'431227000000','新晃侗族自治县','county','1','y','431200000000',0),(2341,'431228000000','芷江侗族自治县','county','1','y','431200000000',0),(2342,'431229000000','靖州苗族侗族自治县','county','1','y','431200000000',0),(2343,'431230000000','通道侗族自治县','county','1','y','431200000000',0),(2344,'431281000000','洪江市','county','1','y','431200000000',0),(2345,'431321000000','双峰县','county','1','y','431300000000',0),(2346,'431322000000','新化县','county','1','y','431300000000',0),(2347,'431381000000','冷水江市','county','1','y','431300000000',0),(2348,'431382000000','涟源市','county','1','y','431300000000',0),(2349,'433122000000','泸溪县','county','1','y','433100000000',0),(2350,'433123000000','凤凰县','county','1','y','433100000000',0),(2351,'433124000000','花垣县','county','1','y','433100000000',0),(2352,'433125000000','保靖县','county','1','y','433100000000',0),(2353,'433126000000','古丈县','county','1','y','433100000000',0),(2354,'433127000000','永顺县','county','1','y','433100000000',0),(2355,'433130000000','龙山县','county','1','y','433100000000',0),(2356,'440104000000','越秀区','county','1','y','440100000000',0),(2357,'440105000000','海珠区','county','1','y','440100000000',0),(2358,'440106000000','天河区','county','1','y','440100000000',0),(2359,'440111000000','白云区','county','1','y','440100000000',0),(2360,'440112000000','黄埔区','county','1','y','440100000000',0),(2361,'440113000000','番禺区','county','1','y','440100000000',0),(2362,'440114000000','花都区','county','1','y','440100000000',0),(2363,'440115000000','南沙区','county','1','y','440100000000',0),(2364,'440116000000','萝岗区','county','1','y','440100000000',0),(2365,'440183000000','增城市','county','1','y','440100000000',0),(2366,'440184000000','从化市','county','1','y','440100000000',0),(2367,'440204000000','浈江区','county','1','y','440200000000',0),(2368,'440205000000','曲江区','county','1','y','440200000000',0),(2369,'440222000000','始兴县','county','1','y','440200000000',0),(2370,'440224000000','仁化县','county','1','y','440200000000',0),(2371,'440229000000','翁源县','county','1','y','440200000000',0),(2372,'440232000000','乳源瑶族自治县','county','1','y','440200000000',0),(2373,'440233000000','新丰县','county','1','y','440200000000',0),(2374,'440281000000','乐昌市','county','1','y','440200000000',0),(2375,'440282000000','南雄市','county','1','y','440200000000',0),(2376,'440304000000','福田区','county','1','y','440300000000',0),(2377,'440305000000','南山区','county','1','y','440300000000',0),(2378,'440306000000','宝安区','county','1','y','440300000000',0),(2379,'440307000000','龙岗区','county','1','y','440300000000',0),(2380,'440308000000','盐田区','county','1','y','440300000000',0),(2381,'440403000000','斗门区','county','1','y','440400000000',0),(2382,'440404000000','金湾区','county','1','y','440400000000',0),(2383,'440511000000','金平区','county','1','y','440500000000',0),(2384,'440512000000','濠江区','county','1','y','440500000000',0),(2385,'440513000000','潮阳区','county','1','y','440500000000',0),(2386,'440514000000','潮南区','county','1','y','440500000000',0),(2387,'440515000000','澄海区','county','1','y','440500000000',0),(2388,'440523000000','南澳县','county','1','y','440500000000',0),(2389,'440605000000','南海区','county','1','y','440600000000',0),(2390,'440606000000','顺德区','county','1','y','440600000000',0),(2391,'440607000000','三水区','county','1','y','440600000000',0),(2392,'440608000000','高明区','county','1','y','440600000000',0),(2393,'440704000000','江海区','county','1','y','440700000000',0),(2394,'440705000000','新会区','county','1','y','440700000000',0),(2395,'440781000000','台山市','county','1','y','440700000000',0),(2396,'440783000000','开平市','county','1','y','440700000000',0),(2397,'440784000000','鹤山市','county','1','y','440700000000',0),(2398,'440785000000','恩平市','county','1','y','440700000000',0),(2399,'440803000000','霞山区','county','1','y','440800000000',0),(2400,'440804000000','坡头区','county','1','y','440800000000',0),(2401,'440811000000','麻章区','county','1','y','440800000000',0),(2402,'440823000000','遂溪县','county','1','y','440800000000',0),(2403,'440825000000','徐闻县','county','1','y','440800000000',0),(2404,'440881000000','廉江市','county','1','y','440800000000',0),(2405,'440882000000','雷州市','county','1','y','440800000000',0),(2406,'440883000000','吴川市','county','1','y','440800000000',0),(2407,'440903000000','茂港区','county','1','y','440900000000',0),(2408,'440923000000','电白县','county','1','y','440900000000',0),(2409,'440981000000','高州市','county','1','y','440900000000',0),(2410,'440982000000','化州市','county','1','y','440900000000',0),(2411,'440983000000','信宜市','county','1','y','440900000000',0),(2412,'441203000000','鼎湖区','county','1','y','441200000000',0),(2413,'441223000000','广宁县','county','1','y','441200000000',0),(2414,'441224000000','怀集县','county','1','y','441200000000',0),(2415,'441225000000','封开县','county','1','y','441200000000',0),(2416,'441226000000','德庆县','county','1','y','441200000000',0),(2417,'441283000000','高要市','county','1','y','441200000000',0),(2418,'441284000000','四会市','county','1','y','441200000000',0),(2419,'441303000000','惠阳区','county','1','y','441300000000',0),(2420,'441322000000','博罗县','county','1','y','441300000000',0),(2421,'441323000000','惠东县','county','1','y','441300000000',0),(2422,'441324000000','龙门县','county','1','y','441300000000',0),(2423,'441421000000','梅县','county','1','y','441400000000',0),(2424,'441422000000','大埔县','county','1','y','441400000000',0),(2425,'441423000000','丰顺县','county','1','y','441400000000',0),(2426,'441424000000','五华县','county','1','y','441400000000',0),(2427,'441426000000','平远县','county','1','y','441400000000',0),(2428,'441427000000','蕉岭县','county','1','y','441400000000',0),(2429,'441481000000','兴宁市','county','1','y','441400000000',0),(2430,'441521000000','海丰县','county','1','y','441500000000',0),(2431,'441523000000','陆河县','county','1','y','441500000000',0),(2432,'441581000000','陆丰市','county','1','y','441500000000',0),(2433,'441621000000','紫金县','county','1','y','441600000000',0),(2434,'441622000000','龙川县','county','1','y','441600000000',0),(2435,'441623000000','连平县','county','1','y','441600000000',0),(2436,'441624000000','和平县','county','1','y','441600000000',0),(2437,'441625000000','东源县','county','1','y','441600000000',0),(2438,'441721000000','阳西县','county','1','y','441700000000',0),(2439,'441723000000','阳东县','county','1','y','441700000000',0),(2440,'441781000000','阳春市','county','1','y','441700000000',0),(2441,'441821000000','佛冈县','county','1','y','441800000000',0),(2442,'441823000000','阳山县','county','1','y','441800000000',0),(2443,'441825000000','连山壮族瑶族自治县','county','1','y','441800000000',0),(2444,'441826000000','连南瑶族自治县','county','1','y','441800000000',0),(2445,'441827000000','清新县','county','1','y','441800000000',0),(2446,'441881000000','英德市','county','1','y','441800000000',0),(2447,'441882000000','连州市','county','1','y','441800000000',0),(2448,'','南城街道办事处','county','1','y','00000000',0),(2449,'','万江街道办事处','county','1','y','00000000',0),(2450,'','莞城街道办事处','county','1','y','00000000',0),(2451,'','石碣镇','county','1','y','00000000',0),(2452,'','石龙镇','county','1','y','00000000',0),(2453,'','茶山镇','county','1','y','00000000',0),(2454,'','石排镇','county','1','y','00000000',0),(2455,'','企石镇','county','1','y','00000000',0),(2456,'','横沥镇','county','1','y','00000000',0),(2457,'','桥头镇','county','1','y','00000000',0),(2458,'','谢岗镇','county','1','y','00000000',0),(2459,'','东坑镇','county','1','y','00000000',0),(2460,'','常平镇','county','1','y','00000000',0),(2461,'','寮步镇','county','1','y','00000000',0),(2462,'','樟木头镇','county','1','y','00000000',0),(2463,'','大朗镇','county','1','y','00000000',0),(2464,'','黄江镇','county','1','y','00000000',0),(2465,'','清溪镇','county','1','y','00000000',0),(2466,'','塘厦镇','county','1','y','00000000',0),(2467,'','凤岗镇','county','1','y','00000000',0),(2468,'','大岭山镇','county','1','y','00000000',0),(2469,'','长安镇','county','1','y','00000000',0),(2470,'','虎门镇','county','1','y','00000000',0),(2471,'','厚街镇','county','1','y','00000000',0),(2472,'','沙田镇','county','1','y','00000000',0),(2473,'','道滘镇','county','1','y','00000000',0),(2474,'','洪梅镇','county','1','y','00000000',0),(2475,'','麻涌镇','county','1','y','00000000',0),(2476,'','望牛墩镇','county','1','y','00000000',0),(2477,'','中堂镇','county','1','y','00000000',0),(2478,'','高埗镇','county','1','y','00000000',0),(2479,'','松山湖管委会','county','1','y','00000000',0),(2480,'','虎门港管委会','county','1','y','00000000',0),(2481,'','东莞生态园','county','1','y','00000000',0),(2482,'','东区街道办事处','county','1','y','00000000',0),(2483,'','火炬开发区街道办事处','county','1','y','00000000',0),(2484,'','西区街道办事处','county','1','y','00000000',0),(2485,'','南区街道办事处','county','1','y','00000000',0),(2486,'','五桂山街道办事处','county','1','y','00000000',0),(2487,'','小榄镇','county','1','y','00000000',0),(2488,'','黄圃镇','county','1','y','00000000',0),(2489,'','民众镇','county','1','y','00000000',0),(2490,'','东凤镇','county','1','y','00000000',0),(2491,'','东升镇','county','1','y','00000000',0),(2492,'','古镇镇','county','1','y','00000000',0),(2493,'','沙溪镇','county','1','y','00000000',0),(2494,'','坦洲镇','county','1','y','00000000',0),(2495,'','港口镇','county','1','y','00000000',0),(2496,'','三角镇','county','1','y','00000000',0),(2497,'','横栏镇','county','1','y','00000000',0),(2498,'','南头镇','county','1','y','00000000',0),(2499,'','阜沙镇','county','1','y','00000000',0),(2500,'','南朗镇','county','1','y','00000000',0),(2501,'','三乡镇','county','1','y','00000000',0),(2502,'','板芙镇','county','1','y','00000000',0),(2503,'','大涌镇','county','1','y','00000000',0),(2504,'','神湾镇','county','1','y','00000000',0),(2505,'445121000000','潮安县','county','1','y','445100000000',0),(2506,'445122000000','饶平县','county','1','y','445100000000',0),(2507,'445221000000','揭东县','county','1','y','445200000000',0),(2508,'445222000000','揭西县','county','1','y','445200000000',0),(2509,'445224000000','惠来县','county','1','y','445200000000',0),(2510,'445281000000','普宁市','county','1','y','445200000000',0),(2511,'445321000000','新兴县','county','1','y','445300000000',0),(2512,'445322000000','郁南县','county','1','y','445300000000',0),(2513,'445323000000','云安县','county','1','y','445300000000',0),(2514,'445381000000','罗定市','county','1','y','445300000000',0),(2515,'450103000000','青秀区','county','1','y','450100000000',0),(2516,'450105000000','江南区','county','1','y','450100000000',0),(2517,'450107000000','西乡塘区','county','1','y','450100000000',0),(2518,'450108000000','良庆区','county','1','y','450100000000',0),(2519,'450109000000','邕宁区','county','1','y','450100000000',0),(2520,'450122000000','武鸣县','county','1','y','450100000000',0),(2521,'450123000000','隆安县','county','1','y','450100000000',0),(2522,'450124000000','马山县','county','1','y','450100000000',0),(2523,'450125000000','上林县','county','1','y','450100000000',0),(2524,'450126000000','宾阳县','county','1','y','450100000000',0),(2525,'450127000000','横县','county','1','y','450100000000',0),(2526,'450203000000','鱼峰区','county','1','y','450200000000',0),(2527,'450204000000','柳南区','county','1','y','450200000000',0),(2528,'450205000000','柳北区','county','1','y','450200000000',0),(2529,'450221000000','柳江县','county','1','y','450200000000',0),(2530,'450222000000','柳城县','county','1','y','450200000000',0),(2531,'450223000000','鹿寨县','county','1','y','450200000000',0),(2532,'450224000000','融安县','county','1','y','450200000000',0),(2533,'450225000000','融水苗族自治县','county','1','y','450200000000',0),(2534,'450226000000','三江侗族自治县','county','1','y','450200000000',0),(2535,'450303000000','叠彩区','county','1','y','450300000000',0),(2536,'450304000000','象山区','county','1','y','450300000000',0),(2537,'450305000000','七星区','county','1','y','450300000000',0),(2538,'450311000000','雁山区','county','1','y','450300000000',0),(2539,'450321000000','阳朔县','county','1','y','450300000000',0),(2540,'450322000000','临桂县','county','1','y','450300000000',0),(2541,'450323000000','灵川县','county','1','y','450300000000',0),(2542,'450324000000','全州县','county','1','y','450300000000',0),(2543,'450325000000','兴安县','county','1','y','450300000000',0),(2544,'450326000000','永福县','county','1','y','450300000000',0),(2545,'450327000000','灌阳县','county','1','y','450300000000',0),(2546,'450328000000','龙胜各族自治县','county','1','y','450300000000',0),(2547,'450329000000','资源县','county','1','y','450300000000',0),(2548,'450330000000','平乐县','county','1','y','450300000000',0),(2549,'450331000000','荔蒲县','county','1','y','450300000000',0),(2550,'450332000000','恭城瑶族自治县','county','1','y','450300000000',0),(2551,'450404000000','蝶山区','county','1','y','450400000000',0),(2552,'450405000000','长洲区','county','1','y','450400000000',0),(2553,'450421000000','苍梧县','county','1','y','450400000000',0),(2554,'450422000000','藤县','county','1','y','450400000000',0),(2555,'450423000000','蒙山县','county','1','y','450400000000',0),(2556,'450481000000','岑溪市','county','1','y','450400000000',0),(2557,'450503000000','银海区','county','1','y','450500000000',0),(2558,'450512000000','铁山港区','county','1','y','450500000000',0),(2559,'450521000000','合浦县','county','1','y','450500000000',0),(2560,'450603000000','防城区','county','1','y','450600000000',0),(2561,'450621000000','上思县','county','1','y','450600000000',0),(2562,'450681000000','东兴市','county','1','y','450600000000',0),(2563,'450703000000','钦北区','county','1','y','450700000000',0),(2564,'450721000000','灵山县','county','1','y','450700000000',0),(2565,'450722000000','浦北县','county','1','y','450700000000',0),(2566,'450803000000','港南区','county','1','y','450800000000',0),(2567,'450804000000','覃塘区','county','1','y','450800000000',0),(2568,'450821000000','平南县','county','1','y','450800000000',0),(2569,'450881000000','桂平市','county','1','y','450800000000',0),(2570,'450921000000','容县','county','1','y','450900000000',0),(2571,'450922000000','陆川县','county','1','y','450900000000',0),(2572,'450923000000','博白县','county','1','y','450900000000',0),(2573,'450924000000','兴业县','county','1','y','450900000000',0),(2574,'450981000000','北流市','county','1','y','450900000000',0),(2575,'451021000000','田阳县','county','1','y','451000000000',0),(2576,'451022000000','田东县','county','1','y','451000000000',0),(2577,'451023000000','平果县','county','1','y','451000000000',0),(2578,'451024000000','德保县','county','1','y','451000000000',0),(2579,'451025000000','靖西县','county','1','y','451000000000',0),(2580,'451026000000','那坡县','county','1','y','451000000000',0),(2581,'451027000000','凌云县','county','1','y','451000000000',0),(2582,'451028000000','乐业县','county','1','y','451000000000',0),(2583,'451029000000','田林县','county','1','y','451000000000',0),(2584,'451030000000','西林县','county','1','y','451000000000',0),(2585,'451031000000','隆林各族自治县','county','1','y','451000000000',0),(2586,'451119000000','平桂管理区','county','1','y','451100000000',0),(2587,'451121000000','昭平县','county','1','y','451100000000',0),(2588,'451122000000','钟山县','county','1','y','451100000000',0),(2589,'451123000000','富川瑶族自治县','county','1','y','451100000000',0),(2590,'451221000000','南丹县','county','1','y','451200000000',0),(2591,'451222000000','天峨县','county','1','y','451200000000',0),(2592,'451223000000','凤山县','county','1','y','451200000000',0),(2593,'451224000000','东兰县','county','1','y','451200000000',0),(2594,'451225000000','罗城仫佬族自治县','county','1','y','451200000000',0),(2595,'451226000000','环江毛南族自治县','county','1','y','451200000000',0),(2596,'451227000000','巴马瑶族自治县','county','1','y','451200000000',0),(2597,'451228000000','都安瑶族自治县','county','1','y','451200000000',0),(2598,'451229000000','大化瑶族自治县','county','1','y','451200000000',0),(2599,'451281000000','宜州市','county','1','y','451200000000',0),(2600,'451321000000','忻城县','county','1','y','451300000000',0),(2601,'451322000000','象州县','county','1','y','451300000000',0),(2602,'451323000000','武宣县','county','1','y','451300000000',0),(2603,'451324000000','金秀瑶族自治县','county','1','y','451300000000',0),(2604,'451381000000','合山市','county','1','y','451300000000',0),(2605,'451421000000','扶绥县','county','1','y','451400000000',0),(2606,'451422000000','宁明县','county','1','y','451400000000',0),(2607,'451423000000','龙州县','county','1','y','451400000000',0),(2608,'451424000000','大新县','county','1','y','451400000000',0),(2609,'451425000000','天等县','county','1','y','451400000000',0),(2610,'451481000000','凭祥市','county','1','y','451400000000',0),(2611,'460106000000','龙华区','county','1','y','460100000000',0),(2612,'460107000000','琼山区','county','1','y','460100000000',0),(2613,'460108000000','美兰区','county','1','y','460100000000',0),(2614,'469002000000','琼海市','county','1','y','46',0),(2615,'469003000000','儋州市','county','1','y','46',0),(2616,'469005000000','文昌市','county','1','y','46',0),(2617,'469006000000','万宁市','county','1','y','46',0),(2618,'469007000000','东方市','county','1','y','46',0),(2619,'469021000000','定安县','county','1','y','46',0),(2620,'469022000000','屯昌县','county','1','y','46',0),(2621,'469023000000','澄迈县','county','1','y','46',0),(2622,'469024000000','临高县','county','1','y','46',0),(2623,'469025000000','白沙黎族自治县','county','1','y','46',0),(2624,'469026000000','昌江黎族自治县','county','1','y','46',0),(2625,'469027000000','乐东黎族自治县','county','1','y','46',0),(2626,'469028000000','陵水黎族自治县','county','1','y','46',0),(2627,'469029000000','保亭黎族苗族自治县','county','1','y','46',0),(2628,'469030000000','琼中黎族苗族自治县','county','1','y','46',0),(2629,'469031000000','西沙群岛','county','1','y','46',0),(2630,'469032000000','南沙群岛','county','1','y','46',0),(2631,'469033000000','中沙群岛的岛礁及其海域','county','1','y','46',0),(2632,'500102000000','涪陵区','county','1','y','50',0),(2633,'500103000000','渝中区','county','1','y','50',0),(2634,'500104000000','大渡口区','county','1','y','50',0),(2635,'500105000000','江北区','county','1','y','50',0),(2636,'500106000000','沙坪坝区','county','1','y','50',0),(2637,'500107000000','九龙坡区','county','1','y','50',0),(2638,'500108000000','南岸区','county','1','y','50',0),(2639,'500109000000','北碚区','county','1','y','50',0),(2640,'500110000000','綦江区','county','1','y','50',0),(2641,'500111000000','大足区','county','1','y','50',0),(2642,'500112000000','渝北区','county','1','y','50',0),(2643,'500113000000','巴南区','county','1','y','50',0),(2644,'500114000000','黔江区','county','1','y','50',0),(2645,'500115000000','长寿区','county','1','y','50',0),(2646,'500116000000','江津区','county','1','y','50',0),(2647,'500117000000','合川区','county','1','y','50',0),(2648,'500118000000','永川区','county','1','y','50',0),(2649,'500119000000','南川区','county','1','y','50',0),(2650,'500224000000','铜梁县','county','1','y','50',0),(2651,'500226000000','荣昌县','county','1','y','50',0),(2652,'500227000000','璧山县','county','1','y','50',0),(2653,'500228000000','梁平县','county','1','y','50',0),(2654,'500229000000','城口县','county','1','y','50',0),(2655,'500230000000','丰都县','county','1','y','50',0),(2656,'500231000000','垫江县','county','1','y','50',0),(2657,'500232000000','武隆县','county','1','y','50',0),(2658,'500233000000','忠县','county','1','y','50',0),(2659,'500234000000','开县','county','1','y','50',0),(2660,'500235000000','云阳县','county','1','y','50',0),(2661,'500236000000','奉节县','county','1','y','50',0),(2662,'500237000000','巫山县','county','1','y','50',0),(2663,'500238000000','巫溪县','county','1','y','50',0),(2664,'500240000000','石柱土家族自治县','county','1','y','50',0),(2665,'500241000000','秀山土家族苗族自治县','county','1','y','50',0),(2666,'500242000000','酉阳土家族苗族自治县','county','1','y','50',0),(2667,'500243000000','彭水苗族土家族自治县','county','1','y','50',0),(2668,'510105000000','青羊区','county','1','y','510100000000',0),(2669,'510106000000','金牛区','county','1','y','510100000000',0),(2670,'510107000000','武侯区','county','1','y','510100000000',0),(2671,'510108000000','成华区','county','1','y','510100000000',0),(2672,'510112000000','龙泉驿区','county','1','y','510100000000',0),(2673,'510113000000','青白江区','county','1','y','510100000000',0),(2674,'510114000000','新都区','county','1','y','510100000000',0),(2675,'510115000000','温江区','county','1','y','510100000000',0),(2676,'510121000000','金堂县','county','1','y','510100000000',0),(2677,'510122000000','双流县','county','1','y','510100000000',0),(2678,'510124000000','郫县','county','1','y','510100000000',0),(2679,'510129000000','大邑县','county','1','y','510100000000',0),(2680,'510131000000','蒲江县','county','1','y','510100000000',0),(2681,'510132000000','新津县','county','1','y','510100000000',0),(2682,'510181000000','都江堰市','county','1','y','510100000000',0),(2683,'510182000000','彭州市','county','1','y','510100000000',0),(2684,'510183000000','邛崃市','county','1','y','510100000000',0),(2685,'510184000000','崇州市','county','1','y','510100000000',0),(2686,'510303000000','贡井区','county','1','y','510300000000',0),(2687,'510304000000','大安区','county','1','y','510300000000',0),(2688,'510311000000','沿滩区','county','1','y','510300000000',0),(2689,'510321000000','荣县','county','1','y','510300000000',0),(2690,'510322000000','富顺县','county','1','y','510300000000',0),(2691,'510403000000','西区','county','1','y','510400000000',0),(2692,'510411000000','仁和区','county','1','y','510400000000',0),(2693,'510421000000','米易县','county','1','y','510400000000',0),(2694,'510422000000','盐边县','county','1','y','510400000000',0),(2695,'510503000000','纳溪区','county','1','y','510500000000',0),(2696,'510504000000','龙马潭区','county','1','y','510500000000',0),(2697,'510521000000','泸县','county','1','y','510500000000',0),(2698,'510522000000','合江县','county','1','y','510500000000',0),(2699,'510524000000','叙永县','county','1','y','510500000000',0),(2700,'510525000000','古蔺县','county','1','y','510500000000',0),(2701,'510623000000','中江县','county','1','y','510600000000',0),(2702,'510626000000','罗江县','county','1','y','510600000000',0),(2703,'510681000000','广汉市','county','1','y','510600000000',0),(2704,'510682000000','什邡市','county','1','y','510600000000',0),(2705,'510683000000','绵竹市','county','1','y','510600000000',0),(2706,'510704000000','游仙区','county','1','y','510700000000',0),(2707,'510722000000','三台县','county','1','y','510700000000',0),(2708,'510723000000','盐亭县','county','1','y','510700000000',0),(2709,'510724000000','安县','county','1','y','510700000000',0),(2710,'510725000000','梓潼县','county','1','y','510700000000',0),(2711,'510726000000','北川羌族自治县','county','1','y','510700000000',0),(2712,'510727000000','平武县','county','1','y','510700000000',0),(2713,'510781000000','江油市','county','1','y','510700000000',0),(2714,'510811000000','元坝区','county','1','y','510800000000',0),(2715,'510812000000','朝天区','county','1','y','510800000000',0),(2716,'510821000000','旺苍县','county','1','y','510800000000',0),(2717,'510822000000','青川县','county','1','y','510800000000',0),(2718,'510823000000','剑阁县','county','1','y','510800000000',0),(2719,'510824000000','苍溪县','county','1','y','510800000000',0),(2720,'510904000000','安居区','county','1','y','510900000000',0),(2721,'510921000000','蓬溪县','county','1','y','510900000000',0),(2722,'510922000000','射洪县','county','1','y','510900000000',0),(2723,'510923000000','大英县','county','1','y','510900000000',0),(2724,'511011000000','东兴区','county','1','y','511000000000',0),(2725,'511024000000','威远县','county','1','y','511000000000',0),(2726,'511025000000','资中县','county','1','y','511000000000',0),(2727,'511028000000','隆昌县','county','1','y','511000000000',0),(2728,'511111000000','沙湾区','county','1','y','511100000000',0),(2729,'511112000000','五通桥区','county','1','y','511100000000',0),(2730,'511113000000','金口河区','county','1','y','511100000000',0),(2731,'511123000000','犍为县','county','1','y','511100000000',0),(2732,'511124000000','井研县','county','1','y','511100000000',0),(2733,'511126000000','夹江县','county','1','y','511100000000',0),(2734,'511129000000','沐川县','county','1','y','511100000000',0),(2735,'511132000000','峨边彝族自治县','county','1','y','511100000000',0),(2736,'511133000000','马边彝族自治县','county','1','y','511100000000',0),(2737,'511181000000','峨眉山市','county','1','y','511100000000',0),(2738,'511303000000','高坪区','county','1','y','511300000000',0),(2739,'511304000000','嘉陵区','county','1','y','511300000000',0),(2740,'511321000000','南部县','county','1','y','511300000000',0),(2741,'511322000000','营山县','county','1','y','511300000000',0),(2742,'511323000000','蓬安县','county','1','y','511300000000',0),(2743,'511324000000','仪陇县','county','1','y','511300000000',0),(2744,'511325000000','西充县','county','1','y','511300000000',0),(2745,'511381000000','阆中市','county','1','y','511300000000',0),(2746,'511421000000','仁寿县','county','1','y','511400000000',0),(2747,'511422000000','彭山县','county','1','y','511400000000',0),(2748,'511423000000','洪雅县','county','1','y','511400000000',0),(2749,'511424000000','丹棱县','county','1','y','511400000000',0),(2750,'511425000000','青神县','county','1','y','511400000000',0),(2751,'511503000000','南溪区','county','1','y','511500000000',0),(2752,'511521000000','宜宾县','county','1','y','511500000000',0),(2753,'511523000000','江安县','county','1','y','511500000000',0),(2754,'511524000000','长宁县','county','1','y','511500000000',0),(2755,'511525000000','高县','county','1','y','511500000000',0),(2756,'511526000000','珙县','county','1','y','511500000000',0),(2757,'511527000000','筠连县','county','1','y','511500000000',0),(2758,'511528000000','兴文县','county','1','y','511500000000',0),(2759,'511529000000','屏山县','county','1','y','511500000000',0),(2760,'511621000000','岳池县','county','1','y','511600000000',0),(2761,'511622000000','武胜县','county','1','y','511600000000',0),(2762,'511623000000','邻水县','county','1','y','511600000000',0),(2763,'511681000000','华蓥市','county','1','y','511600000000',0),(2764,'511721000000','达县','county','1','y','511700000000',0),(2765,'511722000000','宣汉县','county','1','y','511700000000',0),(2766,'511723000000','开江县','county','1','y','511700000000',0),(2767,'511724000000','大竹县','county','1','y','511700000000',0),(2768,'511725000000','渠县','county','1','y','511700000000',0),(2769,'511781000000','万源市','county','1','y','511700000000',0),(2770,'511821000000','名山县','county','1','y','511800000000',0),(2771,'511822000000','荥经县','county','1','y','511800000000',0),(2772,'511823000000','汉源县','county','1','y','511800000000',0),(2773,'511824000000','石棉县','county','1','y','511800000000',0),(2774,'511825000000','天全县','county','1','y','511800000000',0),(2775,'511826000000','芦山县','county','1','y','511800000000',0),(2776,'511827000000','宝兴县','county','1','y','511800000000',0),(2777,'511921000000','通江县','county','1','y','511900000000',0),(2778,'511922000000','南江县','county','1','y','511900000000',0),(2779,'511923000000','平昌县','county','1','y','511900000000',0),(2780,'512021000000','安岳县','county','1','y','512000000000',0),(2781,'512022000000','乐至县','county','1','y','512000000000',0),(2782,'512081000000','简阳市','county','1','y','512000000000',0),(2783,'513222000000','理县','county','1','y','513200000000',0),(2784,'513223000000','茂县','county','1','y','513200000000',0),(2785,'513224000000','松潘县','county','1','y','513200000000',0),(2786,'513225000000','九寨沟县','county','1','y','513200000000',0),(2787,'513226000000','金川县','county','1','y','513200000000',0),(2788,'513227000000','小金县','county','1','y','513200000000',0),(2789,'513228000000','黑水县','county','1','y','513200000000',0),(2790,'513229000000','马尔康县','county','1','y','513200000000',0),(2791,'513230000000','壤塘县','county','1','y','513200000000',0),(2792,'513231000000','阿坝县','county','1','y','513200000000',0),(2793,'513232000000','若尔盖县','county','1','y','513200000000',0),(2794,'513233000000','红原县','county','1','y','513200000000',0),(2795,'513322000000','泸定县','county','1','y','513300000000',0),(2796,'513323000000','丹巴县','county','1','y','513300000000',0),(2797,'513324000000','九龙县','county','1','y','513300000000',0),(2798,'513325000000','雅江县','county','1','y','513300000000',0),(2799,'513326000000','道孚县','county','1','y','513300000000',0),(2800,'513327000000','炉霍县','county','1','y','513300000000',0),(2801,'513328000000','甘孜县','county','1','y','513300000000',0),(2802,'513329000000','新龙县','county','1','y','513300000000',0),(2803,'513330000000','德格县','county','1','y','513300000000',0),(2804,'513331000000','白玉县','county','1','y','513300000000',0),(2805,'513332000000','石渠县','county','1','y','513300000000',0),(2806,'513333000000','色达县','county','1','y','513300000000',0),(2807,'513334000000','理塘县','county','1','y','513300000000',0),(2808,'513335000000','巴塘县','county','1','y','513300000000',0),(2809,'513336000000','乡城县','county','1','y','513300000000',0),(2810,'513337000000','稻城县','county','1','y','513300000000',0),(2811,'513338000000','得荣县','county','1','y','513300000000',0),(2812,'513422000000','木里藏族自治县','county','1','y','513400000000',0),(2813,'513423000000','盐源县','county','1','y','513400000000',0),(2814,'513424000000','德昌县','county','1','y','513400000000',0),(2815,'513425000000','会理县','county','1','y','513400000000',0),(2816,'513426000000','会东县','county','1','y','513400000000',0),(2817,'513427000000','宁南县','county','1','y','513400000000',0),(2818,'513428000000','普格县','county','1','y','513400000000',0),(2819,'513429000000','布拖县','county','1','y','513400000000',0),(2820,'513430000000','金阳县','county','1','y','513400000000',0),(2821,'513431000000','昭觉县','county','1','y','513400000000',0),(2822,'513432000000','喜德县','county','1','y','513400000000',0),(2823,'513433000000','冕宁县','county','1','y','513400000000',0),(2824,'513434000000','越西县','county','1','y','513400000000',0),(2825,'513435000000','甘洛县','county','1','y','513400000000',0),(2826,'513436000000','美姑县','county','1','y','513400000000',0),(2827,'513437000000','雷波县','county','1','y','513400000000',0),(2828,'520103000000','云岩区','county','1','y','520100000000',0),(2829,'520111000000','花溪区','county','1','y','520100000000',0),(2830,'520112000000','乌当区','county','1','y','520100000000',0),(2831,'520113000000','白云区','county','1','y','520100000000',0),(2832,'520114000000','小河区','county','1','y','520100000000',0),(2833,'520121000000','开阳县','county','1','y','520100000000',0),(2834,'520122000000','息烽县','county','1','y','520100000000',0),(2835,'520123000000','修文县','county','1','y','520100000000',0),(2836,'520181000000','清镇市','county','1','y','520100000000',0),(2837,'520203000000','六枝特区','county','1','y','520200000000',0),(2838,'520221000000','水城县','county','1','y','520200000000',0),(2839,'520222000000','盘县','county','1','y','520200000000',0),(2840,'520303000000','汇川区','county','1','y','520300000000',0),(2841,'520321000000','遵义县','county','1','y','520300000000',0),(2842,'520322000000','桐梓县','county','1','y','520300000000',0),(2843,'520323000000','绥阳县','county','1','y','520300000000',0),(2844,'520324000000','正安县','county','1','y','520300000000',0),(2845,'520325000000','道真仡佬族苗族自治县','county','1','y','520300000000',0),(2846,'520326000000','务川仡佬族苗族自治县','county','1','y','520300000000',0),(2847,'520327000000','凤冈县','county','1','y','520300000000',0),(2848,'520328000000','湄潭县','county','1','y','520300000000',0),(2849,'520329000000','余庆县','county','1','y','520300000000',0),(2850,'520330000000','习水县','county','1','y','520300000000',0),(2851,'520381000000','赤水市','county','1','y','520300000000',0),(2852,'520382000000','仁怀市','county','1','y','520300000000',0),(2853,'520421000000','平坝县','county','1','y','520400000000',0),(2854,'520422000000','普定县','county','1','y','520400000000',0),(2855,'520423000000','镇宁布依族苗族自治县','county','1','y','520400000000',0),(2856,'520424000000','关岭布依族苗族自治县','county','1','y','520400000000',0),(2857,'520425000000','紫云苗族布依族自治县','county','1','y','520400000000',0),(2858,'520521000000','大方县','county','1','y','520500000000',0),(2859,'520522000000','黔西县','county','1','y','520500000000',0),(2860,'520523000000','金沙县','county','1','y','520500000000',0),(2861,'520524000000','织金县','county','1','y','520500000000',0),(2862,'520525000000','纳雍县','county','1','y','520500000000',0),(2863,'520526000000','威宁彝族回族苗族自治县','county','1','y','520500000000',0),(2864,'520527000000','赫章县','county','1','y','520500000000',0),(2865,'520603000000','万山区','county','1','y','520600000000',0),(2866,'520621000000','江口县','county','1','y','520600000000',0),(2867,'520622000000','玉屏侗族自治县','county','1','y','520600000000',0),(2868,'520623000000','石阡县','county','1','y','520600000000',0),(2869,'520624000000','思南县','county','1','y','520600000000',0),(2870,'520625000000','印江土家族苗族自治县','county','1','y','520600000000',0),(2871,'520626000000','德江县','county','1','y','520600000000',0),(2872,'520627000000','沿河土家族自治县','county','1','y','520600000000',0),(2873,'520628000000','松桃苗族自治县','county','1','y','520600000000',0),(2874,'522322000000','兴仁县','county','1','y','522300000000',0),(2875,'522323000000','普安县','county','1','y','522300000000',0),(2876,'522324000000','晴隆县','county','1','y','522300000000',0),(2877,'522325000000','贞丰县','county','1','y','522300000000',0),(2878,'522326000000','望谟县','county','1','y','522300000000',0),(2879,'522327000000','册亨县','county','1','y','522300000000',0),(2880,'522328000000','安龙县','county','1','y','522300000000',0),(2881,'522622000000','黄平县','county','1','y','522600000000',0),(2882,'522623000000','施秉县','county','1','y','522600000000',0),(2883,'522624000000','三穗县','county','1','y','522600000000',0),(2884,'522625000000','镇远县','county','1','y','522600000000',0),(2885,'522626000000','岑巩县','county','1','y','522600000000',0),(2886,'522627000000','天柱县','county','1','y','522600000000',0),(2887,'522628000000','锦屏县','county','1','y','522600000000',0),(2888,'522629000000','剑河县','county','1','y','522600000000',0),(2889,'522630000000','台江县','county','1','y','522600000000',0),(2890,'522631000000','黎平县','county','1','y','522600000000',0),(2891,'522632000000','榕江县','county','1','y','522600000000',0),(2892,'522633000000','从江县','county','1','y','522600000000',0),(2893,'522634000000','雷山县','county','1','y','522600000000',0),(2894,'522635000000','麻江县','county','1','y','522600000000',0),(2895,'522636000000','丹寨县','county','1','y','522600000000',0),(2896,'522702000000','福泉市','county','1','y','522700000000',0),(2897,'522722000000','荔波县','county','1','y','522700000000',0),(2898,'522723000000','贵定县','county','1','y','522700000000',0),(2899,'522725000000','瓮安县','county','1','y','522700000000',0),(2900,'522726000000','独山县','county','1','y','522700000000',0),(2901,'522727000000','平塘县','county','1','y','522700000000',0),(2902,'522728000000','罗甸县','county','1','y','522700000000',0),(2903,'522729000000','长顺县','county','1','y','522700000000',0),(2904,'522730000000','龙里县','county','1','y','522700000000',0),(2905,'522731000000','惠水县','county','1','y','522700000000',0),(2906,'522732000000','三都水族自治县','county','1','y','522700000000',0),(2907,'530103000000','盘龙区','county','1','y','530100000000',0),(2908,'530111000000','官渡区','county','1','y','530100000000',0),(2909,'530112000000','西山区','county','1','y','530100000000',0),(2910,'530113000000','东川区','county','1','y','530100000000',0),(2911,'530114000000','呈贡区','county','1','y','530100000000',0),(2912,'530122000000','晋宁县','county','1','y','530100000000',0),(2913,'530124000000','富民县','county','1','y','530100000000',0),(2914,'530125000000','宜良县','county','1','y','530100000000',0),(2915,'530126000000','石林彝族自治县','county','1','y','530100000000',0),(2916,'530127000000','嵩明县','county','1','y','530100000000',0),(2917,'530128000000','禄劝彝族苗族自治县','county','1','y','530100000000',0),(2918,'530129000000','寻甸回族彝族自治县','county','1','y','530100000000',0),(2919,'530181000000','安宁市','county','1','y','530100000000',0),(2920,'530321000000','马龙县','county','1','y','530300000000',0),(2921,'530322000000','陆良县','county','1','y','530300000000',0),(2922,'530323000000','师宗县','county','1','y','530300000000',0),(2923,'530324000000','罗平县','county','1','y','530300000000',0),(2924,'530325000000','富源县','county','1','y','530300000000',0),(2925,'530326000000','会泽县','county','1','y','530300000000',0),(2926,'530328000000','沾益县','county','1','y','530300000000',0),(2927,'530381000000','宣威市','county','1','y','530300000000',0),(2928,'530421000000','江川县','county','1','y','530400000000',0),(2929,'530422000000','澄江县','county','1','y','530400000000',0),(2930,'530423000000','通海县','county','1','y','530400000000',0),(2931,'530424000000','华宁县','county','1','y','530400000000',0),(2932,'530425000000','易门县','county','1','y','530400000000',0),(2933,'530426000000','峨山彝族自治县','county','1','y','530400000000',0),(2934,'530427000000','新平彝族傣族自治县','county','1','y','530400000000',0),(2935,'530428000000','元江哈尼族彝族傣族自治县','county','1','y','530400000000',0),(2936,'530521000000','施甸县','county','1','y','530500000000',0),(2937,'530522000000','腾冲县','county','1','y','530500000000',0),(2938,'530523000000','龙陵县','county','1','y','530500000000',0),(2939,'530524000000','昌宁县','county','1','y','530500000000',0),(2940,'530621000000','鲁甸县','county','1','y','530600000000',0),(2941,'530622000000','巧家县','county','1','y','530600000000',0),(2942,'530623000000','盐津县','county','1','y','530600000000',0),(2943,'530624000000','大关县','county','1','y','530600000000',0),(2944,'530625000000','永善县','county','1','y','530600000000',0),(2945,'530626000000','绥江县','county','1','y','530600000000',0),(2946,'530627000000','镇雄县','county','1','y','530600000000',0),(2947,'530628000000','彝良县','county','1','y','530600000000',0),(2948,'530629000000','威信县','county','1','y','530600000000',0),(2949,'530630000000','水富县','county','1','y','530600000000',0),(2950,'530721000000','玉龙纳西族自治县','county','1','y','530700000000',0),(2951,'530722000000','永胜县','county','1','y','530700000000',0),(2952,'530723000000','华坪县','county','1','y','530700000000',0),(2953,'530724000000','宁蒗彝族自治县','county','1','y','530700000000',0),(2954,'530821000000','宁洱哈尼族彝族自治县','county','1','y','530800000000',0),(2955,'530822000000','墨江哈尼族自治县','county','1','y','530800000000',0),(2956,'530823000000','景东彝族自治县','county','1','y','530800000000',0),(2957,'530824000000','景谷傣族彝族自治县','county','1','y','530800000000',0),(2958,'530825000000','镇沅彝族哈尼族拉祜族自治县','county','1','y','530800000000',0),(2959,'530826000000','江城哈尼族彝族自治县','county','1','y','530800000000',0),(2960,'530827000000','孟连傣族拉祜族佤族自治县','county','1','y','530800000000',0),(2961,'530828000000','澜沧拉祜族自治县','county','1','y','530800000000',0),(2962,'530829000000','西盟佤族自治县','county','1','y','530800000000',0),(2963,'530921000000','凤庆县','county','1','y','530900000000',0),(2964,'530922000000','云县','county','1','y','530900000000',0),(2965,'530923000000','永德县','county','1','y','530900000000',0),(2966,'530924000000','镇康县','county','1','y','530900000000',0),(2967,'530925000000','双江拉祜族佤族布朗族傣族自治县','county','1','y','530900000000',0),(2968,'530926000000','耿马傣族佤族自治县','county','1','y','530900000000',0),(2969,'530927000000','沧源佤族自治县','county','1','y','530900000000',0),(2970,'532322000000','双柏县','county','1','y','532300000000',0),(2971,'532323000000','牟定县','county','1','y','532300000000',0),(2972,'532324000000','南华县','county','1','y','532300000000',0),(2973,'532325000000','姚安县','county','1','y','532300000000',0),(2974,'532326000000','大姚县','county','1','y','532300000000',0),(2975,'532327000000','永仁县','county','1','y','532300000000',0),(2976,'532328000000','元谋县','county','1','y','532300000000',0),(2977,'532329000000','武定县','county','1','y','532300000000',0),(2978,'532331000000','禄丰县','county','1','y','532300000000',0),(2979,'532502000000','开远市','county','1','y','532500000000',0),(2980,'532503000000','蒙自市','county','1','y','532500000000',0),(2981,'532523000000','屏边苗族自治县','county','1','y','532500000000',0),(2982,'532524000000','建水县','county','1','y','532500000000',0),(2983,'532525000000','石屏县','county','1','y','532500000000',0),(2984,'532526000000','弥勒县','county','1','y','532500000000',0),(2985,'532527000000','泸西县','county','1','y','532500000000',0),(2986,'532528000000','元阳县','county','1','y','532500000000',0),(2987,'532529000000','红河县','county','1','y','532500000000',0),(2988,'532530000000','金平苗族瑶族傣族自治县','county','1','y','532500000000',0),(2989,'532531000000','绿春县','county','1','y','532500000000',0),(2990,'532532000000','河口瑶族自治县','county','1','y','532500000000',0),(2991,'532622000000','砚山县','county','1','y','532600000000',0),(2992,'532623000000','西畴县','county','1','y','532600000000',0),(2993,'532624000000','麻栗坡县','county','1','y','532600000000',0),(2994,'532625000000','马关县','county','1','y','532600000000',0),(2995,'532626000000','丘北县','county','1','y','532600000000',0),(2996,'532627000000','广南县','county','1','y','532600000000',0),(2997,'532628000000','富宁县','county','1','y','532600000000',0),(2998,'532822000000','勐海县','county','1','y','532800000000',0),(2999,'532823000000','勐腊县','county','1','y','532800000000',0),(3000,'532922000000','漾濞彝族自治县','county','1','y','532900000000',0),(3001,'532923000000','祥云县','county','1','y','532900000000',0),(3002,'532924000000','宾川县','county','1','y','532900000000',0),(3003,'532925000000','弥渡县','county','1','y','532900000000',0),(3004,'532926000000','南涧彝族自治县','county','1','y','532900000000',0),(3005,'532927000000','巍山彝族回族自治县','county','1','y','532900000000',0),(3006,'532928000000','永平县','county','1','y','532900000000',0),(3007,'532929000000','云龙县','county','1','y','532900000000',0),(3008,'532930000000','洱源县','county','1','y','532900000000',0),(3009,'532931000000','剑川县','county','1','y','532900000000',0),(3010,'532932000000','鹤庆县','county','1','y','532900000000',0),(3011,'533103000000','芒市','county','1','y','533100000000',0),(3012,'533122000000','梁河县','county','1','y','533100000000',0),(3013,'533123000000','盈江县','county','1','y','533100000000',0),(3014,'533124000000','陇川县','county','1','y','533100000000',0),(3015,'533323000000','福贡县','county','1','y','533300000000',0),(3016,'533324000000','贡山独龙族怒族自治县','county','1','y','533300000000',0),(3017,'533325000000','兰坪白族普米族自治县','county','1','y','533300000000',0),(3018,'533422000000','德钦县','county','1','y','533400000000',0),(3019,'533423000000','维西傈僳族自治县','county','1','y','533400000000',0),(3020,'540121000000','林周县','county','1','y','540100000000',0),(3021,'540122000000','当雄县','county','1','y','540100000000',0),(3022,'540123000000','尼木县','county','1','y','540100000000',0),(3023,'540124000000','曲水县','county','1','y','540100000000',0),(3024,'540125000000','堆龙德庆县','county','1','y','540100000000',0),(3025,'540126000000','达孜县','county','1','y','540100000000',0),(3026,'540127000000','墨竹工卡县','county','1','y','540100000000',0),(3027,'542122000000','江达县','county','1','y','542100000000',0),(3028,'542123000000','贡觉县','county','1','y','542100000000',0),(3029,'542124000000','类乌齐县','county','1','y','542100000000',0),(3030,'542125000000','丁青县','county','1','y','542100000000',0),(3031,'542126000000','察雅县','county','1','y','542100000000',0),(3032,'542127000000','八宿县','county','1','y','542100000000',0),(3033,'542128000000','左贡县','county','1','y','542100000000',0),(3034,'542129000000','芒康县','county','1','y','542100000000',0),(3035,'542132000000','洛隆县','county','1','y','542100000000',0),(3036,'542133000000','边坝县','county','1','y','542100000000',0),(3037,'542222000000','扎囊县','county','1','y','542200000000',0),(3038,'542223000000','贡嘎县','county','1','y','542200000000',0),(3039,'542224000000','桑日县','county','1','y','542200000000',0),(3040,'542225000000','琼结县','county','1','y','542200000000',0),(3041,'542226000000','曲松县','county','1','y','542200000000',0),(3042,'542227000000','措美县','county','1','y','542200000000',0),(3043,'542228000000','洛扎县','county','1','y','542200000000',0),(3044,'542229000000','加查县','county','1','y','542200000000',0),(3045,'542231000000','隆子县','county','1','y','542200000000',0),(3046,'542232000000','错那县','county','1','y','542200000000',0),(3047,'542233000000','浪卡子县','county','1','y','542200000000',0),(3048,'542322000000','南木林县','county','1','y','542300000000',0),(3049,'542323000000','江孜县','county','1','y','542300000000',0),(3050,'542324000000','定日县','county','1','y','542300000000',0),(3051,'542325000000','萨迦县','county','1','y','542300000000',0),(3052,'542326000000','拉孜县','county','1','y','542300000000',0),(3053,'542327000000','昂仁县','county','1','y','542300000000',0),(3054,'542328000000','谢通门县','county','1','y','542300000000',0),(3055,'542329000000','白朗县','county','1','y','542300000000',0),(3056,'542330000000','仁布县','county','1','y','542300000000',0),(3057,'542331000000','康马县','county','1','y','542300000000',0),(3058,'542332000000','定结县','county','1','y','542300000000',0),(3059,'542333000000','仲巴县','county','1','y','542300000000',0),(3060,'542334000000','亚东县','county','1','y','542300000000',0),(3061,'542335000000','吉隆县','county','1','y','542300000000',0),(3062,'542336000000','聂拉木县','county','1','y','542300000000',0),(3063,'542337000000','萨嘎县','county','1','y','542300000000',0),(3064,'542338000000','岗巴县','county','1','y','542300000000',0),(3065,'542422000000','嘉黎县','county','1','y','542400000000',0),(3066,'542423000000','比如县','county','1','y','542400000000',0),(3067,'542424000000','聂荣县','county','1','y','542400000000',0),(3068,'542425000000','安多县','county','1','y','542400000000',0),(3069,'542426000000','申扎县','county','1','y','542400000000',0),(3070,'542427000000','索县','county','1','y','542400000000',0),(3071,'542428000000','班戈县','county','1','y','542400000000',0),(3072,'542429000000','巴青县','county','1','y','542400000000',0),(3073,'542430000000','尼玛县','county','1','y','542400000000',0),(3074,'542522000000','札达县','county','1','y','542500000000',0),(3075,'542523000000','噶尔县','county','1','y','542500000000',0),(3076,'542524000000','日土县','county','1','y','542500000000',0),(3077,'542525000000','革吉县','county','1','y','542500000000',0),(3078,'542526000000','改则县','county','1','y','542500000000',0),(3079,'542527000000','措勤县','county','1','y','542500000000',0),(3080,'542622000000','工布江达县','county','1','y','542600000000',0),(3081,'542623000000','米林县','county','1','y','542600000000',0),(3082,'542624000000','墨脱县','county','1','y','542600000000',0),(3083,'542625000000','波密县','county','1','y','542600000000',0),(3084,'542626000000','察隅县','county','1','y','542600000000',0),(3085,'542627000000','朗县','county','1','y','542600000000',0),(3086,'610103000000','碑林区','county','1','y','610100000000',0),(3087,'610104000000','莲湖区','county','1','y','610100000000',0),(3088,'610111000000','灞桥区','county','1','y','610100000000',0),(3089,'610112000000','未央区','county','1','y','610100000000',0),(3090,'610113000000','雁塔区','county','1','y','610100000000',0),(3091,'610114000000','阎良区','county','1','y','610100000000',0),(3092,'610115000000','临潼区','county','1','y','610100000000',0),(3093,'610116000000','长安区','county','1','y','610100000000',0),(3094,'610122000000','蓝田县','county','1','y','610100000000',0),(3095,'610124000000','周至县','county','1','y','610100000000',0),(3096,'610125000000','户县','county','1','y','610100000000',0),(3097,'610126000000','高陵县','county','1','y','610100000000',0),(3098,'610203000000','印台区','county','1','y','610200000000',0),(3099,'610204000000','耀州区','county','1','y','610200000000',0),(3100,'610222000000','宜君县','county','1','y','610200000000',0),(3101,'610303000000','金台区','county','1','y','610300000000',0),(3102,'610304000000','陈仓区','county','1','y','610300000000',0),(3103,'610322000000','凤翔县','county','1','y','610300000000',0),(3104,'610323000000','岐山县','county','1','y','610300000000',0),(3105,'610324000000','扶风县','county','1','y','610300000000',0),(3106,'610326000000','眉县','county','1','y','610300000000',0),(3107,'610327000000','陇县','county','1','y','610300000000',0),(3108,'610328000000','千阳县','county','1','y','610300000000',0),(3109,'610329000000','麟游县','county','1','y','610300000000',0),(3110,'610330000000','凤县','county','1','y','610300000000',0),(3111,'610331000000','太白县','county','1','y','610300000000',0),(3112,'610403000000','杨陵区','county','1','y','610400000000',0),(3113,'610404000000','渭城区','county','1','y','610400000000',0),(3114,'610422000000','三原县','county','1','y','610400000000',0),(3115,'610423000000','泾阳县','county','1','y','610400000000',0),(3116,'610424000000','乾县','county','1','y','610400000000',0),(3117,'610425000000','礼泉县','county','1','y','610400000000',0),(3118,'610922000000','石泉县','county','1','y','610900000000',0),(3119,'610923000000','宁陕县','county','1','y','610900000000',0),(3120,'610924000000','紫阳县','county','1','y','610900000000',0),(3121,'610925000000','岚皋县','county','1','y','610900000000',0),(3122,'610926000000','平利县','county','1','y','610900000000',0),(3123,'610927000000','镇坪县','county','1','y','610900000000',0),(3124,'610928000000','旬阳县','county','1','y','610900000000',0),(3125,'610929000000','白河县','county','1','y','610900000000',0),(3126,'611021000000','洛南县','county','1','y','611000000000',0),(3127,'611022000000','丹凤县','county','1','y','611000000000',0),(3128,'611023000000','商南县','county','1','y','611000000000',0),(3129,'611024000000','山阳县','county','1','y','611000000000',0),(3130,'611025000000','镇安县','county','1','y','611000000000',0),(3131,'611026000000','柞水县','county','1','y','611000000000',0),(3132,'620103000000','七里河区','county','1','y','620100000000',0),(3133,'620104000000','西固区','county','1','y','620100000000',0),(3134,'620105000000','安宁区','county','1','y','620100000000',0),(3135,'620111000000','红古区','county','1','y','620100000000',0),(3136,'620121000000','永登县','county','1','y','620100000000',0),(3137,'620122000000','皋兰县','county','1','y','620100000000',0),(3138,'620123000000','榆中县','county','1','y','620100000000',0),(3139,'620321000000','永昌县','county','1','y','620300000000',0),(3140,'620403000000','平川区','county','1','y','620400000000',0),(3141,'620421000000','靖远县','county','1','y','620400000000',0),(3142,'620422000000','会宁县','county','1','y','620400000000',0),(3143,'620423000000','景泰县','county','1','y','620400000000',0),(3144,'620503000000','麦积区','county','1','y','620500000000',0),(3145,'620521000000','清水县','county','1','y','620500000000',0),(3146,'620522000000','秦安县','county','1','y','620500000000',0),(3147,'620523000000','甘谷县','county','1','y','620500000000',0),(3148,'620524000000','武山县','county','1','y','620500000000',0),(3149,'620525000000','张家川回族自治县','county','1','y','620500000000',0),(3150,'620621000000','民勤县','county','1','y','620600000000',0),(3151,'620622000000','古浪县','county','1','y','620600000000',0),(3152,'620623000000','天祝藏族自治县','county','1','y','620600000000',0),(3153,'620721000000','肃南裕固族自治县','county','1','y','620700000000',0),(3154,'620722000000','民乐县','county','1','y','620700000000',0),(3155,'620723000000','临泽县','county','1','y','620700000000',0),(3156,'620724000000','高台县','county','1','y','620700000000',0),(3157,'620725000000','山丹县','county','1','y','620700000000',0),(3158,'620821000000','泾川县','county','1','y','620800000000',0),(3159,'620822000000','灵台县','county','1','y','620800000000',0),(3160,'620823000000','崇信县','county','1','y','620800000000',0),(3161,'620824000000','华亭县','county','1','y','620800000000',0),(3162,'620825000000','庄浪县','county','1','y','620800000000',0),(3163,'620826000000','静宁县','county','1','y','620800000000',0),(3164,'620921000000','金塔县','county','1','y','620900000000',0),(3165,'620922000000','瓜州县','county','1','y','620900000000',0),(3166,'610426000000','永寿县','county','1','y','610400000000',0),(3167,'610427000000','彬县','county','1','y','610400000000',0),(3168,'610428000000','长武县','county','1','y','610400000000',0),(3169,'610429000000','旬邑县','county','1','y','610400000000',0),(3170,'610430000000','淳化县','county','1','y','610400000000',0),(3171,'610431000000','武功县','county','1','y','610400000000',0),(3172,'610481000000','兴平市','county','1','y','610400000000',0),(3173,'610521000000','华县','county','1','y','610500000000',0),(3174,'610522000000','潼关县','county','1','y','610500000000',0),(3175,'610523000000','大荔县','county','1','y','610500000000',0),(3176,'610524000000','合阳县','county','1','y','610500000000',0),(3177,'610525000000','澄城县','county','1','y','610500000000',0),(3178,'610526000000','蒲城县','county','1','y','610500000000',0),(3179,'610527000000','白水县','county','1','y','610500000000',0),(3180,'610528000000','富平县','county','1','y','610500000000',0),(3181,'610581000000','韩城市','county','1','y','610500000000',0),(3182,'610582000000','华阴市','county','1','y','610500000000',0),(3183,'610621000000','延长县','county','1','y','610600000000',0),(3184,'610622000000','延川县','county','1','y','610600000000',0),(3185,'610623000000','子长县','county','1','y','610600000000',0),(3186,'610624000000','安塞县','county','1','y','610600000000',0),(3187,'610625000000','志丹县','county','1','y','610600000000',0),(3188,'610626000000','吴起县','county','1','y','610600000000',0),(3189,'610627000000','甘泉县','county','1','y','610600000000',0),(3190,'610628000000','富县','county','1','y','610600000000',0),(3191,'610629000000','洛川县','county','1','y','610600000000',0),(3192,'610630000000','宜川县','county','1','y','610600000000',0),(3193,'610631000000','黄龙县','county','1','y','610600000000',0),(3194,'610632000000','黄陵县','county','1','y','610600000000',0),(3195,'610721000000','南郑县','county','1','y','610700000000',0),(3196,'610722000000','城固县','county','1','y','610700000000',0),(3197,'610723000000','洋县','county','1','y','610700000000',0),(3198,'610724000000','西乡县','county','1','y','610700000000',0),(3199,'610725000000','勉县','county','1','y','610700000000',0),(3200,'610726000000','宁强县','county','1','y','610700000000',0),(3201,'610727000000','略阳县','county','1','y','610700000000',0),(3202,'610728000000','镇巴县','county','1','y','610700000000',0),(3203,'610729000000','留坝县','county','1','y','610700000000',0),(3204,'610730000000','佛坪县','county','1','y','610700000000',0),(3205,'610821000000','神木县','county','1','y','610800000000',0),(3206,'610822000000','府谷县','county','1','y','610800000000',0),(3207,'610823000000','横山县','county','1','y','610800000000',0),(3208,'610824000000','靖边县','county','1','y','610800000000',0),(3209,'610825000000','定边县','county','1','y','610800000000',0),(3210,'610826000000','绥德县','county','1','y','610800000000',0),(3211,'610827000000','米脂县','county','1','y','610800000000',0),(3212,'610828000000','佳县','county','1','y','610800000000',0),(3213,'610829000000','吴堡县','county','1','y','610800000000',0),(3214,'610830000000','清涧县','county','1','y','610800000000',0),(3215,'610831000000','子洲县','county','1','y','610800000000',0),(3216,'610921000000','汉阴县','county','1','y','610900000000',0),(3217,'620923000000','肃北蒙古族自治县','county','1','y','620900000000',0),(3218,'620924000000','阿克塞哈萨克族自治县','county','1','y','620900000000',0),(3219,'620981000000','玉门市','county','1','y','620900000000',0),(3220,'620982000000','敦煌市','county','1','y','620900000000',0),(3221,'621021000000','庆城县','county','1','y','621000000000',0),(3222,'621022000000','环县','county','1','y','621000000000',0),(3223,'621023000000','华池县','county','1','y','621000000000',0),(3224,'621024000000','合水县','county','1','y','621000000000',0),(3225,'621025000000','正宁县','county','1','y','621000000000',0),(3226,'621026000000','宁县','county','1','y','621000000000',0),(3227,'621027000000','镇原县','county','1','y','621000000000',0),(3228,'621121000000','通渭县','county','1','y','621100000000',0),(3229,'621122000000','陇西县','county','1','y','621100000000',0),(3230,'621123000000','渭源县','county','1','y','621100000000',0),(3231,'621124000000','临洮县','county','1','y','621100000000',0),(3232,'621125000000','漳县','county','1','y','621100000000',0),(3233,'621126000000','岷县','county','1','y','621100000000',0),(3234,'621221000000','成县','county','1','y','621200000000',0),(3235,'621222000000','文县','county','1','y','621200000000',0),(3236,'621223000000','宕昌县','county','1','y','621200000000',0),(3237,'621224000000','康县','county','1','y','621200000000',0),(3238,'621225000000','西和县','county','1','y','621200000000',0),(3239,'621226000000','礼县','county','1','y','621200000000',0),(3240,'621227000000','徽县','county','1','y','621200000000',0),(3241,'621228000000','两当县','county','1','y','621200000000',0),(3242,'622921000000','临夏县','county','1','y','622900000000',0),(3243,'622922000000','康乐县','county','1','y','622900000000',0),(3244,'622923000000','永靖县','county','1','y','622900000000',0),(3245,'622924000000','广河县','county','1','y','622900000000',0),(3246,'622925000000','和政县','county','1','y','622900000000',0),(3247,'622926000000','东乡族自治县','county','1','y','622900000000',0),(3248,'622927000000','积石山保安族东乡族撒拉族自治县','county','1','y','622900000000',0),(3249,'623021000000','临潭县','county','1','y','623000000000',0),(3250,'623022000000','卓尼县','county','1','y','623000000000',0),(3251,'623023000000','舟曲县','county','1','y','623000000000',0),(3252,'623024000000','迭部县','county','1','y','623000000000',0),(3253,'623025000000','玛曲县','county','1','y','623000000000',0),(3254,'623026000000','碌曲县','county','1','y','623000000000',0),(3255,'623027000000','夏河县','county','1','y','623000000000',0),(3256,'630103000000','城中区','county','1','y','630100000000',0),(3257,'630104000000','城西区','county','1','y','630100000000',0),(3258,'630105000000','城北区','county','1','y','630100000000',0),(3259,'630121000000','大通回族土族自治县','county','1','y','630100000000',0),(3260,'630122000000','湟中县','county','1','y','630100000000',0),(3261,'630123000000','湟源县','county','1','y','630100000000',0),(3262,'632122000000','民和回族土族自治县','county','1','y','632100000000',0),(3263,'632123000000','乐都县','county','1','y','632100000000',0),(3264,'632126000000','互助土族自治县','county','1','y','632100000000',0),(3265,'632127000000','化隆回族自治县','county','1','y','632100000000',0),(3266,'632128000000','循化撒拉族自治县','county','1','y','632100000000',0),(3267,'632222000000','祁连县','county','1','y','632200000000',0),(3268,'632223000000','海晏县','county','1','y','632200000000',0),(3269,'632224000000','刚察县','county','1','y','632200000000',0),(3270,'632322000000','尖扎县','county','1','y','632300000000',0),(3271,'632323000000','泽库县','county','1','y','632300000000',0),(3272,'632324000000','河南蒙古族自治县','county','1','y','632300000000',0),(3273,'632522000000','同德县','county','1','y','632500000000',0),(3274,'632523000000','贵德县','county','1','y','632500000000',0),(3275,'632524000000','兴海县','county','1','y','632500000000',0),(3276,'632525000000','贵南县','county','1','y','632500000000',0),(3277,'632622000000','班玛县','county','1','y','632600000000',0),(3278,'632623000000','甘德县','county','1','y','632600000000',0),(3279,'632624000000','达日县','county','1','y','632600000000',0),(3280,'632625000000','久治县','county','1','y','632600000000',0),(3281,'632626000000','玛多县','county','1','y','632600000000',0),(3282,'632722000000','杂多县','county','1','y','632700000000',0),(3283,'632723000000','称多县','county','1','y','632700000000',0),(3284,'632724000000','治多县','county','1','y','632700000000',0),(3285,'632725000000','囊谦县','county','1','y','632700000000',0),(3286,'632726000000','曲麻莱县','county','1','y','632700000000',0),(3287,'632802000000','德令哈市','county','1','y','632800000000',0),(3288,'632821000000','乌兰县','county','1','y','632800000000',0),(3289,'632822000000','都兰县','county','1','y','632800000000',0),(3290,'632823000000','天峻县','county','1','y','632800000000',0),(3291,'640105000000','西夏区','county','1','y','640100000000',0),(3292,'640106000000','金凤区','county','1','y','640100000000',0),(3293,'640121000000','永宁县','county','1','y','640100000000',0),(3294,'640122000000','贺兰县','county','1','y','640100000000',0),(3295,'640181000000','灵武市','county','1','y','640100000000',0),(3296,'640205000000','惠农区','county','1','y','640200000000',0),(3297,'640221000000','平罗县','county','1','y','640200000000',0),(3298,'640303000000','红寺堡区','county','1','y','640300000000',0),(3299,'640323000000','盐池县','county','1','y','640300000000',0),(3300,'640324000000','同心县','county','1','y','640300000000',0),(3301,'640381000000','青铜峡市','county','1','y','640300000000',0),(3302,'640422000000','西吉县','county','1','y','640400000000',0),(3303,'640423000000','隆德县','county','1','y','640400000000',0),(3304,'640424000000','泾源县','county','1','y','640400000000',0),(3305,'640425000000','彭阳县','county','1','y','640400000000',0),(3306,'640521000000','中宁县','county','1','y','640500000000',0),(3307,'640522000000','海原县','county','1','y','640500000000',0),(3308,'650103000000','沙依巴克区','county','1','y','650100000000',0),(3309,'650104000000','新市区','county','1','y','650100000000',0),(3310,'650105000000','水磨沟区','county','1','y','650100000000',0),(3311,'650106000000','头屯河区','county','1','y','650100000000',0),(3312,'650107000000','达坂城区','county','1','y','650100000000',0),(3313,'650109000000','米东区','county','1','y','650100000000',0),(3314,'650121000000','乌鲁木齐县','county','1','y','650100000000',0),(3315,'650203000000','克拉玛依区','county','1','y','650200000000',0),(3316,'650204000000','白碱滩区','county','1','y','650200000000',0),(3317,'650205000000','乌尔禾区','county','1','y','650200000000',0),(3318,'652122000000','鄯善县','county','1','y','652100000000',0),(3319,'652123000000','托克逊县','county','1','y','652100000000',0),(3320,'652222000000','巴里坤哈萨克自治县','county','1','y','652200000000',0),(3321,'652223000000','伊吾县','county','1','y','652200000000',0),(3322,'652302000000','阜康市','county','1','y','652300000000',0),(3323,'652323000000','呼图壁县','county','1','y','652300000000',0),(3324,'652324000000','玛纳斯县','county','1','y','652300000000',0),(3325,'652325000000','奇台县','county','1','y','652300000000',0),(3326,'652327000000','吉木萨尔县','county','1','y','652300000000',0),(3327,'652328000000','木垒哈萨克自治县','county','1','y','652300000000',0),(3328,'652722000000','精河县','county','1','y','652700000000',0),(3329,'652723000000','温泉县','county','1','y','652700000000',0),(3330,'652822000000','轮台县','county','1','y','652800000000',0),(3331,'652823000000','尉犁县','county','1','y','652800000000',0),(3332,'652824000000','若羌县','county','1','y','652800000000',0),(3333,'652825000000','且末县','county','1','y','652800000000',0),(3334,'652826000000','焉耆回族自治县','county','1','y','652800000000',0),(3335,'652827000000','和静县','county','1','y','652800000000',0),(3336,'652828000000','和硕县','county','1','y','652800000000',0),(3337,'652829000000','博湖县','county','1','y','652800000000',0),(3338,'652922000000','温宿县','county','1','y','652900000000',0),(3339,'652923000000','库车县','county','1','y','652900000000',0),(3340,'652924000000','沙雅县','county','1','y','652900000000',0),(3341,'652925000000','新和县','county','1','y','652900000000',0),(3342,'652926000000','拜城县','county','1','y','652900000000',0),(3343,'652927000000','乌什县','county','1','y','652900000000',0),(3344,'652928000000','阿瓦提县','county','1','y','652900000000',0),(3345,'652929000000','柯坪县','county','1','y','652900000000',0),(3346,'653022000000','阿克陶县','county','1','y','653000000000',0),(3347,'653023000000','阿合奇县','county','1','y','653000000000',0),(3348,'653024000000','乌恰县','county','1','y','653000000000',0),(3349,'653121000000','疏附县','county','1','y','653100000000',0),(3350,'653122000000','疏勒县','county','1','y','653100000000',0),(3351,'653123000000','英吉沙县','county','1','y','653100000000',0),(3352,'653124000000','泽普县','county','1','y','653100000000',0),(3353,'653125000000','莎车县','county','1','y','653100000000',0),(3354,'653126000000','叶城县','county','1','y','653100000000',0),(3355,'653127000000','麦盖提县','county','1','y','653100000000',0),(3356,'653128000000','岳普湖县','county','1','y','653100000000',0),(3357,'653129000000','伽师县','county','1','y','653100000000',0),(3358,'653130000000','巴楚县','county','1','y','653100000000',0),(3359,'653131000000','塔什库尔干塔吉克自治县','county','1','y','653100000000',0),(3360,'653221000000','和田县','county','1','y','653200000000',0),(3361,'653222000000','墨玉县','county','1','y','653200000000',0),(3362,'653223000000','皮山县','county','1','y','653200000000',0),(3363,'653224000000','洛浦县','county','1','y','653200000000',0),(3364,'653225000000','策勒县','county','1','y','653200000000',0),(3365,'653226000000','于田县','county','1','y','653200000000',0),(3366,'653227000000','民丰县','county','1','y','653200000000',0),(3367,'654003000000','奎屯市','county','1','y','654000000000',0),(3368,'654021000000','伊宁县','county','1','y','654000000000',0),(3369,'654022000000','察布查尔锡伯自治县','county','1','y','654000000000',0),(3370,'654023000000','霍城县','county','1','y','654000000000',0),(3371,'654024000000','巩留县','county','1','y','654000000000',0),(3372,'654025000000','新源县','county','1','y','654000000000',0),(3373,'654026000000','昭苏县','county','1','y','654000000000',0),(3374,'654027000000','特克斯县','county','1','y','654000000000',0),(3375,'654028000000','尼勒克县','county','1','y','654000000000',0),(3376,'654202000000','乌苏市','county','1','y','654200000000',0),(3377,'654221000000','额敏县','county','1','y','654200000000',0),(3378,'654223000000','沙湾县','county','1','y','654200000000',0),(3379,'654224000000','托里县','county','1','y','654200000000',0),(3380,'654225000000','裕民县','county','1','y','654200000000',0),(3381,'654226000000','和布克赛尔蒙古自治县','county','1','y','654200000000',0),(3382,'654321000000','布尔津县','county','1','y','654300000000',0),(3383,'654322000000','富蕴县','county','1','y','654300000000',0),(3384,'654323000000','福海县','county','1','y','654300000000',0),(3385,'654324000000','哈巴河县','county','1','y','654300000000',0),(3386,'654325000000','青河县','county','1','y','654300000000',0),(3387,'654326000000','吉木乃县','county','1','y','654300000000',0),(3388,'659002000000','阿拉尔市','county','1','y','65',0),(3389,'659003000000','图木舒克市','county','1','y','65',0),(3390,'659004000000','五家渠市','county','1','y','65',0);
/*!40000 ALTER TABLE `tb_area` ENABLE KEYS */;

#
# Structure for table "tb_cbb_comment"
#

DROP TABLE IF EXISTS `tb_cbb_comment`;
CREATE TABLE `tb_cbb_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `attach_ids` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `instance_id` varchar(255) DEFAULT NULL,
  `is_anonymity` int(11) DEFAULT NULL,
  `statue` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `approve_user_id` int(11) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK218AB9B29B9F8D7C` (`create_user_id`),
  KEY `FK218AB9B2B41A0ECD` (`approve_user_id`),
  KEY `FK218AB9B21E4181D1` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_comment"
#


#
# Structure for table "tb_cbb_datapriv"
#

DROP TABLE IF EXISTS `tb_cbb_datapriv`;
CREATE TABLE `tb_cbb_datapriv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compyId` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `groupIds` longtext,
  `groupNames` longtext,
  `IsDelete` int(11) DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `lastUpdateUserId` int(11) DEFAULT NULL,
  `moduleName` varchar(200) DEFAULT NULL,
  `refId` int(11) DEFAULT NULL,
  `refName` varchar(50) DEFAULT NULL,
  `roleIds` longtext,
  `roleNames` longtext,
  `subModuleName` varchar(100) DEFAULT NULL,
  `userIds` longtext,
  `userNames` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_datapriv"
#


#
# Structure for table "tb_cbb_dict"
#

DROP TABLE IF EXISTS `tb_cbb_dict`;
CREATE TABLE `tb_cbb_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `info_order` int(11) DEFAULT NULL,
  `info_type` varchar(100) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `record_user_id` int(11) DEFAULT NULL,
  `sys_tag` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_dict"
#

/*!40000 ALTER TABLE `tb_cbb_dict` DISABLE KEYS */;
INSERT INTO `tb_cbb_dict` VALUES (1,1,'2016-08-25 09:46:38',1,'pigsty_type',0,NULL,'分娩舍',1,1,1),(2,1,'2016-08-25 09:46:44',2,'pigsty_type',0,NULL,'配怀舍',1,1,2),(3,1,'2016-08-25 09:50:10',3,'pigsty_type',0,NULL,'保育舍',1,1,3),(4,1,'2016-08-25 09:50:13',4,'pigsty_type',0,NULL,'育肥舍',1,1,4),(5,1,'2016-08-25 09:50:15',5,'pigsty_type',0,NULL,'混合舍',1,1,5),(6,1,'2016-08-25 09:50:17',6,'pigsty_type',0,NULL,'公猪舍',1,1,6),(7,1,'2016-08-25 09:51:41',1,'variety_type',0,NULL,'其他',1,1,1),(8,1,'2016-08-25 09:52:34',2,'variety_type',0,NULL,'杜洛克',1,1,2),(9,1,'2016-08-25 09:52:34',3,'variety_type',0,NULL,'长白',1,1,3),(10,1,'2016-08-25 09:52:34',4,'variety_type',0,NULL,'大白',1,1,4),(11,1,'2016-08-25 09:52:34',5,'variety_type',0,NULL,'二元',1,1,5),(12,1,'2016-08-25 09:52:34',6,'variety_type',0,NULL,'土猪',1,1,6),(13,1,'2016-08-25 09:55:19',1,'smell_type',0,NULL,'正常腥膻',1,1,1),(14,1,'2016-08-25 09:55:19',2,'smell_type',0,NULL,'异常尿骚',1,1,2),(15,1,'2016-08-25 09:55:19',3,'smell_type',0,NULL,'异常臭味',1,1,3),(16,1,'2016-08-25 09:55:19',4,'smell_type',0,NULL,'其他',1,1,4),(17,1,'2016-08-25 09:56:30',1,'color_type',0,NULL,'浓乳白',1,1,1),(18,1,'2016-08-25 09:56:30',2,'color_type',0,NULL,'浅灰白',1,1,2),(19,1,'2016-08-25 09:56:30',3,'color_type',0,NULL,'异常带红',1,1,3),(20,1,'2016-08-25 09:56:30',4,'color_type',0,NULL,'异常带绿',1,1,4),(21,1,'2016-08-25 09:56:30',5,'color_type',0,NULL,'其他',1,1,5),(22,1,'2016-08-25 09:58:21',1,'leave_type',0,NULL,'死亡',1,1,1),(23,1,'2016-08-25 09:58:21',2,'leave_type',0,NULL,'淘汰',1,1,2),(24,1,'2016-08-25 09:58:21',3,'leave_type',0,NULL,'出售',1,1,3),(25,1,'2016-08-25 09:58:21',4,'leave_type',0,NULL,'其他',1,1,4),(26,1,'2016-08-25 09:58:21',1,'leave_reason',0,NULL,'急性烈性病',1,1,1),(27,1,'2016-08-25 09:58:21',2,'leave_reason',0,NULL,'难产',1,1,2),(28,1,'2016-08-25 09:58:21',3,'leave_reason',0,NULL,'阴道子宫脱脱岗等',1,1,3),(29,1,'2016-08-25 09:58:21',4,'leave_reason',0,NULL,'胀气',1,1,4),(30,1,'2016-08-25 09:58:21',5,'leave_reason',0,NULL,'发烧',1,1,5),(31,1,'2016-08-25 09:58:21',6,'leave_reason',0,NULL,'猝死',1,1,6),(32,1,'2016-08-25 09:58:21',7,'leave_reason',0,NULL,'应激',1,1,7),(33,1,'2016-08-25 09:58:21',8,'leave_reason',0,NULL,'咬死',1,1,8),(34,1,'2016-08-25 09:58:21',9,'leave_reason',0,NULL,'其他',1,1,9),(35,1,'2016-08-25 10:21:57',1,'hog_leave_reason',0,NULL,'压死',1,1,1),(36,1,'2016-08-25 10:21:57',2,'hog_leave_reason',0,NULL,'饿死',1,1,2),(37,1,'2016-08-25 10:21:57',3,'hog_leave_reason',0,NULL,'腹泻',1,1,3),(38,1,'2016-08-25 10:21:57',4,'hog_leave_reason',0,NULL,'脑炎',1,1,4),(39,1,'2016-08-25 10:21:57',5,'hog_leave_reason',0,NULL,'水肿',1,1,5),(40,1,'2016-08-25 10:21:57',6,'hog_leave_reason',0,NULL,'皮炎',1,1,6),(41,1,'2016-08-25 10:21:57',7,'hog_leave_reason',0,NULL,'猝死',1,1,7),(42,1,'2016-08-25 10:21:57',8,'hog_leave_reason',0,NULL,'咬死',1,1,8),(43,1,'2016-08-25 10:21:57',9,'hog_leave_reason',0,NULL,'烈性传染病',1,1,9),(44,1,'2016-08-25 10:21:57',10,'hog_leave_reason',0,NULL,'发烧',1,1,10),(45,1,'2016-08-25 10:21:57',11,'hog_leave_reason',0,NULL,'关节炎',1,1,11),(46,1,'2016-08-25 10:21:57',12,'hog_leave_reason',0,NULL,'遗传病',1,1,12),(47,1,'2016-08-25 10:21:57',13,'hog_leave_reason',0,NULL,'胀气',1,1,13),(48,1,'2016-08-25 10:21:57',14,'hog_leave_reason',0,NULL,'喘气',1,1,14),(49,1,'2016-08-25 10:21:57',15,'hog_leave_reason',0,NULL,'畸形',1,1,15),(50,1,'2016-08-25 10:21:57',16,'hog_leave_reason',0,NULL,'疝气',1,1,16),(51,1,'2016-08-25 10:21:57',17,'hog_leave_reason',0,NULL,'其他',1,1,17);
/*!40000 ALTER TABLE `tb_cbb_dict` ENABLE KEYS */;

#
# Structure for table "tb_cbb_jpush"
#

DROP TABLE IF EXISTS `tb_cbb_jpush`;
CREATE TABLE `tb_cbb_jpush` (
  `push_id` int(11) NOT NULL AUTO_INCREMENT,
  `Insert_Time` datetime DEFAULT NULL,
  `Is_Delete` int(11) DEFAULT NULL,
  `Push_Content` longtext,
  `Push_Time` datetime DEFAULT NULL,
  `push_type` int(11) DEFAULT NULL,
  `Show_Content` longtext,
  `Subject` varchar(200) NOT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `User_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`push_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_jpush"
#


#
# Structure for table "tb_cbb_jpush_user"
#

DROP TABLE IF EXISTS `tb_cbb_jpush_user`;
CREATE TABLE `tb_cbb_jpush_user` (
  `send_no` int(11) NOT NULL AUTO_INCREMENT,
  `is_read` int(11) DEFAULT NULL,
  `Push_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `User_name` varchar(255) DEFAULT NULL,
  `User_type` int(11) NOT NULL,
  PRIMARY KEY (`send_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_jpush_user"
#


#
# Structure for table "tb_cbb_my_processed"
#

DROP TABLE IF EXISTS `tb_cbb_my_processed`;
CREATE TABLE `tb_cbb_my_processed` (
  `my_started_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `advice` varchar(200) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `creater_name` varchar(50) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `instance_id` varchar(50) DEFAULT NULL,
  `module_code` varchar(50) DEFAULT NULL,
  `processer_id` int(11) DEFAULT NULL,
  `processer_name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`my_started_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_my_processed"
#


#
# Structure for table "tb_cbb_my_started"
#

DROP TABLE IF EXISTS `tb_cbb_my_started`;
CREATE TABLE `tb_cbb_my_started` (
  `my_started_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `creater_id` int(11) DEFAULT NULL,
  `creater_name` varchar(50) DEFAULT NULL,
  `creater_time` datetime DEFAULT NULL,
  `instance_id` varchar(50) DEFAULT NULL,
  `module_code` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`my_started_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_my_started"
#


#
# Structure for table "tb_cbb_my_wait_process"
#

DROP TABLE IF EXISTS `tb_cbb_my_wait_process`;
CREATE TABLE `tb_cbb_my_wait_process` (
  `my_started_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `creater_name` varchar(50) DEFAULT NULL,
  `instance_id` varchar(50) DEFAULT NULL,
  `module_code` varchar(50) DEFAULT NULL,
  `processer_id` int(11) DEFAULT NULL,
  `processer_name` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`my_started_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_my_wait_process"
#


#
# Structure for table "tb_cbb_secret_property"
#

DROP TABLE IF EXISTS `tb_cbb_secret_property`;
CREATE TABLE `tb_cbb_secret_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_secret_property"
#


#
# Structure for table "tb_cbb_secret_settings"
#

DROP TABLE IF EXISTS `tb_cbb_secret_settings`;
CREATE TABLE `tb_cbb_secret_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `apply_user_ids` text,
  `attribute` varchar(255) DEFAULT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `invisible_user_ids` text,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cbb_secret_settings"
#


#
# Structure for table "tb_company_info"
#

DROP TABLE IF EXISTS `tb_company_info`;
CREATE TABLE `tb_company_info` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(150) DEFAULT NULL,
  `company_code` varchar(50) DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `company_state` int(11) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `expiration_time` datetime DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `Introduction` varchar(200) DEFAULT NULL,
  `link_man` varchar(150) DEFAULT NULL,
  `log_Url` varchar(100) DEFAULT NULL,
  `philosophy` varchar(255) DEFAULT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `sys_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

#
# Data for table "tb_company_info"
#

INSERT INTO `tb_company_info` VALUES (1,'河南省#郑州市#金水区','AAAAAAAA','潘博猪场',1,'434557245@qq.com',NULL,'2016-08-25 09:36:23',NULL,'潘博',NULL,'',NULL,'15838369365','河南'),(17,'具体地址2222222','IvheYYGl','潘博猪场12',1,NULL,NULL,'2016-08-30 18:24:54','山西大同市南郊区','潘博',NULL,'14#140200000000#140211000000',NULL,'15838369365',NULL),(18,NULL,'UNEAhPlA','北京全亚猪场',1,'',NULL,'2016-08-31 18:57:02',NULL,'',NULL,'111',NULL,'34343434',NULL),(19,NULL,'STTWAZKw','测试',0,'454554',NULL,'2016-08-31 19:01:46',NULL,'',NULL,'111',NULL,'2222',NULL),(20,NULL,'OQqCSIYF','33434',3,'454554@qq.com',NULL,'2016-08-31 19:04:23',NULL,'32333333333333',NULL,'111',NULL,'15838369365',NULL),(21,NULL,'NcpzorSz','W猪场',3,'',NULL,'2016-09-08 10:36:27',NULL,'吴胜光',NULL,'11',NULL,'13838196113',NULL),(22,NULL,'eugAyQAW','p猪场',0,'',NULL,'2016-09-08 10:38:24',NULL,'',NULL,'13',NULL,'15838369365',NULL),(23,NULL,'sRdKQhic','匿名',0,'',NULL,'2016-09-08 10:39:00',NULL,'',NULL,'13',NULL,'13838196113',NULL),(24,NULL,'KQLIEnVV','吴盛光猪场',3,'',NULL,'2016-09-08 10:40:43',NULL,'',NULL,'12',NULL,'15036566326',NULL),(25,NULL,'KJNQHZsj','猪猪猪',0,'',NULL,'2016-09-08 10:56:23',NULL,'',NULL,'12',NULL,'15036566829',NULL),(26,NULL,'DcnWXByV','猪猪猪',0,'',NULL,'2016-09-08 10:56:24',NULL,'',NULL,'12',NULL,'15036566829',NULL),(27,NULL,'AXgCieyj','猪猪猪',0,'',NULL,'2016-09-08 10:57:13',NULL,'',NULL,'12',NULL,'15036566892',NULL),(28,NULL,'zPcfbFoc','猪场',0,'',NULL,'2016-09-08 10:57:58',NULL,'',NULL,'11',NULL,'15869582365',NULL),(29,NULL,'CdfQpbyP','微信集成猪场',1,'',NULL,'2016-09-09 10:10:54',NULL,'三三',NULL,'11',NULL,'15512345679',NULL),(30,NULL,'AhpCnpHb','测试20160909',1,'',NULL,'2016-09-09 15:11:05',NULL,'',NULL,'41',NULL,'15512345678',NULL),(31,NULL,'mTLdyZJg','腾飞猪场',1,'184367850@qq.com',NULL,'2016-09-09 15:30:06',NULL,'腾飞',NULL,'41',NULL,'18638239685',NULL),(39,NULL,'kERHjqZB','大傻逼',1,'',NULL,'2016-09-09 15:47:20',NULL,'',NULL,'11',NULL,'13783476576',NULL),(41,NULL,'ttutSPQb','udud',1,'183848473@qq.com',NULL,'2016-09-09 15:51:41',NULL,'不觉得简单',NULL,'11',NULL,'18273744766',NULL),(42,NULL,'HMvIrCoL','测试20160912',1,'12345678@163.com',NULL,'2016-09-12 09:58:21',NULL,'测试',NULL,'41',NULL,'15512345678',NULL),(43,NULL,'cesgAyem','李华伟测试',2,'',NULL,'2016-09-12 14:21:00',NULL,'',NULL,'42',NULL,'13849041182',NULL),(44,NULL,'ttJmOycH','提醒猪场',1,'',NULL,'2016-09-19 17:33:45',NULL,'',NULL,'11',NULL,'15838369365',NULL);

#
# Structure for table "tb_data_filter_rule"
#

DROP TABLE IF EXISTS `tb_data_filter_rule`;
CREATE TABLE `tb_data_filter_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `CONDITION_JPQL` longtext,
  `MODEL_CLASS_NAME` varchar(128) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(6) DEFAULT NULL,
  `RELATION_ID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_data_filter_rule"
#


#
# Structure for table "tb_group_info"
#

DROP TABLE IF EXISTS `tb_group_info`;
CREATE TABLE `tb_group_info` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `Functions` longtext,
  `group_code` varchar(50) DEFAULT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `group_type` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `Memo` longtext,
  `order_index` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `Path` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `assistant_id` int(11) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `group_state` int(11) DEFAULT NULL,
  `is_fork_group` int(11) DEFAULT NULL,
  `public_level` int(11) DEFAULT NULL,
  `top_change_id` int(11) DEFAULT NULL,
  `top_director_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_group_info"
#


#
# Structure for table "tb_group_user"
#

DROP TABLE IF EXISTS `tb_group_user`;
CREATE TABLE `tb_group_user` (
  `Vid` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`Vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_group_user"
#


#
# Structure for table "tb_module_info"
#

DROP TABLE IF EXISTS `tb_module_info`;
CREATE TABLE `tb_module_info` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `Icon` varchar(50) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `Memo` longtext,
  `module_class` varchar(50) DEFAULT NULL,
  `module_code` varchar(50) DEFAULT NULL,
  `module_level` int(11) DEFAULT NULL,
  `module_name` varchar(50) DEFAULT NULL,
  `module_type` int(11) DEFAULT NULL,
  `order_index` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sys_name` varchar(50) DEFAULT NULL,
  `Url` varchar(100) DEFAULT NULL,
  `default_state` int(11) DEFAULT NULL,
  `menu_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_module_info"
#


#
# Structure for table "tb_module_info_mobile"
#

DROP TABLE IF EXISTS `tb_module_info_mobile`;
CREATE TABLE `tb_module_info_mobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `code` varchar(150) DEFAULT NULL,
  `icon` longtext,
  `name` varchar(50) DEFAULT NULL,
  `order_list` varchar(50) DEFAULT NULL,
  `statue` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK54B081711248E351` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_module_info_mobile"
#


#
# Structure for table "tb_oc_check"
#

DROP TABLE IF EXISTS `tb_oc_check`;
CREATE TABLE `tb_oc_check` (
  `check_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` int(11) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`check_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_oc_check"
#


#
# Structure for table "tb_om_affair_setting"
#

DROP TABLE IF EXISTS `tb_om_affair_setting`;
CREATE TABLE `tb_om_affair_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `affair_priv` int(11) DEFAULT NULL,
  `module_code` varchar(255) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `push_priv` int(11) DEFAULT NULL,
  `sms_priv` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_om_affair_setting"
#


#
# Structure for table "tb_om_affairs"
#

DROP TABLE IF EXISTS `tb_om_affairs`;
CREATE TABLE `tb_om_affairs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` int(11) DEFAULT NULL,
  `remind_flag` int(11) NOT NULL,
  `remind_time` datetime DEFAULT NULL,
  `body_id` int(11) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9EDF5DDAEB48A10F` (`to_id`),
  KEY `FK9EDF5DDAB5267FBB` (`body_id`),
  KEY `FK9EDF5DDA9B9F8D7C` (`create_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_om_affairs"
#


#
# Structure for table "tb_om_affairs_body"
#

DROP TABLE IF EXISTS `tb_om_affairs_body`;
CREATE TABLE `tb_om_affairs_body` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `content_info` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` int(11) DEFAULT NULL,
  `remind_url` varchar(255) DEFAULT NULL,
  `send_time` datetime NOT NULL,
  `sms_type` varchar(255) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9C2CE7C1455580` (`from_id`),
  KEY `FK9C2CE79B9F8D7C` (`create_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_om_affairs_body"
#


#
# Structure for table "tb_om_affairs_remind"
#

DROP TABLE IF EXISTS `tb_om_affairs_remind`;
CREATE TABLE `tb_om_affairs_remind` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `times` int(11) NOT NULL,
  PRIMARY KEY (`vid`),
  UNIQUE KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_om_affairs_remind"
#


#
# Structure for table "tb_om_attachment"
#

DROP TABLE IF EXISTS `tb_om_attachment`;
CREATE TABLE `tb_om_attachment` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `attach_file` varchar(200) NOT NULL,
  `attach_name` varchar(200) NOT NULL,
  `attach_size` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_om_attachment"
#


#
# Structure for table "tb_om_sys_para"
#

DROP TABLE IF EXISTS `tb_om_sys_para`;
CREATE TABLE `tb_om_sys_para` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `para_name` varchar(255) DEFAULT NULL,
  `para_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_om_sys_para"
#


#
# Structure for table "tb_pig"
#

DROP TABLE IF EXISTS `tb_pig`;
CREATE TABLE `tb_pig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `ear_no` varchar(50) DEFAULT NULL,
  `ear_short_no` varchar(50) DEFAULT NULL,
  `variety` int(11) DEFAULT NULL,
  `parity` int(11) DEFAULT NULL,
  `enter_date` datetime DEFAULT NULL,
  `enter_state` int(11) DEFAULT NULL,
  `from_type` int(11) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `father` int(11) DEFAULT NULL,
  `mother` int(11) DEFAULT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `pigsty_id` int(11) DEFAULT NULL,
  `swinery_id` int(11) DEFAULT NULL,
  `is_outlier` int(11) DEFAULT NULL,
  `in_scene` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `process_id` varchar(100) DEFAULT NULL,
  `state_date` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `recent_breed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig"
#

INSERT INTO `tb_pig` VALUES (14,0,'p001','p001',5,0,'2016-09-04 00:00:00',0,1,'2016-07-29 00:00:00',NULL,NULL,'',11,NULL,1,0,5,'5ac3edfb-25dd-478c-9a68-8b11695aba34','2016-09-05 00:00:00','2016-09-05 18:26:34',33,'2016-09-20 11:31:41',33,0,17,NULL),(15,0,'w001','m1',6,14,'2015-09-05 00:00:00',1,1,'2014-09-05 00:00:00',NULL,NULL,'',1,NULL,1,0,7,'dde48838-6e55-4f57-ae13-c8351d13b093','2016-09-04 00:00:00','2016-09-05 18:29:26',33,'2016-09-07 14:27:13',33,0,17,NULL),(16,1,'p111','',6,NULL,'2016-08-05 00:00:00',2,0,'2016-08-24 00:00:00',NULL,14,'',14,NULL,1,0,10,NULL,'2016-08-24 00:00:00','2016-09-05 18:29:23',33,NULL,NULL,0,17,'2016-09-20 11:31:41'),(17,1,'w101','',6,NULL,'2015-09-05 00:00:00',0,1,'2014-09-05 00:00:00',NULL,NULL,'',NULL,NULL,1,0,8,NULL,'2014-09-05 00:00:00','2016-09-05 18:35:10',33,'2016-09-05 18:38:21',33,0,17,NULL),(18,1,'p112','',4,NULL,'2016-09-01 00:00:00',2,0,'2016-09-03 00:00:00',NULL,14,'',14,NULL,1,0,10,NULL,'2016-09-03 00:00:00','2016-09-05 18:41:12',33,NULL,NULL,0,17,'2016-09-20 11:31:41'),(19,0,'p002','',3,1,'2016-09-03 00:00:00',0,0,'2016-08-31 00:00:00',NULL,NULL,'',16,NULL,1,0,5,'bd4d5b6e-2492-4f86-97a0-e17ebc748720','2016-09-04 00:00:00','2016-09-05 18:51:42',33,'2016-09-08 10:57:09',33,0,17,NULL),(20,1,'p113','',6,NULL,'2016-09-05 00:00:00',2,0,'2016-09-04 00:00:00',NULL,NULL,'',14,NULL,1,0,10,NULL,'2016-09-04 00:00:00','2016-09-05 18:52:47',33,NULL,NULL,0,17,NULL),(21,0,'mz20160907001','1',2,2,'2016-09-02 00:00:00',1,0,'2016-06-07 00:00:00',NULL,NULL,'',15,NULL,0,0,4,'c0edbf3b-b180-4b6c-926c-a67f52531e72','2016-08-17 00:00:00','2016-09-07 14:35:05',33,'2016-09-14 16:59:21',33,0,17,NULL),(22,1,'gz20160907001','1',2,NULL,'2016-09-04 00:00:00',2,0,'2016-06-07 00:00:00',NULL,NULL,'',25,NULL,1,0,10,NULL,'2016-06-07 00:00:00','2016-09-07 14:36:20',33,'2016-09-07 14:39:09',33,0,17,'2016-09-14 16:59:21'),(23,0,'mz20160907002','',3,1,'2015-01-07 00:00:00',1,1,'2017-09-07 00:00:00',NULL,NULL,'',1,NULL,0,0,4,'a303a92f-28ab-4d3c-8e1a-2be0b2c63617','2016-08-15 00:00:00','2016-09-07 15:56:17',33,'2016-09-08 11:05:45',33,0,17,NULL),(24,1,'gz20160907002','',3,NULL,'2015-03-07 00:00:00',2,1,'2014-09-07 00:00:00',NULL,NULL,'',25,NULL,0,0,10,NULL,'2014-09-07 00:00:00','2016-09-07 15:57:27',33,'2016-09-21 15:43:27',33,0,17,'2016-09-20 11:31:41'),(25,1,'2222','',4,NULL,'2016-09-05 00:00:00',0,0,'2015-09-07 00:00:00',17,21,'',14,NULL,0,0,8,NULL,'2015-09-07 00:00:00','2016-09-07 15:58:13',33,'2016-09-21 15:43:43',33,0,17,NULL),(26,0,'Km','12',3,2,'2016-09-01 00:00:00',0,0,'2016-09-01 00:00:00',NULL,NULL,'',22,NULL,0,0,8,NULL,'2016-09-01 00:00:00','2016-09-07 17:49:56',33,NULL,NULL,1,17,NULL),(27,0,'12','12',2,2,'2016-09-01 00:00:00',0,0,'2016-09-01 00:00:00',NULL,NULL,'',24,NULL,0,0,8,NULL,'2016-09-01 00:00:00','2016-09-07 17:52:32',33,NULL,NULL,1,17,NULL),(28,0,'12','123',2,2,'2016-09-01 00:00:00',0,0,'2016-09-02 00:00:00',NULL,NULL,'',23,NULL,0,0,8,NULL,'2016-09-02 00:00:00','2016-09-07 17:53:25',33,NULL,NULL,1,17,NULL),(29,0,'21','1',3,2,'2016-09-01 00:00:00',0,0,'2016-09-06 00:00:00',25,NULL,'',NULL,NULL,0,0,8,NULL,'2016-09-06 00:00:00','2016-09-07 17:54:40',33,NULL,NULL,1,17,NULL),(30,0,'00000','',2,1,'2016-09-07 00:00:00',0,0,'2016-08-08 00:00:00',NULL,NULL,'',14,NULL,0,0,8,NULL,'2016-08-08 00:00:00','2016-09-08 10:12:15',33,NULL,NULL,0,17,NULL),(31,0,'mz201609072','121',2,2,'2016-09-02 00:00:00',0,0,'2016-09-01 00:00:00',NULL,NULL,'',21,NULL,0,0,8,NULL,'2016-09-01 00:00:00','2016-09-08 10:13:43',33,NULL,NULL,0,17,NULL),(32,0,'AAAvvvv','AAAvvvv',6,0,'2016-09-08 00:00:00',1,0,'2014-09-08 00:00:00',NULL,NULL,'',16,NULL,0,0,5,'9e4c32ce-3847-4b5d-a4c0-c70fa4b93180','2016-03-02 00:00:00','2016-09-08 11:00:16',33,'2016-09-08 11:07:45',33,0,17,NULL),(33,0,'MG00001','001',2,0,'2016-09-03 00:00:00',1,0,'2016-05-02 00:00:00',NULL,NULL,'',31,NULL,0,0,9,NULL,'2016-05-02 00:00:00','2016-09-09 16:28:48',57,NULL,NULL,0,31,NULL),(34,1,'MB00001','012',4,NULL,'2016-09-08 00:00:00',2,0,'2016-04-16 00:00:00',NULL,NULL,'',31,NULL,0,0,10,NULL,'2016-04-16 00:00:00','2016-09-09 16:30:00',57,NULL,NULL,1,31,NULL),(35,1,'G123456','',4,NULL,'2016-09-04 00:00:00',2,0,'2016-06-09 00:00:00',NULL,NULL,'',31,NULL,0,0,10,NULL,'2016-06-09 00:00:00','2016-09-09 18:34:34',59,NULL,NULL,0,31,NULL),(36,0,'MB00002','002',5,1,'2016-08-04 00:00:00',1,0,'2016-08-05 00:00:00',35,33,'',31,NULL,0,0,9,NULL,'2016-08-05 00:00:00','2016-09-09 18:34:57',57,NULL,NULL,0,31,NULL),(37,1,'G111111','',4,NULL,'2016-08-09 00:00:00',0,0,'2016-06-09 00:00:00',35,33,'',32,NULL,1,0,8,NULL,'2016-06-09 00:00:00','2016-09-09 18:35:13',59,NULL,NULL,0,31,NULL),(38,0,'m00005','',2,12,'2016-09-09 00:00:00',0,0,'2014-09-09 00:00:00',NULL,NULL,'',31,NULL,0,0,4,'5d6aeba9-3602-42ad-b865-cf6c7925e5cf','2016-09-13 00:00:00','2016-09-09 18:35:27',58,'2016-09-13 10:55:19',58,0,31,NULL),(39,0,'s123456','6666',2,7,'2016-09-09 00:00:00',1,0,'2016-09-09 00:00:00',-1,36,'',31,NULL,0,0,7,'9d0039a5-8d8b-40f7-a779-a347b0e4aac3','2016-09-08 00:00:00','2016-09-09 18:35:31',60,'2016-09-09 18:38:25',58,0,31,NULL),(40,0,'MDM','456',2,10,'2016-09-06 00:00:00',0,0,'2016-08-29 00:00:00',NULL,NULL,'',31,NULL,0,0,8,NULL,'2016-08-29 00:00:00','2016-09-09 18:36:04',61,'2016-09-11 17:52:26',57,0,31,NULL),(41,0,'s1364697','777',3,8,'2010-01-09 00:00:00',1,0,'2016-09-09 00:00:00',-1,38,'',32,NULL,0,0,9,NULL,'2016-09-09 00:00:00','2016-09-09 18:36:25',60,NULL,NULL,0,31,NULL),(42,0,'s7849465','8888',5,6,'2016-09-03 00:00:00',0,0,'2015-08-05 00:00:00',35,41,'',31,NULL,0,0,8,NULL,'2015-08-05 00:00:00','2016-09-09 18:37:09',60,NULL,NULL,0,31,NULL),(43,0,'mdjw','123',1,5,'2016-09-09 00:00:00',0,1,'2016-09-05 00:00:00',NULL,NULL,'',31,NULL,0,0,8,NULL,'2016-09-05 00:00:00','2016-09-09 18:37:26',61,NULL,NULL,0,31,NULL),(44,0,'y66543','434',3,3,'2015-07-09 00:00:00',0,0,'2015-08-13 00:00:00',37,42,'',31,NULL,0,0,8,NULL,'2015-08-13 00:00:00','2016-09-09 18:38:40',60,NULL,NULL,0,31,NULL),(45,0,'M123456','',5,5,'2016-08-09 00:00:00',0,0,'2016-04-09 00:00:00',35,33,'',31,NULL,0,0,8,NULL,'2016-06-09 00:00:00','2016-09-09 18:38:50',59,'2016-09-09 18:39:37',59,0,31,NULL),(46,0,'y333333','11111',2,6,'2014-09-09 00:00:00',1,0,'2014-09-09 00:00:00',37,42,'',31,NULL,0,0,9,NULL,'2014-09-09 00:00:00','2016-09-09 18:39:33',60,NULL,NULL,0,31,NULL),(47,0,'mg123580','86349',1,10,'2016-08-09 00:00:00',0,0,'2016-03-09 00:00:00',37,NULL,'',31,NULL,0,0,8,NULL,'2016-03-09 00:00:00','2016-09-09 18:39:36',61,NULL,NULL,0,31,NULL),(48,0,'Mb3694','36',4,0,'2016-09-02 00:00:00',1,1,'2016-09-01 00:00:00',NULL,NULL,'河南',31,NULL,0,0,9,NULL,'2016-09-01 00:00:00','2016-09-11 17:48:46',57,NULL,NULL,0,31,NULL),(49,0,'mzbczz0912001','001',2,0,'2015-09-12 00:00:00',1,0,'2015-09-12 00:00:00',55,68,'',36,NULL,0,0,6,'2183a6e6-b8d5-417e-b7a9-ce778728355d','2016-06-20 00:00:00','2016-09-12 10:37:06',53,'2016-09-14 10:01:50',53,0,30,NULL),(50,0,'mzbchb0912002','002',3,0,'2016-04-05 00:00:00',0,0,'2016-02-05 00:00:00',NULL,NULL,'',37,NULL,0,0,6,'64242542-b614-4ca1-a4fc-efd885b5eef9','2016-06-20 00:00:00','2016-09-12 10:39:33',53,'2016-09-12 13:59:47',53,0,30,NULL),(51,0,'mzwgzz0912003','003',4,1,'2016-09-01 00:00:00',1,1,'2016-07-06 00:00:00',NULL,NULL,'测试',36,NULL,1,0,4,'d1af94bd-9629-463a-b36d-3b2f62c50a0c','2016-09-10 00:00:00','2016-09-12 10:41:27',53,'2016-09-13 17:24:09',53,0,30,NULL),(52,0,'mzwghb0912004','004',5,1,'2016-09-01 00:00:00',0,1,'2016-02-04 00:00:00',NULL,NULL,'5科技哦自由人走下坡路数据国务院破利欲熏心就像是最美丽硝酸异山梨酯注射液金融组织外婆沟通后容易陷入他',36,NULL,0,0,5,'ffbb6e02-d867-4350-baaf-7227f0656987','2016-09-08 00:00:00','2016-09-12 10:42:56',53,'2016-09-14 10:05:59',53,0,30,NULL),(53,1,'gzbczz0912001','001',2,NULL,'2016-02-04 00:00:00',2,0,'2015-12-17 00:00:00',NULL,NULL,'',41,NULL,0,0,10,NULL,'2015-12-17 00:00:00','2016-09-12 10:45:51',53,NULL,NULL,0,30,NULL),(54,1,'gzbchb0912002','002',3,NULL,'2016-07-14 00:00:00',0,0,'2016-07-01 00:00:00',NULL,NULL,'',41,NULL,0,0,8,NULL,'2016-07-01 00:00:00','2016-09-12 10:47:59',53,NULL,NULL,0,30,NULL),(55,1,'gzwgzz0912003','003',4,NULL,'2016-09-01 00:00:00',2,1,'2016-07-08 00:00:00',NULL,NULL,'',41,NULL,0,0,10,NULL,'2016-07-08 00:00:00','2016-09-12 10:50:14',53,NULL,NULL,0,30,NULL),(56,1,'gzwghb0912004','004',5,NULL,'2016-09-01 00:00:00',0,1,'2016-07-14 00:00:00',NULL,NULL,'',41,NULL,0,0,8,NULL,'2016-07-14 00:00:00','2016-09-12 10:51:26',53,NULL,NULL,0,30,NULL),(57,0,'sorry','99',1,0,'2016-09-12 00:00:00',0,0,'2016-09-01 00:00:00',NULL,NULL,'',36,NULL,0,0,8,NULL,'2016-09-01 00:00:00','2016-09-12 10:57:19',53,NULL,NULL,1,30,NULL),(58,0,'626','',1,0,'2016-09-12 00:00:00',0,0,'2016-09-01 00:00:00',NULL,NULL,'',36,NULL,0,0,8,NULL,'2016-09-01 00:00:00','2016-09-12 12:00:31',53,NULL,NULL,1,30,NULL),(59,0,'123456','5',1,0,'2016-07-07 00:00:00',1,0,'2016-07-01 00:00:00',55,50,'',36,NULL,1,0,9,NULL,'2016-07-01 00:00:00','2016-09-12 15:18:04',53,'2016-09-12 15:20:40',53,0,30,NULL),(60,0,'4555','',6,0,'2016-08-04 00:00:00',1,0,'2016-07-07 00:00:00',55,59,'',36,NULL,0,1,9,NULL,'2016-07-07 00:00:00','2016-09-12 15:21:44',53,'2016-09-12 16:10:57',53,0,30,NULL),(61,0,'hb111','',1,0,'2016-09-02 00:00:00',0,0,'2016-08-18 00:00:00',NULL,NULL,'',36,NULL,0,0,8,NULL,'2016-08-18 00:00:00','2016-09-12 16:09:26',53,NULL,NULL,0,30,NULL),(62,1,'456','',1,NULL,'2016-09-12 00:00:00',0,0,'2016-09-02 00:00:00',NULL,NULL,'',46,NULL,0,0,8,NULL,'2016-09-02 00:00:00','2016-09-12 17:33:35',53,'2016-09-13 16:54:12',53,0,30,NULL),(63,0,'9596','',1,0,'2016-09-12 00:00:00',0,0,'2016-08-11 00:00:00',NULL,NULL,'',36,NULL,0,0,8,NULL,'2016-08-11 00:00:00','2016-09-12 17:43:39',53,NULL,NULL,0,30,NULL),(64,0,'1','',1,2,'2016-05-20 00:00:00',1,0,'2014-12-04 00:00:00',NULL,NULL,'',36,NULL,0,0,7,'03d0cf0d-80b7-4b8e-b3d8-5f71a89c40c1','2016-09-06 00:00:00','2016-09-13 11:00:03',53,'2016-09-13 17:24:30',53,0,30,NULL),(65,0,'9','',1,0,'2016-05-20 00:00:00',1,0,'2016-05-06 00:00:00',NULL,NULL,'',36,NULL,0,0,9,NULL,'2016-05-06 00:00:00','2016-09-13 11:01:45',53,NULL,NULL,0,30,NULL),(66,0,'wg001','',1,0,'2015-03-13 00:00:00',1,1,'2015-02-13 00:00:00',NULL,NULL,'测试外购种猪来源是否正确牧绒雪羊绒民营企业做事有始有终正是因为是维生素走下坡路著我扁舟一叶名岂文章著',37,NULL,0,0,1,'b2e3eef7-379d-4fac-bf8b-5964053d514a','2016-08-15 00:00:00','2016-09-13 14:17:05',53,'2016-09-13 17:14:30',53,0,30,NULL),(67,0,'2','',1,0,'2016-09-01 00:00:00',0,0,'2016-02-17 00:00:00',53,50,'',36,NULL,0,0,8,NULL,'2016-02-17 00:00:00','2016-09-13 14:47:30',53,'2016-09-13 14:48:25',53,0,30,NULL),(68,0,'88','',1,1,'2016-09-01 00:00:00',0,0,'2014-10-02 00:00:00',NULL,NULL,'',36,NULL,0,0,7,'da2769e8-766d-4999-845f-38ef188ae856','2015-09-06 00:00:00','2016-09-13 15:11:44',53,'2016-09-14 10:16:08',53,0,30,NULL),(69,0,'6','',3,0,'2016-06-02 00:00:00',0,0,'2015-01-08 00:00:00',NULL,NULL,'',37,NULL,0,0,1,'5475ce52-9a22-4bda-a7a6-9afacbe45ef2','2016-05-05 00:00:00','2016-09-13 17:41:35',53,'2016-09-13 17:52:24',53,0,30,NULL),(70,0,'19','',1,0,'2015-09-10 00:00:00',0,0,'2015-06-19 00:00:00',NULL,NULL,'',40,NULL,0,0,8,NULL,'2015-06-19 00:00:00','2016-09-14 10:22:51',53,NULL,NULL,0,30,NULL),(71,0,'99','',1,0,'2016-02-11 00:00:00',0,0,'2016-01-14 00:00:00',NULL,NULL,'',36,NULL,0,0,8,NULL,'2016-01-14 00:00:00','2016-09-14 10:24:13',53,NULL,NULL,0,30,NULL),(72,1,'212','121212',1,NULL,'2016-09-01 00:00:00',0,0,'2016-08-30 00:00:00',-1,NULL,'',1,NULL,0,0,8,NULL,'2016-08-30 00:00:00','2016-09-14 10:38:29',33,'2016-09-21 15:43:09',33,0,17,NULL),(73,1,'212111111111111','1212',1,NULL,'2016-09-01 00:00:00',0,0,'2016-08-31 00:00:00',NULL,NULL,'',1,NULL,0,0,8,NULL,'2016-08-31 00:00:00','2016-09-14 10:39:19',33,NULL,NULL,0,17,'2016-09-14 16:59:21'),(74,0,'21212','222',1,2,'2016-09-13 00:00:00',0,0,'2016-09-01 00:00:00',NULL,NULL,'',1,NULL,0,1,8,NULL,'2016-09-01 00:00:00','2016-09-14 10:49:30',33,'2016-09-20 10:02:29',33,0,17,NULL),(75,0,'123','lo',1,10,'2016-09-14 00:00:00',0,0,'2016-09-12 00:00:00',NULL,NULL,'',19,NULL,0,0,8,NULL,'2016-09-12 00:00:00','2016-09-14 15:50:11',33,NULL,NULL,0,17,NULL),(76,0,'123456789h','',1,0,'2016-09-22 00:00:00',0,0,'2016-09-22 00:00:00',NULL,NULL,'',1,NULL,0,0,8,NULL,'2016-09-22 00:00:00','2016-09-22 14:23:47',33,'2016-09-22 14:24:29',33,0,17,NULL);

#
# Structure for table "tb_pig_breed"
#

DROP TABLE IF EXISTS `tb_pig_breed`;
CREATE TABLE `tb_pig_breed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sow_id` int(11) DEFAULT NULL COMMENT '母猪',
  `breed_date` datetime DEFAULT NULL,
  `pigsty_id` int(11) DEFAULT NULL,
  `one_boar` int(11) DEFAULT NULL,
  `two_boar` int(11) DEFAULT NULL,
  `three_boar` int(11) DEFAULT NULL,
  `year_week` varchar(50) DEFAULT NULL,
  `process_id` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_breed"
#

INSERT INTO `tb_pig_breed` VALUES (20,15,'2016-08-05 00:00:00',20,17,-1,16,'2016年32周','fdb83a01-c365-4dd5-9f94-4ffffaddeca3','2016-09-05 18:45:01',33,'2016-09-05 19:03:38',33,0,17),(21,15,'2016-08-05 00:00:00',15,16,NULL,NULL,'2016年32周','dde48838-6e55-4f57-ae13-c8351d13b093','2016-09-05 19:12:36',33,'2016-09-06 16:03:35',33,0,17),(22,14,'2016-09-05 00:00:00',11,24,16,18,'2016年37周','5ac3edfb-25dd-478c-9a68-8b11695aba34','2016-09-06 16:00:59',33,'2016-09-20 11:31:41',33,0,17),(23,21,'2016-08-07 00:00:00',15,22,73,NULL,'2016年33周','c0edbf3b-b180-4b6c-926c-a67f52531e72','2016-09-07 15:33:28',33,'2016-09-14 16:59:21',33,0,17),(24,19,'2016-09-04 00:00:00',16,17,16,18,'2016年37周','bd4d5b6e-2492-4f86-97a0-e17ebc748720','2016-09-07 15:53:47',33,'2016-09-08 10:57:09',33,0,17),(25,23,'2016-05-07 00:00:00',25,24,NULL,NULL,'2016年19周','a303a92f-28ab-4d3c-8e1a-2be0b2c63617','2016-09-07 16:32:44',33,'2016-09-07 16:32:44',33,0,17),(26,32,'2016-03-02 00:00:00',16,24,NULL,NULL,'2016年10周','9e4c32ce-3847-4b5d-a4c0-c70fa4b93180','2016-09-08 11:04:51',33,'2016-09-08 11:07:45',33,0,17),(27,38,'2015-09-09 00:00:00',32,-1,NULL,-1,'2015年37周','5d6aeba9-3602-42ad-b865-cf6c7925e5cf','2016-09-09 18:36:17',58,'2016-09-12 17:22:57',58,0,31),(28,39,'2015-09-09 00:00:00',32,37,NULL,NULL,'2015年37周','9d0039a5-8d8b-40f7-a779-a347b0e4aac3','2016-09-09 18:36:53',58,'2016-09-09 18:36:53',58,0,31),(29,49,'2016-05-20 00:00:00',37,53,54,NULL,'2016年21周','2183a6e6-b8d5-417e-b7a9-ce778728355d','2016-09-12 13:43:32',53,'2016-09-12 13:53:15',53,0,30),(30,50,'2016-05-20 00:00:00',37,54,NULL,NULL,'2016年21周','64242542-b614-4ca1-a4fc-efd885b5eef9','2016-09-12 13:59:06',53,'2016-09-12 13:59:06',53,0,30),(31,51,'2016-07-12 00:00:00',37,55,NULL,NULL,'2016年29周','d003f5e3-9cdb-4373-b924-283084d7d994','2016-09-12 14:00:42',53,'2016-09-12 14:00:42',53,0,30),(32,51,'2016-08-13 00:00:00',37,55,NULL,NULL,'2016年33周','a2d632b3-7f80-45a2-be41-06267423e0c2','2016-09-12 14:03:22',53,'2016-09-12 14:03:22',53,0,30),(33,51,'2016-04-12 00:00:00',37,55,NULL,NULL,'2016年16周','d1af94bd-9629-463a-b36d-3b2f62c50a0c','2016-09-12 14:19:26',53,'2016-09-12 14:19:26',53,0,30),(34,52,'2016-03-12 00:00:00',37,56,NULL,NULL,'2016年11周','68706cf7-cadb-49c3-97d9-0d04eb9967bd','2016-09-12 14:40:12',53,'2016-09-12 14:40:12',53,0,30),(35,64,'2016-04-14 00:00:00',44,53,NULL,NULL,'2016年16周','03d0cf0d-80b7-4b8e-b3d8-5f71a89c40c1','2016-09-13 11:00:36',53,'2016-09-13 11:00:36',53,0,30),(36,52,'2016-09-08 00:00:00',46,56,55,56,'2016年37周','ffbb6e02-d867-4350-baaf-7227f0656987','2016-09-13 14:59:32',53,'2016-09-13 17:08:27',53,0,30),(37,68,'2015-05-14 00:00:00',37,53,54,55,'2015年20周','da2769e8-766d-4999-845f-38ef188ae856','2016-09-13 15:12:31',53,'2016-09-13 15:12:31',53,0,30),(38,66,'2016-08-10 00:00:00',37,53,NULL,NULL,'2016年33周','b2e3eef7-379d-4fac-bf8b-5964053d514a','2016-09-13 17:13:38',53,'2016-09-13 17:13:38',53,0,30),(39,69,'2016-04-05 00:00:00',37,56,NULL,NULL,'2016年15周','5475ce52-9a22-4bda-a7a6-9afacbe45ef2','2016-09-13 17:46:36',53,'2016-09-13 17:46:36',53,0,30);

#
# Structure for table "tb_pig_check"
#

DROP TABLE IF EXISTS `tb_pig_check`;
CREATE TABLE `tb_pig_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sow_id` int(11) DEFAULT NULL,
  `check_date` datetime DEFAULT NULL,
  `pigsty_id` int(11) DEFAULT NULL,
  `check_result` int(11) DEFAULT NULL,
  `year_week` varchar(50) DEFAULT NULL,
  `process_id` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_check"
#

INSERT INTO `tb_pig_check` VALUES (11,15,'2016-08-14 00:00:00',11,2,'2016年34周','fdb83a01-c365-4dd5-9f94-4ffffaddeca3','2016-09-05 19:04:19',33,'2016-09-05 19:11:59',33,0,17),(12,15,'2016-02-06 00:00:00',11,4,'2016年6周','dde48838-6e55-4f57-ae13-c8351d13b093','2016-09-05 19:13:52',33,'2016-09-05 19:20:25',33,0,17),(13,21,'2016-05-07 00:00:00',25,4,'2016年19周','c0edbf3b-b180-4b6c-926c-a67f52531e72','2016-09-07 15:51:15',33,'2016-09-07 16:00:29',33,0,17),(14,21,'2016-05-07 00:00:00',11,4,'2016年19周','c0edbf3b-b180-4b6c-926c-a67f52531e72','2016-09-07 15:58:54',33,'2016-09-07 15:58:54',33,0,17),(15,38,'2016-09-04 00:00:00',32,1,'2016年37周','5d6aeba9-3602-42ad-b865-cf6c7925e5cf','2016-09-09 18:36:38',61,'2016-09-09 18:36:38',61,0,31),(16,49,'2016-05-25 00:00:00',37,1,'2016年22周','2183a6e6-b8d5-417e-b7a9-ce778728355d','2016-09-12 13:47:02',53,'2016-09-12 13:48:08',53,0,30),(17,49,'2016-06-20 00:00:00',37,1,'2016年26周','2183a6e6-b8d5-417e-b7a9-ce778728355d','2016-09-12 13:52:45',53,'2016-09-12 13:52:45',53,0,30),(18,50,'2016-06-20 00:00:00',37,4,'2016年26周','64242542-b614-4ca1-a4fc-efd885b5eef9','2016-09-12 13:59:47',53,'2016-09-12 13:59:47',53,0,30),(19,51,'2016-08-12 00:00:00',37,2,'2016年33周','d003f5e3-9cdb-4373-b924-283084d7d994','2016-09-12 14:02:12',53,'2016-09-12 14:02:12',53,0,30),(20,51,'2016-08-20 00:00:00',37,3,'2016年34周','a2d632b3-7f80-45a2-be41-06267423e0c2','2016-09-12 14:04:30',53,'2016-09-12 14:04:30',53,0,30),(21,49,'2016-06-20 00:00:00',37,4,'2016年26周','2183a6e6-b8d5-417e-b7a9-ce778728355d','2016-09-12 14:11:31',53,'2016-09-12 14:11:31',53,0,30),(22,51,'2016-05-12 00:00:00',37,4,'2016年20周','d1af94bd-9629-463a-b36d-3b2f62c50a0c','2016-09-12 14:20:01',53,'2016-09-12 14:20:01',53,0,30),(23,52,'2016-04-12 00:00:00',37,4,'2016年16周','68706cf7-cadb-49c3-97d9-0d04eb9967bd','2016-09-12 14:41:32',53,'2016-09-12 14:41:32',53,0,30),(24,64,'2016-05-14 00:00:00',37,4,'2016年20周','03d0cf0d-80b7-4b8e-b3d8-5f71a89c40c1','2016-09-13 11:01:09',53,'2016-09-13 11:01:09',53,0,30),(25,66,'2016-08-15 00:00:00',37,1,'2016年34周','b2e3eef7-379d-4fac-bf8b-5964053d514a','2016-09-13 17:14:23',53,'2016-09-13 17:14:30',53,0,30),(26,69,'2016-05-05 00:00:00',37,1,'2016年19周','5475ce52-9a22-4bda-a7a6-9afacbe45ef2','2016-09-13 17:47:03',53,'2016-09-13 17:47:03',53,0,30),(27,69,'2016-05-05 00:00:00',37,1,'2016年19周','5475ce52-9a22-4bda-a7a6-9afacbe45ef2','2016-09-13 17:52:24',53,'2016-09-13 17:52:24',53,0,30);

#
# Structure for table "tb_pig_collect"
#

DROP TABLE IF EXISTS `tb_pig_collect`;
CREATE TABLE `tb_pig_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boar_id` int(11) DEFAULT NULL,
  `collect_date` datetime DEFAULT NULL,
  `pigsty_id` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `activity` float DEFAULT NULL,
  `density` float DEFAULT NULL,
  `deformity` float DEFAULT NULL,
  `colour` int(11) DEFAULT NULL,
  `smell` int(11) DEFAULT NULL,
  `year_week` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `dilute` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_collect"
#

INSERT INTO `tb_pig_collect` VALUES (1,16,'2016-09-06 00:00:00',18,99,11,10,10,2,3,'2016年37周','2016-09-06 15:55:47',33,'2016-09-06 17:39:23',33,0,17,1),(2,16,'2016-09-07 00:00:00',17,0.11,0.22,33,11,4,3,'2016年37周','2016-09-07 15:01:22',33,'2016-09-07 15:19:39',33,0,17,150),(3,35,'2016-09-09 00:00:00',34,100,99,10,1,2,3,'2016年37周','2016-09-09 18:52:04',58,'2016-09-09 18:52:04',58,0,31,10),(4,53,'2016-08-12 00:00:00',40,10,90,10,0.01,5,4,'2016年33周','2016-09-12 15:00:51',53,'2016-09-13 17:21:52',53,0,30,2);

#
# Structure for table "tb_pig_delivery"
#

DROP TABLE IF EXISTS `tb_pig_delivery`;
CREATE TABLE `tb_pig_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sow_id` int(11) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `pigsty_id` int(11) DEFAULT NULL,
  `birth_weight` float DEFAULT NULL,
  `weak_young_num` int(11) DEFAULT NULL,
  `still_birth_num` int(11) DEFAULT NULL,
  `mummy_num` int(11) DEFAULT NULL,
  `deformity_num` int(11) DEFAULT NULL,
  `health_num` int(11) DEFAULT NULL,
  `year_week` varchar(50) DEFAULT NULL,
  `process_id` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_delivery"
#

INSERT INTO `tb_pig_delivery` VALUES (6,15,'2016-09-04 00:00:00',1,0.11,40,1,1,0,0,'2016年37周','dde48838-6e55-4f57-ae13-c8351d13b093','2016-09-05 19:21:04',33,'2016-09-07 14:27:13',33,0,17),(7,21,'2016-08-07 00:00:00',1,100,0,1,0,0,10,'2016年33周','c0edbf3b-b180-4b6c-926c-a67f52531e72','2016-09-07 16:09:56',33,'2016-09-07 16:10:28',33,0,17),(8,23,'2016-08-07 00:00:00',1,0,0,1,0,0,10,'2016年33周','a303a92f-28ab-4d3c-8e1a-2be0b2c63617','2016-09-07 16:46:47',33,'2016-09-07 16:46:47',33,0,17),(9,39,'2016-09-08 00:00:00',31,100,5,2,0,0,10,'2016年37周','9d0039a5-8d8b-40f7-a779-a347b0e4aac3','2016-09-09 18:38:25',58,'2016-09-09 18:38:25',58,0,31),(10,51,'2016-09-03 00:00:00',36,20.2,1,1,1,1,1,'2016年36周','d1af94bd-9629-463a-b36d-3b2f62c50a0c','2016-09-12 14:21:19',53,'2016-09-12 14:21:19',53,0,30),(11,52,'2016-08-05 00:00:00',36,20,1,1,1,1,1,'2016年32周','68706cf7-cadb-49c3-97d9-0d04eb9967bd','2016-09-12 14:45:38',53,'2016-09-12 14:45:38',53,0,30),(12,38,'2016-09-01 00:00:00',31,0,0,0,0,0,1,'2016年36周','5d6aeba9-3602-42ad-b865-cf6c7925e5cf','2016-09-13 10:54:34',58,'2016-09-13 10:55:02',58,0,31),(13,64,'2016-09-06 00:00:00',36,20,1,1,1,1,1,'2016年37周','03d0cf0d-80b7-4b8e-b3d8-5f71a89c40c1','2016-09-13 11:09:26',53,'2016-09-13 17:24:30',53,0,30),(14,68,'2015-09-06 00:00:00',36,20,1,1,1,1,1,'2015年37周','da2769e8-766d-4999-845f-38ef188ae856','2016-09-14 10:15:52',53,'2016-09-14 10:16:08',53,0,30);

#
# Structure for table "tb_pig_hog_check"
#

DROP TABLE IF EXISTS `tb_pig_hog_check`;
CREATE TABLE `tb_pig_hog_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_date` datetime DEFAULT NULL,
  `pigsty_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `yearMonth` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_hog_check"
#

INSERT INTO `tb_pig_hog_check` VALUES (11,'2016-08-12 00:00:00',21,12,1,56,'2016-09-05 18:38:59',33,'2016-09-08 18:04:52',33,0,17,'2016年08月'),(12,'2016-09-01 00:00:00',1,12,3,12,'2016-09-05 18:59:27',33,'2016-09-08 17:42:08',33,0,17,'2016年09月'),(13,'2016-04-01 00:00:00',1,12,1,45,'2016-09-05 19:07:16',33,'2016-09-05 19:16:07',33,0,17,'2016年04月'),(14,'2016-06-09 00:00:00',1,12,1,0.23,'2016-09-05 19:09:06',33,NULL,NULL,0,17,'2016年06月'),(15,'2016-09-02 00:00:00',22,NULL,1,NULL,'2016-09-06 17:12:30',33,NULL,NULL,0,17,'2016年09月'),(16,'2016-09-01 00:00:00',31,3,1,120,'2016-09-09 15:53:47',54,NULL,NULL,0,31,'2016年09月'),(17,'2016-08-31 00:00:00',36,100,1,200,'2016-09-12 15:14:14',53,NULL,NULL,0,30,'2016年08月');

#
# Structure for table "tb_pig_hog_leave"
#

DROP TABLE IF EXISTS `tb_pig_hog_leave`;
CREATE TABLE `tb_pig_hog_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_date` datetime DEFAULT NULL,
  `pigsty_id` int(11) DEFAULT NULL,
  `leave_type` int(11) DEFAULT NULL,
  `leave_reason` int(11) DEFAULT NULL,
  `leave_reason_str` varchar(500) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `yearWeek` varchar(100) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_hog_leave"
#

INSERT INTO `tb_pig_hog_leave` VALUES (4,'2016-09-01 00:00:00',1,1,1,NULL,12,23,'1232',1,'2016-09-06 14:01:15',33,NULL,NULL,0,'2016年36周',17),(7,'2016-07-14 00:00:00',1,1,1,NULL,2,0.36,'',1,'2016-09-06 14:24:23',33,NULL,NULL,0,'2016年29周',17),(8,'2016-08-28 00:00:00',1,2,5,NULL,23,20,'zhesh saapsipajsas',3,'2016-09-06 14:25:27',33,'2016-09-06 15:11:57',33,0,'2016年36周',17),(9,'2016-06-23 00:00:00',21,1,6,NULL,2,63,'',2,'2016-09-06 14:25:59',33,NULL,NULL,0,'2016年26周',17),(10,'2016-09-01 00:00:00',23,3,5,NULL,2,8,'',2,'2016-09-06 14:26:20',33,NULL,NULL,0,'2016年36周',17),(11,'2016-03-18 00:00:00',1,1,1,NULL,20,623,'',1,'2016-09-06 14:32:31',33,NULL,NULL,0,'2016年12周',17),(12,'2016-08-26 00:00:00',18,4,6,NULL,13,1520,'zheshi ceshi',2,'2016-09-06 14:48:48',33,NULL,NULL,0,'2016年35周',17),(16,'2016-09-06 00:00:00',1,1,1,NULL,NULL,NULL,'',1,'2016-09-06 18:22:22',33,NULL,NULL,0,'2016年37周',17),(17,'2016-09-02 00:00:00',31,1,1,NULL,3,22,'',1,'2016-09-09 16:27:16',57,NULL,NULL,0,'2016年36周',31),(18,'2015-09-09 00:00:00',31,1,1,NULL,1,1,'',1,'2016-09-09 18:32:03',58,NULL,NULL,0,'2015年37周',31),(19,'2016-09-02 00:00:00',36,1,1,NULL,5,30,'测试',1,'2016-09-12 15:13:07',53,NULL,NULL,0,'2016年36周',30),(20,'2016-09-20 00:00:00',17,1,1,NULL,1,1,'',1,'2016-09-20 10:10:07',33,NULL,NULL,0,'2016年39周',17),(21,'2016-09-20 00:00:00',1,1,1,NULL,50,50,'',1,'2016-09-20 10:21:14',33,NULL,NULL,0,'2016年39周',17);

#
# Structure for table "tb_pig_hog_move"
#

DROP TABLE IF EXISTS `tb_pig_hog_move`;
CREATE TABLE `tb_pig_hog_move` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `move_date` datetime DEFAULT NULL,
  `out_pigsty_id` int(11) DEFAULT NULL,
  `out_type` int(11) DEFAULT NULL,
  `out_total` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `in_pigsty_id` int(11) DEFAULT NULL,
  `in_type` int(11) DEFAULT NULL,
  `year_week` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_hog_move"
#

INSERT INTO `tb_pig_hog_move` VALUES (1,'2016-09-07 00:00:00',1,2,11,1100,21,1,'2016年37周','2016-09-07 18:14:27',33,'2016-09-08 11:24:02',33,0,17),(2,'2016-08-03 00:00:00',17,3,100000,100000,18,2,'2016年32周','2016-09-08 09:36:35',33,'2016-09-08 09:36:35',33,0,17),(3,'2016-05-03 00:00:00',1,1,100,10000,24,1,'2016年19周','2016-09-08 09:39:11',33,'2016-09-08 09:39:11',33,0,17),(4,'2016-09-08 00:00:00',19,3,123,1312,1,3,'2016年37周','2016-09-08 09:46:41',33,'2016-09-14 16:46:11',33,0,17),(5,'2016-09-09 00:00:00',31,1,500,5000,33,3,'2016年37周','2016-09-09 18:48:21',58,'2016-09-13 17:47:05',58,0,31),(6,'2016-08-20 00:00:00',36,1,5,30,38,2,'2016年34周','2016-09-12 15:03:21',53,'2016-09-12 15:03:21',53,0,30),(7,'2016-08-20 00:00:00',36,2,3,0,39,3,'2016年34周','2016-09-12 15:04:07',53,'2016-09-12 15:04:55',53,0,30),(8,'2016-08-20 00:00:00',36,3,2,2,38,2,'2016年34周','2016-09-12 15:05:25',53,'2016-09-12 15:05:45',53,0,30),(9,'2016-09-10 00:00:00',36,1,999999,10,40,1,'2016年37周','2016-09-12 16:00:39',53,'2016-09-12 16:00:39',53,0,30),(10,'2016-09-10 00:00:00',36,1,10,0,39,1,'2016年37周','2016-09-12 16:01:13',53,'2016-09-12 16:01:13',53,0,30),(11,'2016-09-01 00:00:00',43,1,2,0,45,2,'2016年36周','2016-09-13 11:04:08',53,'2016-09-13 11:04:08',53,0,30);

#
# Structure for table "tb_pig_leave"
#

DROP TABLE IF EXISTS `tb_pig_leave`;
CREATE TABLE `tb_pig_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pig_id` int(11) DEFAULT NULL,
  `leave_dete` datetime DEFAULT NULL,
  `pigsty_id` int(11) DEFAULT NULL,
  `leave_type` int(11) DEFAULT NULL,
  `leave_reason` int(11) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `year_week` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_leave"
#

INSERT INTO `tb_pig_leave` VALUES (1,14,'2016-09-01 00:00:00',1,2,1,NULL,'2016年36周',NULL,NULL,'2016-09-07 10:52:26',33,0,17),(2,19,'2016-09-01 00:00:00',16,3,1,'撒个赋予给他的发元素的','2016年36周','2016-09-07 10:46:23',33,'2016-09-07 10:53:17',33,0,17),(3,18,'2016-09-03 00:00:00',1,1,1,'Xx','2016年36周','2016-09-07 10:54:00',33,'2016-09-07 10:54:00',33,0,17),(4,20,'2016-08-11 00:00:00',15,3,3,'ceshisajdsdassd','2016年33周','2016-09-07 11:01:50',33,'2016-09-07 11:01:50',33,0,17),(5,15,'2016-03-09 00:00:00',17,1,1,'adhadadadadasdad','2016年11周','2016-09-07 11:02:11',33,'2016-09-07 11:02:11',33,0,17),(6,17,'2016-05-04 00:00:00',1,1,1,'','2016年19周','2016-09-07 11:02:57',33,'2016-09-07 11:02:57',33,0,17),(7,23,'2016-09-06 00:00:00',20,3,8,'','2016年37周','2016-09-07 16:17:34',33,'2016-09-07 16:17:34',33,0,17),(8,22,'2016-09-07 00:00:00',25,2,9,'测试','2016年37周','2016-09-07 16:28:24',33,'2016-09-08 11:02:20',33,0,17),(9,37,'2016-09-09 00:00:00',31,1,1,'','2016年37周','2016-09-09 18:47:48',58,'2016-09-11 17:56:17',57,0,31),(10,51,'2016-09-01 00:00:00',36,2,1,'测试','2016年36周','2016-09-12 15:07:55',53,'2016-09-12 15:08:47',53,0,30),(11,59,'2016-09-05 00:00:00',36,1,1,'','2016年37周','2016-09-12 15:22:44',53,'2016-09-12 15:22:44',53,0,30);

#
# Structure for table "tb_pig_pigsty"
#

DROP TABLE IF EXISTS `tb_pig_pigsty`;
CREATE TABLE `tb_pig_pigsty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_pigsty"
#

/*!40000 ALTER TABLE `tb_pig_pigsty` DISABLE KEYS */;
INSERT INTO `tb_pig_pigsty` VALUES (1,17,'2016-08-29 14:50:26',2,0,'分娩',1,'2016-09-08 10:09:09',33),(5,17,'2016-08-31 15:29:42',2,1,'育肥舍',4,'2016-08-31 15:37:44',2),(6,17,'2016-08-31 16:02:45',2,1,'21212',2,'2016-08-31 16:02:54',2),(7,17,'2016-08-31 16:44:11',2,1,'',NULL,NULL,NULL),(8,17,'2016-08-31 17:16:33',33,1,'949',1,'2016-08-31 17:40:44',33),(9,17,'2016-08-31 17:40:38',33,1,'注射1',4,'2016-08-31 18:47:13',33),(10,17,'2016-08-31 17:41:18',33,1,'猪场',2,NULL,NULL),(11,17,'2016-08-31 17:53:33',2,0,'qzhushe',2,'2016-08-31 17:53:39',2),(12,17,'2016-09-01 10:38:00',33,1,'测试',5,NULL,NULL),(13,17,'2016-09-01 10:38:37',33,1,'测试222',3,NULL,NULL),(14,17,'2016-09-02 11:42:10',33,1,'潘博猪舍',2,'2016-09-07 15:36:28',33),(15,17,'2016-09-02 14:54:55',2,0,'配怀舍1',2,NULL,NULL),(16,17,'2016-09-02 14:55:29',2,0,'配怀舍2',2,NULL,NULL),(17,17,'2016-09-02 14:55:47',2,0,'混合舍1',5,NULL,NULL),(18,17,'2016-09-02 14:56:01',2,0,'混合舍2',5,NULL,NULL),(19,17,'2016-09-02 18:05:15',33,0,'这是车市哦啦啦啦',1,'2016-09-14 16:45:50',33),(20,17,'2016-09-02 18:20:20',33,0,'配坏舍21',5,'2016-09-08 10:00:00',33),(21,17,'2016-09-02 18:20:41',33,0,'保育舍1',3,NULL,NULL),(22,17,'2016-09-02 18:21:06',33,0,'混合舍3',5,'2016-09-08 10:46:21',33),(23,17,'2016-09-05 10:07:55',33,0,'王测',5,'2016-09-08 09:59:04',33),(24,17,'2016-09-05 10:22:10',33,0,'猪场看看',3,NULL,NULL),(25,17,'2016-09-07 14:37:54',33,1,'测试20160907001',2,NULL,NULL),(26,17,'2016-09-08 09:52:25',33,1,'王',4,'2016-09-08 09:52:39',33),(27,17,'2016-09-08 09:53:35',33,1,'车数',3,NULL,NULL),(28,17,'2016-09-08 09:59:21',33,0,'王测1',5,'2016-09-08 09:59:46',33),(29,18,'2016-09-08 10:41:53',34,0,'分娩舍1',1,'2016-09-08 10:42:02',34),(30,17,'2016-09-08 10:49:17',33,1,'测试育肥111',1,'2016-09-08 10:49:30',33),(31,31,'2016-09-09 15:50:58',54,0,'育肥1',6,'2016-09-13 18:53:41',61),(32,31,'2016-09-09 16:31:11',57,0,'配种舍1',3,'2016-09-12 15:40:32',61),(33,31,'2016-09-09 18:29:25',58,0,'育肥11',3,'2016-09-12 15:40:24',61),(34,31,'2016-09-09 18:51:10',58,0,'公猪舍1',6,NULL,NULL),(35,29,'2016-09-12 09:28:52',52,0,'配怀舍-1',2,NULL,NULL),(36,30,'2016-09-12 10:18:36',53,0,'测试0912001分娩舍',1,'2016-09-12 10:28:09',53),(37,30,'2016-09-12 10:18:56',53,0,'测试0912002配怀舍',2,'2016-09-12 10:28:39',53),(38,30,'2016-09-12 10:19:12',53,0,'测试0912003保育舍',3,'2016-09-12 17:32:33',53),(39,30,'2016-09-12 10:19:28',53,0,'测试0912004育肥舍',4,'2016-09-12 10:29:58',53),(40,30,'2016-09-12 10:19:58',53,0,'测试0912005混合舍',5,'2016-09-12 17:32:37',53),(41,30,'2016-09-12 10:20:29',53,0,'测试0912006公猪舍',6,'2016-09-12 10:30:10',53),(42,30,'2016-09-12 10:20:45',53,1,'测试',2,NULL,NULL),(43,30,'2016-09-13 10:55:07',53,0,'123',1,NULL,NULL),(44,30,'2016-09-13 10:55:40',53,0,'456',2,NULL,NULL),(45,30,'2016-09-13 10:55:56',53,0,'2',1,NULL,NULL),(46,30,'2016-09-13 10:56:11',53,0,'测试猪舍名称字数限制测试猪舍名称字数限制测试猪舍名',5,'2016-09-13 17:07:37',53),(47,31,'2016-09-13 16:45:08',58,0,'混合动力系统的确很好很好很好很好很好很好很',5,NULL,NULL),(48,31,'2016-09-13 18:25:29',61,0,'班了',1,NULL,NULL);
/*!40000 ALTER TABLE `tb_pig_pigsty` ENABLE KEYS */;

#
# Structure for table "tb_pig_qrcode"
#

DROP TABLE IF EXISTS `tb_pig_qrcode`;
CREATE TABLE `tb_pig_qrcode` (
  `content` varchar(50) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `open_id` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_qrcode"
#

INSERT INTO `tb_pig_qrcode` VALUES ('3ebd992de9c44730ad4cceb15065cd94',29,'oL9FktwyhE0nqHtpkh_O0VDjul-Y',0,'/ewm/09/13/3ebd992de9c44730ad4cceb15065cd94.jpg',49,2),('3d981604a38044a28b5dcb7e07d656f5',NULL,NULL,0,'/ewm/09/13/3d981604a38044a28b5dcb7e07d656f5.jpg',NULL,3),('60b3c442ce3942099ebd97d56c881947',NULL,NULL,0,'/ewm/09/14/60b3c442ce3942099ebd97d56c881947.jpg',NULL,4),('c99162b1ddb14567b97a8e141aa558af',NULL,NULL,0,'/ewm/09/14/c99162b1ddb14567b97a8e141aa558af.jpg',NULL,5),('5ebcc2bb9a6148cc8ffd79899e639464',NULL,NULL,0,'/ewm/09/14/5ebcc2bb9a6148cc8ffd79899e639464.jpg',NULL,6),('a63329cded254d13a6dde81c842ab199',NULL,NULL,0,'/ewm/09/20/a63329cded254d13a6dde81c842ab199.jpg',NULL,7),('a43776e5060c4a0da88e88144ca9325b',NULL,NULL,0,'/ewm/09/21/a43776e5060c4a0da88e88144ca9325b.jpg',NULL,8),('58ea1e7d98b44833abe9618bf330290f',NULL,NULL,0,'/ewm/09/21/58ea1e7d98b44833abe9618bf330290f.jpg',NULL,9),('abf130298cc748858a455ced150d92af',NULL,NULL,0,'/ewm/09/22/abf130298cc748858a455ced150d92af.jpg',NULL,10),('b9be4d28e47941fd8b4dfa1a762a020f',NULL,NULL,0,'/ewm/09/23/b9be4d28e47941fd8b4dfa1a762a020f.jpg',NULL,11);

#
# Structure for table "tb_pig_remind_info"
#

DROP TABLE IF EXISTS `tb_pig_remind_info`;
CREATE TABLE `tb_pig_remind_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `remind_type` varchar(50) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `remind_time_str` varchar(50) DEFAULT NULL,
  `open_id` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `send_state` int(11) DEFAULT NULL,
  `send_num` int(11) DEFAULT NULL,
  `remind_content` text,
  `is_delete` int(11) DEFAULT NULL,
  `remind_time` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_remind_info"
#

INSERT INTO `tb_pig_remind_info` VALUES (36,'猪场名称：潘博猪场12','潘博猪场12','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=2&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',17),(37,'猪场名称：潘博猪场12','潘博猪场12','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=33&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',17),(38,'猪场名称：潘博猪场12','潘博猪场12','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','111111','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=39&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',17),(39,'猪场名称：北京全亚猪场','北京全亚猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=18&userId=34&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',18),(40,'猪场名称：大傻逼','大傻逼','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=39&userId=55&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',39),(41,'猪场名称：测试20160912','测试20160912','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=42&userId=63&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',42),(42,'猪场名称：udud','udud','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt0Q3X4BhdJVqfl3LCUfES8M','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=41&userId=56&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',41),(43,'猪场名称：微信集成猪场','微信集成猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=49&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',29),(44,'猪场名称：微信集成猪场','微信集成猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=50&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',29),(45,'猪场名称：微信集成猪场','微信集成猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=52&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',29),(46,'猪场名称：提醒猪场','提醒猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=74&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',44),(47,'猪场名称：提醒猪场','提醒猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','333333','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=75&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',44),(48,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt9RPddPajvw_WiYgewHlHAU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=54&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(49,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt8hHrXN8TTCDbfauvUG-VPM','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=57&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(50,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=58&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(51,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=59&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(52,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=60&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(53,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt9m7-_pv8l8yIF1Ds6U-X-E','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=61&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(54,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt4561julHSviMChgAoshYy0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=62&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(55,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=66&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(56,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9FktwRguluRyZq84oMtAW4jfdo','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=67&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(57,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=69&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(58,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt7negWyQ775tkUnwQ4jcg7k','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=70&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(59,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt2RS2MngydztI8ChLp1mL_Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=72&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',31),(60,'猪场名称：测试20160909','测试20160909','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=53&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',30),(61,'猪场名称：测试20160909','测试20160909','生产记录','2016-09-19 18:04:01','2016年09月19日 18:04','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=71&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪33头，公猪10头，肉猪0头。',0,'2016-09-19 18:04:01',30),(62,'猪场名称：潘博猪场12','潘博猪场12','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=2&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪2头,其中断奶21天未配92头;\n分娩：待产母猪1头,其中怀孕超过125天未产20头;\n',0,'2016-09-19 18:05:00',17),(63,'猪场名称：潘博猪场12','潘博猪场12','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=33&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪2头,其中断奶21天未配92头;\n分娩：待产母猪1头,其中怀孕超过125天未产20头;\n',0,'2016-09-19 18:05:00',17),(64,'猪场名称：潘博猪场12','潘博猪场12','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','111111','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=39&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪2头,其中断奶21天未配92头;\n分娩：待产母猪1头,其中怀孕超过125天未产20头;\n',0,'2016-09-19 18:05:00',17),(65,'猪场名称：北京全亚猪场','北京全亚猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=18&userId=34&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-19 18:05:00',18),(66,'猪场名称：大傻逼','大傻逼','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=39&userId=55&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-19 18:05:00',39),(67,'猪场名称：测试20160912','测试20160912','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=42&userId=63&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-19 18:05:00',42),(68,'猪场名称：udud','udud','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt0Q3X4BhdJVqfl3LCUfES8M','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=41&userId=56&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-19 18:05:00',41),(69,'猪场名称：微信集成猪场','微信集成猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=49&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-19 18:05:00',29),(70,'猪场名称：微信集成猪场','微信集成猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=50&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-19 18:05:00',29),(71,'猪场名称：微信集成猪场','微信集成猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=52&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-19 18:05:00',29),(72,'猪场名称：提醒猪场','提醒猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=74&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-19 18:05:00',44),(73,'猪场名称：提醒猪场','提醒猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','333333','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=75&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-19 18:05:00',44),(74,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt9RPddPajvw_WiYgewHlHAU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=54&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(75,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt8hHrXN8TTCDbfauvUG-VPM','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=57&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(76,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=58&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(77,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=59&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(78,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=60&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(79,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt9m7-_pv8l8yIF1Ds6U-X-E','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=61&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(80,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt4561julHSviMChgAoshYy0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=62&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(81,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=66&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(82,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9FktwRguluRyZq84oMtAW4jfdo','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=67&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(83,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=69&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(84,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt7negWyQ775tkUnwQ4jcg7k','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=70&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(85,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt2RS2MngydztI8ChLp1mL_Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=72&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配92头;\n断奶：待配母猪1头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',31),(86,'猪场名称：测试20160909','测试20160909','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=53&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪4头,其中断奶21天未配92头;\n断奶：待配母猪2头,其中哺乳超35天未断奶280头;',0,'2016-09-19 18:05:00',30),(87,'猪场名称：测试20160909','测试20160909','待办任务','2016-09-19 18:05:00','2016年09月19日 18:05','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=71&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪4头,其中断奶21天未配92头;\n断奶：待配母猪2头,其中哺乳超35天未断奶280头;',0,'2016-09-20 18:05:00',30),(88,'猪场名称：潘博猪场12','潘博猪场12','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=2&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪6头，公猪4头，肉猪0头。',0,'2016-09-21 20:00:00',17),(89,'猪场名称：潘博猪场12','潘博猪场12','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=33&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪6头，公猪4头，肉猪0头。',0,'2016-09-21 20:00:00',17),(90,'猪场名称：潘博猪场12','潘博猪场12','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','111111','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=39&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪6头，公猪4头，肉猪0头。',0,'2016-09-21 20:00:00',17),(91,'猪场名称：北京全亚猪场','北京全亚猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=18&userId=34&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-21 20:00:00',18),(92,'猪场名称：大傻逼','大傻逼','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=39&userId=55&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-21 20:00:00',39),(93,'猪场名称：测试20160912','测试20160912','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=42&userId=63&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-21 20:00:00',42),(94,'猪场名称：udud','udud','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt0Q3X4BhdJVqfl3LCUfES8M','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=41&userId=56&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-21 20:00:00',41),(95,'猪场名称：微信集成猪场','微信集成猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=49&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-21 20:00:00',29),(96,'猪场名称：微信集成猪场','微信集成猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=50&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-21 20:00:00',29),(97,'猪场名称：微信集成猪场','微信集成猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=52&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-21 20:00:00',29),(98,'猪场名称：提醒猪场','提醒猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=74&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-21 20:00:00',44),(99,'猪场名称：提醒猪场','提醒猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','333333','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=75&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-21 20:00:00',44),(100,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt9RPddPajvw_WiYgewHlHAU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=54&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(101,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt8hHrXN8TTCDbfauvUG-VPM','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=57&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(102,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=58&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(103,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=59&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(104,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=60&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(105,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt9m7-_pv8l8yIF1Ds6U-X-E','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=61&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(106,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt4561julHSviMChgAoshYy0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=62&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(107,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=66&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(108,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9FktwRguluRyZq84oMtAW4jfdo','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=67&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(109,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=69&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(110,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt7negWyQ775tkUnwQ4jcg7k','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=70&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(111,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt2RS2MngydztI8ChLp1mL_Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=72&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-21 20:00:00',31),(112,'猪场名称：测试20160909','测试20160909','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=53&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪5头，肉猪0头。',0,'2016-09-21 20:00:00',30),(113,'猪场名称：测试20160909','测试20160909','生产记录','2016-09-21 17:30:00','2016年09月21日 20:00','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=71&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪5头，肉猪0头。',0,'2016-09-21 20:00:00',30),(114,'猪场名称：潘博猪场12','潘博猪场12','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=2&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪7头，公猪4头，肉猪0头。',0,'2016-09-22 20:00:00',17),(115,'猪场名称：潘博猪场12','潘博猪场12','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=33&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪7头，公猪4头，肉猪0头。',0,'2016-09-22 20:00:00',17),(116,'猪场名称：潘博猪场12','潘博猪场12','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','111111','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=39&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪7头，公猪4头，肉猪0头。',0,'2016-09-22 20:00:00',17),(117,'猪场名称：北京全亚猪场','北京全亚猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=18&userId=34&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-22 20:00:00',18),(118,'猪场名称：大傻逼','大傻逼','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=39&userId=55&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-22 20:00:00',39),(119,'猪场名称：测试20160912','测试20160912','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=42&userId=63&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-22 20:00:00',42),(120,'猪场名称：udud','udud','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt0Q3X4BhdJVqfl3LCUfES8M','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=41&userId=56&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-22 20:00:00',41),(121,'猪场名称：微信集成猪场','微信集成猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=49&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-22 20:00:00',29),(122,'猪场名称：微信集成猪场','微信集成猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=50&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-22 20:00:00',29),(123,'猪场名称：微信集成猪场','微信集成猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=52&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-22 20:00:00',29),(124,'猪场名称：提醒猪场','提醒猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=74&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-22 20:00:00',44),(125,'猪场名称：提醒猪场','提醒猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','333333','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=75&clickType=2&_clientType=wap',1,1,'无',0,'2016-09-22 20:00:00',44),(126,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt9RPddPajvw_WiYgewHlHAU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=54&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(127,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt8hHrXN8TTCDbfauvUG-VPM','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=57&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(128,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=58&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(129,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=59&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(130,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=60&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(131,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt9m7-_pv8l8yIF1Ds6U-X-E','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=61&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(132,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt4561julHSviMChgAoshYy0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=62&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(133,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=66&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(134,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9FktwRguluRyZq84oMtAW4jfdo','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=67&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(135,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=69&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(136,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt7negWyQ775tkUnwQ4jcg7k','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=70&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(137,'猪场名称：腾飞猪场','腾飞猪场','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt2RS2MngydztI8ChLp1mL_Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=72&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪1头，肉猪0头。',0,'2016-09-22 20:00:00',31),(138,'猪场名称：测试20160909','测试20160909','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=53&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪5头，肉猪0头。',0,'2016-09-22 20:00:00',30),(139,'猪场名称：测试20160909','测试20160909','生产记录','2016-09-22 17:30:01','2016年09月22日 20:00','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=71&clickType=2&_clientType=wap',1,1,'今日生产日报内容如下:\n存栏：母猪13头，公猪5头，肉猪0头。',0,'2016-09-22 20:00:00',30),(140,'猪场名称：潘博猪场12','潘博猪场12','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=2&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪2头,其中断奶21天未配2头;\n分娩：待产母猪1头,其中怀孕超过125天未产1头;\n',0,'2016-09-23 08:00:00',17),(141,'猪场名称：潘博猪场12','潘博猪场12','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=33&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪2头,其中断奶21天未配2头;\n分娩：待产母猪1头,其中怀孕超过125天未产1头;\n',0,'2016-09-23 08:00:00',17),(142,'猪场名称：潘博猪场12','潘博猪场12','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','111111','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=17&userId=39&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪2头,其中断奶21天未配2头;\n分娩：待产母猪1头,其中怀孕超过125天未产1头;\n',0,'2016-09-23 08:00:00',17),(143,'猪场名称：北京全亚猪场','北京全亚猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=18&userId=34&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-23 08:00:00',18),(144,'猪场名称：大傻逼','大傻逼','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=39&userId=55&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-23 08:00:00',39),(145,'猪场名称：测试20160912','测试20160912','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=42&userId=63&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-23 08:00:00',42),(146,'猪场名称：udud','udud','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt0Q3X4BhdJVqfl3LCUfES8M','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=41&userId=56&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-23 08:00:00',41),(147,'猪场名称：微信集成猪场','微信集成猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=49&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-23 08:00:00',29),(148,'猪场名称：微信集成猪场','微信集成猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=50&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-23 08:00:00',29),(149,'猪场名称：微信集成猪场','微信集成猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=29&userId=52&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-23 08:00:00',29),(150,'猪场名称：提醒猪场','提醒猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','123456','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=74&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-23 08:00:00',44),(151,'猪场名称：提醒猪场','提醒猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','333333','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=44&userId=75&clickType=1&_clientType=wap',1,1,'无',0,'2016-09-23 08:00:00',44),(152,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt9RPddPajvw_WiYgewHlHAU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=54&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(153,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt8hHrXN8TTCDbfauvUG-VPM','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=57&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(154,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=58&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(155,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9FktwyhE0nqHtpkh_O0VDjul-Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=59&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(156,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt5LgjUXCu8Svcw4GYok880A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=60&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(157,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt9m7-_pv8l8yIF1Ds6U-X-E','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=61&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(158,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt4561julHSviMChgAoshYy0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=62&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(159,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=66&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(160,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9FktwRguluRyZq84oMtAW4jfdo','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=67&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(161,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=69&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(162,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt7negWyQ775tkUnwQ4jcg7k','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=70&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(163,'猪场名称：腾飞猪场','腾飞猪场','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt2RS2MngydztI8ChLp1mL_Y','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=31&userId=72&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪3头,其中断奶21天未配0头;\n断奶：待断奶母猪1头,其中哺乳超35天未断奶0头;',0,'2016-09-23 08:00:00',31),(164,'猪场名称：测试20160909','测试20160909','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt5Ekejg6ahBQvZJyqEd20Z0','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=53&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪4头,其中断奶21天未配0头;\n断奶：待断奶母猪2头,其中哺乳超35天未断奶1头;',0,'2016-09-23 08:00:00',30),(165,'猪场名称：测试20160909','测试20160909','待办任务','2016-09-23 10:51:00','2016年09月23日 08:00','oL9Fkt0UgzlFAJ0grp2nc3H7CP0A','http://pig.superfriend.cn/xfkj/pigFarm/remind_EnterPigFarm.c?companyId=30&userId=71&clickType=1&_clientType=wap',1,1,'今日生产待办内容如下:\n配种：待配母猪4头,其中断奶21天未配0头;\n断奶：待断奶母猪2头,其中哺乳超35天未断奶1头;',0,'2016-09-23 08:00:00',30);

#
# Structure for table "tb_pig_remind_set"
#

DROP TABLE IF EXISTS `tb_pig_remind_set`;
CREATE TABLE `tb_pig_remind_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `is_wait` int(11) DEFAULT NULL,
  `is_summary` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_remind_set"
#

INSERT INTO `tb_pig_remind_set` VALUES (1,33,1,0,17);

#
# Structure for table "tb_pig_wean"
#

DROP TABLE IF EXISTS `tb_pig_wean`;
CREATE TABLE `tb_pig_wean` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sow_id` int(11) DEFAULT NULL,
  `wean_date` datetime DEFAULT NULL,
  `wean_num` int(11) DEFAULT NULL,
  `wean_weight` float DEFAULT NULL,
  `year_week` varchar(50) DEFAULT NULL,
  `process_id` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "tb_pig_wean"
#

INSERT INTO `tb_pig_wean` VALUES (1,15,'2016-09-06 00:00:00',1,0.01,'2016年37周','dde48838-6e55-4f57-ae13-c8351d13b093','2016-09-06 10:20:37',33,'2016-09-07 14:23:27',33,0,17),(2,21,'2016-08-17 00:00:00',10,0,'2016年34周','c0edbf3b-b180-4b6c-926c-a67f52531e72','2016-09-07 16:14:37',33,'2016-09-07 16:15:19',33,0,17),(3,23,'2016-08-15 00:00:00',5,0,'2016年34周','a303a92f-28ab-4d3c-8e1a-2be0b2c63617','2016-09-07 16:47:23',33,'2016-09-07 16:47:23',33,0,17),(4,51,'2016-09-10 00:00:00',10,0,'2016年37周','d1af94bd-9629-463a-b36d-3b2f62c50a0c','2016-09-12 14:31:23',53,'2016-09-13 17:24:09',53,0,30),(5,52,'2016-08-13 00:00:00',11,30,'2016年33周','68706cf7-cadb-49c3-97d9-0d04eb9967bd','2016-09-12 14:50:35',53,'2016-09-12 14:56:50',53,0,30),(6,38,'2016-09-13 00:00:00',10,11,'2016年38周','5d6aeba9-3602-42ad-b865-cf6c7925e5cf','2016-09-13 10:55:19',58,'2016-09-13 10:55:19',58,0,31);

#
# Structure for table "tb_role_info"
#

DROP TABLE IF EXISTS `tb_role_info`;
CREATE TABLE `tb_role_info` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `Memo` varchar(100) DEFAULT NULL,
  `order_index` int(11) DEFAULT NULL,
  `role_code` varchar(50) DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `role_type` int(11) DEFAULT NULL,
  `is_fork_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

#
# Data for table "tb_role_info"
#

INSERT INTO `tb_role_info` VALUES (61,17,0,NULL,1,'staff','员工',1,NULL),(62,17,0,NULL,2,'factoryDirector','厂长',1,NULL),(63,17,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(64,17,0,NULL,4,'boss','老板',1,NULL),(65,18,0,NULL,1,'staff','员工',1,NULL),(66,18,0,NULL,2,'factoryDirector','厂长',1,NULL),(67,18,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(68,18,0,NULL,4,'boss','老板',1,NULL),(69,19,0,NULL,1,'staff','员工',1,NULL),(70,19,0,NULL,2,'factoryDirector','厂长',1,NULL),(71,19,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(72,19,0,NULL,4,'boss','老板',1,NULL),(73,20,0,NULL,1,'staff','员工',1,NULL),(74,20,0,NULL,2,'factoryDirector','厂长',1,NULL),(75,20,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(76,20,0,NULL,4,'boss','老板',1,NULL),(77,21,0,NULL,1,'staff','员工',1,NULL),(78,21,0,NULL,2,'factoryDirector','厂长',1,NULL),(79,21,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(80,21,0,NULL,4,'boss','老板',1,NULL),(81,22,0,NULL,1,'staff','员工',1,NULL),(82,22,0,NULL,2,'factoryDirector','厂长',1,NULL),(83,22,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(84,22,0,NULL,4,'boss','老板',1,NULL),(85,23,0,NULL,1,'staff','员工',1,NULL),(86,23,0,NULL,2,'factoryDirector','厂长',1,NULL),(87,23,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(88,23,0,NULL,4,'boss','老板',1,NULL),(89,24,0,NULL,1,'staff','员工',1,NULL),(90,24,0,NULL,2,'factoryDirector','厂长',1,NULL),(91,24,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(92,24,0,NULL,4,'boss','老板',1,NULL),(93,25,0,NULL,1,'staff','员工',1,NULL),(94,25,0,NULL,2,'factoryDirector','厂长',1,NULL),(95,25,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(96,25,0,NULL,4,'boss','老板',1,NULL),(97,26,0,NULL,1,'staff','员工',1,NULL),(98,26,0,NULL,2,'factoryDirector','厂长',1,NULL),(99,26,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(100,26,0,NULL,4,'boss','老板',1,NULL),(101,27,0,NULL,1,'staff','员工',1,NULL),(102,27,0,NULL,2,'factoryDirector','厂长',1,NULL),(103,27,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(104,27,0,NULL,4,'boss','老板',1,NULL),(105,28,0,NULL,1,'staff','员工',1,NULL),(106,28,0,NULL,2,'factoryDirector','厂长',1,NULL),(107,28,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(108,28,0,NULL,4,'boss','老板',1,NULL),(109,29,0,NULL,1,'staff','员工',1,NULL),(110,29,0,NULL,2,'factoryDirector','厂长',1,NULL),(111,29,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(112,29,0,NULL,4,'boss','老板',1,NULL),(113,30,0,NULL,1,'staff','员工',1,NULL),(114,30,0,NULL,2,'factoryDirector','厂长',1,NULL),(115,30,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(116,30,0,NULL,4,'boss','老板',1,NULL),(117,31,0,NULL,1,'staff','员工',1,NULL),(118,31,0,NULL,2,'factoryDirector','厂长',1,NULL),(119,31,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(120,31,0,NULL,4,'boss','老板',1,NULL),(121,39,0,NULL,1,'staff','员工',1,NULL),(122,39,0,NULL,2,'factoryDirector','厂长',1,NULL),(123,39,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(124,39,0,NULL,4,'boss','老板',1,NULL),(125,41,0,NULL,1,'staff','员工',1,NULL),(126,41,0,NULL,2,'factoryDirector','厂长',1,NULL),(127,41,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(128,41,0,NULL,4,'boss','老板',1,NULL),(129,42,0,NULL,1,'staff','员工',1,NULL),(130,42,0,NULL,2,'factoryDirector','厂长',1,NULL),(131,42,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(132,42,0,NULL,4,'boss','老板',1,NULL),(133,43,0,NULL,1,'staff','员工',1,NULL),(134,43,0,NULL,2,'factoryDirector','厂长',1,NULL),(135,43,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(136,43,0,NULL,4,'boss','老板',1,NULL),(137,44,0,NULL,1,'staff','员工',1,NULL),(138,44,0,NULL,2,'factoryDirector','厂长',1,NULL),(139,44,0,NULL,3,'serviceTeacher','服务老师',1,NULL),(140,44,0,NULL,4,'boss','老板',1,NULL);

#
# Structure for table "tb_role_module"
#

DROP TABLE IF EXISTS `tb_role_module`;
CREATE TABLE `tb_role_module` (
  `Vid` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_role_module"
#


#
# Structure for table "tb_role_module_mobile"
#

DROP TABLE IF EXISTS `tb_role_module_mobile`;
CREATE TABLE `tb_role_module_mobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_role_module_mobile"
#


#
# Structure for table "tb_role_user"
#

DROP TABLE IF EXISTS `tb_role_user`;
CREATE TABLE `tb_role_user` (
  `Vid` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Vid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

#
# Data for table "tb_role_user"
#

INSERT INTO `tb_role_user` VALUES (16,17,64,1,33),(18,18,68,1,34),(19,19,72,1,35),(20,20,76,1,36),(21,18,65,1,38),(22,17,62,1,39),(23,21,80,1,40),(24,22,84,1,41),(25,23,88,1,42),(26,24,92,1,43),(27,17,61,1,44),(28,25,96,1,45),(29,26,100,1,46),(30,27,104,1,47),(31,28,108,1,48),(32,29,112,1,49),(33,29,109,1,50),(34,29,109,1,51),(35,29,109,1,52),(36,30,116,1,53),(37,31,120,1,54),(38,39,124,1,55),(39,41,128,1,56),(40,31,117,1,57),(41,31,117,1,58),(42,31,117,1,59),(43,31,117,1,60),(44,31,117,1,61),(45,31,117,1,62),(46,42,132,1,63),(47,30,113,1,64),(48,31,117,1,65),(49,31,117,1,66),(50,31,117,1,67),(51,43,136,1,68),(52,31,117,1,69),(53,31,117,1,70),(54,30,115,1,71),(55,31,117,1,72),(56,31,117,1,73),(57,44,140,1,74),(58,44,137,1,75);

#
# Structure for table "tb_sys_config"
#

DROP TABLE IF EXISTS `tb_sys_config`;
CREATE TABLE `tb_sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `checkpagemodule` varchar(255) DEFAULT NULL,
  `config_key` varchar(50) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_sys_config"
#


#
# Structure for table "tb_user_group"
#

DROP TABLE IF EXISTS `tb_user_group`;
CREATE TABLE `tb_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `group_power` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB8E7977CDBED01BF` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_user_group"
#


#
# Structure for table "tb_user_info"
#

DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `alter_name` varchar(50) DEFAULT NULL,
  `Birthday` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `is_default` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `is_virtual` int(11) DEFAULT NULL,
  `Job` varchar(50) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `login_pass` varchar(50) DEFAULT NULL,
  `order_index` int(11) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `phone_public` int(11) DEFAULT NULL,
  `Photo` longtext,
  `PY` varchar(50) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `Sex` int(11) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_state` int(11) DEFAULT NULL,
  `work_no` varchar(50) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `formatted_number` varchar(255) DEFAULT NULL,
  `full_py` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `home_tel` varchar(255) DEFAULT NULL,
  `is_fork_group` int(11) DEFAULT NULL,
  `mcn_type` int(11) DEFAULT NULL,
  `mobile_show_state` int(11) DEFAULT NULL,
  `ntko_url` varchar(100) DEFAULT NULL,
  `office_tel` varchar(255) DEFAULT NULL,
  `office_widget` int(11) DEFAULT NULL,
  `OrderChangedDate` datetime DEFAULT NULL,
  `OrderType` int(11) DEFAULT NULL,
  `partition_companyid` int(11) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `sign_name` varchar(255) DEFAULT NULL,
  `sign_type` int(11) DEFAULT NULL,
  `sign_url` varchar(100) DEFAULT NULL,
  `sign_widget` int(11) DEFAULT NULL,
  `skin_logo` int(11) DEFAULT NULL,
  `tao_da` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `turn_list` varchar(50) DEFAULT NULL,
  `turn_type` int(11) DEFAULT NULL,
  `user_num` varchar(255) DEFAULT NULL,
  `user_num_type` int(11) DEFAULT NULL,
  `user_power` int(11) DEFAULT NULL,
  `v_group` varchar(255) DEFAULT NULL,
  `v_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

#
# Data for table "tb_user_info"
#

INSERT INTO `tb_user_info` VALUES (1,-1,'顶顶顶顶',NULL,'2016-08-26 15:58:44','413455787',1,0,NULL,NULL,'2016-09-19 17:34:58',NULL,NULL,'panbo','e10adc3949ba59abbe56e057f20f883e',NULL,'15838369365',NULL,NULL,NULL,NULL,NULL,'系统管理员',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,17,'??',NULL,NULL,NULL,0,0,NULL,NULL,'2016-09-14 16:37:07','2016-09-14 16:23:26',NULL,'admin','e10adc3949ba59abbe56e057f20f883e',NULL,'15838369365',NULL,NULL,NULL,NULL,NULL,'系统管理员1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,7,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,17,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'2016-09-21 18:35:33','2016-09-21 18:35:33',NULL,'111','e10adc3949ba59abbe56e057f20f883e',NULL,'15838369365',NULL,NULL,NULL,NULL,NULL,'潘博',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,7,NULL,NULL,'123456',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,18,NULL,NULL,'2016-08-31 18:56:50',NULL,NULL,0,NULL,NULL,'2016-09-19 15:07:46','2016-09-19 15:07:46',NULL,NULL,NULL,NULL,'15838369365',NULL,NULL,NULL,NULL,NULL,'潘博',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,8,NULL,NULL,'123456',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,20,NULL,NULL,'2016-08-31 19:04:23',NULL,NULL,0,NULL,NULL,'2016-09-01 14:36:09','2016-09-01 14:36:09',NULL,NULL,NULL,NULL,'15838369365',NULL,NULL,NULL,NULL,NULL,'111',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'123456',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,17,NULL,NULL,NULL,'434557245@qq.com',NULL,0,NULL,NULL,'2016-09-06 18:28:51','2016-09-07 10:12:21',NULL,NULL,NULL,NULL,'15899999999',NULL,NULL,NULL,NULL,NULL,'员工1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,7,NULL,NULL,'111111',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,22,NULL,NULL,'2016-09-08 10:38:24',NULL,NULL,0,NULL,NULL,'2016-09-08 16:22:56','2016-09-08 16:22:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,2,NULL,NULL,'123456',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,23,NULL,NULL,'2016-09-08 10:39:00',NULL,NULL,0,NULL,NULL,'2016-09-08 16:22:53','2016-09-08 16:22:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,3,NULL,NULL,'123456',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,25,NULL,NULL,'2016-09-08 10:56:23',NULL,NULL,0,NULL,NULL,'2016-09-08 10:56:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,5,NULL,NULL,'555555',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,26,NULL,NULL,'2016-09-08 10:56:23',NULL,NULL,0,NULL,NULL,'2016-09-08 10:56:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,6,NULL,NULL,'555555',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,27,NULL,NULL,'2016-09-08 10:57:13',NULL,NULL,0,NULL,NULL,'2016-09-08 10:58:20','2016-09-08 10:58:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,7,NULL,NULL,'555555',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,28,NULL,NULL,'2016-09-08 10:57:58',NULL,NULL,0,NULL,NULL,'2016-09-08 10:58:39','2016-09-08 10:58:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,8,NULL,NULL,'555555',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,29,NULL,NULL,'2016-09-09 10:10:54',NULL,NULL,0,NULL,NULL,'2016-09-13 10:22:39','2016-09-13 10:22:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'潘博',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,9,NULL,NULL,'oL9FktwyhE0nqHtpkh_O0VDjul-Y',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,29,NULL,NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-09 18:21:45','2016-09-09 18:21:45',NULL,NULL,NULL,NULL,'13838196113',NULL,NULL,NULL,NULL,NULL,'吴胜光',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,9,NULL,NULL,'oL9Fkt0UgzlFAJ0grp2nc3H7CP0A',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,29,NULL,NULL,NULL,'',NULL,1,NULL,NULL,'2016-09-09 10:19:43','2016-09-09 10:43:42',NULL,NULL,NULL,NULL,'13849041182',NULL,NULL,NULL,NULL,NULL,'',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,9,NULL,NULL,'oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,29,NULL,NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-12 14:09:28','2016-09-12 14:09:28',NULL,NULL,NULL,NULL,'13849041182',NULL,NULL,NULL,NULL,NULL,'李华伟',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,9,NULL,NULL,'oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,30,'红叶',NULL,'2016-09-09 15:11:05',NULL,NULL,0,NULL,NULL,'2016-09-13 10:28:11','2016-09-13 10:28:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'红叶',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'oL9Fkt5Ekejg6ahBQvZJyqEd20Z0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,31,'自由自在',NULL,'2016-09-09 15:30:06',NULL,NULL,0,NULL,NULL,'2016-09-09 15:30:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'自由自在',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt9RPddPajvw_WiYgewHlHAU',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,39,'石鑫',NULL,'2016-09-09 15:47:20',NULL,NULL,0,NULL,NULL,'2016-09-09 15:47:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'石鑫',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,9,NULL,NULL,'oL9Fkt5LgjUXCu8Svcw4GYok880A',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,41,'123',NULL,'2016-09-09 15:51:41',NULL,NULL,0,NULL,NULL,'2016-09-09 15:51:51','2016-09-09 15:51:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt0Q3X4BhdJVqfl3LCUfES8M',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,31,'史翔',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-09 16:25:35','2016-09-09 16:25:43',NULL,NULL,NULL,NULL,'13673664216',NULL,NULL,NULL,NULL,NULL,'史翔',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt8hHrXN8TTCDbfauvUG-VPM',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,31,'胜光',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-13 16:43:49','2016-09-13 16:43:49',NULL,NULL,NULL,NULL,'13838196113',NULL,NULL,NULL,NULL,NULL,'胜光',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt0UgzlFAJ0grp2nc3H7CP0A',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,31,'潘博',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-13 17:40:45','2016-09-13 17:40:45',NULL,NULL,NULL,NULL,'15838369365',NULL,NULL,NULL,NULL,NULL,'潘博',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9FktwyhE0nqHtpkh_O0VDjul-Y',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,31,'石鑫',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-09 18:28:52','2016-09-09 18:32:05',NULL,NULL,NULL,NULL,'13783476576',NULL,NULL,NULL,NULL,NULL,'石鑫',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt5LgjUXCu8Svcw4GYok880A',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,31,'gg。',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-09 18:31:37','2016-09-09 18:32:00',NULL,NULL,NULL,NULL,'15836522356',NULL,NULL,NULL,NULL,NULL,'gg。',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt9m7-_pv8l8yIF1Ds6U-X-E',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,31,'王永刚',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-12 09:57:23','2016-09-12 10:00:00',NULL,NULL,NULL,NULL,'13683717560',NULL,NULL,NULL,NULL,NULL,'王永刚',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt4561julHSviMChgAoshYy0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,42,'红叶',NULL,'2016-09-12 09:58:21',NULL,NULL,0,NULL,NULL,'2016-09-12 15:16:22','2016-09-12 15:16:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'红叶',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,2,NULL,NULL,'oL9Fkt5Ekejg6ahBQvZJyqEd20Z0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,30,'红叶2',NULL,NULL,'',NULL,1,NULL,NULL,'2016-09-12 10:00:10','2016-09-12 15:16:45',NULL,NULL,NULL,NULL,'15512345689',NULL,NULL,NULL,NULL,NULL,'红叶2',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'oL9Fkt5Ekejg6ahBQvZJyqEd20Z0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,31,'李华伟',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-12 14:09:28','2016-09-12 17:39:11',NULL,NULL,NULL,NULL,'13849041182',NULL,NULL,NULL,NULL,NULL,'李华伟',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt2B-8y9jgyZ-2nDoUQTnpIU',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,31,'大阿敏～',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-12 14:32:08','2016-09-12 14:32:08',NULL,NULL,NULL,NULL,'15237138770',NULL,NULL,NULL,NULL,NULL,'大阿敏～',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9FktwRguluRyZq84oMtAW4jfdo',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,43,'',NULL,'2016-09-12 14:21:00',NULL,NULL,0,NULL,NULL,'2016-09-12 14:29:33','2016-09-12 14:29:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,3,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,31,'红叶',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-13 10:28:08','2016-09-13 10:28:08',NULL,NULL,NULL,NULL,'15512345678',NULL,NULL,NULL,NULL,NULL,'红叶',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt5Ekejg6ahBQvZJyqEd20Z0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,31,'张凯俐',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-12 17:40:34','2016-09-12 17:40:34',NULL,NULL,NULL,NULL,'13849041182',NULL,NULL,NULL,NULL,NULL,'张凯俐',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt7negWyQ775tkUnwQ4jcg7k',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,30,'胜光',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-13 10:58:36','2016-09-13 10:58:55',NULL,NULL,NULL,NULL,'13838196113',NULL,NULL,NULL,NULL,NULL,'胜光',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'oL9Fkt0UgzlFAJ0grp2nc3H7CP0A',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,31,'小明',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-13 12:31:54','2016-09-13 12:31:54',NULL,NULL,NULL,NULL,'15138477385',NULL,NULL,NULL,NULL,NULL,'小明',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt2RS2MngydztI8ChLp1mL_Y',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,31,'李金涛',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-13 18:29:31',NULL,NULL,NULL,NULL,NULL,'13603711460',NULL,NULL,NULL,NULL,NULL,'李金涛',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'oL9Fkt8FUfRDFxVwx4GPtV2INdmI',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,44,'111',NULL,'2016-09-19 17:33:45',NULL,NULL,0,NULL,NULL,'2016-09-20 11:39:54','2016-09-20 11:39:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,4,NULL,NULL,'123456',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,44,'提醒',NULL,NULL,'',NULL,0,NULL,NULL,'2016-09-19 17:43:47','2016-09-19 17:44:02',NULL,NULL,NULL,NULL,'15838369366',NULL,NULL,NULL,NULL,NULL,'提醒',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,4,NULL,NULL,'333333',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

#
# Structure for table "version_company"
#

DROP TABLE IF EXISTS `version_company`;
CREATE TABLE `version_company` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `Company_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Version_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "version_company"
#


#
# Structure for table "version_info"
#

DROP TABLE IF EXISTS `version_info`;
CREATE TABLE `version_info` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `Creat_time` datetime DEFAULT NULL,
  `Creat_userId` int(11) DEFAULT NULL,
  `Is_delete` int(11) DEFAULT NULL,
  `Is_formal` int(11) DEFAULT NULL,
  `Is_strong` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `Version_code` int(11) DEFAULT NULL,
  `Version_content` longtext,
  `Version_name` longtext,
  `Version_src` longtext,
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "version_info"
#


#
# Procedure "proc01"
#

DROP PROCEDURE IF EXISTS `proc01`;
CREATE PROCEDURE `proc01`(OUT s int)
BEGIN 
	DECLARE pig_id INT;
	
	DECLARE i INT DEFAULT 0;
	DECLARE cursor_name CURSOR FOR SELECT p.`id` FROM tb_pig p WHERE p.`type`=0 AND p.`state` = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET i=1;
	
	SET s = 0;
	
	OPEN cursor_name;
	
	FETCH cursor_name INTO pig_id;
	WHILE i <> 1 DO 
		CALL xfkj.verifyCheckResultBySowId(pig_id, @score);
		
		IF @score = 0 THEN   
			#SET s = CONCAT(s, pig_id, ",");
			set s = s + 1;
		END IF; 
		
		#读取下一行的数据
		FETCH  cursor_name INTO pig_id;  
	END WHILE;
	CLOSE cursor_name ;	
	
END;

#
# Procedure "verifyCheckResultBySowId"
#

DROP PROCEDURE IF EXISTS `verifyCheckResultBySowId`;
CREATE PROCEDURE `verifyCheckResultBySowId`(IN sow_id INT, OUT s INT)
BEGIN 
	DECLARE max_id INT;
	DECLARE max_last_id INT;
	DECLARE max_check_result INT;
	DECLARE max_last_check_result INT;
	
	SELECT pc.`id`, pc.`check_result` INTO max_id, max_check_result FROM tb_pig_check pc WHERE pc.`sow_id` = sow_id ORDER BY pc.`id` DESC limit 1;
	SELECT pc.`id`, pc.`check_result` INTO max_last_id, max_last_check_result FROM tb_pig_check pc WHERE pc.`sow_id` = sow_id AND pc.`id` < max_id ORDER BY pc.`id` limit 1;
	
	-- SELECT max_id, max_check_result, max_last_id, max_last_check_result;
	
	IF max_check_result = max_last_check_result THEN   
		SET s = 0;
	ELSE 
		SET s = 1;
	END IF; 	
	
END;
