<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>WebCourses - Inscription Evenement</title>
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
    <div class="inscription-evenement">
        <form action="event.php" method="POST">
            <h1> Inscription Evenement </h1>
            <br>
            <label for="nom">Nom :</label>
            <input id="nom" type=text name="nom" required/>
            <br>
            <label for="prenom">Prenom :</label>
            <input id="prenom" type=text name="prenom" required/>
            <br>
            <label for="pseudo">Pseudo :</label>
            <input id="pseudo" type=text name="pseudo" required/>
            <br>
            <label for="num_licence">Numero de licence :</label>
            <input id="num_licence" type=number name="num_licence" required/>
            <br>

            <label for="cat_coureur">Categorie du coureur :</label>
            <select list="cat_coureur" id="cat_coureur" name="cat_coureur" required/>
                <option value="Bebe">Bebe</option>
                <option value="Jeune">Jeune</option>
                <option value="Junior">Junior</option>
                <option value="Ado">Ado</option>
                <option value="Adulte">Adulte</option>
                <option value="Senior">Senior</option>
            </select>
            <br>
            <label for="epreuve_choisie">Epreuve choisie :</label>
            <select id="epreuve_choisie" name="epreuve_choisie" required>
                <option value="Arkétop">Arkétop</option>
                <option value="Aventure">Aventure</option>
                <option value="Suprême sensation">Suprême sensation</option>
                <option value="Coule douce">Coule douce</option>
                <option value="Admirer le paysage">Admirer le paysage</option>
                <option value="Verdoyants parcours">Verdoyants parcours</option>
                <option value="Extrême">Extrême</option>
                <option value="Pour les mordues">Pour les mordues</option>
                <option value="Vive demain">Vive demain</option>
                <option value="La perle de la montagne">La perle de la montagne</option>
                <option value="Tous en plaine">Tous en plaine</option>
                <option value="Parcours aventure">Parcours aventure</option>
                <option value="Le chemin des petits">Le chemin des petits</option>
                <option value="Warriorss">Warriorss</option>
                <option value="La baby course">La baby course</option>
                <option value="Upgrade">Upgrade</option>
                <option value="Toujours plus loin">Toujours plus loin</option>
                <option value="Les 5 bornes">Les 5 bornes</option>
                <option value="La courses 100m">La courses 100m</option>
            </select>
            <br>
            <label for="date">Choisissez une date de debut :</label>
            <input type="date" name="date" id="date" required>
            <br>
            <div class="radio">
                <label for="certif_medical">Presence d'un certificat medical :</label>
                <center><label for="oui">Oui</label></center>
                <input type="radio" id="oui" name="certif_medical" value="1">
                <center><label for="non">Non</label></center>
                <input type="radio" id="non" name="certif_medical" value="0">
            </div>
            <br>
            <label for="taille_maillot">Taille du maillot choisi :</label>
            <select id="taille_maillot" name="taille_maillot" required>
                <option value="XS">Taille XS</option>
                <option value="S">Taille S</option>
                <option value="M" selected>Taille M</option>
                <option value="L">Taille L</option>
                <option value="XL">Taille XL</option>
                <option value="XXL">Taille XXL</option>
            </select>
            <br>
            <label for="type_reglement">Type de règlement :</label>
            <select id="type_reglement" name="type_reglement" required>
                <option value="Chèque">Chèque</option>
                <option value="Liquide">Liquide</option>
                <option value="Carte bleu">Carte bleu</option>
            </select>
            <br>
            <label for="niveau">Niveau :</label>
            <select id="niveau" name="niveau" required>
                <option value="Amateur">Amateur</option>
                <option value="Professionnel">Professionnel</option>
            </select>
            <br>
            <button>Valider</button> <br>
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