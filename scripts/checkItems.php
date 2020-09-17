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
    foreach ($results as $row) {
        $exist = $row-> name ;
    }
    if ($exist ) {
        echo '<p><img src="https://www.myhealthypets.tk/wp-content/uploads/2020/09/jingtanhao.jpg" width="80" height="80" /><code>'.$code_qr. '</code> will do harm to your dog!!!!</p>';
    }else{
        echo '<p><img src="https://www.myhealthypets.tk/wp-content/uploads/2020/09/duigou.jpg" width="80" height="80" /><code>'.$code_qr. '</code> is safe to your dog.</p>';
    }
}
?>
