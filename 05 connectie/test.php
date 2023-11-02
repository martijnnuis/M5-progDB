
<?php
include 'dbdata.php';

function connectToDatabase($DbHost, $DbUser, $DbPassword, $DbSchemeName)
{
    $conn = new mysqli($DbHost, $DbUser, $DbPassword, $DbSchemeName);
    if($conn->connect_error)
    {
        echo "error try again\r\n";
    }

    echo "connected to database\r\n";
    return $conn;
}


$conn = connectToDatabase($DbHost, $DbUser, $DbPassword, $DbSchemeName);
try{
    $flights = GetAllflights($conn);
    print_r($flights);
    
}