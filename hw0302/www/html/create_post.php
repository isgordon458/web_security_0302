<?php
session_start();
if (isset($_SESSION['id']) && 
    isset($_POST['content']) && 
    $_POST['content'] != '') {
    
    if (strlen($_POST['content']) >= 10000) {
        echo "The size of content area can't exceed 10000. No post is accepted", '<br>';
        return;
    }

    require_once('config.php');
    $sql = "CALL AddNewPost(".$_SESSION["id"].", '".$_POST["content"]."');";
    $query = mysqli_query($link, $sql);
    if ($query == TRUE) {
        $post_id = mysqli_insert_id($link);
        header('Location: ./board.php');
    } else {
        echo "Unexpected Error, fail to add new post";
    }
    mysqli_close($link);
}
?>

