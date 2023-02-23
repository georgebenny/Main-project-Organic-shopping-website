<?php
session_start();
include 'database.php';
$con=mysqli_connect("localhost","root","","organic_shop_db")or die ("Couldnt connect");

 $o=$_POST["product_category_id"];

$sql="DELETE from tbl_product_category where product_category_id='$o'";
$res=mysqli_query($con,$sql);

header("location:addcat.php");?>
<script>
alert("Successfully Updated");
</script>
