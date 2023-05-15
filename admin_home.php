<?php

$con = mysqli_connect("localhost", "root", "", "organic_shop_db") or die("Couldn't connect");
session_start();
if (isset($_SESSION['alogin'])) {
	$mail = $_SESSION['alogin'];

	$query = "SELECT DATE(order_date) as odate, SUM(purchase_price) AS total FROM tbl_customer_order GROUP BY DATE(order_date) ORDER BY order_date DESC LIMIT 7 ";
	$result = mysqli_query($con, $query);

	// format data for chart.js
	$data = [];
	while ($row = mysqli_fetch_assoc($result)) {
		$data['labels'][] = date('d-m-Y', strtotime($row['odate']));
		$data['data'][] = $row['total'];
	}
?>

	<!DOCTYPE html>
	<html>

	<head>
		<title>Admin|Home</title>
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />

		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>

		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

		<script src="js/jquery.min.js"></script>
	</head>

	<body>

		<div class="header">

			<div class="bottom-header" style="background-color:palegreen;">
				<div class="container">
					<div class="header-bottom-left">
						<div class="logo">
							<font size="4"><strong><i> <b>
											<p style="color:red;">ORGANICSHOPPING </p>
										</b></i></strong></font>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="header-bottom-right">
						<div class="account"><a href="admin_profile.php"><span> </span><?php echo $mail ?></a></div>
						<ul class="login">
							<li><a href="logout.php"><span> </span>LOGOUT</a></li>

						</ul>

						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!---->
		<div class="container">

			<div class="account_grid">
				<div class=" login-right">
					<marquee behavior="scroll" direction="left">
						<h3>Welcome <?php echo $mail ?></h3>
					</marquee>
					<!-- <image src='images/a.jpeg'> -->
					<h2>Daily Sales</h2>
					<canvas id="myChart"></canvas>

				</div>

				<div class="clearfix"> </div>
			</div>
			<div class="sub-cate">
				<div class=" top-nav rsidebar span_1_of_left">
					<h3 class="cate">MENU</h3>

					<ul class="menu">
						<ul class="kid-menu">
							<li><a href="admin_home.php">Home</a></li>
						</ul>
						<li class="item2"><a href="view_users.php">Profile<img class="arrow-img " src="images/arrow1.png" alt="" /></a>
							<ul class="cute">
								<li class="subitem1"><a href="admin_update.php">Update password </a></li>
								<li class="subitem1"><a href="admin_profile.php">View profile </a></li>
							</ul>
						</li>
						<li class="item2"><a href="view_users.php">View users<img class="arrow-img " src="images/arrow1.png" alt="" /></a>
							<ul class="cute">
								<li class="subitem1"><a href="reg_sellers.php">View Sellers </a></li>
								<li class="subitem1"><a href="reg_customer.php">View Customers </a></li>
							</ul>
						</li>


						<li>
							<ul class="kid-menu">
								<li><a href="addcat.php">Add category</a></li>

							</ul>
						</li>
						<ul class="kid-menu ">
						</ul>

					</ul>
				</div>

				<script type="text/javascript">
					$(function() {
						var menu_ul = $('.menu > li > ul'),
							menu_a = $('.menu > li > a');
						menu_ul.hide();
						menu_a.click(function(e) {
							e.preventDefault();
							if (!$(this).hasClass('active')) {
								menu_a.removeClass('active');
								menu_ul.filter(':visible').slideUp('normal');
								$(this).addClass('active').next().stop(true, true).slideDown('normal');
							} else {
								$(this).removeClass('active');
								$(this).next().stop(true, true).slideUp('normal');
							}
						});

					});
				</script>

				<img class="img-responsive chain" src="images/a.jpg" alt=" " />
				<div class="grid-chain-bottom chain-watch">
					<div class="footer">

						<div class="footer-bottom">
						<?php
					} else {
						header('Location:login.php');
					}
						?>

						<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
						<script>
							var ctx = document.getElementById('myChart').getContext('2d');
							var myChart = new Chart(ctx, {
								type: 'bar',
								data: {
									labels: <?php echo json_encode($data['labels']); ?>,
									datasets: [{
										label: 'Sales',
										data: <?php echo json_encode($data['data']); ?>,
										backgroundColor: 'rgba(54, 162, 235, 0.2)',
										borderColor: 'rgba(54, 162, 235, 1)',
										borderWidth: 1
									}]
								},
								options: {
									scales: {
										yAxes: [{
											ticks: {
												beginAtZero: true
											}
										}]
									}
								}
							});
						</script>