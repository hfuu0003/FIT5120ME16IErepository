<!-- Http post method -->
<form method="post">
    <!-- One input box with datalist  -->
    <div style="text-align: center;vertical-align: middle;"><br>
        <label><?php _e('Select an area here: '); ?></label>
        <input type="text" required="required" name="area" list="areas"/>
        <datalist id="areas" style="display: none; max-height:150px; overflow:auto;">
            <?php
            /**
             * Create options in datalist
             *
             * The post method use this script during creating of datalist.
             * The script use WordPress global class wpdb to connect to the database which is used by WordPress
             * and use SQL to do the query operation in the database
             *
             * @package WordPress
             */
            global $wpdb;
            $query = "SELECT * FROM wp_map_html_links ";  //table name here
            $results = $wpdb->get_results($query);
            foreach ($results as $row) { //use a loop to display all results get from the query.
                echo '<option value="'.$row->Suburb_Name.'">' .$row->Suburb_Name. '</option>'; //replace name with colunmn name
            }
            ?>
        </datalist>
        <button type="submit" name="submit" class="submit button"><?php _e('Check now'); ?></button><br><br>
    </div>
</form>


<?php
/**
 * Check weather the input in post method match the records in wp_map_html_links table
 * and get Suburb_Name, Link and Count from the Query result
 * Suburb_name used to check the weather the input in post method match the records in wp_map_html_links table
 * Link used in html sentence to display the map allocated to the link
 * Count used to display the count in the suburb.
 *
 * Get one variable from post method which is area used in the query
 *
 * The script use WordPress global class wpdb to connect to the database which is used by WordPress
 * and use SQL to do the query operation in the database
 *
 * @trigger Http post method
 * @package WordPress
 */
if (isset($_POST['submit'])) {

    $area = $_POST["area"];
    global $wpdb;
    $query = "SELECT * FROM wp_map_html_links WHERE Suburb_Name='".$area."' ORDER BY Suburb_Name ASC";  //table name here; replace name with colunmn name
    $results = $wpdb->get_results($query);
    foreach ($results as $row) { //use a loop to display all results get from the query.
        $exist = $row->Suburb_Name;
        $link = $row->Link;
        $count = $row->Count;
    }
    if ($exist){
        echo '<div style="text-align: center;vertical-align: middle; background-color: #ff9900; font-size: 28px;">' .$area. ' contains '.$count.' toxic plants to dogs !!</div>';
        echo '<div class="holds-the-iframe">

                    <iframe style="width: 100%; height: 500px;" defer src="'.$link.'" allowfullscreen="alloallowfullscreen"></iframe>

               </div>';

    }
    else{
        echo'<p align="center"><img src="https://www.myhealthypets.tk/wp-content/uploads/2020/09/jingtanhao.jpg" width="80" height="80" /><code>'.$area. '</code> is not in Victoria or it don\'t contain any toxic plants to dog! <br> Please select one from the select box! </p>';
    }

}
?>
