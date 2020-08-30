<?php
global $wpdb;
$posts = $wpdb->get_results("SELECT * FROM $wpdb->wp_item_information")
?>

<?php echo "$post" ?>


