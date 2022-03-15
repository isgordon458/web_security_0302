<?php 
session_start();
echo "Welcome Back, ", $_SESSION['username'], '<br>';
echo '<br>';
?>

<a href='./create_post.html'>Add Post</a><br>
<a href='./logout.php'>Logout</a><br>

<h1>Bulletin board</h1><br>

<?php
require_once('config.php');
$query = mysqli_query($link, 'SELECT * FROM `post`, `users` WHERE `users`.id = `post`.poster_id;');
mysqli_close($link);
$all_post = mysqli_fetch_all($query, MYSQLI_ASSOC);
foreach ($all_post as $post) {
    echo "User: ", $post['username'], '<br>';
    echo "Content: ", $post['contents'], '<br>';
    echo '<br>';
}
?>