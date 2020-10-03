<form method="post">
    <div style="text-align: center;vertical-align: middle;">
        <label><?php _e('Select an area here: '); ?></label>
        <input type="text" name="area" list="areas"/>
        <datalist id="areas" style="display: none;">
            <?php
            global $wpdb;
            $query = "SELECT * FROM tablenamehere ";  //table name here
            $results = $wpdb->get_results($query);
            foreach ($results as $row) {
                echo '<option value="'.$row->name.'">' .$row->name. '</option>'; //replace name with colunmn name
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
    $query = "SELECT * FROM tablenamehere WHERE name='".$area."'";  //table name here; replace name with colunmn name
    $results = $wpdb->get_results($query);
    foreach ($results as $row) {
        $exist = $row-> name;
    }
    if ($exist){
        echo '<div class="holds-the-iframe">

                    <iframe style="width: 100%; height: 500px;" defer src="https://dayr8ngd7k1ny.cloudfront.net/'.$area.'.html" allowfullscreen="alloallowfullscreen"></iframe>

               </div>"';

    }
    else{
        echo"The area or suburb is not in Victoria, please enter some keywords and select one from the select box";
    }

}
?>
