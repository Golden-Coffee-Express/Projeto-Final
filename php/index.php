<<?php
include 'functions.php';
if (!isLoggedIn()) {
	$_SESSION['msg'] = "Você deve logar primeiro!";
	header('location: login.php');
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Área do Usuário</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="header">
		<h2>Pág Inicial</h2>
	</div>
	<div class="content">

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

		<div class="perfil_info">
			<img src="../img/social/user.png">

			<div>
				<?php  if (isset($_SESSION['user'])) : ?>
					<strong><?php echo $_SESSION['user']['nome']; ?></strong>

					<small>
						<i  style="color: #888;">(<?php echo ucfirst($_SESSION['user']['tipo_user']); ?>)</i> 
						<br>
						<a href="index.php?logout='1'" style="color: red;">logout</a>
					</small>

				<?php endif ?>
			</div>
		</div>
	</div>
</body>
</html>