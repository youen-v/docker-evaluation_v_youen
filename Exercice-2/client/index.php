<?php
$host = getenv('DB_HOST');
$dbname = getenv('DB_NAME');
$user = getenv('DB_USER');
$password = getenv('DB_PASSWORD');
$env = getenv('ENVIRONMENT');

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->query("SELECT * FROM article");
    $articles = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    if ($env === 'dev') {
        echo "<h1>Articles</h1>";
        echo "<p style='color: red;'>Environnement de développement</p>";
    
        foreach ($articles as $article) {
            echo "<h2>Titre : {$article['title']}</h2>";
            echo "<p>Contenu : {$article['body']}</p>";
        }
    } elseif ($env === 'prod') {
        
    }   

} catch (PDOException $e) {
    echo "Erreur de connexion à la base de données: " . $e->getMessage();
}
?>