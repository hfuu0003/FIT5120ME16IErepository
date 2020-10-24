<!-- Http post method -->
<form method="post">
    <!-- One input box with datalist  -->
    <label><?php _e('Check the item here: '); ?></label>
    <input type="text" name="codename" list="items"/>
    <datalist id="items" style="display: none; table-layout: fixed; word-break: break-all;">
        <?php
        /**
         * Options in datalist
         *
         * The post method use this script during creating of datalist.
         * The script use WordPress global class wpdb to connect to the database which is used by WordPress
         * and use SQL to do the query operation in the database
         *
         * @package WordPress
         */
        global $wpdb;
        $query = "SELECT * FROM wp_item_information";  //table name here
        $results = $wpdb->get_results($query);
        foreach ($results as $row) { //use a loop to display all results get from the query.
            echo '<option value="'.$row->name.'">' .$row->name. '</option>'; //replace name with colunmn name
        }
        ?>
    </datalist>
    <button type="submit" name="submit" class="submit button"><?php _e('Check now'); ?></button><br>
</form>


<?php
/**
 * Check weather the input in post method match the records in wp_item_information table
 * and display the information according to the result
 *
 * Get one variable from post method which is codename used in the query
 *
 * The script use WordPress global class wpdb to connect to the database which is used by WordPress
 * and use SQL to do the query operation in the database
 *
 * @trigger Http post method
 * @package WordPress
 */
if (isset($_POST['submit'])) {

    $code_qr = $_POST["codename"];
    global $wpdb;
    $query = "SELECT * FROM wp_item_information WHERE name  ='".$code_qr."'";
    $results = $wpdb->get_results($query);
    foreach ($results as $row) { //use a loop to display all results get from the query.
        $exist = $row-> name ;
    }
    if ($exist ) {
        echo '<p><img src="https://www.myhealthypets.tk/wp-content/uploads/2020/09/jingtanhao.jpg" width="80" height="80" /><code>'.$code_qr. '</code> will do harm to your dog!!!!</p>';
    }else{
        echo '<p><img src="https://www.myhealthypets.tk/wp-content/uploads/2020/09/duigou.jpg" width="80" height="80" /><code>'.$code_qr. '</code> is safe to your dog.</p>';
    }
}
?>
