/*
 Navicat Premium Dump SQL

 Source Server         : LOCAL POSTGRES
 Source Server Type    : PostgreSQL
 Source Server Version : 150008 (150008)
 Source Host           : localhost:5432
 Source Catalog        : kids-city
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150008 (150008)
 File Encoding         : 65001

 Date: 29/11/2024 15:18:17
*/


-- ----------------------------
-- Sequence structure for devices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."devices_id_seq";
CREATE SEQUENCE "public"."devices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."devices_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."migrations_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for tokens_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tokens_id_seq";
CREATE SEQUENCE "public"."tokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."tokens_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."users_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for vouchers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."vouchers_id_seq";
CREATE SEQUENCE "public"."vouchers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."vouchers_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for devices
-- ----------------------------
DROP TABLE IF EXISTS "public"."devices";
CREATE TABLE "public"."devices" (
  "id" int4 NOT NULL DEFAULT nextval('devices_id_seq'::regclass),
  "serial_number" int4 NOT NULL,
  "os" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "users_id" int4,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "deleted_at" timestamp(6)
)
;
ALTER TABLE "public"."devices" OWNER TO "postgres";

-- ----------------------------
-- Records of devices
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;
ALTER TABLE "public"."migrations" OWNER TO "postgres";

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."tokens";
CREATE TABLE "public"."tokens" (
  "id" int4 NOT NULL DEFAULT nextval('tokens_id_seq'::regclass),
  "users_id" int4 NOT NULL,
  "token" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "refresh_token" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL,
  "deleted_at" timestamp(6),
  "status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "expire_at" timestamp(6) NOT NULL,
  "devices_id" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."tokens" OWNER TO "postgres";
COMMENT ON COLUMN "public"."tokens"."status" IS 'active,logout,block,';

-- ----------------------------
-- Records of tokens
-- ----------------------------
BEGIN;
INSERT INTO "public"."tokens" ("id", "users_id", "token", "refresh_token", "created_at", "updated_at", "deleted_at", "status", "expire_at", "devices_id") VALUES (175, 28, '$2a$12$tFJJ2HUJo962U9rNCWiVxOBRkNOG/L/jse5AQzD1T.1y2AWJ3IfRK', 'IhnueuBd6J', '2024-11-13 04:40:31.264205', '2024-11-13 04:40:31.264205', NULL, 'active', '2024-11-13 14:40:31.263441', 'A781C7BF-3853-43E7-902D-C71BF54955A9');
INSERT INTO "public"."tokens" ("id", "users_id", "token", "refresh_token", "created_at", "updated_at", "deleted_at", "status", "expire_at", "devices_id") VALUES (176, 28, '$2a$12$UXmkn0IcceWslcLmLX8/uuOaN1Pip/cIJs./Q9aSG1wsLw0j2nT..', 'iu5buRp59F', '2024-11-13 10:23:02.126061', '2024-11-13 10:23:02.126061', NULL, 'active', '2024-11-13 20:23:02.12454', '3136ae89-abc9-eb39-d787-252625c37125');
INSERT INTO "public"."tokens" ("id", "users_id", "token", "refresh_token", "created_at", "updated_at", "deleted_at", "status", "expire_at", "devices_id") VALUES (174, 28, '$2a$12$FIrgevt7vuPUF3C/6ekixusEZ7U9K7wvtEi439gc62iPjUusfOwha', 'cK5k6h5wLp', '2024-11-13 04:39:20.688335', '2024-11-13 04:39:20.688335', NULL, 'active', '2024-11-13 14:39:20.68685', 'A781C7BF-3853-43E7-902D-C71BF54955A9');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "phone" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL,
  "deleted_at" timestamp(6),
  "avatar" varchar(100) COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default",
  "ip" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."users" OWNER TO "postgres";

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO "public"."users" ("id", "name", "email", "phone", "created_at", "updated_at", "deleted_at", "avatar", "status", "ip", "password") VALUES (27, 'putra', 'admin@gmail.com', '85888893232', '2024-08-06 12:54:26.100681', '2024-08-06 12:54:26.100681', NULL, 'https://ui-avatars.com/api/?name=Muh+Sya', 'active', '127.0.0.1', '8d24cd0f0d357ab61894095a5283068f');
INSERT INTO "public"."users" ("id", "name", "email", "phone", "created_at", "updated_at", "deleted_at", "avatar", "status", "ip", "password") VALUES (28, 'putra', 'putra@gmail.com', '085888893232', '2024-11-07 15:05:07.106828', '2024-11-07 15:05:07.106828', NULL, '-', 'active', '127.0.0.1', '0f793e1d048576812c0dc3b1b1392f31');
COMMIT;

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS "public"."vouchers";
CREATE TABLE "public"."vouchers" (
  "id" int4 NOT NULL DEFAULT nextval('vouchers_id_seq'::regclass),
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(20) COLLATE "pg_catalog"."default",
  "redeem_by" varchar(50) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL,
  "deleted_at" timestamp(6),
  "devices_id" varchar(100) COLLATE "pg_catalog"."default",
  "redeem_at" timestamp(6),
  "users_id" int4,
  "avatar" varchar(100) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."vouchers" OWNER TO "postgres";

-- ----------------------------
-- Records of vouchers
-- ----------------------------
BEGIN;
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1217, 'KqdB0boBR3qiVinnVQdQ', 'redeem', '', '2024-08-07 14:22:46.753331', '2024-08-07 07:36:34.781182', NULL, '', '2024-08-07 14:36:34.781092', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1214, 'dmdmW3DVyCh9wlzX1BNN', 'redeem', '', '2024-08-07 14:22:46.753331', '2024-08-07 14:38:24.721479', NULL, '', '2024-08-07 14:38:24.717323', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1219, 'mZPr7Ks8leYofNj5p6wW', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1222, 'm2oNnm6X4bOfwR1l8eCJ', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1223, 'MFNaN6Mnq981ThXrLZ5q', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1225, 'vuHnz6RsFzc5tMp3HTSM', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1228, 'Ea1o6M3JxdTNLtGdAkau', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1229, '7yXug07L4lBaWMP63VU1', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1230, 'WBzGYOtGBCYE5b0kUNiO', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1233, '6XJcyUHUSJPfo9lSRZHH', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1234, '15HJoymoSK7k21MD1Mh5', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1235, 'FOqGq1G1Gp61PmvYsjaD', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1236, 'kHPLslFIWqkraMXfIr8y', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1237, 'n0UfeWPrYQhZEuREgC1N', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1238, 'uBoK03fX9iH66OTAHRcB', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1239, 'U85fhplnAR3HkI1POmcI', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1240, 'sxhzf8AyQipnlaFVGrBH', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1241, 'SPwK6JCdcG51EGlcUjb2', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1242, '4kCmtIir3wKAQTUsP03S', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1243, 'HRv2TV7TZ7YifiFzwyJe', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1244, 'fOtQWaHek1KTIQ3m95k2', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1245, 'jlqOtZeUW14ezyyJ0vyJ', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1246, 'ZjN8c0rbsRGGyNUZqpXc', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1247, 'nYwRoeaBgksjkPbku6RM', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1248, 'i7pkZYtH6GI6ePHmFRJS', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1249, 'Q2YJc5tEsY1lV9FlSvtJ', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1250, '0JKG3uPsHUDnXPmIGtrg', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1251, 'wsPmRIGD9nDwRXw7SHj1', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1252, 'oVwO1duyIhSBEo3jlYp5', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1253, 'ymglwowoPHFGUy9QKLDu', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1254, 'Ndu11pHtqRqfZDrADLVe', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1255, 'xI7rS8oufmAmu8sARwsB', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1256, 'aPaIslpq8tIeIo0hQGrD', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1257, 'gXWTkAe2PZ1O7Jq383Xt', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1258, 'fYoU2s2j3Usjgi6SV9Iv', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1259, 'MMCLXxWhqKhyoqmfNL8u', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1260, 'YBKSlLe5TkEfVfzdEBFy', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1261, 'JFhs9QEKahV6uBbegtH5', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1262, 'smV1SpbfcqYT89De3mUK', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1263, 'uTgkbl6eZR9QebKMtimv', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1264, 'YqKzzNFaJqiTRZJNG5Np', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1265, 'R5gZ34xqNAe62S79hd9B', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1266, 'YqXfUK4eryMIMLVisgrB', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1267, 'mitTC57ILK6g13SNme8E', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1268, 'gLEKrlIkHptx2B8XgAAA', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1269, '6xn8idYSr8euOZ321m17', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1270, 'RF3Pa0pk4NgIdxmjLS3Z', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1271, 'oPzoi0Y8JTZWMpCBOz5U', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1272, 'toLbA3bpaLDP1U7kaRRr', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1273, '0I9frhDwv1Mk0G058KCC', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1274, 'rjbpaeft968rE0ww44t1', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1275, '97zLlLNoVAKzpT0Ehc3M', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1276, '99GAT9wVRZsTQ2NamZpO', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1277, 'YvTi9fxtlj1CGD01mUF5', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1278, '4KT1cHbDf6PIlWd2y7aa', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1279, 'zLtJOKDb7gL9ueXQ9Zdy', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1280, 'TGtX0KlMN9mzjfKeHJaV', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1221, 'hZ12QwxDIoJDHcKb7Wlb', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-08-08 15:10:54.546529', NULL, '', '2024-08-08 15:10:54.542413', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1213, 'B5OYYL4npr3koyy7YvJ5', 'redeem', '', '2024-08-07 14:22:46.753331', '2024-08-08 15:12:53.263851', NULL, '', '2024-08-08 15:12:53.262771', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1215, 'xCx0dz9agzHXuksJFRCh', 'redeem', '', '2024-08-07 14:22:46.753331', '2024-08-08 15:16:47.638759', NULL, '', '2024-08-08 15:16:47.637356', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1220, 'd0rA8CR7lUw5LYrHFcXB', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-08-08 15:57:40.985458', NULL, '', '2024-08-08 15:57:40.981252', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1226, 'LwZaSs2mXDDl2MBDGE37', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-08-08 15:58:57.20762', NULL, '', '2024-08-08 15:58:57.207179', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1231, 'Djkfome2KZNAnZx50NbA', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-08-08 16:04:37.954854', NULL, '', '2024-08-08 16:04:37.952855', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1224, 'FLDzRbjxKDws3x9Rh9rq', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-08-09 11:35:30.118911', NULL, '', '2024-08-09 11:35:30.114914', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1227, '2Tx464gzvEQ3GwgYPP9m', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-08-09 11:41:37.13795', NULL, '', '2024-08-09 11:41:37.134205', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1232, 'z2yT7EnbQnJVyHhINbPY', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-08-09 11:43:18.405152', NULL, '', '2024-08-09 11:43:18.403225', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1216, 'YZPIUrq3POKihQ1AnS0I', 'redeem', '', '2024-08-07 14:22:46.753331', '2024-11-12 15:32:12.401997', NULL, '', '2024-11-12 15:32:12.400456', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1281, '5XD7MUoHa1EwHgIvyQcM', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1282, '8smUl0mQ59U0xpK2kpW9', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1283, '7aB5yFut61xhkboJvOQP', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1284, '585dQgF7gHash8qNCQ9e', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1285, 'qV2MOg9rH5jHh5uI6SyB', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1286, '1I5lovXit8SDgQ9oTSEP', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1287, 'XgzNpmth5rkwdHFNPGXb', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1288, 'TkTbJ1201qwdzcRSyZVo', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1289, 'cGdUBoRlXyRZGpu5Dp6d', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1290, 'azEL7XHWtMexcUln8BS2', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1291, 'PAvo47KE6iQYiNrkwjjV', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1293, 'iQ99gyeIHv3P1MY5y7Ke', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1294, 'GgScS2rvzPOEh4ahPh0C', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1295, 'KNEYDMdOZgfxI5NxtmLw', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1296, 'VzzkKOwzRzvRyHmG2qJX', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1297, 'RRRnYSWPTqV6ot73q98C', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1298, 'vCVn8I2bKBSE9yqWAFFr', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1299, 'kdPXDrZiortSKXIWmaAn', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1300, 'KWodoAuoBxwf8mxYXPxh', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1301, 'D5i92bqEJnckgXHNkL7p', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1302, 'XX97Xfdo8Dfxs6h7VrKn', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1303, 'kUnCUo4gjl8jbVA2ODBI', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1304, 'aSuuGOGxaNPrhgneoYnp', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1305, 'wd7vfSLGxCuFRSxUtjei', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1306, 'nc97kcpTCZVTUrHBNXDg', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1307, 'i6r7qSK8qBmo8I9bV7Wy', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1308, 'yBV0FWlurNmG2ciuDAFX', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1309, 'fjeK91gX1q8FVdzQl8uP', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1310, 'BwB5XrTYqRjL4J6Hzm4L', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1311, 'gF0YcRN92ewvFZ7kAoud', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1312, 'SdSNNYdgyN3r4kJSFZtV', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1315, 'CitIZmigSXdNIuKzwNoN', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1316, 'PzPiwvvwxoLSbmchWkIm', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1317, 'TkyS0w9rs5EFCGiwuTHN', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1318, 'V59Uvm5X5wfMAiQBXqRQ', 'not-redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 15:56:50.214306', NULL, '', '0001-01-01 00:00:00', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1314, 'Vi4Nge9daXYe2fEJ0w8u', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 16:01:50.348267', NULL, '', '2024-08-07 16:01:50.34475', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1313, 'LGg6adnOAYcZE1665SX9', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-08-07 17:05:01.441544', NULL, '', '2024-08-07 17:05:01.439101', 27, '');
INSERT INTO "public"."vouchers" ("id", "code", "status", "redeem_by", "created_at", "updated_at", "deleted_at", "devices_id", "redeem_at", "users_id", "avatar") VALUES (1292, 'mtm9dalE73lPSHzvTmr4', 'redeem', '', '2024-08-07 15:56:50.214306', '2024-11-12 15:34:00.368025', NULL, '', '2024-11-12 15:34:00.366196', 27, '');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."devices_id_seq"
OWNED BY "public"."devices"."id";
SELECT setval('"public"."devices_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tokens_id_seq"
OWNED BY "public"."tokens"."id";
SELECT setval('"public"."tokens_id_seq"', 176, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 28, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."vouchers_id_seq"
OWNED BY "public"."vouchers"."id";
SELECT setval('"public"."vouchers_id_seq"', 1318, true);

-- ----------------------------
-- Primary Key structure for table devices
-- ----------------------------
ALTER TABLE "public"."devices" ADD CONSTRAINT "devices_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table tokens
-- ----------------------------
ALTER TABLE "public"."tokens" ADD CONSTRAINT "unique_refresh_token" UNIQUE ("refresh_token");
ALTER TABLE "public"."tokens" ADD CONSTRAINT "unique_token_id" UNIQUE ("token");

-- ----------------------------
-- Primary Key structure for table tokens
-- ----------------------------
ALTER TABLE "public"."tokens" ADD CONSTRAINT "tokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
