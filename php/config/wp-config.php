<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wp_wordpress');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', '172.19.0.1');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'UbGYt2P/|` j-]7R/*02s{ N;gw&~JqO9|-v2c`pdIjd0eUkAA5*Z)X{^_JP@rao');
define('SECURE_AUTH_KEY',  'G|v/[$DXl+xV`g$&fu)f|I[V][Z-,-9bI)T78Ol:gJ_7+l9Rc,;? mjK2&e)nigr');
define('LOGGED_IN_KEY',    '{TO>04.3i}Bt*DvlR0S)gyJ[A6/J|jA|P5!sR#k3!$+~$}TY=mf0|HxI!iiU-i7I');
define('NONCE_KEY',        '-E,uhQiwt%@#)KMq4rvRM^s$y%,eU8<UJ+2Z(Mh|t}|#Vh|eeeQ]W.2unvBfX1|W');
define('AUTH_SALT',        'w!HE5q^mZEaZl2r-(h3BKIaMW1]8n6<j(bo+7`.T$|.GYdy#l{2%4WD6g-L}syI~');
define('SECURE_AUTH_SALT', 'Zf=(<m+jC#o:n0{Mx}hjOdR=s]!-whqo@lpN2KSwQpt)r.1JDK4rRb%<UQ!9K/N)');
define('LOGGED_IN_SALT',   '6-.mk:pM&rmyF^YwS?+|O.%~4?p?~bZq31y,Tg-p/`Si^Nd+2b9x]lP:~i[P]2N0');
define('NONCE_SALT',       'DDi)s_Px_Y%b 2 >Nkl};d|r{(~mtID7IPNkTPL~1NxcITq3`s)IE||.mftV|!. ');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Dynamic URL setting (match any url/domain) */
$currenthost = $_SERVER['REQUEST_SCHEME']."://".$_SERVER['HTTP_HOST'];
$currentpath = preg_replace('@/+$@','',dirname($_SERVER['SCRIPT_NAME']));
$currentpath = preg_replace('/\/wp.+/','',$currentpath);
define('WP_HOME',$currenthost.$currentpath);
define('WP_SITEURL',$currenthost.$currentpath);
define('WP_CONTENT_URL', $currenthost.$currentpath.'/wp-content');
define('WP_PLUGIN_URL', $currenthost.$currentpath.'/wp-content/plugins');
define('DOMAIN_CURRENT_SITE', $currenthost.$currentpath );
@define('ADMIN_COOKIE_PATH', './');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

/* install plugin without SFTP/FTP username/password */
define('FS_METHOD', 'direct');
define('FS_CHMOD_DIR', 0775);
define('FS_CHMOD_FILE', 0664);
