<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>WebCourses - Contact</title>
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
    <div class="hero">
        <center><h1 data-aos="fade-down">
            Le site des courses pour amateurs et professionnels
        </h1></center>
        <center><p data-aos="fade-up">
            Ce site est dédié aux coureurs amateurs et professionnels cherchant à participer à différentes courses au niveau national.
            Pour vous aidez, un calendrier évènementiel présentant les courses par régions, dates et lieux est à votre disposition.
            Des informations par club vous sont présentés (nombre d’adhérents, classement)
            Dans votre espace personnel, vous trouverez le bulletin d’inscription pour la participation à un évènement, vos statistiques de courses, vos classements.
            Pour nous contacter, vous pouvez utiliser l’onglet contact ou bien nous joindre par email à evenementiel_sio@sitewebdescourses.fr
        </p></center>
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
    <script src="./assets/js/main.js"></script>
</body>
</html>