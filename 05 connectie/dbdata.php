<?php
$envSettings = [];
    if (file_exists(dirname(__FILE__).'/.env')) {
        $envSettings = parse_ini_file(dirname(__FILE__).'/.env');
    }

    
    $DbSchemeName = $envSettings['DB_SCHEMA_NAME'];
    $DbHost = $envSettings['DB_HOST'];
    $DbUser = $envSettings['DB_USER'];
    $DbPassword = $envSettings['DB_PASSWORD'];
?>