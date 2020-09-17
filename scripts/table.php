<?php
global $wpdb;
$result = $wpdb->get_results( "SELECT name, effects FROM wp_item_information");
echo $result;


echo "<table border='1'>
<tr>
<th>Item</th>
<th>Description</th>
</tr>";

foreach ($result as $row)
{
    echo "<tr>";
    echo "<td>" . $row-> name . "</td>";
    echo "<td>" . $row-> effects . "</td>";
    echo "</tr>";
}

echo "</table>";
?>