<?php
	global $dbconn;
	$dbname = 'hancom_majors';
	$user = 'hancom';
	$pass = 'hciproject';
	$dbconn = new PDO('mysql:host=localhost;dbname='.$dbname, $user, $pass);
	$dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>