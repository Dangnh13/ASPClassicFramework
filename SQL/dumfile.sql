/*
Navicat PGSQL Data Transfer

Source Server         : mock_project
Source Server Version : 90604
Source Host           : localhost:5432
Source Database       : test_mvc
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90604
File Encoding         : 65001

Date: 2017-08-23 09:16:01
*/


-- ----------------------------
-- Sequence structure for attachment_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."attachment_seq";
CREATE SEQUENCE "public"."attachment_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."attachment_seq"', 3, true);

-- ----------------------------
-- Sequence structure for category_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."category_seq";
CREATE SEQUENCE "public"."category_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."category_seq"', 5, true);

-- ----------------------------
-- Sequence structure for email_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."email_seq";
CREATE SEQUENCE "public"."email_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for organization_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."organization_seq";
CREATE SEQUENCE "public"."organization_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 34
 CACHE 1;
SELECT setval('"public"."organization_seq"', 34, true);

-- ----------------------------
-- Sequence structure for posttype_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."posttype_seq";
CREATE SEQUENCE "public"."posttype_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for priority_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."priority_seq";
CREATE SEQUENCE "public"."priority_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for project_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."project_seq";
CREATE SEQUENCE "public"."project_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for publication_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."publication_seq";
CREATE SEQUENCE "public"."publication_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for publicationpost_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."publicationpost_seq";
CREATE SEQUENCE "public"."publicationpost_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for status_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."status_seq";
CREATE SEQUENCE "public"."status_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for user_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_seq";
CREATE SEQUENCE "public"."user_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS "public"."attachment";
CREATE TABLE "public"."attachment" (
"id" int4 DEFAULT nextval('attachment_seq'::regclass) NOT NULL,
"itempost" int4,
"attachmentcontent" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO "public"."attachment" VALUES ('1', '1', 'test 1');
INSERT INTO "public"."attachment" VALUES ('2', '1', 'test 2');
INSERT INTO "public"."attachment" VALUES ('3', '1', 'test 3');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS "public"."category";
CREATE TABLE "public"."category" (
"id" int4 DEFAULT nextval('category_seq'::regclass) NOT NULL,
"categoryname" varchar(200) COLLATE "default",
"sortorder" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS "public"."email";
CREATE TABLE "public"."email" (
"id" int4 DEFAULT nextval('email_seq'::regclass) NOT NULL,
"fromaddress" varchar(200) COLLATE "default",
"toaddress" varchar(200) COLLATE "default",
"subject" varchar(200) COLLATE "default",
"body" varchar(200) COLLATE "default",
"incomming" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of email
-- ----------------------------

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS "public"."organization";
CREATE TABLE "public"."organization" (
"id" int4 DEFAULT nextval('organization_seq'::regclass) NOT NULL,
"organizationname" varchar(200) COLLATE "default",
"description" varchar(200) COLLATE "default",
"active" bool,
"isexternal" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO "public"."organization" VALUES ('1', '1', '1', 't', 't');
INSERT INTO "public"."organization" VALUES ('2', '2', '2', 't', 't');
INSERT INTO "public"."organization" VALUES ('3', '3', '3', null, null);
INSERT INTO "public"."organization" VALUES ('4', '4', '4', null, null);
INSERT INTO "public"."organization" VALUES ('5', '5', '5', null, null);
INSERT INTO "public"."organization" VALUES ('6', '6', '6', null, null);
INSERT INTO "public"."organization" VALUES ('7', '7', '7', null, null);
INSERT INTO "public"."organization" VALUES ('8', '8', '8', null, null);
INSERT INTO "public"."organization" VALUES ('9', '9', '9', null, null);
INSERT INTO "public"."organization" VALUES ('10', '10', '10', null, null);
INSERT INTO "public"."organization" VALUES ('11', '11', '11', null, null);
INSERT INTO "public"."organization" VALUES ('12', '12', '12', null, null);
INSERT INTO "public"."organization" VALUES ('13', '13', '13', null, null);
INSERT INTO "public"."organization" VALUES ('14', '14', '14', null, null);
INSERT INTO "public"."organization" VALUES ('15', '15', '15', null, null);
INSERT INTO "public"."organization" VALUES ('16', '16', '16', null, null);
INSERT INTO "public"."organization" VALUES ('17', '17', '17', null, null);
INSERT INTO "public"."organization" VALUES ('18', '18', '18', null, null);
INSERT INTO "public"."organization" VALUES ('19', '19', '19', null, null);
INSERT INTO "public"."organization" VALUES ('20', '20', '20', null, null);
INSERT INTO "public"."organization" VALUES ('21', '21', '1', 't', 't');
INSERT INTO "public"."organization" VALUES ('22', '22', '22', null, null);
INSERT INTO "public"."organization" VALUES ('23', '23', '23', null, null);
INSERT INTO "public"."organization" VALUES ('24', '24', null, null, null);
INSERT INTO "public"."organization" VALUES ('25', '25', null, null, null);
INSERT INTO "public"."organization" VALUES ('26', '26', null, null, null);
INSERT INTO "public"."organization" VALUES ('27', '27', null, null, null);
INSERT INTO "public"."organization" VALUES ('28', '28', null, null, null);
INSERT INTO "public"."organization" VALUES ('29', '29', null, null, null);
INSERT INTO "public"."organization" VALUES ('30', '30', null, null, null);
INSERT INTO "public"."organization" VALUES ('31', '31', null, null, null);
INSERT INTO "public"."organization" VALUES ('32', '32', null, null, null);
INSERT INTO "public"."organization" VALUES ('33', '33', null, null, null);
INSERT INTO "public"."organization" VALUES ('34', '34', null, null, null);
INSERT INTO "public"."organization" VALUES ('35', '35', null, null, null);
INSERT INTO "public"."organization" VALUES ('36', '36', null, null, null);
INSERT INTO "public"."organization" VALUES ('37', '37', null, null, null);
INSERT INTO "public"."organization" VALUES ('38', '38', null, null, null);
INSERT INTO "public"."organization" VALUES ('39', '39', null, null, null);
INSERT INTO "public"."organization" VALUES ('40', '40', null, null, null);

-- ----------------------------
-- Table structure for posttype
-- ----------------------------
DROP TABLE IF EXISTS "public"."posttype";
CREATE TABLE "public"."posttype" (
"id" int4 DEFAULT nextval('posttype_seq'::regclass) NOT NULL,
"posttypename" varchar(200) COLLATE "default",
"sortorder" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of posttype
-- ----------------------------

-- ----------------------------
-- Table structure for priority
-- ----------------------------
DROP TABLE IF EXISTS "public"."priority";
CREATE TABLE "public"."priority" (
"id" int4 DEFAULT nextval('priority_seq'::regclass) NOT NULL,
"priorityname" varchar(200) COLLATE "default",
"sortorder" int4,
"sccclass" varchar(200) COLLATE "default",
"bgcolor" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of priority
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS "public"."project";
CREATE TABLE "public"."project" (
"id" int4 DEFAULT nextval('project_seq'::regclass) NOT NULL,
"projectname" varchar(200) COLLATE "default",
"active" bool,
"pop3address" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for publication
-- ----------------------------
DROP TABLE IF EXISTS "public"."publication";
CREATE TABLE "public"."publication" (
"id" int4 DEFAULT nextval('publication_seq'::regclass) NOT NULL,
"description" varchar(200) COLLATE "default",
"projectid" int4,
"organizationid" int4,
"categoryid" int4,
"priorityid" int4,
"statusid" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of publication
-- ----------------------------

-- ----------------------------
-- Table structure for publicationpost
-- ----------------------------
DROP TABLE IF EXISTS "public"."publicationpost";
CREATE TABLE "public"."publicationpost" (
"id" int4 DEFAULT nextval('publicationpost_seq'::regclass) NOT NULL,
"publicationid" int4,
"posttext" varchar(200) COLLATE "default",
"posttype" int4,
"author" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of publicationpost
-- ----------------------------

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS "public"."status";
CREATE TABLE "public"."status" (
"id" int4 DEFAULT nextval('status_seq'::regclass) NOT NULL,
"statusname" varchar(200) COLLATE "default",
"sortorder" int4,
"cssclass" varchar(200) COLLATE "default",
"isdefault" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of status
-- ----------------------------

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS "public"."User";
CREATE TABLE "public"."User" (
"id" int4 DEFAULT nextval('user_seq'::regclass) NOT NULL,
"firstname" varchar(200) COLLATE "default",
"lastname" varchar(200) COLLATE "default",
"username" varchar(200) COLLATE "default",
"projectid" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of User
-- ----------------------------

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------


DROP SEQUENCE IF EXISTS "public"."customer_seq";
CREATE SEQUENCE "public"."customer_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."customer_seq"', 1, true);

DROP TABLE IF EXISTS "public"."customer";
CREATE TABLE "public"."customer" (
"id" int8 DEFAULT nextval('customer_seq'::regclass) PRIMARY key NOT NULL,
"NAME" VARCHAR(100),
"phone" VARCHAR(10),
Description VARCHAR(200),
Status VARCHAR(1),
create_datetime time,
update_datetime time
)
;