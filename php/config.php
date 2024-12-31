<?php
$mysqli = new mysqli('db', 'root', '', 'registration');

// Check connection
if ($mysqli->connect_error) {
    die("Database connection failed: " . $mysqli->connect_error);
}
echo "Database connection successful!";
?>