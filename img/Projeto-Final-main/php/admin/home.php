<?php 
include '../functions.php';

if (!isAdmin()) {
	$_SESSION['msg'] = "Você precisa logar primeiro!";
	header('location: ../login.php');
}

if (isset($_GET['logout'])) {
	session_destroy();
	unset($_SESSION['user']);
	header("location: ../login.php");
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Área do Usuário</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div class="header">
		<h2>Admin - Pág Inicial</h2>
	</div>
	<div class="content">
		<!-- notification message -->
		<?php if (isset($_SESSION['sucesso'])) : ?>
			<div class="erro sucesso" >
				<h3>
					<?php 
						echo $_SESSION['sucesso']; 
						unset($_SESSION['sucesso']);
					?>
				</h3>
			</div>
		<?php endif ?>

		<!-- logged in user information -->
		<div class="perfil_info">
			<img src="../images/admin_profile.png"  >

			<div>
				<?php  if (isset($_SESSION['user'])) : ?>
					<strong><?php echo $_SESSION['user']['nome']; ?></strong>

					<small>
						<i  style="color: #888;">(<?php echo ucfirst($_SESSION['user']['tipo_user']); ?>)</i> 
						<br>
						<a href="home.php?logout='1'" style="color: red;">logout</a>
                       &nbsp; <a href="criar_user.php"> + add usuário</a>
					</small>

				<?php endif ?>
			</div>
		</div>
	</div>
</body>
</html>