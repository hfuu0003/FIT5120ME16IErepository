<?php
/**
 * Display the table shows information in wp_item_information table.
 * The script use WordPress global class wpdb to connect to the database which is used by WordPress
 * and use SQL to do the query operation in the database
 *
 * @package WordPress
 */
global $wpdb;
$result = $wpdb->get_results( "SELECT name, effects FROM wp_item_information");
echo $result;

/**
 * table header
 */
echo "<table border='1'>
<tr>
<th>Item</th> <!-- first column-->
<th>Description</th> <!-- second column-->
</tr>";
/**
 * table body
 */
foreach ($result as $row) //use a loop to display all results get from the query.
{
    echo "<tr>";
    echo "<td>" . $row-> name . "</td>";
    echo "<td>" . $row-> effects . "</td>";
    echo "</tr>";
}

echo "</table>";
?>