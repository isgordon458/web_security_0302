<?php 
session_start();
if( !isset($_POST['username']) || 
    !isset($_POST['password']) || 
    $_POST['username']=="" || 
    $_POST['password']=="" ) {
    header("Location: index.php");
}

$username = $_POST['username'];
$password = $_POST['password'];

require_once('config.php');
// $sql = "SELECT * FROM `users` WHERE `username` = '$username' and `password` = '$password';";
$sql = "SELECT UserLogin('$username', '$password')";
$result = mysqli_query($link, $sql);
mysqli_close($link);
try {
    if ($result && 
        $id = mysqli_fetch_array($result)[0]
    ) {
        // echo $id, '登入成功', '<br>';
        $_SESSION['id'] = $id;
        $_SESSION['username'] = $username;
        header("Location: board.php");
        return;
    }
    session_destroy();
    header("Location: index.php");
}
catch (Exception $e) {
    echo 'Caught exception: ', $e->getMessage(), '<br>';
    echo 'Check credentials in config file at: ', $Mysql_config_location, '\n';
}
?>