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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('WP_CACHE', true);
define( 'WPCACHEHOME', '/var/www/html/wp-content/plugins/wp-super-cache/' );
define( 'DB_NAME', 'phpmyadmin' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'greenbeings' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '9](!z:Y2$ new#D81Es5JX$<qfJDw/p#$q0,$!=iK`RGkr_~ku?:mTcVzYg4e~s{' );
define( 'SECURE_AUTH_KEY',  'v]FJ}F71uGl,,X}a@l?Af=?X()yY#w-fqAfgPF&K_#jQJ`rloV4/PaFNVq[ors^P' );
define( 'LOGGED_IN_KEY',    '2l4*qd.5SYEw=]o#fW0yZdnK>ht&R3U=mrAlvzn5iKkmQC9aQVuKX>&QUCeGB+W.' );
define( 'NONCE_KEY',        '?%Mxk(nik/82*=[/BEJxdY3)Cs{G{;U9<f[R*U5nqKJd2lB}(XzG]}Iv]7|WLP/#' );
define( 'AUTH_SALT',        'WzL++)I!hlcFB*V`R]IbXYqO6.UB@}A(|.iWW&=<ZYSRPN=h%qQz(iHr~4`znCAt' );
define( 'SECURE_AUTH_SALT', '-%T.Qn%;^AML`WqV<r|Nv5Mhy9*F,o1`af&`tfux~|a>Uvm:9J(j8DA0|]!0:l)j' );
define( 'LOGGED_IN_SALT',   ',0HEc:Z{V(@A$X.|T._Q)Q>.8gsyIvYb-:l/2;zie&:[R(ci}%nUj,3N&X{%#DmF' );
define( 'NONCE_SALT',       ']vkd~8~l&[GRIhV;Q%#Eju}GX8`o5.kz>U =KD=;Z~P_/^icUoK8Vyj9uS:29b#Y' );

/**#@-*/
/**
 * WordPress Language Setting
 */
define('WPLANG','zh_CN');
/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
if(is_admin()) { 

    add_filter('filesystem_method',create_function('$a','return "direct";')); 

    define('FS_CHMOD_DIR', 0751);

  }
