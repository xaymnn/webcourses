<?php
    session_start();
    $mysqli = require __DIR__ . "/database.php";
    $_SESSION['nom'] = $_POST['nom'];
    $_SESSION['prenom'] = $_POST['prenom'];
    $_SESSION['pseudo'] = $_POST['pseudo'];
    $_SESSION['num_licence'] = $_POST['num_licence'];
    $_SESSION['cat_coureur'] = $_POST['cat_coureur'];
    $_SESSION['epreuve_choisie'] = $_POST['epreuve_choisie'];
    $_SESSION['date'] = $_POST['date'];
    $_SESSION['taille_maillot'] = $_POST['taille_maillot'];
    $_SESSION['type_reglement'] = $_POST['type_reglement'];
    $_SESSION['niveau'] = $_POST['niveau'];

    if ($_POST['certif_medical'] == 1) {
        $_SESSION['certif_medical'] = 'Oui';
    } else {
        $_SESSION['certif_medical'] = 'Non';
    }


    $sql = "INSERT INTO inscriptions_evenements (nom, prenom, pseudo, numero_licence, categorie_coureur, epreuve_choisie, date_debut, certificat_medical, taille_maillot, type_reglement, niveau)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $mysqli->stmt_init();
    $stmt->prepare($sql);
    $stmt->bind_param(
        "sssisssisss",
        $_POST['nom'],
        $_POST["prenom"],
        $_POST["pseudo"],
        $_POST["num_licence"],
        $_POST["cat_coureur"],
        $_POST["epreuve_choisie"],
        $_POST["date"],
        $_POST["certif_medical"],
        $_POST["taille_maillot"],
        $_POST["type_reglement"],
        $_POST["niveau"]
    );
    if ($stmt->execute()) {
        header('Location: evenementinscrit.php');
        exit;
    } else {
        echo 'Erreur lors de l\'inscription : ' . $stmt->error;
    }

    $stmt->close();
    $mysqli->close();
?>
