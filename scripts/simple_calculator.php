<form method="post">
    <div style="text-align: center;vertical-align: middle;"><br>
        <label><?php _e('Select your dog breed: '); ?></label>
        <input type="text" name="breed" required="required" list="breeds"/>
        <datalist id="breeds" style="display: none; max-height:150px; overflow:auto;">
            <?php
            global $wpdb;
            $query = "SELECT * FROM dog_bmi ";  //table name here
            $results = $wpdb->get_results($query);
            foreach ($results as $row) {
                echo '<option value="'.$row->Breed.'">' .$row->Breed. '</option>'; //replace name with colunmn name
            }
            ?>
        </datalist>
        <br/><br/>
        <label><?php _e('Enter your dog height(cm): '); ?></label>
        <input type="number" name="height" required="required" min="5" max="300"/><br/><br/>
        <label><?php _e('Enter your dog weight(kg): '); ?></label>
        <input type="number" name="weight" required="required" min="0.5" max="150" step="0.01"/><br/><br/>
        <button type="submit" name="submit" class="submit button"><?php _e('Calculate now'); ?></button><br/><br/>
    </div>
</form>
<?php
if (isset($_POST['submit'])) {

    $breed = $_POST["breed"];
    $height = $_POST["height"];
    $weight = $_POST["weight"];
    global $wpdb;
    $query = "SELECT * FROM dog_bmi WHERE Breed='".$breed."'";  //table name here; replace name with colunmn name
    $results = $wpdb->get_results($query);
    foreach ($results as $row) {
        $exist = $row->Breed;
        $high = $row->BMI_high;
        $low = $row->BMI_low;
        $avg = $row->BMI_avg;
    }
    if (!$exist){
        echo 'Sorry!! We can not calculate BMI for your dog.';
    }
    else{
        $bmi = $weight / pow(($height/100),2);
        echo '<div style="text-align: center;vertical-align: middle;"> Your dog\'s BMI is '.round($bmi).' .</div>';
        echo '<br/><br/>';
        echo 'Indicator of '.$breed. ' :';
        echo '<br/>';
        echo "<table border='1'>
              <tr>
              <th>Status</th>
              <th>BMI Value</th>
              </tr>";
        echo "<tr>";
        echo "<td>Underweight</td>";
        echo "<td>Below " . $low . "</td>";
        echo "</tr>";
        echo "<tr>";
        echo "<td>Average Weight</td>";
        echo "<td>" . $avg . "</td>";
        echo "</tr>";
        echo "<tr>";
        echo "<td>Overweight</td>";
        echo "<td>Above " . $high . "</td>";
        echo "</tr>";

    }

}
?>