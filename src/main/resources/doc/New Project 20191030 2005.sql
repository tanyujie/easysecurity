-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema easysecurity
--

CREATE DATABASE IF NOT EXISTS easysecurity;
USE easysecurity;

--
-- Definition of table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` varchar(40) NOT NULL COMMENT 'id',
  `end_point` varchar(1024) default NULL COMMENT '不包含域名的路径',
  `return_class` varchar(1024) default NULL COMMENT '返回类',
  `resource_name` varchar(1024) NOT NULL COMMENT '名称',
  `parent_id` varchar(1024) default NULL COMMENT '上一级资源',
  `return_file` tinyint(1) default '0' COMMENT '是否返回的是文件',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `resource`
--

/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` (`id`,`end_point`,`return_class`,`resource_name`,`parent_id`,`return_file`) VALUES 
 ('29',NULL,NULL,'17维度',NULL,0),
 ('30','/company/info',NULL,'公司信息','29',0),
 ('32','/summary/query',NULL,'查询结果展示条数',NULL,0),
 ('34',NULL,NULL,'个人中心',NULL,0),
 ('35','/user/info',NULL,'个人详情','34',0),
 ('37','/abnormalInfo/queryAbnormalInfo',NULL,'经营异常信息','29',0),
 ('38','/annualReport/queryAnnualReport',NULL,'企业年报','29',0),
 ('39','/branchOrganization/info',NULL,'分支机构信息','29',0),
 ('40','/cancellationInfo/queryCancellationInfo',NULL,'企业注销与吊销信息','29',0),
 ('41','/checkInfo/queryCheckInfo',NULL,'企业抽查检查信息','29',0),
 ('42','/companyChangeInfo/info',NULL,'变更记录相关','29',0),
 ('43','/companyEquity/info',NULL,'股权出质','29',0),
 ('44','/companyInvestor/info',NULL,'股东信息','29',0),
 ('45','/companyMortgage/info',NULL,'动产抵押','29',0),
 ('46','/companyPunishment/info',NULL,'行政处罚','29',0),
 ('47','/staff/info',NULL,'员工信息','29',0),
 ('50','/IllegalInfo/queryIllegalInfo',NULL,'严重违法','29',0),
 ('51','/IprPledge/queryIprPledge',NULL,'知识产权','29',0),
 ('52','/judicialAssistance/queryJudicalInfo',NULL,'司法协助','29',0),
 ('53','/licenseInfo/queryLicenseInfo',NULL,'行政许可','29',0),
 ('54','/liquidatingInfo/queryLiquidatingInfo',NULL,'清算信息','29',0),
 ('55','/checkInfo/queryPunishmentInfo',NULL,'企业行政处罚','29',0),
 ('57',NULL,NULL,'订单',NULL,0),
 ('58','/gdeOrder/queryOrderRecord',NULL,'购买记录','57',0),
 ('59','/gdeOrder/createPagePrepayOrder',NULL,'pc端订单生成','57',0),
 ('60','/gdeOrder/save',NULL,'移动端订单生成','57',0),
 ('61','/user/getAppVersion',NULL,'系统版本号','34',0),
 ('62',NULL,NULL,'商品',NULL,0),
 ('63','/goods/visibleGoods',NULL,'商品列表','62',0),
 ('64','/summary/exportedQuery',NULL,'可导出条数(每天)',NULL,0),
 ('65','/summary/tagQuery','java.lang.String','精准搜索分类展示条数',NULL,0),
 ('66','/summary/addressQuery','java.lang.String','重复地址查询',NULL,0),
 ('67','/summary/preciseQuery',NULL,'精准搜索',NULL,0),
 ('68','/user/preciseQueryEntrance',NULL,'精准数据查询入口','34',0),
 ('72','/seventeenTable/queryQuantity',NULL,'公司详情入口','29',0);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(20) NOT NULL auto_increment COMMENT 'id',
  `role_name` varchar(32) NOT NULL COMMENT '名称',
  `role_sn` varchar(32) default NULL COMMENT 'ROLE_开头,用于security判断',
  `template_name` varchar(100) NOT NULL COMMENT '模板名称',
  PRIMARY KEY  (`role_name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`,`role_name`,`role_sn`,`template_name`) VALUES 
 (1,'def_super_admin','ROLE_def_super_admin','def_super_admin'),
 (4,'VIP_1','ROLE_VIP_1','VIP_1'),
 (7,'VIP权限001','ROLE_VIP权限001','VIP权限001'),
 (12,'普通用户权限-003','ROLE_普通用户权限-003','普通用户权限-003'),
 (20,'普通用户权限组','ROLE_USER','普通用户权限组'),
 (22,'权限组01','ROLE_权限组01','权限组01'),
 (23,'权限组02','ROLE_权限组02','权限组02'),
 (25,'游客权限','ROLE_ANONYMOUS','游客权限'),
 (10,'贵宾权限001','ROLE_贵宾权限001','贵宾权限001'),
 (11,'贵宾权限002','ROLE_贵宾权限002','贵宾权限002');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `role_resource`
