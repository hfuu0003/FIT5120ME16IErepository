<form method="post">
    <div style="text-align: center;vertical-align: middle;"><br>
        <label><?php _e('Select an area here: '); ?></label>
        <input type="text" name="area" list="areas"/>
        <datalist id="areas" style="display: none; max-height:150px; overflow:auto;">
            <?php
            global $wpdb;
            $query = "SELECT * FROM wp_map_html_links ";  //table name here
            $results = $wpdb->get_results($query);
            foreach ($results as $row) {
                echo '<option value="'.$row->Suburb_Name.'">' .$row->Suburb_Name. '</option>'; //replace name with colunmn name
            }
            ?>
        </datalist>
        <button type="submit" name="submit" class="submit button"><?php _e('Check now'); ?></button><br>
    </div>
</form>


<?php
if (isset($_POST['submit'])) {

    $area = $_POST["area"];
    global $wpdb;
    $query = "SELECT * FROM wp_map_html_links WHERE Suburb_Name='".$area."' ORDER BY Suburb_Name ASC";  //table name here; replace name with colunmn name
    $results = $wpdb->get_results($query);
    foreach ($results as $row) {
        $exist = $row->Suburb_Name;
        $link = $row->Link;
        $count = $row->Count;
    }
    if ($exist){
        echo' <br><h2> ' .$area. ' contains <font color="red">'.$count.' toxic plants</font> to dogs !!</h2><br>';
        echo '<div class="holds-the-iframe">

                    <iframe style="width: 100%; height: 500px;" defer src="'.$link.'" allowfullscreen="alloallowfullscreen"></iframe>

               </div>"';

    }
    else{
        echo'<p><img src="https://www.myhealthypets.tk/wp-content/uploads/2020/09/jingtanhao.jpg" width="80" height="80" /><code>'.$area. '</code> is not in Victoria or it don\'t contain any toxic plants to dog! <br> Please select one from the select box! </p>';
    }

}
?>
