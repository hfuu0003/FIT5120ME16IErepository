<?php

global $wpdb;
$result = $wpdb->get_results( "SELECT name FROM wp_item_information");

foreach ($result as $row) {
	echo $row-> name ;
}

?>