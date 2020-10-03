<?php
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

