<?php 

$username = "root";
$password = "";
$database = "golden_express";

try {
  $pdo = new PDO("mysql:host=localhost;database=$database", $username, $password);
  //Deixa o erro do pdo como exeção
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e){
  die("ERROR: Could not connect. " . $e->getMessage());
}

?>


<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Graficos</title>
    <style type="text/css"> 
        .ChartBox{
            width:1000px; 
            
        }
    </style>
</head>

<body>
    

        <?php 
        // Tenta selecionar o query para executar
        try{
        $sql = "SELECT * FROM golden_express.estoque ";   
        $result = $pdo->query($sql);
        if($result->rowCount() > 0) {
            $quantidade = array ();
            while($row = $result->fetch()) {
                $quantidade[] = $row["quantidade"];
            }
            
        unset($result);
        } else {
            echo "No records matching your query were found.";
        }
        } catch(PDOException $e){
        die("ERROR: Could not able to execute $sql. " . $e->getMessage());
        }
        
        // Fechar conexão
        unset($pdo);
        ?>

<div class="ChartBox">
    <canvas id="myChart"></canvas>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script> 
//Bloco de setup
const quantidade =<?php echo json_encode($quantidade); ?>;

const data = {
labels: ['Pão doce', 'Café', 'Golden Express'],
            datasets: [{
                label: 'Quantidade de itens em estoque',
                data: quantidade,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        };
//Fim do bloco de setup

//Bloco de configuração
const config = {
        type: 'bar',
            data,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
    };

//Bloco de renderização
    const myChart = new Chart(
    document.getElementById('myChart'),
    config
    );

</script>

</body>
</html>