<?php
session_start();
session_destroy();
header("Location: firstpage.php");
exit();
?>
