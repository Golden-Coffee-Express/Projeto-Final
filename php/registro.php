<?php require 'functions.php'; ?>
<!DOCTYPE html>
<html>
<head>
	<title>Área do Usuário</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="header">
	<h2>Criar conta</h2>
</div>
<form method="post" action="registro.php">
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
		<label>Senha</label>
		<input type="senha" name="senha_1">
	</div>
	<div class="input-group">
		<label>Confirmar Senha</label>
		<input type="senha" name="senha_2">
	</div>
	<div class="input-group">
		<button type="submit" class="btn" name="registro_btn">Criar</button>
	</div>
	<p>
		Já é um membro ? <a href="login.php">Login</a>
	</p>
</form>
</body>
</html>