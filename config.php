<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "egglabs";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {    die("Connection failed: " . $conn->connect_error);}



// $sql = "SELECT id, firstname, lastname FROM MyGuests";
// $result = $conn->query($sql);
?>
