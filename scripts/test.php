<?php
/**
 * Test the wpdb class can working or not
 *
 * The script use WordPress global class wpdb to connect to the database which is used by WordPress
 * and use SQL to do the query operation in the database
 *
 * @package WordPress
 */
if (isset($_POST['submit'])) {

    $code_qr = $_POST["codename"];
    global $wpdb;
    $query = "SELECT name FROM wp_item_information WHERE name  ='".$code_qr."'";
    $results = $wpdb->get_results($query);
    foreach ($results as $row) {
        echo $row-> name ;
    }
    echo  $code_qr;
}
?>

