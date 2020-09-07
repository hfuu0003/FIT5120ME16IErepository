<form method="post">
<label><?php _e('Check the item here: '); ?></label>
<input type="text" name="codename" />
<button type="submit" name="submit" class="submit button"><?php _e('Check now'); ?></button><br> 
</form>


<?php
if (isset($_POST['submit'])) {

    $code_qr = $_POST["codename"];
    global $wpdb;
    $query = "SELECT * FROM wp_item_information WHERE name  ='".$code_qr."'";
    $results = $wpdb->get_results($query);
    echo  $code_qr;
    foreach ($results as $row) {
        echo $row-> effects ;
    }
    
}
?>
