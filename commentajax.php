<?php
include('config.php');
if($_POST)
{
$user_id=$_POST['user_id'];
$slide_id=$_POST['slide_id'];
$comment=$_POST['comment'];
$post_id=$_POST['post_id'];

$lowercase = strtolower($email);
  $image = md5( $lowercase );

$sql = "INSERT INTO comments (user_id, slide_id, comment, post_id)
VALUES ('".$user_id."', '".$slide_id."', '".$comment."', '".$post_id."')";  
$conn->query($sql);
}

else { }

?>
<li class="box">
<img src="http://www.gravatar.com/avatar.php?gravatar_id=<?php echo $image; ?>" class="com_img"/>
<span  class="com_name"> <?php echo $user_id;?></span> <br /><br />

<?php echo $comment; ?>
</li>
