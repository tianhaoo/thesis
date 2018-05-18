/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : thesis

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-05-18 10:55:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('2', null, '1', 'Category 2', 'category-2', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `categories` VALUES ('3', null, '1', 'hgjhgj', 'hgjhgj', '2018-05-16 06:46:28', '2018-05-16 06:46:28');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('22', '2', '2', 'fasdfasdf', '2018-05-16 06:04:05', '2018-05-16 06:04:05');
INSERT INTO `comments` VALUES ('25', '3', '2', '阿斯顿发射点', '2018-05-16 07:29:10', '2018-05-16 07:29:10');

-- ----------------------------
-- Table structure for `data_rows`
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
INSERT INTO `data_rows` VALUES ('1', '1', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `data_rows` VALUES ('2', '1', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '2');
INSERT INTO `data_rows` VALUES ('3', '1', 'email', 'text', 'Email', '1', '1', '1', '1', '1', '1', '', '3');
INSERT INTO `data_rows` VALUES ('4', '1', 'password', 'password', 'Password', '1', '0', '0', '1', '1', '0', '', '4');
INSERT INTO `data_rows` VALUES ('5', '1', 'remember_token', 'text', 'Remember Token', '0', '0', '0', '0', '0', '0', '', '5');
INSERT INTO `data_rows` VALUES ('6', '1', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '0', '0', '0', '', '6');
INSERT INTO `data_rows` VALUES ('7', '1', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '', '7');
INSERT INTO `data_rows` VALUES ('8', '1', 'avatar', 'image', 'Avatar', '0', '1', '1', '1', '1', '1', '', '8');
INSERT INTO `data_rows` VALUES ('9', '1', 'user_belongsto_role_relationship', 'relationship', 'Role', '0', '1', '1', '1', '1', '0', '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', '10');
INSERT INTO `data_rows` VALUES ('10', '1', 'user_belongstomany_role_relationship', 'relationship', 'Roles', '0', '1', '1', '1', '1', '0', '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', '11');
INSERT INTO `data_rows` VALUES ('11', '1', 'locale', 'text', 'Locale', '0', '1', '1', '1', '1', '0', '', '12');
INSERT INTO `data_rows` VALUES ('12', '1', 'settings', 'hidden', 'Settings', '0', '0', '0', '0', '0', '0', '', '12');
INSERT INTO `data_rows` VALUES ('13', '2', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `data_rows` VALUES ('14', '2', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '2');
INSERT INTO `data_rows` VALUES ('15', '2', 'created_at', 'timestamp', 'Created At', '0', '0', '0', '0', '0', '0', '', '3');
INSERT INTO `data_rows` VALUES ('16', '2', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '', '4');
INSERT INTO `data_rows` VALUES ('17', '3', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `data_rows` VALUES ('18', '3', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '2');
INSERT INTO `data_rows` VALUES ('19', '3', 'created_at', 'timestamp', 'Created At', '0', '0', '0', '0', '0', '0', '', '3');
INSERT INTO `data_rows` VALUES ('20', '3', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '', '4');
INSERT INTO `data_rows` VALUES ('21', '3', 'display_name', 'text', 'Display Name', '1', '1', '1', '1', '1', '1', '', '5');
INSERT INTO `data_rows` VALUES ('22', '1', 'role_id', 'text', 'Role', '1', '1', '1', '1', '1', '1', '', '9');
INSERT INTO `data_rows` VALUES ('23', '4', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `data_rows` VALUES ('24', '4', 'parent_id', 'select_dropdown', 'Parent', '0', '0', '1', '1', '1', '1', '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', '2');
INSERT INTO `data_rows` VALUES ('25', '4', 'order', 'text', 'Order', '1', '1', '1', '1', '1', '1', '{\"default\":1}', '3');
INSERT INTO `data_rows` VALUES ('26', '4', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '4');
INSERT INTO `data_rows` VALUES ('27', '4', 'slug', 'text', 'Slug', '1', '1', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"name\"}}', '5');
INSERT INTO `data_rows` VALUES ('28', '4', 'created_at', 'timestamp', 'Created At', '0', '0', '1', '0', '0', '0', '', '6');
INSERT INTO `data_rows` VALUES ('29', '4', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '', '7');
INSERT INTO `data_rows` VALUES ('30', '5', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('31', '5', 'author_id', 'text', 'Author', '1', '0', '1', '1', '0', '1', null, '2');
INSERT INTO `data_rows` VALUES ('32', '5', 'category_id', 'text', 'Category', '0', '0', '1', '1', '1', '0', null, '3');
INSERT INTO `data_rows` VALUES ('33', '5', 'title', 'text', 'Title', '1', '1', '1', '1', '1', '1', '{\r\n    \"validation\": {\r\n        \"rule\": \"required\"\r\n    }\r\n}', '4');
INSERT INTO `data_rows` VALUES ('34', '5', 'excerpt', 'text_area', 'Excerpt', '0', '0', '1', '1', '1', '1', null, '5');
INSERT INTO `data_rows` VALUES ('35', '5', 'body', 'rich_text_box', 'Body', '1', '0', '1', '1', '1', '1', '{\r\n    \"validation\": {\r\n        \"rule\": \"required\"\r\n    }\r\n}', '6');
INSERT INTO `data_rows` VALUES ('36', '5', 'image', 'image', 'Post Image', '0', '1', '1', '1', '1', '1', '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', '7');
INSERT INTO `data_rows` VALUES ('37', '5', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{\r\n    \"validation\": {\r\n        \"rule\": \"required|unique:posts,slug\"\r\n    }\r\n}', '8');
INSERT INTO `data_rows` VALUES ('38', '5', 'meta_description', 'text_area', 'Meta Description', '0', '0', '1', '1', '1', '1', null, '9');
INSERT INTO `data_rows` VALUES ('39', '5', 'meta_keywords', 'text_area', 'Meta Keywords', '0', '0', '1', '1', '1', '1', null, '10');
INSERT INTO `data_rows` VALUES ('40', '5', 'status', 'select_dropdown', 'Status', '1', '1', '1', '1', '1', '1', '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', '11');
INSERT INTO `data_rows` VALUES ('41', '5', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '0', '0', '0', null, '12');
INSERT INTO `data_rows` VALUES ('42', '5', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '13');
INSERT INTO `data_rows` VALUES ('43', '5', 'seo_title', 'text', 'SEO Title', '0', '1', '1', '1', '1', '1', null, '14');
INSERT INTO `data_rows` VALUES ('44', '5', 'featured', 'checkbox', 'Featured', '1', '1', '1', '1', '1', '1', null, '15');
INSERT INTO `data_rows` VALUES ('45', '6', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `data_rows` VALUES ('46', '6', 'author_id', 'text', 'Author', '1', '0', '0', '0', '0', '0', '', '2');
INSERT INTO `data_rows` VALUES ('47', '6', 'title', 'text', 'Title', '1', '1', '1', '1', '1', '1', '', '3');
INSERT INTO `data_rows` VALUES ('48', '6', 'excerpt', 'text_area', 'Excerpt', '1', '0', '1', '1', '1', '1', '', '4');
INSERT INTO `data_rows` VALUES ('49', '6', 'body', 'rich_text_box', 'Body', '1', '0', '1', '1', '1', '1', '', '5');
INSERT INTO `data_rows` VALUES ('50', '6', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', '6');
INSERT INTO `data_rows` VALUES ('51', '6', 'meta_description', 'text', 'Meta Description', '1', '0', '1', '1', '1', '1', '', '7');
INSERT INTO `data_rows` VALUES ('52', '6', 'meta_keywords', 'text', 'Meta Keywords', '1', '0', '1', '1', '1', '1', '', '8');
INSERT INTO `data_rows` VALUES ('53', '6', 'status', 'select_dropdown', 'Status', '1', '1', '1', '1', '1', '1', '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', '9');
INSERT INTO `data_rows` VALUES ('54', '6', 'created_at', 'timestamp', 'Created At', '1', '1', '1', '0', '0', '0', '', '10');
INSERT INTO `data_rows` VALUES ('55', '6', 'updated_at', 'timestamp', 'Updated At', '1', '0', '0', '0', '0', '0', '', '11');
INSERT INTO `data_rows` VALUES ('56', '6', 'image', 'image', 'Page Image', '0', '1', '1', '1', '1', '1', '', '12');
INSERT INTO `data_rows` VALUES ('57', '7', 'id', 'text', 'Id', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('58', '7', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', null, '2');
INSERT INTO `data_rows` VALUES ('59', '7', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '0', '0', '0', null, '3');
INSERT INTO `data_rows` VALUES ('60', '7', 'updtaed_at', 'timestamp', 'Updtaed At', '0', '1', '1', '0', '0', '0', null, '4');
INSERT INTO `data_rows` VALUES ('61', '5', 'post_belongstomany_tag_relationship', 'relationship', 'tags', '0', '1', '1', '1', '1', '1', '{\"model\":\"App\\\\Tag\",\"table\":\"tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"post_tags\",\"pivot\":\"1\",\"taggable\":\"0\"}', '16');
INSERT INTO `data_rows` VALUES ('68', '5', 'annex', 'file', 'Annex', '0', '1', '1', '1', '1', '1', null, '16');

-- ----------------------------
-- Table structure for `data_types`
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES ('1', 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', '1', '0', null, '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `data_types` VALUES ('2', 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', null, '', '', '1', '0', null, '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `data_types` VALUES ('3', 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', null, '', '', '1', '0', null, '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `data_types` VALUES ('4', 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', null, '', '', '1', '0', null, '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `data_types` VALUES ('5', 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', null, null, '1', '0', '{\"order_column\":null,\"order_display_column\":null}', '2018-05-08 21:48:55', '2018-05-16 06:52:48');
INSERT INTO `data_types` VALUES ('6', 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', null, '', '', '1', '0', null, '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `data_types` VALUES ('7', 'tags', 'tags', 'Tag', 'Tags', 'voyager-bulb', 'App\\Tag', null, null, null, '1', '0', '{\"order_column\":null,\"order_display_column\":null}', '2018-05-08 21:59:42', '2018-05-08 21:59:42');

-- ----------------------------
-- Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', 'admin', '2018-05-08 21:48:54', '2018-05-08 21:48:54');

-- ----------------------------
-- Table structure for `menu_items`
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES ('1', '1', 'Dashboard', '', '_self', 'voyager-boat', null, null, '1', '2018-05-08 21:48:54', '2018-05-08 21:48:54', 'voyager.dashboard', null);
INSERT INTO `menu_items` VALUES ('2', '1', 'Media', '', '_self', 'voyager-images', null, null, '5', '2018-05-08 21:48:54', '2018-05-08 21:48:54', 'voyager.media.index', null);
INSERT INTO `menu_items` VALUES ('3', '1', 'Users', '', '_self', 'voyager-person', null, null, '3', '2018-05-08 21:48:54', '2018-05-08 21:48:54', 'voyager.users.index', null);
INSERT INTO `menu_items` VALUES ('4', '1', 'Roles', '', '_self', 'voyager-lock', null, null, '2', '2018-05-08 21:48:54', '2018-05-08 21:48:54', 'voyager.roles.index', null);
INSERT INTO `menu_items` VALUES ('5', '1', 'Tools', '', '_self', 'voyager-tools', null, null, '9', '2018-05-08 21:48:54', '2018-05-08 21:48:54', null, null);
INSERT INTO `menu_items` VALUES ('6', '1', 'Menu Builder', '', '_self', 'voyager-list', null, '5', '10', '2018-05-08 21:48:54', '2018-05-08 21:48:54', 'voyager.menus.index', null);
INSERT INTO `menu_items` VALUES ('7', '1', 'Database', '', '_self', 'voyager-data', null, '5', '11', '2018-05-08 21:48:54', '2018-05-08 21:48:54', 'voyager.database.index', null);
INSERT INTO `menu_items` VALUES ('8', '1', 'Compass', '', '_self', 'voyager-compass', null, '5', '12', '2018-05-08 21:48:54', '2018-05-08 21:48:54', 'voyager.compass.index', null);
INSERT INTO `menu_items` VALUES ('9', '1', 'BREAD', '', '_self', 'voyager-bread', null, '5', '13', '2018-05-08 21:48:54', '2018-05-08 21:48:54', 'voyager.bread.index', null);
INSERT INTO `menu_items` VALUES ('10', '1', 'Settings', '', '_self', 'voyager-settings', null, null, '14', '2018-05-08 21:48:54', '2018-05-08 21:48:54', 'voyager.settings.index', null);
INSERT INTO `menu_items` VALUES ('11', '1', 'Categories', '', '_self', 'voyager-categories', null, null, '8', '2018-05-08 21:48:55', '2018-05-08 21:48:55', 'voyager.categories.index', null);
INSERT INTO `menu_items` VALUES ('12', '1', 'Posts', '', '_self', 'voyager-news', null, null, '6', '2018-05-08 21:48:55', '2018-05-08 21:48:55', 'voyager.posts.index', null);
INSERT INTO `menu_items` VALUES ('13', '1', 'Pages', '', '_self', 'voyager-file-text', null, null, '7', '2018-05-08 21:48:55', '2018-05-08 21:48:55', 'voyager.pages.index', null);
INSERT INTO `menu_items` VALUES ('14', '1', 'Hooks', '', '_self', 'voyager-hook', null, '5', '13', '2018-05-08 21:48:55', '2018-05-08 21:48:55', 'voyager.hooks', null);
INSERT INTO `menu_items` VALUES ('15', '1', 'Tags', '', '_self', 'voyager-bulb', null, null, '15', '2018-05-08 21:59:42', '2018-05-08 21:59:42', 'voyager.tags.index', null);

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_01_000000_add_voyager_user_fields', '1');
INSERT INTO `migrations` VALUES ('4', '2016_01_01_000000_create_data_types_table', '1');
INSERT INTO `migrations` VALUES ('5', '2016_01_01_000000_create_pages_table', '1');
INSERT INTO `migrations` VALUES ('6', '2016_01_01_000000_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('7', '2016_02_15_204651_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('8', '2016_05_19_173453_create_menu_table', '1');
INSERT INTO `migrations` VALUES ('9', '2016_10_21_190000_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('10', '2016_10_21_190000_create_settings_table', '1');
INSERT INTO `migrations` VALUES ('11', '2016_11_30_135954_create_permission_table', '1');
INSERT INTO `migrations` VALUES ('12', '2016_11_30_141208_create_permission_role_table', '1');
INSERT INTO `migrations` VALUES ('13', '2016_12_26_201236_data_types__add__server_side', '1');
INSERT INTO `migrations` VALUES ('14', '2017_01_13_000000_add_route_to_menu_items_table', '1');
INSERT INTO `migrations` VALUES ('15', '2017_01_14_005015_create_translations_table', '1');
INSERT INTO `migrations` VALUES ('16', '2017_01_15_000000_make_table_name_nullable_in_permissions_table', '1');
INSERT INTO `migrations` VALUES ('17', '2017_03_06_000000_add_controller_to_data_types_table', '1');
INSERT INTO `migrations` VALUES ('18', '2017_04_11_000000_alter_post_nullable_fields_table', '1');
INSERT INTO `migrations` VALUES ('19', '2017_04_21_000000_add_order_to_data_rows_table', '1');
INSERT INTO `migrations` VALUES ('20', '2017_07_05_210000_add_policyname_to_data_types_table', '1');
INSERT INTO `migrations` VALUES ('21', '2017_08_05_000000_add_group_to_settings_table', '1');
INSERT INTO `migrations` VALUES ('22', '2017_11_26_013050_add_user_role_relationship', '1');
INSERT INTO `migrations` VALUES ('23', '2017_11_26_015000_create_user_roles_table', '1');
INSERT INTO `migrations` VALUES ('24', '2018_03_11_000000_add_user_settings', '1');
INSERT INTO `migrations` VALUES ('25', '2018_03_14_000000_add_details_to_data_types_table', '1');
INSERT INTO `migrations` VALUES ('26', '2018_03_16_000000_make_settings_value_nullable', '1');

-- ----------------------------
-- Table structure for `pages`
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', '0', 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2018-05-08 21:48:55', '2018-05-08 21:48:55');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'browse_admin', null, '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('2', 'browse_bread', null, '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('3', 'browse_database', null, '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('4', 'browse_media', null, '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('5', 'browse_compass', null, '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('6', 'browse_menus', 'menus', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('7', 'read_menus', 'menus', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('8', 'edit_menus', 'menus', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('9', 'add_menus', 'menus', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('10', 'delete_menus', 'menus', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('11', 'browse_roles', 'roles', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('12', 'read_roles', 'roles', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('13', 'edit_roles', 'roles', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('14', 'add_roles', 'roles', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('15', 'delete_roles', 'roles', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('16', 'browse_users', 'users', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('17', 'read_users', 'users', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('18', 'edit_users', 'users', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('19', 'add_users', 'users', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('20', 'delete_users', 'users', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('21', 'browse_settings', 'settings', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('22', 'read_settings', 'settings', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('23', 'edit_settings', 'settings', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('24', 'add_settings', 'settings', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('25', 'delete_settings', 'settings', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `permissions` VALUES ('26', 'browse_categories', 'categories', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('27', 'read_categories', 'categories', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('28', 'edit_categories', 'categories', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('29', 'add_categories', 'categories', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('30', 'delete_categories', 'categories', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('31', 'browse_posts', 'posts', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('32', 'read_posts', 'posts', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('33', 'edit_posts', 'posts', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('34', 'add_posts', 'posts', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('35', 'delete_posts', 'posts', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('36', 'browse_pages', 'pages', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('37', 'read_pages', 'pages', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('38', 'edit_pages', 'pages', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('39', 'add_pages', 'pages', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('40', 'delete_pages', 'pages', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('41', 'browse_hooks', null, '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `permissions` VALUES ('42', 'browse_tags', 'tags', '2018-05-08 21:59:42', '2018-05-08 21:59:42');
INSERT INTO `permissions` VALUES ('43', 'read_tags', 'tags', '2018-05-08 21:59:42', '2018-05-08 21:59:42');
INSERT INTO `permissions` VALUES ('44', 'edit_tags', 'tags', '2018-05-08 21:59:42', '2018-05-08 21:59:42');
INSERT INTO `permissions` VALUES ('45', 'add_tags', 'tags', '2018-05-08 21:59:42', '2018-05-08 21:59:42');
INSERT INTO `permissions` VALUES ('46', 'delete_tags', 'tags', '2018-05-08 21:59:42', '2018-05-08 21:59:42');

-- ----------------------------
-- Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1');
INSERT INTO `permission_role` VALUES ('1', '4');
INSERT INTO `permission_role` VALUES ('2', '1');
INSERT INTO `permission_role` VALUES ('3', '1');
INSERT INTO `permission_role` VALUES ('4', '1');
INSERT INTO `permission_role` VALUES ('5', '1');
INSERT INTO `permission_role` VALUES ('6', '1');
INSERT INTO `permission_role` VALUES ('7', '1');
INSERT INTO `permission_role` VALUES ('8', '1');
INSERT INTO `permission_role` VALUES ('9', '1');
INSERT INTO `permission_role` VALUES ('10', '1');
INSERT INTO `permission_role` VALUES ('11', '1');
INSERT INTO `permission_role` VALUES ('12', '1');
INSERT INTO `permission_role` VALUES ('13', '1');
INSERT INTO `permission_role` VALUES ('14', '1');
INSERT INTO `permission_role` VALUES ('15', '1');
INSERT INTO `permission_role` VALUES ('16', '1');
INSERT INTO `permission_role` VALUES ('16', '4');
INSERT INTO `permission_role` VALUES ('17', '1');
INSERT INTO `permission_role` VALUES ('17', '4');
INSERT INTO `permission_role` VALUES ('18', '1');
INSERT INTO `permission_role` VALUES ('18', '4');
INSERT INTO `permission_role` VALUES ('19', '1');
INSERT INTO `permission_role` VALUES ('19', '4');
INSERT INTO `permission_role` VALUES ('20', '1');
INSERT INTO `permission_role` VALUES ('20', '4');
INSERT INTO `permission_role` VALUES ('21', '1');
INSERT INTO `permission_role` VALUES ('22', '1');
INSERT INTO `permission_role` VALUES ('23', '1');
INSERT INTO `permission_role` VALUES ('24', '1');
INSERT INTO `permission_role` VALUES ('25', '1');
INSERT INTO `permission_role` VALUES ('26', '1');
INSERT INTO `permission_role` VALUES ('26', '4');
INSERT INTO `permission_role` VALUES ('27', '1');
INSERT INTO `permission_role` VALUES ('27', '4');
INSERT INTO `permission_role` VALUES ('28', '1');
INSERT INTO `permission_role` VALUES ('28', '4');
INSERT INTO `permission_role` VALUES ('29', '1');
INSERT INTO `permission_role` VALUES ('29', '4');
INSERT INTO `permission_role` VALUES ('30', '1');
INSERT INTO `permission_role` VALUES ('30', '4');
INSERT INTO `permission_role` VALUES ('31', '1');
INSERT INTO `permission_role` VALUES ('31', '2');
INSERT INTO `permission_role` VALUES ('31', '4');
INSERT INTO `permission_role` VALUES ('32', '1');
INSERT INTO `permission_role` VALUES ('32', '4');
INSERT INTO `permission_role` VALUES ('33', '1');
INSERT INTO `permission_role` VALUES ('33', '4');
INSERT INTO `permission_role` VALUES ('34', '1');
INSERT INTO `permission_role` VALUES ('34', '4');
INSERT INTO `permission_role` VALUES ('35', '1');
INSERT INTO `permission_role` VALUES ('35', '4');
INSERT INTO `permission_role` VALUES ('36', '1');
INSERT INTO `permission_role` VALUES ('37', '1');
INSERT INTO `permission_role` VALUES ('38', '1');
INSERT INTO `permission_role` VALUES ('39', '1');
INSERT INTO `permission_role` VALUES ('40', '1');
INSERT INTO `permission_role` VALUES ('41', '1');
INSERT INTO `permission_role` VALUES ('42', '1');
INSERT INTO `permission_role` VALUES ('42', '4');
INSERT INTO `permission_role` VALUES ('43', '1');
INSERT INTO `permission_role` VALUES ('43', '4');
INSERT INTO `permission_role` VALUES ('44', '1');
INSERT INTO `permission_role` VALUES ('44', '4');
INSERT INTO `permission_role` VALUES ('45', '1');
INSERT INTO `permission_role` VALUES ('45', '4');
INSERT INTO `permission_role` VALUES ('46', '1');
INSERT INTO `permission_role` VALUES ('46', '4');

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `annex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '1', '1', 'Lorem Ipsum Post', null, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', '20', '2018-05-08 21:48:55', '2018-05-11 04:04:40', null);
INSERT INTO `posts` VALUES ('2', '1', '2', 'My Sample Post', null, 'This is the excerpt for阿斯顿发射点官方啊 the sample Post', '<table style=\"height: 19px; border-color: black;\" width=\"975\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 91px;\">时刻提防感觉</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">2354</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">456</td>\r\n<td style=\"width: 91px;\">675</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 92px;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">啊手动阀</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">a啊手动阀</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">苏大f</td>\r\n<td style=\"width: 91px;\">发</td>\r\n<td style=\"width: 91px;\">&nbsp;撒旦发个</td>\r\n<td style=\"width: 92px;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;啊大哥&nbsp;</td>\r\n<td style=\"width: 92px;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 91px;\">&nbsp;啊打发时光</td>\r\n<td style=\"width: 91px;\">&nbsp;</td>\r\n<td style=\"width: 92px;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', '1', '2018-05-08 21:48:55', '2018-05-18 02:15:03', null);
INSERT INTO `posts` VALUES ('3', '1', '2', 'Latest Post', null, 'This is the excerpt for the latest post', '# asdfasdfThis is the body for the latest post\r\naksdjhfkajshdf\r\n\r\n阿斯达克警方和喀什地方\r\n\r\n阿斯蒂芬哈克斯的\r\n2\r\n333\r\n### 的说法是都会发生的', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', '1', '2018-05-08 21:48:55', '2018-05-16 07:15:04', null);
INSERT INTO `posts` VALUES ('4', '1', '2', 'Yarr Post', null, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '阿斯顿放款快捷回复顶顶顶顶顶顶顶顶顶顶\r\n阿三地方烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦尽快回来和急急急急急急急急急急急急急急急急急急', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', '2', '2018-05-08 21:48:55', '2018-05-17 13:40:41', null);
INSERT INTO `posts` VALUES ('16', '2', '2', 'a\'s\'d\'fa\'s\'d', null, '啊手动阀手动阀', '<p>&nbsp;啊手动阀啊手动阀手动分</p>', null, '嗲山东巨力放假啊送到', null, null, 'PUBLISHED', '0', '2018-05-18 10:42:04', '2018-05-18 10:42:04', null);
INSERT INTO `posts` VALUES ('17', '2', '2', '啊手动阀第三方', null, '阀手动阀手动分', '<p>&nbsp;啊手动阀啊手动阀</p>', null, 'dfghsfg', null, null, 'PUBLISHED', '0', '2018-05-18 10:42:24', '2018-05-18 10:42:24', null);
INSERT INTO `posts` VALUES ('18', '2', '2', 'asdfads', null, 'asdf asdf', '<p>asdf asdf&nbsp;</p>', null, 'asdsdf asd', null, null, 'PUBLISHED', '0', '2018-05-18 10:47:40', '2018-05-18 10:47:40', null);
INSERT INTO `posts` VALUES ('19', '2', '2', 'asdfasdf asd', null, 'asdfasdf asdf', '<p>sad fasdf asdf&nbsp;</p>', null, 'asdfasdfadsfasd', null, null, 'PUBLISHED', '0', '2018-05-18 10:48:00', '2018-05-18 10:48:00', null);
INSERT INTO `posts` VALUES ('20', '2', '2', 'asdfasdfasdf', null, 'asdfasdfasdf', '<p>asdfa sd fasdf</p>', null, 'asdfasdfasdf', null, null, 'PUBLISHED', '0', '2018-05-18 10:48:14', '2018-05-18 10:48:14', null);

-- ----------------------------
-- Table structure for `post_tags`
-- ----------------------------
DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE `post_tags` (
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `post_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post_tags
-- ----------------------------
INSERT INTO `post_tags` VALUES ('3', '1');
INSERT INTO `post_tags` VALUES ('4', '1');
INSERT INTO `post_tags` VALUES ('1', '2');
INSERT INTO `post_tags` VALUES ('2', '2');
INSERT INTO `post_tags` VALUES ('3', '2');
INSERT INTO `post_tags` VALUES ('4', '2');
INSERT INTO `post_tags` VALUES ('2', '3');
INSERT INTO `post_tags` VALUES ('3', '3');
INSERT INTO `post_tags` VALUES ('4', '3');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'Administrator', '2018-05-08 21:48:54', '2018-05-08 21:48:54');
INSERT INTO `roles` VALUES ('2', 'guest', 'Guest', '2018-05-08 21:48:54', '2018-05-16 06:41:53');
INSERT INTO `roles` VALUES ('4', 'user', 'Normal User', '2018-05-16 06:43:49', '2018-05-16 06:43:49');

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'site.title', 'Site Title', 'Site Title', '', 'text', '1', 'Site');
INSERT INTO `settings` VALUES ('2', 'site.description', 'Site Description', 'Site Description', '', 'text', '2', 'Site');
INSERT INTO `settings` VALUES ('3', 'site.logo', 'Site Logo', '', '', 'image', '3', 'Site');
INSERT INTO `settings` VALUES ('4', 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', '4', 'Site');
INSERT INTO `settings` VALUES ('5', 'admin.bg_image', 'Admin Background Image', '', '', 'image', '5', 'Admin');
INSERT INTO `settings` VALUES ('6', 'admin.title', 'Admin Title', 'Voyager', '', 'text', '1', 'Admin');
INSERT INTO `settings` VALUES ('7', 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', '2', 'Admin');
INSERT INTO `settings` VALUES ('8', 'admin.loader', 'Admin Loader', '', '', 'image', '3', 'Admin');
INSERT INTO `settings` VALUES ('9', 'admin.icon_image', 'Admin Icon Image', '', '', 'image', '4', 'Admin');
INSERT INTO `settings` VALUES ('10', 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', '1', 'Admin');

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', 'ubuntu', '2018-05-08 22:06:07', '2018-05-08 22:06:07');
INSERT INTO `tags` VALUES ('2', '大数据', '2018-05-08 22:06:18', '2018-05-08 22:06:18');
INSERT INTO `tags` VALUES ('3', '机器学习', '2018-05-08 22:06:27', '2018-05-08 22:06:27');

-- ----------------------------
-- Table structure for `translations`
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of translations
-- ----------------------------
INSERT INTO `translations` VALUES ('1', 'data_types', 'display_name_singular', '5', 'pt', 'Post', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('2', 'data_types', 'display_name_singular', '6', 'pt', 'Página', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('3', 'data_types', 'display_name_singular', '1', 'pt', 'Utilizador', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('4', 'data_types', 'display_name_singular', '4', 'pt', 'Categoria', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('5', 'data_types', 'display_name_singular', '2', 'pt', 'Menu', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('6', 'data_types', 'display_name_singular', '3', 'pt', 'Função', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('7', 'data_types', 'display_name_plural', '5', 'pt', 'Posts', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('8', 'data_types', 'display_name_plural', '6', 'pt', 'Páginas', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('9', 'data_types', 'display_name_plural', '1', 'pt', 'Utilizadores', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('10', 'data_types', 'display_name_plural', '4', 'pt', 'Categorias', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('11', 'data_types', 'display_name_plural', '2', 'pt', 'Menus', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('12', 'data_types', 'display_name_plural', '3', 'pt', 'Funções', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('13', 'categories', 'slug', '1', 'pt', 'categoria-1', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('14', 'categories', 'name', '1', 'pt', 'Categoria 1', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('15', 'categories', 'slug', '2', 'pt', 'categoria-2', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('16', 'categories', 'name', '2', 'pt', 'Categoria 2', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('17', 'pages', 'title', '1', 'pt', 'Olá Mundo', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('18', 'pages', 'slug', '1', 'pt', 'ola-mundo', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('19', 'pages', 'body', '1', 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('20', 'menu_items', 'title', '1', 'pt', 'Painel de Controle', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('21', 'menu_items', 'title', '2', 'pt', 'Media', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('22', 'menu_items', 'title', '12', 'pt', 'Publicações', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('23', 'menu_items', 'title', '3', 'pt', 'Utilizadores', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('24', 'menu_items', 'title', '11', 'pt', 'Categorias', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('25', 'menu_items', 'title', '13', 'pt', 'Páginas', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('26', 'menu_items', 'title', '4', 'pt', 'Funções', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('27', 'menu_items', 'title', '5', 'pt', 'Ferramentas', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('28', 'menu_items', 'title', '6', 'pt', 'Menus', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('29', 'menu_items', 'title', '7', 'pt', 'Base de dados', '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `translations` VALUES ('30', 'menu_items', 'title', '10', 'pt', 'Configurações', '2018-05-08 21:48:55', '2018-05-08 21:48:55');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$TEOHv6E6Y6o5BiF38Ln94uu1UJ2XAWdJY1d54e3roTurFxACh5lGi', 'woXhvHdYsH3j81BrdEw2DkArUtGEqfSChKbiffL8Bk7R932DgPn6PzC3m7VL', null, '2018-05-08 21:48:55', '2018-05-08 21:48:55');
INSERT INTO `users` VALUES ('2', '1', 'Tianhaoo', '360726539@qq.com', 'users/default.png', '$2y$10$CpNFmqvwY7g12UcDb009gOe7W648LB0By5mhbQknHFxfFyEczZ55.', 'JzA4lJKrtaPsiK6sZuYMDCVJfeKS1KvtFRmroDWRw2OG7Py5ygHKL1muU2Li', '{\"locale\":\"en\"}', '2018-05-08 21:55:18', '2018-05-08 21:55:18');
INSERT INTO `users` VALUES ('3', '4', 'xiaoliu', '123@456.com', 'users/default.png', '$2y$10$cFFudJGlLMncvp.9VOjoIOiOqVvmfkdyvi97yoejYJC6BnpNKjsAC', 'TrKP5VUuoU1czJnp2oacSyx6VGmfrVGzxw2t5ORlS4mtH0LhLd3gedOKqLCU', '{\"locale\":\"en\"}', '2018-05-16 06:11:01', '2018-05-16 06:44:16');
INSERT INTO `users` VALUES ('4', '2', 'xiaowang', '123425678@qq.com', 'users/default.png', '$2y$10$T/WTaIIj82R138xDAAHYzOvXaRckGkFjHaeFy0CA3mo88UZ0ANrwS', 'D6uYrCljGFwQaQTnO0YnkjWc8hNT7B0klHbcwOqomHpuQYA5ZbVjFauwk9Tu', null, '2018-05-16 06:39:50', '2018-05-16 06:39:50');

-- ----------------------------
-- Table structure for `user_post_thumbs`
-- ----------------------------
DROP TABLE IF EXISTS `user_post_thumbs`;
CREATE TABLE `user_post_thumbs` (
  `user_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `user_post_thumbs_post_id_foreign` (`post_id`),
  CONSTRAINT `user_post_thumbs_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_post_thumbs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_post_thumbs
-- ----------------------------
INSERT INTO `user_post_thumbs` VALUES ('2', '1', '2018-05-11 04:04:40', '2018-05-11 04:04:40');
INSERT INTO `user_post_thumbs` VALUES ('2', '2', '2018-05-11 04:04:47', '2018-05-11 04:04:47');
INSERT INTO `user_post_thumbs` VALUES ('2', '3', '2018-05-11 04:04:59', '2018-05-11 04:04:59');
INSERT INTO `user_post_thumbs` VALUES ('2', '4', '2018-05-17 13:40:41', '2018-05-17 13:40:41');

-- ----------------------------
-- Table structure for `user_roles`
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('2', '1');
