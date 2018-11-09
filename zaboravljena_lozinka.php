<!DOCTYPE html>
<?php
include_once("aplikacijskiOkvir.php");

if (!isset($_COOKIE[$cookieIme]) || time() > ($_COOKIE[$cookieIme] - (dohvatiStupac("pomak_vremena") * 60 * 60))) {
    header("Location: uvjeti_koristenja_provjera.php");
}

$uri = $_SERVER["REQUEST_URI"];
$pos = strrpos($uri, "/");
$dir = $_SERVER["SERVER_NAME"] . substr($uri, 0, $pos + 1);

if (!isset($_SERVER["HTTPS"]) || strtolower($_SERVER["HTTPS"]) != "on") {
    $adresa = 'https://' . $dir . 'zaboravljena_lozinka.php';
    header("Location: $adresa");
}
?>
<html>
    <head>
        <title>Zaboravljena lozinka</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="naslov" content="Zaboravljena lozinka">
        <meta name="kljucne_rijeci" content="FOI,Web DiP">
        <meta name="datum_izrade" content="07.03.2017.">  
        <meta name="autor" content="Nikola Fluks">
        <link rel="stylesheet" media="screen" type="text/css" href="css/nikfluks.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/nikfluksJquery.js"></script>
    </head>

    <body>
        <?php
        if (isset($_POST["btnZaboravljenaLozinka"])) {
            $sql = "SELECT korisnik_id,email FROM korisnik WHERE email='" . $_POST["zaboravljenaLozEmail"] . "'";
            $rezultat = $dbc->selectDB($sql);
            $red = $rezultat->fetch_array();

            if (!empty($red)) {
                $skripta = substr($uri, $pos + 1);
                $kor_id = $red["korisnik_id"];

                $prviRazmak = strpos($sql, " ");
                $tipUpita = substr($sql, 0, $prviRazmak);

                dnevnik_zapis($tipUpita, $skripta, $kor_id);

                $velikaSlova = "QWERTZUIOPASDFGHJKLYXCVBNM";
                $malaSlova = "qwertzuiopasdfghjklyxcvbnm";
                $brojevi = "0123456789";

                $novaLozinka = "";
                for ($i = 0; $i < 5; $i++) {
                    switch ($i) {
                        case 0:
                            $n = mt_rand(0, strlen($velikaSlova) - 1);
                            $novaLozinka .= $velikaSlova[$n];
                            break;
                        case 1:
                            $n = mt_rand(0, strlen($velikaSlova) - 1);
                            $novaLozinka .= $velikaSlova[$n];
                            break;
                        case 2:
                            $n = mt_rand(0, strlen($malaSlova) - 1);
                            $novaLozinka .= $malaSlova[$n];
                            break;
                        case 3:
                            $n = mt_rand(0, strlen($malaSlova) - 1);
                            $novaLozinka .= $malaSlova[$n];
                            break;
                        case 4:
                            $n = mt_rand(0, strlen($brojevi) - 1);
                            $novaLozinka .= $brojevi[$n];
                            break;
                    }
                }
                echo $novaLozinka . "<br>";

                $salt = sha1(time());
                $kriptirana_lozinka = sha1($salt . "--" . $novaLozinka);

                $sql = "UPDATE korisnik SET lozinka='$novaLozinka', kriptirana_lozinka='$kriptirana_lozinka' WHERE korisnik_id='$kor_id'";
                $uspjeh = $dbc->ostaliUpitiDB($sql);

                $prviRazmak2 = strpos($sql, " ");
                $tipUpita2 = substr($sql, 0, $prviRazmak2);

                dnevnik_zapis($tipUpita2, $skripta, $kor_id);
                dnevnik_zapis("Promjena lozinke", $skripta, $kor_id);

                $mail_to = $red["email"];
                $mail_from = "From: WebDiP2016x038@foi.hr";
                $mail_subject = "Zaboravljena lozinka";
                $mail_body = "Vaša nova lozinka: " . $novaLozinka;

                if (mail($mail_to, $mail_subject, $mail_body, $mail_from)) {
                    echo("Poslana poruka za: '$mail_to'!");
                } else {
                    echo("Problem kod poruke za: '$mail_to'!");
                }

                $ispravnoEmail = "Nova lozinka je poslana na zadanu email adresu!";
            } else {
                $greskaEmail = "Email ne postoji!";
            }
        }
        $dbc->zatvoriDB();
        ?>
        <header class="zaboravljenaLozinka">
            <h1>Zaboravljena lozinka</h1>

            <form method="POST" name="uvjeti"
                  action="<?php echo $_SERVER["PHP_SELF"]; ?>">
                <label id="zaboravljenaLozinkaLabel" for="zaboravljenaLozEmail">Vaša email adresa:</label>
                <input id="zaboravljenaLozEmail" type="text" name="zaboravljenaLozEmail" placeholder="Email adresa" size="25"
                <?php
                if (isset($_POST["zaboravljenaLozEmail"])) {
                    echo "value='" . $_POST["zaboravljenaLozEmail"] . "'";
                }
                ?>><br>

                <input type="submit" class="gumb" id="btnZaboravljenaLozinka" name="btnZaboravljenaLozinka" value="Generiraj novu lozinku">
            </form>
            
            <div id="zaboravljenaLozinka">
                <?php
                if (isset($greskaEmail)) {
                    echo $greskaEmail;
                } else if (isset($ispravnoEmail)) {
                    echo '<span style="color:blue;font-size:20px;">"' . $ispravnoEmail . '"</span>';
                }
                ?>
            </div>
        </header>
        
        <nav id="prijava_nav">
            <ul>
                <li><a href="privatno/korisnici.php">Korisnici</a></li>
                <li><a href="index.php">Početna</a></li>
                <li><a href="registracija.php">Registracija</a></li>

                <?php
                if (!isset($_SESSION["korisnik"])) {
                    echo '<li><a href="prijava.php">Prijava</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="konfiguracija.php">Konfiguracija</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="dnevnik.php">Dnevnik</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="otkljucavanje_korisnika.php">Otključavanje korisnika</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="aktivacija.php">Aktivacija</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"])) {
                    echo '<li><a href="odjava.php">Odjava</a></li>';
                }
                ?>
                <li><a href="uvjeti_koristenja.php">Uvjeti korištenja</a></li>
            </ul> 
        </nav>

        <footer>
            <p>Vrijeme potrebno za rješavanje aktivnog dokumenta: 3h </p>
            <a href="https://validator.w3.org/nu/?doc=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Fdnevnik.php" target="html5">
                <figure id="html5">
                    <img src="slike/HTML5.png" alt="HTML5" width="100" height="100">
                    <figcaption>HTML5 validator</figcaption>
                </figure>
            </a>
            <a href="https://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Fcss%2Fnikfluks.css&profile=css3&usermedium=all&warning=1&vextwarning=&lang=en" target="css3">
                <figure id="css3">
                    <img src="slike/CSS3.png" alt="CSS3" width="100" height="100">
                    <figcaption>CSS3 validator</figcaption>
                </figure> 
            </a>
            <address id="mail"><strong>Kontakt: <a href="mailto:nikfluks@foi.hr">Nikola Fluks</a></strong></address>
            <p><small>&copy; 2017. N. Fluks </small></p>
        </footer>
    </body>
</html>
