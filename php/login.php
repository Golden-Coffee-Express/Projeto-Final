<?php require 'functions.php'; ?>
<!DOCTYPE html>
<html>
<head>
	<title>Área do Usuário</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="header">
		<h2>Entrar</h2>
	</div>
	<form method="post" action="login.php">

		<?php echo display_error(); ?>

		<div class="input-group">
			<label>Nome</label>
			<input type="text" name="nome" >
		</div>
		<div class="input-group">
			<label>Senha</label>
			<input type="senha" name="senha">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="login_btn">Login</button>
		</div>
		<p>
			Não é um membro ? <a href="registro.php">Registrar</a>
		</p>
	</form>
</body>
</html>