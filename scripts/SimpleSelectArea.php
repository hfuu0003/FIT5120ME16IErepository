<!-- Http post method -->
<form method="post">
    <!-- One input box with datalist  -->
    <div style="text-align: center;vertical-align: middle;">
        <label><?php _e('Select an area here: '); ?></label>
        <input type="text" name="area" list="areas"/>
        <datalist id="areas" style="display: none;">
            <option value="Melbourne">Melbourne</option>
        </datalist>
        <button type="submit" name="submit" class="submit button"><?php _e('Check now'); ?></button><br>
    </div>
</form>


<?php
if (isset($_POST['submit'])) {
    /**
     * Display the map
     *
     * Get one variable from post method used to check the input is not empty.
     *
     * @trigger Http post method
     */

    $area = $_POST["area"];
    if ($area){
        echo '<div class="holds-the-iframe">

                    <iframe style="width: 100%; height: 500px;" defer src="https://dayr8ngd7k1ny.cloudfront.net/parksV2.0.html" allowfullscreen="alloallowfullscreen"></iframe>

               </div>"';

    }

}
?>
