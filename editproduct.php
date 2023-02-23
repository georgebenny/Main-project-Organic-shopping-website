<?php
session_start();
$con=mysqli_connect("localhost","root","","organic_shop_db")or die ("Couldnt connect");
$pi=$_POST["pid"];
$name=$_POST["name"];
$price=$_POST["price"];
$des=$_POST["des"];
$qunty=$_POST["qunty"];
$qunt="update tbl_product  set price=$price,qunty=$qunty where pid='$pi'";

if($con->query($qunt)===True)
{
echo"<script>
alert('sucessfully updated');
window.location='viewproduct.php';
</script>	";
}
else
{
echo"<script>
alert('Not updated');
window.location='viewproduct.php';
</script>	";	
}
?>

