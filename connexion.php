<?php
session_start();
$is_invalid = false;
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $mysqli = require __DIR__ . "/database.php";
        $sql = sprintf("SELECT * FROM utilisateurs WHERE u_pseudo = '%s'", $mysqli->real_escape_string($_POST["pseudo"]));
        $result = $mysqli->query($sql);
        $user = $result->fetch_assoc();
        if ($user) {
            if (password_verify($_POST["password"], $user["u_password"])) {
                session_start();
                $_SESSION["user_id"] = $user["u_id"];
                header("Location: index.php");
                exit;
            }
        }
        $is_invalid = true;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>WebCourses - Connexion</title>
    <!-- META -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- LIB -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <!-- CSS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/index.css">
    <link rel="shortcut icon" href="./assets/img/icone.png" type="image/x-icon">
</head>
<body>
    <header>
        <nav>
            <a href="index.php"><img class="logo" src="./assets/img/icone.png" alt="webcourses logo"></a>
            <ul>
                <li><a class="hover-underline-animation" href="index.php">Accueil</a></li>
                <li><a class="hover-underline-animation" href="quisommesnous.php">Qui Sommes-Nous ?</a></li>
                <li><a class="hover-underline-animation" href="calendrierevenementiel.php">Calendrier évènementiel</a></li>
                <li><a class="hover-underline-animation" href="informationsclub.php">Informations Club</a></li>
                <?php if (!isset($_SESSION["user_id"])): ?>
                <li><a class="hover-underline-animation" href="nouveaumembre.php">Inscription</a></li>
                <li><a class="hover-underline-animation" href="connexion.php">Connexion</a></li>
                <?php endif; ?>
                <?php if (isset($_SESSION["user_id"])): ?>
                    <li><a href="inscriptionevenement.php" class="hover-underline-animation">Inscription evenement</a></li>
                <?php endif; ?>
                <li><a class="hover-underline-animation" href="contact.php">Contact</a></li>
                <?php if (isset($_SESSION["user_id"])): ?>
                    <li><a href="logout.php" style="color: red; font-weight=700;" class="hover-underline-animation-logout">Se Deconnecter</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </header>
    <div class="signin-section">
        <form method="POST" data-aos="flip-right">
            <h1>Connexion</h1>
            <?php if ($is_invalid): ?>
                <em style="color: red">Les informations entrees sont incorrectes. Veuillez reessayer</em> <br> <br>
            <?php endif; ?>
            <label for="pseudo">Pseudonyme :</label>
            <input id="pseudo" type=text name="pseudo" value="<?= htmlspecialchars($_POST["pseudo"] ?? "") ?>" required/>
            <br />
            <label for="password">Mot de passe :</label>
            <input id="password" type=password name="password" required/>
            <br />
            <button name="signin">Se Connecter</button>
        </form>
    </div>
    <footer>
        <ul>
            <li><a class="hover-underline-animation-footer" href="mentionslegales.pdf">Mentions Légales</a></li>
            <li><a class="hover-underline-animation-footer" href="politiquedeconfidentialite.pdf">Politique De Confidentialité</a></li>
            <li><a class="hover-underline-animation-footer" href="chartecookies.pdf">Charte Cookies</a></li>
        </ul>
    </footer>
    <!--
        Script JS
    -->
    <script>AOS.init();</script>
    <script src="./assets/js/main.js"></script>
</body>
</html>