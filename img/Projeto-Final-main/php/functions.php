<?php 
session_start();

// Conexão D.B.
$db = mysqli_connect('localhost', 'root', '', 'database');

$nome 	= "";
$email  = "";
$erros  = array(); 

if (isset($_POST['registro_btn'])) {
	register();
}

function register(){
	// Permite o uso das Var nas funções
	global $db, $erros, $nome, $email;

	// Recebe os valores do HTML
	$nome     =  e($_POST['nome']);
	$email    =  e($_POST['email']);
	$senha_1  =  e($_POST['senha_1']);
	$senha_2  =  e($_POST['senha_2']);

	// Verificação de preenchimento
	if (empty($nome)) { 
		array_push($erros, "O campo 'Nome' está vazio"); 
	}
	if (empty($email)) { 
		array_push($erros, "O campo 'Email' está vazio"); 
	}
	if (empty($senha_1)) { 
		array_push($erros, "O campo 'Senha' está vazio"); 
	}
	if ($senha_1 != $senha_2) {
		array_push($erros, "As duas senhas NÃO são iguais");
	}

	// Verifica se o User já existe na Database
	$user_check_query = "SELECT * FROM user WHERE nome='$nome' OR email='$email' LIMIT 1";
	$result = mysqli_query($db, $user_check_query);
	$user = mysqli_fetch_assoc($result);
	
	if ($user) { // Se existe...
	  if ($user['nome'] === $nome) {
		array_push($erros, "Nome de usuário já está em uso");
	  }
  
	  if ($user['email'] === $email) {
		array_push($erros, "Email já está em uso");
	  }
	}  

	// Registra caso não possua erros
	if (count($erros) == 0) {
		$senha = md5($senha_1); // Criptografia básica... obrigado StackOverflow !

		if (isset($_POST['tipo_user'])) {
			$tipo_user = e($_POST['tipo_user']);
			$query = "INSERT INTO user (nome, email, tipo_user, senha) 
					  VALUES('$nome', '$email', '$tipo_user', '$senha')";
			mysqli_query($db, $query);
			$_SESSION['sucesso']  = "Novo usuário criado com sucesso !";
			header('location: home.php');
		}else{
			$query = "INSERT INTO user (nome, email, tipo_user, senha) 
					  VALUES('$nome', '$email', 'user', '$senha')";
			mysqli_query($db, $query);

			// Armazenamento do ID do usuário em Var
			$logged_in_user_id = mysqli_insert_id($db);

			$_SESSION['user'] = getUserById($logged_in_user_id); // Loga novo usuário novo
			$_SESSION['sucesso']  = "Agora você está logado !";
			header('location: index.php');				
		}
	}
}

// Retorna Info do usuário por meio de seu ID
function getUserById($id){
	global $db;
	$query = "SELECT * FROM user WHERE id=" . $id;
	$result = mysqli_query($db, $query);

	$user = mysqli_fetch_assoc($result);
	return $user;
}

// Resolução de Bug confuso (???)
function e($val){
	global $db;
	return mysqli_real_escape_string($db, trim($val));
}

function display_error() {
	global $erros;

	if (count($erros) > 0){
		echo '<div class="erro">';
			foreach ($erros as $erro){
				echo $erro .'<br>';
			}
		echo '</div>';
	}
}	

// Função que verifica a sessão do User
function isLoggedIn()
{
	if (isset($_SESSION['user'])) {
		return true;
	}else{
		return false;
	}
}

// Função que desloga o User
if (isset($_GET['logout'])) {
	session_destroy();
	unset($_SESSION['user']);
	header("location: login.php");
}

if (isset($_POST['login_btn'])) {
	login();
}

function login(){
	global $db, $nome, $erros;

	// Recebe os valores do HTML 
	$nome = e($_POST['nome']);
	$senha = e($_POST['senha']);

	// Verificação de preenchimento
	if (empty($nome)) {
		array_push($erros, "Nome é requerido");
	}
	if (empty($senha)) {
		array_push($erros, "Senha é requerida");
	}

	// Loga caso não possua erros
	if (count($erros) == 0) {
		$senha = md5($senha);

		$query = "SELECT * FROM user WHERE nome='$nome' AND senha='$senha' LIMIT 1";
		$results = mysqli_query($db, $query);

		if (mysqli_num_rows($results) == 1) { 
			// Checagem geral do User
			$logged_in_user = mysqli_fetch_assoc($results);
			if ($logged_in_user['tipo_user'] == 'admin') {

				$_SESSION['user'] = $logged_in_user;
				$_SESSION['sucesso']  = "Agora você está logado !";
				header('location: admin/home.php');		  
			}else{
				$_SESSION['user'] = $logged_in_user;
				$_SESSION['sucesso']  = "Agora você está logado !";

				header('location: index.php');
			}
		}else {
			array_push($erros, "Nome/Senha errados");
		}
	}
}

// O nome da função é auto-explicativo
function isAdmin()
{
	if (isset($_SESSION['user']) && $_SESSION['user']['tipo_user'] == 'admin' ) {
		return true;
	}else{
		return false;
	}
}