<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Comments  with jQuery and Ajax</title>
  
 <script type="text/javascript" src="jquery.js"></script>
 <script type="text/javascript">  
$(function() {

$(".submit").click(function() {

var user_id = $("#user_id").val();
var slide_id = $("#slide_id").val();
var comment = $("#comment").val();
var post_id = $("#post_id").val();
var dataString = 'user_id='+ user_id + '&slide_id=' + slide_id + '&comment=' + comment + '&post_id=' + post_id;
	
if(comment=='')
  { alert('Enter Comment');  }
else
	{
	$("#flash").show();
	$("#flash").fadeIn(400).html('<img src="ajax-loader.gif" align="absmiddle">&nbsp;<span class="loading">Loading Comment...</span>');
$.ajax({
	type: "POST",
  url: "commentajax.php",
  data: dataString,
  cache: false,
  success: function(html){
  $("ol#update").prepend(html);
  $("ol#update li:last").fadeIn("slow");
  // document.getElementById('email').value='';
  // document.getElementById('name').value='';
  document.getElementById('comment').value='';
	$("#name").focus(); 
  $("#flash").hide();
  }
 });
}
return false;
	});
});
</script>

<style type="text/css">
body
{
font-family:Arial, Helvetica, sans-serif;
font-size:14px;
}
.comment_box{background-color:#D3E7F5; border-bottom:#ffffff solid 1px; padding-top:3px}
a	{text-decoration:none;color:#d02b55;}
a:hover{text-decoration:underline;color:#d02b55;}
*{margin:0;padding:0;}
ol.timeline	{list-style:none;font-size:1.2em;}
ol.timeline li{ /*display:none;*/position:relative;padding:.7em 0 .6em 0;}ol.timeline li:first-child{}
#main{width:500px; margin-top:20px; margin-left:100px;
	font-family:"Trebuchet MS";}
#flash{	margin-left:100px;}
.box{height:85px;border-bottom:#dedede dashed 1px;margin-bottom:20px;}
input{
	color:#000000;
	font-size:14px;
	border:#666666 solid 2px;
	height:24px;
	margin-bottom:10px;
	width:200px;
	}
textarea{
	color:#000000;
	font-size:14px;
	border:#666666 solid 2px;
	height:124px;
	margin-bottom:10px;
	width:200px;
	}
.titles{font-size:13px;padding-left:10px;}
.star{color:#FF0000; font-size:16px; font-weight:bold;padding-left:5px;}
.com_img{float: left; width: 80px; height: 80px; margin-right: 20px;}
.com_name{font-size: 16px; color: rgb(102, 51, 153); font-weight: bold;}
</style>
</head>
<body>
<form action="#" method="post">
<input type="hidden" name="post_id" id="post_id" value="<?php echo $post_id; ?>"/>
<input type="hidden" name="user_id" id="user_id" value="1" />
<input type="hidden"name="slide_id"id="slide_id" value="2" />
<textarea name="comment" id="comment"></textarea><br />
<input type="submit" class="submit" value=" Submit Comment " />
</form>
<div id="flash" align="left"></div>
<ol  id="update" class="timeline">
<?php
include('config.php');
$sql="select * from comments where post_id='0'";
$result = $conn->query($sql);
if($result === FALSE) { die(mysql_error()); }// TODO: better error handling

while($row = $result->fetch_assoc())
{
$user_id=$row['user_id'];
$slide_id=$row['slide_id'];
$comment=$row['comment'];
?>

<li class="box">
<img src="http://www.gravatar.com/avatar.php?gravatar_id=<?php echo $image; ?>" class="com_img">
<span class="com_name"> <?php echo $user_id; ?></span> <br />
<?php echo $comment; ?>
</li>
<?php  }   ?>
</ol>
</body>
</html>
