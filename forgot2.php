<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
require 'vendor/autoload.php';
$con=mysqli_connect("localhost","root","","organic_shop_db")or die ("Couldnt connect");
if(isset($_POST['forgot'])){
	$email = $_POST['Email'];
	$sql = "SELECT * FROM `tbl_login` WHERE email = '$email'";
	$res = mysqli_query($con, $sql);
    while($res3=mysqli_fetch_array($res))
	{
    $sendmail=$res3['email'];
	}
    $count = mysqli_num_rows($res);
	if($count == 1){
    $password=rand();
    $sql4="update tbl_login set password='$password' where email='$sendmail'";
        mysqli_query($con,$sql4);
        $mail = new PHPMailer(true);                 //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'georgebenny2023a@mca.ajce.in';                     //SMTP username
    $mail->Password   = 'rmca2021#';                               //SMTP password
    $mail->SMTPSecure = 'ssl';            //Enable implicit TLS encryption
    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('georgebenny2023a@mca.ajce.in');
    $mail->addAddress($sendmail);
    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'forgot password?';
    $mail->Body    = "Please use this password to login: <strong>$password</strong>";
    if($mail->send()){
      echo "<script>";
        echo "alert('Your Password has been sent to your email id')";
        echo"</script>"; 
    }
	}else{
        echo "<script>";
        echo "alert('User name does not exist in database')";
        echo "</script>";
	}
}
?>

<html>
<head>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<link rel="stylesheet" href="styles.css" >

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #eee;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
	</style>
    <title>forgot</title>
	</head>
    <form class="form-signin" method="POST">
    <br>
    <br>
    <br>
    <center><h2 class="form-signin-heading">Forgot Password</h2></center>
    <br>
    <br>
    <br>
    <br>
    <div class="input-group">
    <span class="input-group-addon" id="basic-addon1">@</span>
    <input type="text" name="Email" id="Email" class="form-control" placeholder="Email" required>
    </div>
        <br>
    <button class="btn btn-lg btn-primary btn-block" id="forgot" name="forgot"type="submit">Forgot Password</button>
    <BR>
    <a class="btn btn-lg btn-primary btn-block" href="login.php">Login</a>
    </form>
</html>