--

DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` varchar(40) NOT NULL COMMENT 'id',
  `resource_id` varchar(40) NOT NULL COMMENT '资源 id',
  `return_field` varchar(1024) default NULL COMMENT '返回字段,分隔',
  `role_id` varchar(40) NOT NULL COMMENT 'role_id',
  `export_number` int(20) default NULL COMMENT '条数',
  `query_number` int(20) default NULL COMMENT '查询条数',
  PRIMARY KEY  (`resource_id`,`role_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role_resource`
--

/*!40000 ALTER TABLE `role_resource` DISABLE KEYS */;
INSERT INTO `role_resource` (`id`,`resource_id`,`return_field`,`role_id`,`export_number`,`query_number`) VALUES 
 ('1','30',NULL,'1',NULL,NULL),
 ('224','30',NULL,'11',NULL,NULL),
 ('255','30',NULL,'12',NULL,NULL),
 ('477','30',NULL,'22',NULL,NULL),
 ('62','30',NULL,'4',NULL,NULL),
 ('139','30',NULL,'7',NULL,NULL),
 ('2','32',NULL,'1',NULL,100000),
 ('225','32',NULL,'11',NULL,1000),
 ('256','32',NULL,'12',NULL,1000),
 ('449','32',NULL,'20',NULL,11),
 ('483','32',NULL,'25',NULL,50),
 ('63','32',NULL,'4',NULL,1000),
 ('140','32',NULL,'7',NULL,1000),
 ('3','35',NULL,'1',NULL,NULL),
 ('226','35',NULL,'11',NULL,NULL),
 ('257','35',NULL,'12',NULL,NULL),
 ('450','35',NULL,'20',NULL,NULL),
 ('484','35',NULL,'25',NULL,NULL),
 ('64','35',NULL,'4',NULL,NULL),
 ('141','35',NULL,'7',NULL,NULL),
 ('4','37',NULL,'1',NULL,NULL),
 ('227','37',NULL,'11',NULL,NULL),
 ('258','37',NULL,'12',NULL,NULL),
 ('451','37',NULL,'20',NULL,NULL),
 ('65','37',NULL,'4',NULL,NULL),
 ('142','37',NULL,'7',NULL,NULL),
 ('5','38',NULL,'1',NULL,NULL),
 ('228','38',NULL,'11',NULL,NULL),
 ('259','38',NULL,'12',NULL,NULL),
 ('66','38',NULL,'4',NULL,NULL),
 ('143','38',NULL,'7',NULL,NULL),
 ('6','39',NULL,'1',NULL,NULL),
 ('229','39',NULL,'11',NULL,NULL),
 ('260','39',NULL,'12',NULL,NULL),
 ('452','39',NULL,'20',NULL,NULL),
 ('67','39',NULL,'4',NULL,NULL),
 ('144','39',NULL,'7',NULL,NULL),
 ('7','40',NULL,'1',NULL,NULL),
 ('230','40',NULL,'11',NULL,NULL),
 ('261','40',NULL,'12',NULL,NULL),
 ('453','40',NULL,'20',NULL,NULL),
 ('68','40',NULL,'4',NULL,NULL),
 ('145','40',NULL,'7',NULL,NULL),
 ('8','41',NULL,'1',NULL,NULL),
 ('231','41',NULL,'11',NULL,NULL),
 ('262','41',NULL,'12',NULL,NULL),
 ('454','41',NULL,'20',NULL,NULL),
 ('69','41',NULL,'4',NULL,NULL),
 ('146','41',NULL,'7',NULL,NULL),
 ('9','42',NULL,'1',NULL,NULL),
 ('232','42',NULL,'11',NULL,NULL),
 ('263','42',NULL,'12',NULL,NULL),
 ('455','42',NULL,'20',NULL,NULL),
 ('70','42',NULL,'4',NULL,NULL),
 ('147','42',NULL,'7',NULL,NULL),
 ('10','43',NULL,'1',NULL,NULL),
 ('233','43',NULL,'11',NULL,NULL),
 ('264','43',NULL,'12',NULL,NULL),
 ('456','43',NULL,'20',NULL,NULL),
 ('71','43',NULL,'4',NULL,NULL),
 ('148','43',NULL,'7',NULL,NULL),
 ('11','44',NULL,'1',NULL,NULL),
 ('234','44',NULL,'11',NULL,NULL),
 ('265','44',NULL,'12',NULL,NULL),
 ('457','44',NULL,'20',NULL,NULL),
 ('72','44',NULL,'4',NULL,NULL),
 ('149','44',NULL,'7',NULL,NULL),
 ('12','45',NULL,'1',NULL,NULL),
 ('235','45',NULL,'11',NULL,NULL),
 ('266','45',NULL,'12',NULL,NULL),
 ('458','45',NULL,'20',NULL,NULL),
 ('73','45',NULL,'4',NULL,NULL),
 ('150','45',NULL,'7',NULL,NULL),
 ('13','46',NULL,'1',NULL,NULL),
 ('236','46',NULL,'11',NULL,NULL),
 ('267','46',NULL,'12',NULL,NULL),
 ('459','46',NULL,'20',NULL,NULL),
 ('481','46',NULL,'23',NULL,NULL),
 ('74','46',NULL,'4',NULL,NULL),
 ('151','46',NULL,'7',NULL,NULL),
 ('14','47',NULL,'1',NULL,NULL),
 ('237','47',NULL,'11',NULL,NULL),
 ('268','47',NULL,'12',NULL,NULL),
 ('460','47',NULL,'20',NULL,NULL),
 ('75','47',NULL,'4',NULL,NULL),
 ('152','47',NULL,'7',NULL,NULL),
 ('15','50',NULL,'1',NULL,NULL),
 ('238','50',NULL,'11',NULL,NULL),
 ('269','50',NULL,'12',NULL,NULL),
 ('461','50',NULL,'20',NULL,NULL),
 ('76','50',NULL,'4',NULL,NULL),
 ('153','50',NULL,'7',NULL,NULL),
 ('16','51',NULL,'1',NULL,NULL),
 ('239','51',NULL,'11',NULL,NULL),
 ('270','51',NULL,'12',NULL,NULL),
 ('462','51',NULL,'20',NULL,NULL),
 ('77','51',NULL,'4',NULL,NULL),
 ('154','51',NULL,'7',NULL,NULL),
 ('17','52',NULL,'1',NULL,NULL),
 ('240','52',NULL,'11',NULL,NULL),
 ('271','52',NULL,'12',NULL,NULL),
 ('463','52',NULL,'20',NULL,NULL),
 ('78','52',NULL,'4',NULL,NULL),
 ('155','52',NULL,'7',NULL,NULL),
 ('18','53',NULL,'1',NULL,NULL),
 ('241','53',NULL,'11',NULL,NULL),
 ('272','53',NULL,'12',NULL,NULL),
 ('464','53',NULL,'20',NULL,NULL),
 ('79','53',NULL,'4',NULL,NULL),
 ('156','53',NULL,'7',NULL,NULL),
 ('19','54',NULL,'1',NULL,NULL),
 ('242','54',NULL,'11',NULL,NULL),
 ('273','54',NULL,'12',NULL,NULL),
 ('465','54',NULL,'20',NULL,NULL),
 ('80','54',NULL,'4',NULL,NULL),
 ('157','54',NULL,'7',NULL,NULL),
 ('20','55',NULL,'1',NULL,NULL),
 ('243','55',NULL,'11',NULL,NULL),
 ('274','55',NULL,'12',NULL,NULL),
 ('466','55',NULL,'20',NULL,NULL),
 ('81','55',NULL,'4',NULL,NULL),
 ('158','55',NULL,'7',NULL,NULL),
 ('21','58',NULL,'1',NULL,NULL),
 ('244','58',NULL,'11',NULL,NULL),
 ('275','58',NULL,'12',NULL,NULL),
 ('485','58',NULL,'25',NULL,NULL),
 ('82','58',NULL,'4',NULL,NULL),
 ('159','58',NULL,'7',NULL,NULL),
 ('22','59',NULL,'1',NULL,NULL),
 ('245','59',NULL,'11',NULL,NULL),
 ('276','59',NULL,'12',NULL,NULL),
 ('467','59',NULL,'20',NULL,NULL),
 ('486','59',NULL,'25',NULL,NULL),
 ('83','59',NULL,'4',NULL,NULL),
 ('160','59',NULL,'7',NULL,NULL),
 ('23','60',NULL,'1',NULL,NULL),
 ('246','60',NULL,'11',NULL,NULL),
 ('277','60',NULL,'12',NULL,NULL),
 ('468','60',NULL,'20',NULL,NULL),
 ('487','60',NULL,'25',NULL,NULL),
 ('84','60',NULL,'4',NULL,NULL),
 ('161','60',NULL,'7',NULL,NULL),
 ('24','61',NULL,'1',NULL,NULL),
 ('247','61',NULL,'11',NULL,NULL),
 ('278','61',NULL,'12',NULL,NULL),
 ('469','61',NULL,'20',NULL,NULL),
 ('488','61',NULL,'25',NULL,NULL),
 ('85','61',NULL,'4',NULL,NULL),
 ('162','61',NULL,'7',NULL,NULL),
 ('25','63',NULL,'1',NULL,NULL),
 ('248','63',NULL,'11',NULL,NULL),
 ('279','63',NULL,'12',NULL,NULL),
 ('470','63',NULL,'20',NULL,NULL),
 ('489','63',NULL,'25',NULL,NULL),
 ('86','63',NULL,'4',NULL,NULL),
 ('163','63',NULL,'7',NULL,NULL),
 ('26','64',NULL,'1',1000000,NULL),
 ('249','64',NULL,'11',100000,NULL),
 ('280','64',NULL,'12',1000,NULL),
 ('471','64',NULL,'20',5,NULL),
 ('478','64',NULL,'22',NULL,NULL),
 ('87','64',NULL,'4',1000,NULL),
 ('164','64',NULL,'7',1000,NULL),
 ('27','65',NULL,'1',NULL,1000000),
 ('250','65',NULL,'11',NULL,1000),
 ('472','65',NULL,'20',NULL,29),
 ('479','65',NULL,'22',NULL,NULL),
 ('28','66',NULL,'1',NULL,1000000),
 ('251','66',NULL,'11',NULL,1000),
 ('473','66',NULL,'20',NULL,20),
 ('29','67',NULL,'1',NULL,1000000),
 ('252','67',NULL,'11',NULL,1000),
 ('474','67',NULL,'20',NULL,40),
 ('30','68',NULL,'1',NULL,NULL),
 ('253','68',NULL,'11',NULL,NULL),
 ('475','68',NULL,'20',NULL,NULL),
 ('490','68',NULL,'25',NULL,NULL),
 ('88','68',NULL,'4',NULL,NULL),
 ('31','72',NULL,'1',NULL,NULL),
 ('387','72',NULL,'10',NULL,NULL),
 ('254','72',NULL,'11',NULL,NULL),
 ('281','72',NULL,'12',NULL,NULL),
 ('476','72',NULL,'20',NULL,NULL),
 ('480','72',NULL,'22',NULL,NULL),
 ('482','72',NULL,'23',NULL,NULL),
 ('491','72',NULL,'25',NULL,NULL),
 ('89','72',NULL,'4',NULL,NULL),
 ('165','72',NULL,'7',NULL,NULL);
/*!40000 ALTER TABLE `role_resource` ENABLE KEYS */;


--
-- Definition of table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(20) NOT NULL auto_increment COMMENT 'id',
  `user_no` varchar(32) NOT NULL COMMENT 'user编号',
  `sex` char(1) default '男' COMMENT '性别',
  `age` int(10) default NULL COMMENT '年龄',
  `company_name` varchar(1024) default NULL COMMENT '公司名称',
  `department` varchar(1024) default NULL COMMENT '部门',
  `position` varchar(1024) default NULL COMMENT '职位',
  `password` varchar(32) default NULL COMMENT '密码',
  `head_url` varchar(1024) default NULL COMMENT '头像地址',
  `phone_number` varchar(32) NOT NULL COMMENT '电话号码',
  `email` varchar(1024) default NULL COMMENT '邮箱',
  `modify_time` datetime default NULL COMMENT '修改时间',
  `create_time` datetime default NULL COMMENT '创建时间',
  `name` varchar(128) default NULL COMMENT '名字',
  PRIMARY KEY  (`user_no`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `sys_user`
--

/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`,`user_no`,`sex`,`age`,`company_name`,`department`,`position`,`password`,`head_url`,`phone_number`,`email`,`modify_time`,`create_time`,`name`) VALUES 
 (3,'GDE1242342','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'13888311260',NULL,NULL,'2019-09-29 14:12:13',NULL),
 (2,'GDE132323','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'13489798318',NULL,NULL,'2019-09-28 21:25:24',NULL),
 (6,'GDE2323242412','男',NULL,NULL,NULL,NULL,'abbdf914aa3b4bda922aae1ca593d348',NULL,'15828208710',NULL,NULL,'2019-10-25 10:27:39','15828208710'),
 (4,'GDE324242432','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'13552815007',NULL,NULL,'2019-10-15 10:52:01','13552815007'),
 (5,'GDF123321','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'15010362665',NULL,NULL,NULL,'laoda'),
 (1,'GDS123455','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'18514235676',NULL,NULL,'2019-09-28 21:24:46',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL auto_increment COMMENT 'id',
  `user_no` varchar(32) NOT NULL COMMENT 'user编号',
  `sex` char(1) default '男' COMMENT '性别',
  `age` int(10) default NULL COMMENT '年龄',
  `company_name` varchar(1024) default NULL COMMENT '公司名称',
  `department` varchar(1024) default NULL COMMENT '部门',
  `position` varchar(1024) default NULL COMMENT '职位',
  `password` varchar(32) default NULL COMMENT '密码',
  `head_url` varchar(1024) default NULL COMMENT '头像地址',
  `phone_number` varchar(32) NOT NULL COMMENT '电话号码',
  `email` varchar(1024) default NULL COMMENT '邮箱',
  `modify_time` datetime default NULL COMMENT '修改时间',
  `create_time` datetime default NULL COMMENT '创建时间',
  `name` varchar(128) default NULL COMMENT '名字',
  `enabled` tinyint(1) default '1' COMMENT '启用/禁用',
  PRIMARY KEY  (`user_no`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`user_no`,`sex`,`age`,`company_name`,`department`,`position`,`password`,`head_url`,`phone_number`,`email`,`modify_time`,`create_time`,`name`,`enabled`) VALUES 
 (19,'GDE2019092813070501663','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'13070501663',NULL,NULL,'2019-09-28 22:47:46','GDEn23fet55ac',1),
 (5,'GDE2019092813489798318','男',NULL,NULL,NULL,NULL,'23eeeb4347bdd26bfc6b7ee9a3b755dd',NULL,'13489798318',NULL,NULL,'2019-09-28 22:05:41','GDEd9x8f8gq4z',1),
 (9,'GDE2019092813520370447','男',NULL,NULL,NULL,NULL,'3d8e717e9a7c14ceb522fe43f70b3fd3',NULL,'13520370447',NULL,NULL,'2019-09-28 22:08:30','GDEzma6gibl6d',1),
 (12,'GDE2019092813520393024','男',NULL,NULL,NULL,NULL,'024375bdfa513158f88867871783063c',NULL,'13520393024',NULL,NULL,'2019-09-28 22:16:26','GDEwd5ed4lywn',1),
 (11,'GDE2019092813577045805','男',NULL,NULL,NULL,NULL,'4285b083dd3aad863395566488c7dd74',NULL,'13577045805',NULL,NULL,'2019-09-28 22:15:51','GDEyy5bdbg2py',1),
 (21,'GDE2019092813648897879','男',NULL,NULL,NULL,NULL,'f86b8bf736bb507593eb511c15e2142e',NULL,'13648897879',NULL,NULL,'2019-09-28 23:18:22','GDElkgh79m4bv',1),
 (13,'GDE2019092813888247781','男',NULL,NULL,NULL,NULL,'5af49980f58366e629f2f8349f6dc7c5',NULL,'13888247781',NULL,NULL,'2019-09-28 22:16:51','GDE4z5e6jcmfv',1),
 (22,'GDE2019092813988415005','男',NULL,NULL,NULL,NULL,'3f80b66f7080ded82f127526a1e0d666',NULL,'13988415005',NULL,NULL,'2019-09-28 23:30:25','GDE58klanue7e',1),
 (18,'GDE2019092815101593710','男',NULL,NULL,NULL,NULL,'94b00e99a3bd6440d26ffd1ce324bf6c',NULL,'15101593710',NULL,NULL,'2019-09-28 22:29:46','GDEvhwbnnbnbn',1),
 (10,'GDE2019092815141923418','男',NULL,NULL,NULL,NULL,'30abb920b3120cedd10f37c54800c3a4',NULL,'15141923418',NULL,NULL,'2019-09-28 22:10:39','GDEvx4fjl8v7u',1),
 (20,'GDE2019092815810987348','男',NULL,NULL,NULL,NULL,'9f305b1d790dfd3e5c6489436c5b2267',NULL,'15810987348',NULL,NULL,'2019-09-28 23:17:50','GDEvicmh9dw34',1),
 (4,'GDE2019092815828208710','男',NULL,NULL,NULL,NULL,'27e7cb180e050bc2cd11fdb2cf1710d0',NULL,'15828208710',NULL,NULL,'2019-09-28 22:05:26','GDE9jl24gby79',1),
 (16,'GDE2019092815928985296','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'15928985296',NULL,NULL,'2019-09-28 22:25:50','GDE4va2dvgun9',1),
 (17,'GDE2019092816601228351','男',NULL,NULL,NULL,NULL,'25f9e794323b453885f5181f1b624d0b',NULL,'16601228351',NULL,NULL,'2019-09-28 22:26:05','GDEv4hlxeczxi',1),
 (2,'GDE2019092816601326094','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'16601326094',NULL,NULL,'2019-09-28 22:04:27','GDE8q5pacbckz',1),
 (14,'GDE2019092817308080208','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'17308080208',NULL,NULL,'2019-09-28 22:21:48','GDEmgl3hlgn6k',1),
 (15,'GDE2019092818308324547','男',NULL,NULL,NULL,NULL,'1ff9c11673b19fb7136f2e3508531bb4',NULL,'18308324547',NULL,NULL,'2019-09-28 22:24:45','GDEjtaovcwcef',1),
 (8,'GDE2019092818395756437','男',NULL,NULL,NULL,NULL,'6af208ac1202e20170545d6f4ed76d88',NULL,'18395756437',NULL,NULL,'2019-09-28 22:07:47','GDEf92hljdbfz',1),
 (3,'GDE2019092818518514053','男',NULL,NULL,NULL,NULL,'a3bb420e5a34ab17b663559a119f2460',NULL,'18518514053',NULL,NULL,'2019-09-28 22:04:46','GDEoucmjgz4b8',1),
 (7,'GDE2019092818701261141','男',NULL,NULL,NULL,NULL,'a920d28ecc91206d9576abada2edae93',NULL,'18701261141',NULL,NULL,'2019-09-28 22:07:11','GDEv44pbom9ae',1),
 (6,'GDE2019092818911290849','男',NULL,NULL,NULL,NULL,'75d589dd1bc5b50d8b822b9b7691273f',NULL,'18911290849',NULL,NULL,'2019-09-28 22:06:38','GDEa998j9ax8l',1),
 (24,'GDE2019092915001070687','男',NULL,NULL,NULL,NULL,'9329c581c177e3685a832e5bf8d98d79',NULL,'15001070687',NULL,NULL,'2019-09-29 02:24:06','GDEf6zalny7v7',1),
 (23,'GDE2019092915928808419','男',NULL,NULL,NULL,NULL,'96e79218965eb72c92a549dd5a330112',NULL,'15928808419',NULL,NULL,'2019-09-29 01:38:02','GDEpg6bz3ece6',1),
 (25,'GDE2019092918801161214','男',NULL,NULL,NULL,NULL,'96e79218965eb72c92a549dd5a330112',NULL,'18801161214',NULL,NULL,'2019-09-29 15:45:45','GDEcaxgcw8e4l',1),
 (27,'GDE2019093017303866672','男',NULL,NULL,NULL,NULL,'2b31cfff0885250a76051653ebd14652',NULL,'17303866672',NULL,NULL,'2019-09-30 18:09:26','GDEzby3xal8ap',1),
 (31,'GDE2019093018010465770','男',NULL,NULL,NULL,NULL,'7aada880a5f926d51de359cdc0dcd3a8',NULL,'18010465770',NULL,NULL,'2019-09-30 18:55:19','GDEaa3aizhgqq',1),
 (26,'GDE2019093018200159514','男',NULL,NULL,NULL,NULL,'9cc67a6d2ab6f58951145f4852113d4b',NULL,'18200159514',NULL,NULL,'2019-09-30 15:22:11','GDE372lafqypx',1),
 (28,'GDE2019093018338869751','男',NULL,NULL,NULL,NULL,'eb0fc08f836edbe29c95ee990c754f57',NULL,'18338869751',NULL,NULL,'2019-09-30 18:12:43','GDEn7322yva25',1),
 (32,'GDE2019100618910743181','男',NULL,NULL,NULL,NULL,'a714560b1381554ae90a0f0fa37c1620',NULL,'18910743181',NULL,NULL,'2019-10-06 20:18:22','GDEicueo9cdgo',1),
 (34,'GDE2019100818310012500','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'18310012500',NULL,NULL,'2019-10-08 17:40:30','GDE8q8wndj4dn',1),
 (33,'GDE2019100818514235676','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'18514235676',NULL,NULL,'2019-10-08 10:32:46','GDE64aeqx6eez',1),
 (35,'GDE2019101013888700731','男',NULL,NULL,NULL,NULL,'3e2267d3b2e475f2a75295477cdcb9c3',NULL,'13888700731',NULL,NULL,'2019-10-10 13:26:26','GDE8xgua9uwcd',1),
 (36,'GDE2019101013910715301','男',NULL,NULL,NULL,NULL,'45be78547153b0a2d3f93014e43fbe1b',NULL,'13910715301',NULL,NULL,'2019-10-10 16:25:17','GDEp4nqecflqq',1),
 (39,'GDE2019101513330499426','男',NULL,NULL,NULL,NULL,'0e9ed8f947379b0fdf82420c7f7c8da0',NULL,'13330499426',NULL,NULL,'2019-10-15 11:30:04','GDEbcdgc8k8lc',1),
 (37,'GDE2019101513552815008','男',NULL,NULL,NULL,NULL,'c4ca4238a0b923820dcc509a6f75849b',NULL,'13552815008',NULL,NULL,'2019-10-15 10:49:05','GDEfb8zae28ek',1),
 (41,'GDE2019101515010362665','男',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'15010362665',NULL,NULL,'2019-10-15 19:45:46','GDE93pfqkipcf',1),
 (38,'GDE2019101515887416621','男',NULL,NULL,NULL,NULL,'4cb470e5a66fdc7f6876eb09e6068c40',NULL,'15887416621',NULL,NULL,'2019-10-15 11:29:57','GDEcb23k5k7oy',1),
 (40,'GDE2019101518987053407','男',NULL,NULL,NULL,NULL,'d96d07a431f60e8b1514f590ef304309',NULL,'18987053407',NULL,NULL,'2019-10-15 11:34:26','GDEvajn4maq9a',1),
 (42,'GDE2019101613577033489','男',NULL,NULL,NULL,NULL,'00303803f663c251c79e8c87600f9dc1',NULL,'13577033489',NULL,NULL,'2019-10-16 15:12:45','GDEeikcpd3b7z',1),
 (46,'GDE2019101713888487077','男',NULL,NULL,NULL,NULL,'a2d2466af7f63363d019de874f7821a2',NULL,'13888487077',NULL,NULL,'2019-10-17 12:38:31','GDEu54v8davof',1),
 (45,'GDE2019101715925176209','男',NULL,NULL,NULL,NULL,'b97e1c29dc4ccef4dc5448bdc9b74903',NULL,'15925176209',NULL,NULL,'2019-10-17 12:38:27','GDEjgxaq3coix',1),
 (47,'GDE2019101813552815009','男',NULL,NULL,NULL,NULL,'c4ca4238a0b923820dcc509a6f75849b',NULL,'13552815009',NULL,NULL,'2019-10-18 11:05:57','GDE38xcxwhihv',1),
 (48,'GDE2019101913552815001','男',NULL,NULL,NULL,NULL,'25f9e794323b453885f5181f1b624d0b',NULL,'13552815001',NULL,NULL,'2019-10-19 14:39:25','GDE8axbm6loq2',1),
 (49,'GDE2019101913552815010','男',NULL,NULL,NULL,NULL,'c81e728d9d4c2f636f067f89cc14862c',NULL,'13552815010',NULL,NULL,'2019-10-19 15:03:39','GDEey8jitq9ch',1),
 (50,'GDE2019102518518912167','男',NULL,NULL,NULL,NULL,'e7ecde65ad9397d73b6e1b663d700f9b',NULL,'18518912167',NULL,NULL,'2019-10-25 14:05:28','GDEx7agkv6qdx',1),
 (51,'GDE2019102813551259347','男',NULL,NULL,NULL,NULL,'8641435fcf1d02982dbfecc31ccb3247',NULL,'13551259347',NULL,NULL,'2019-10-28 10:21:42','GDE2hzj9uptoo',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(20) NOT NULL auto_increment COMMENT 'id',
  `user_no` varchar(32) NOT NULL COMMENT 'user_no',
  `role_name` varchar(32) NOT NULL COMMENT 'role_name',
  `from_time` datetime default NULL COMMENT '有效期起始',
  `to_time` datetime default NULL COMMENT '有效期结束',
  `create_time` datetime default NULL COMMENT '创建时间',
  `free` tinyint(4) default '0' COMMENT '是不是免费的',
  `pay_fee` int(20) default '0' COMMENT '付款金额',
  `gde_order_no` varchar(500) NOT NULL COMMENT '订单编号',
  `free_operation_phone` varchar(32) default NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`,`user_no`,`role_name`,`from_time`,`to_time`,`create_time`,`free`,`pay_fee`,`gde_order_no`,`free_operation_phone`) VALUES 
 (2,'GDE2019092818911290849','VIP_1','2019-09-28 22:15:06','2019-10-08 22:15:06','2019-09-28 22:15:06',0,10,'[\"GEC20190928221459M47X6IB3CI\"]',NULL),
 (3,'GDE2019092818395756437','VIP_1','2019-09-28 22:15:47','2019-10-08 22:15:47','2019-09-28 22:15:47',0,10,'[\"GEC20190928221538BQLCK63C0Y\"]',NULL),
 (4,'GDE2019092818518514053','VIP_1','2019-09-29 22:22:12','2019-10-09 22:16:33','2019-09-28 22:16:33',0,10,'[\"GEC20190928221624B56JQEFRT4\"]',NULL),
 (5,'GDE2019092813888247781','VIP_1','2019-09-28 22:17:06','2019-10-08 22:17:06','2019-09-28 22:17:06',0,10,'[\"GEC20190928221654R8160BUVGH\"]',NULL),
 (6,'GDE2019092818518514053','VIP权限001','2019-09-28 22:22:12','2019-09-29 22:22:12','2019-09-28 22:22:12',0,1,'[\"GEC20190928222204LYU8A4Y25S\"]',NULL),
 (7,'GDE2019092817308080208','VIP权限001','2019-10-01 15:13:39','2019-10-01 22:25:12','2019-09-28 22:25:12',0,2,'[\"GEC20190928222500JOKMF43W6J\", \"1000000573619590\"]',NULL),
 (8,'GDE2019092813520393024','VIP权限001','2019-09-28 22:40:43','2019-09-29 22:40:43','2019-09-28 22:40:43',0,1,'[\"1000000573619620\"]',NULL),
 (9,'GDE2019092815928985296','VIP权限001','2019-09-28 22:42:31','2019-09-29 22:42:31','2019-09-28 22:42:31',0,1,'[\"GEC20190928224203HKVRFHGWXF\"]',NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
