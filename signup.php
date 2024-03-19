<?php
if (empty($_POST["pseudo"])) {
    die("Le Pseudo est obligatoire !");
}

if (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
    die("L'adresse email ne semble pas correcte");
}

if (strlen($_POST['password']) < 8) {
    die('Le mot de passe doit contenir au moins 8 caractères');
}

if (!preg_match("/[a-z]/i", $_POST['password'])) {
    die('Le mot de passe doit contenir au moins une lettre');
}

if (!preg_match("/[0-9]/", $_POST['password'])) {
    die('Le mot de passe doit contenir au moins un nombre');
}

if ($_POST['password'] !== $_POST['password-conf']) {
    die('Les mots de passe doivent être identiques');
}

$password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

$mysqli = require __DIR__ . "/database.php";

$sql = "INSERT INTO utilisateurs (u_pseudo, u_email, u_password)
        VALUES (?, ?, ?)";
        
$stmt = $mysqli->stmt_init();

if ( ! $stmt->prepare($sql)) {
    die("SQL error: " . $mysqli->error);
}

$stmt->bind_param("sss",
                  $_POST["pseudo"],
                  $_POST["email"],
                  $password_hash);

if ($stmt->execute()) {
    header('Location: signup-success.php');
    exit;
} else {
    echo 'Erreur lors de l\'inscription : ' . $stmt->error;
}

$stmt->close();
$mysqli->close();
?>