<?php
    session_start();
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        if (!filter_var($_POST["mail"], FILTER_VALIDATE_EMAIL)) {
            die("L'adresse email ne semble pas correcte");
        }
        require __DIR__ . "/database.php";
        $sql = "INSERT INTO newsletter (nw_email) VALUES (?)";
        $stmt = $mysqli->stmt_init();
        if ( ! $stmt->prepare($sql)) {
            die("SQL error: " . $mysqli->error);
        }
        $stmt->bind_param("s", $_POST['mail']);
        if ($stmt->execute()) {
            $isvalid = true;
        } else {
            $isvalid = false;
        }
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>WebCourses - A Propos</title>
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
    <div class="qsn">
        <center><h1 data-aos="flip-up">
            "Unis par la Passion, Forts par le Mouvement."
        </h1></center>
        <center><h3 data-aos="flip-up">
            Notre Histoire
        </h3></center>
        <center><p data-aos="flip-up">
            Association de la loi 1901 créée en 1960, par deux frères passionnés de courses, …. <br>
            Et c’est là que tout a commencé ….. Enchaînement d’actions <br>
            Aujourd’hui, notre association compte plus d’un million de membres, dont dix mille professionnels répartis dans diverses catégories comme la courses à pied, le vélo, la natation …… <br>
            Adresse: 95 boulevard de ménilmontant, 75020 Paris <br>
            Tél: 01 43 35 98 53 <br>
            Email: evenementiel_sio@sitewebdescourses.fr <br>
        </p></center>
        <button id="scrollToNewsletter">S'abonner à notre newsletter</button>
    </div>
    <div class="newsletter" data-aos="zoom-in">
        <div class="box">
        <center><h1>
            Restons en contact !
        </h1></center>
        <center><h3>
            Ne manquez plus aucune course en vous abonnant a notre newsletter
        </h3></center>
        <form action="quisommesnous.php" method="POST">
            <input class="formEmail" type="email" name="mail" id="mail" placeholder="Votre adresse mail" required />
            <button type="submit">S'abonner</button> <br>
            <?php if($isvalid): ?>
                <em style="color: green; margin-left: 5px;">Vous etes abonnes avec succes !</em>
            <?php endif; ?>
        </form>
        </div>
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
    <script src="./assets/js/main.js" defer></script>
</body>
</html>