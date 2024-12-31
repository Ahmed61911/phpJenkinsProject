<?php
$servername = getenv('DB_HOST'); // 'db' from docker-compose
$username = getenv('DB_USER'); // 'root' from docker-compose
$password = getenv('DB_PASSWORD'); // Password from docker-compose
$dbname = getenv('DB_NAME'); // 'registration' from docker-compose

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>