<?php

session_start();
$mail=$_SESSION['alogin'];
$con=mysqli_connect("localhost","root","","organic_shop_db")or die ("Couldnt connect");

if(isset($_POST["submitd"]))
{

echo $firstname=$_POST["firstname"];
echo $lastname=$_POST["lastname"];
$phonem=$_POST["phonem"];


$q_update="UPDATE tbl_registration SET fname='$firstname',lname='$lastname',phone_no='$phonem' WHERE email='$mail' ";

if(mysqli_query($con,$q_update)==TRUE)
{
	
		echo "<script type='text/javascript'>
				
				alert('Profile updated successfully'); 
				window.location='customer_profile.php';
				</script>";
}
else
{
	
	echo "<script type='text/javascript'>
				
				alert('not updated'); 								
				</script>";
}
}

			?>