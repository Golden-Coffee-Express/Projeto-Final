<?php 
require '../functions.php';

if (!isAdmin()) {
	$_SESSION['msg'] = "Você precisa logar primeiro!";
	header('location: ../login.php');
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Área do Usuário</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
	<style>
		#tipo_user {
			background: #f1f1f1;
		}
	</style>
</head>
<body>
	<div class="header">
		<h2>Admin - Criar usuário</h2>
	</div>
	
	<form method="post" action="criar_user.php">

		<?php echo display_error(); ?>

		<div class="input-group">
			<label>Nome</label>
			<input type="text" name="nome" value="<?php echo $nome; ?>">
		</div>
		<div class="input-group">
			<label>Email</label>
			<input type="email" name="email" value="<?php echo $email; ?>">
		</div>
		<div class="input-group">
			<label>Tipo do Usuário</label>
			<select name="tipo_user" id="tipo_user" >
				<option value=""></option>
				<option value="admin">Admin</option>
				<option value="user">User</option>
			</select>
		</div>
		<div class="input-group">
			<label>Senha</label>
			<input type="senha" name="senha_1">
		</div>
		<div class="input-group">
			<label>Confirmar Senha</label>
			<input type="senha" name="senha_2">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="registro_btn"> + Criar usuário</button>
		</div>
	</form>
</body>
</html>