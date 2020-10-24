<!-- Http post method -->
<form method="post">
    <!-- One input box with datalist for breed
    and two input boxes with numeric restriction and range limitation for height and range-->
    <div style="text-align: center;vertical-align: middle;"><br>
        <label><?php _e('Select your dog breed: '); ?></label>
        <input type="text" name="breed" required="required" list="breeds"/>
        <datalist id="breeds" style="display: none; max-height:150px; overflow:auto;">
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
            $query = "SELECT * FROM dog_bmi ";  //table name here
            $results = $wpdb->get_results($query);
            foreach ($results as $row) { //use a loop to display all results get from the query.
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
/**
 * Check weather the input in post method match the records in dog_bmi table and display the table shows information in dog_bmi table.
 * and get Breed, BMI_high, BMI_low, BMI_avg from the Query result
 * Breed used to check the weather the input in post method match the records in dog_bmi table
 * BMI_high used to check the calculated BMI is over it or not and display in table
 * BMI_low used to check the calculated BMI is under it or not and display in table
 *
 * Get three variables which are breed, height and weight.
 * breed used in query.
 * height and weight used to calculate the BMI.
 *
 * The script use WordPress global class wpdb to connect to the database which is used by WordPress
 * and use SQL to do the query operation in the database
 *
 * @trigger Http post method
 * @package WordPress
 */
if (isset($_POST['submit'])) {

    $breed = $_POST["breed"];
    $height = $_POST["height"];
    $weight = $_POST["weight"];
    global $wpdb;
    $query = "SELECT * FROM dog_bmi WHERE Breed='".$breed."'";  //table name here; replace name with colunmn name
    $results = $wpdb->get_results($query);
    foreach ($results as $row) { //use a loop to display all results get from the query.
        $exist = $row->Breed;
        $high = $row->BMI_high;
        $low = $row->BMI_low;
        $avg = $row->BMI_avg;
    }
    if (!$exist){
        echo 'Sorry!! We can not calculate BMI for your dog.';
    }
    else{
        $bmi = $weight / pow(($height/100),2); // calculate BMI formula is: weight/((height/100)^2)
        echo '<div style="text-align: center;vertical-align: middle;"> Your dog\'s BMI is '.round($bmi).'.<br/>';
        if($bmi > $high){
            echo 'Your pets is overweight!! <br/>Give him/her less food and take him/her for a walk more frequently.';
        }
        elseif ($bmi < $low){
            echo 'Your pets is underweight!! <br/>Give him/her more food and don\'t forget take him/her for a walk to keep healthy.';
        }
        else{
            echo 'Your dog is in the healthy range, keep going.';
        }
        echo'</div>';
        echo '<br/><br/>';
        echo 'Indicator of '.$breed. ' :';
        echo '<br/>';
        /**
         * table header
         */
        echo "<table border='1'>
              <tr>
              <th>Status</th>
              <th>BMI Value</th>
              </tr>";
        /**
         * table body
         */
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