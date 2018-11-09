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
    $adresa = 'https://' . $dir . 'prijava.php';
    header("Location: $adresa");
}

$cookieKorIme = "KorisnickoIme";
$cookieKorImeVrij = "";

$cookieTokenIme = "Token";
?>

<html>
    <head>
        <title>Prijava</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="naslov" content="Prijava">
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
        if (isset($_POST["posaljiPrijavu"])) {
            $kor_ime = $_POST["korImePrijava"];
            $lozinka = $_POST["lozPrijava"];

            $sql = "SELECT * FROM korisnik WHERE `korisnicko_ime`='$kor_ime'";
            $rezultat = $dbc->selectDB($sql);
            $red = $rezultat->fetch_array();

            if (empty($kor_ime)) {
                //echo "Korisničko ime nije uneseno!";
            } else if ($red["korisnicko_ime"] == $kor_ime) {
                // echo "Korisnik postoji!";

                $cookieKorImeVrij = $kor_ime;

                $skripta = substr($uri, $pos + 1);
                $kor_id = dohvatiKorisnikId($kor_ime);

                $prviRazmak = strpos($sql, " ");
                $tipUpita = substr($sql, 0, $prviRazmak);

                dnevnik_zapis($tipUpita, $skripta, $kor_id);

                if ($red["aktiviran"] == 0) {
                   // echo "Korisnik nije aktiviran pa se ne može prijaviti!";
                    dnevnik_zapis("Neuspješna prijava: nije aktiviran", $skripta, $kor_id);

                    $greskaAktiviran = "Niste aktivirani!";
                } else if ($red["broj_pogresnih_prijava"] >= dohvatiStupac("broj_neuspjesnih_prijava")) {
                    //echo "Korisnik je zaključan pa se ne može prijaviti!";
                    dnevnik_zapis("Neuspješna prijava: zaključan", $skripta, $kor_id);

                    $greskaZakljucan = "Zaključani ste!";
                } else if ($red["lozinka"] != $lozinka) {
                    //echo "Pogrešna lozinka!<br>";
                    $brojPogresnihUnosa = $red["broj_pogresnih_prijava"] + 1;
                    //echo "Pogrešno ste se prijavili " . $brojPogresnihUnosa . ". put zaredom!<br>";

                    $greskaLozinka = "Kriva lozinka: " . $brojPogresnihUnosa . "";

                    $sql = "UPDATE `korisnik` SET `broj_pogresnih_prijava`='$brojPogresnihUnosa'  WHERE `korisnicko_ime`='$kor_ime'";
                    $uspjeh = $dbc->ostaliUpitiDB($sql);

                    $prviRazmak = strpos($sql, " ");
                    $tipUpita = substr($sql, 0, $prviRazmak);

                    dnevnik_zapis($tipUpita, $skripta, $kor_id);
                    dnevnik_zapis("Neuspješna prijava: pogrešna lozinka", $skripta, $kor_id);
                } else {
                    if ($red["dvorazinska_prijava"] == 0) {
                        //echo "Prijavili ste se!";
                        $sql = "UPDATE `korisnik` SET `broj_pogresnih_prijava`='0'  WHERE `korisnicko_ime`='$kor_ime'";
                        $uspjeh = $dbc->ostaliUpitiDB($sql);

                        $prviRazmak = strpos($sql, " ");
                        $tipUpita = substr($sql, 0, $prviRazmak);

                        dnevnik_zapis($tipUpita, $skripta, $kor_id);
                        dnevnik_zapis("Uspješna prijava", $skripta, $kor_id);

                        setcookie($cookieKorIme, $cookieKorImeVrij);

                        $tipKorisnika = $red["tip_korisnika_id"];
                        $kor_id = $red["korisnik_id"];
                        Sesija::kreirajKorisnika($kor_ime, $tipKorisnika, $kor_id);
                        //echo "Kreiram sesiju!";
                        header("Location: index.php");
                    } else {
                        echo "Imas prijavu u 2 koraka!<br>";
                        if ($_POST["tokenDaNe"] == 1) {//korisnik hoce novi token
                            $token = mt_rand(1000, 9999);

                            $pomak_vremena = dohvatiStupac("pomak_vremena");
                            $cookieTokenIstjece = (time() + $pomak_vremena * 60 * 60) + (60 * 5);
                            setcookie($cookieTokenIme, $cookieTokenIstjece, $cookieTokenIstjece);

                            //echo "Slanje maila! <br>";
                            $mail_to = $red["email"];
                            $mail_from = "From: WebDiP2016x038@foi.hr";
                            $mail_subject = "Token";
                            $mail_body = "Vaš token: " . $token;

                            $sql = "UPDATE `korisnik` SET `token`='$token'  WHERE `korisnicko_ime`='$kor_ime'";
                            $uspjeh = $dbc->ostaliUpitiDB($sql);

                            $prviRazmak = strpos($sql, " ");
                            $tipUpita = substr($sql, 0, $prviRazmak);

                            dnevnik_zapis($tipUpita, $skripta, $kor_id);

                            echo $mail_body . "<br>";

                            if (mail($mail_to, $mail_subject, $mail_body, $mail_from)) {
                                echo("Poslana poruka za: '$mail_to'!");
                            } else {
                                echo("Problem kod poruke za: '$mail_to'!");
                            }
                        } else {//korisnik nece novi token
                            if ($red["token"] == null) {
                               // echo "Nemate kreirani token, morate ga kreirati!";

                                $nepostojeciToken = "Nemate kreirani token!";
                            } elseif (!isset($_COOKIE[$cookieTokenIme]) || time() > ($_COOKIE[$cookieTokenIme] - (dohvatiStupac("pomak_vremena") * 60 * 60))) {
                                //echo "Token istekao!";
                                dnevnik_zapis("Neuspješna prijava: token istekao", $skripta, $kor_id);

                                $tokenIstekao = "Token istekao!";
                            } elseif ($red["token"] != $_POST["token"]) {
                                //echo "Pogrešan token!";
                                dnevnik_zapis("Neuspješna prijava: pogrešan token", $skripta, $kor_id);

                                $pogresanToken = "Pogrešan token!";
                            } else {
                                //echo "Prijavili ste se <br>";
                                $sql = "UPDATE `korisnik` SET `broj_pogresnih_prijava`='0'  WHERE `korisnicko_ime`='$kor_ime'";
                                $uspjeh = $dbc->ostaliUpitiDB($sql);

                                $prviRazmak = strpos($sql, " ");
                                $tipUpita = substr($sql, 0, $prviRazmak);

                                dnevnik_zapis($tipUpita, $skripta, $kor_id);
                                dnevnik_zapis("Uspješna prijava", $skripta, $kor_id);

                                setcookie($cookieKorIme, $cookieKorImeVrij);

                                $tipKorisnika = $red["tip_korisnika_id"];
                                $kor_id = $red["korisnik_id"];
                                Sesija::kreirajKorisnika($kor_ime, $tipKorisnika, $kor_id);
                                //echo "Kreiram sesiju!";
                                header("Location: index.php");
                            }
                        }
                    }
                }
            } else {
                //echo "Korisnik s unesenim korisničkim imenom ne postoji!";
            }
        }
        $dbc->zatvoriDB();
        ?>
        <header>
            <h1>Prijava</h1>
            <figure id="logoSlika">
                <img src="slike/logo.png" usemap="#mapa1" alt="FOI" width="400" height="200">
                <map name="mapa1">
                    <area href="index.php" alt="logo" shape="rect" coords="0,0,200,200" target="index" />
                    <area href="#korImeL" alt="logo" shape="rect" coords="200,0,400,200" />
                </map>
                <figcaption id="logoCap">Interaktivna slika</figcaption>
            </figure>
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

        <section class="prijava">
            <h2>Prijava</h2>
            <div id="greskePrijava" name="greskePrijava">
                <?php
                if (isset($greskaAktiviran)) {
                    echo $greskaAktiviran;
                } else if (isset($greskaZakljucan)) {
                    echo $greskaZakljucan;
                } else if (isset($greskaLozinka)) {
                    echo $greskaLozinka;
                } else if (isset($nepostojeciToken)) {
                    echo $nepostojeciToken;
                } else if (isset($tokenIstekao)) {
                    echo $tokenIstekao;
                } else if (isset($pogresanToken)) {
                    echo $pogresanToken;
                }
                if (isset($token)) {
                    echo "Token poslan na mail!";
                }
                ?>   
            </div>

            <form method="POST" name="prijava" id="prijava"
                  action="<?php echo $_SERVER["PHP_SELF"]; ?>" novalidate="">
                <label id="korImeL" for="korImePrijava">Korisničko ime:</label>
                <input type="text" id="korImePrijava" name="korImePrijava" size="20" placeholder="Korisničko ime" required="required" 
                <?php
                if (isset($_COOKIE[$cookieKorIme])) {
                    echo "value='" . $_COOKIE[$cookieKorIme] . "'";
                } else {
                    echo 'autofocus="autofocus"';
                }
                ?>><br>

                <label id="lozinkaL" for="lozPrijava">Lozinka:</label>
                <input type="password" id="lozPrijava" name="lozPrijava" size="20" placeholder="Lozinka" required="required" autofocus="autofocus"
                <?php
                if (isset($_COOKIE[$cookieKorIme])) {
                    echo 'autofocus="autofocus"';
                }
                ?>><br>
                <a id="zaboravljenaLozinkaLink" href="zaboravljena_lozinka.php"> Zaboravili ste lozinku?</a>

                <label id="tokenRadio" for="tokenRadioDa">Novi token?</label>
                <input type="radio" id="tokenRadioDa" name="tokenDaNe" value="1" />DA
                <label id="tokenNeBrisi" for="tokenRadioNe">Novi token?</label>
                <input type="radio" id="tokenRadioNe" name="tokenDaNe" value="0" checked="checked"/>NE<br>

                <label id="tokenL" for="token">Token:</label>
                <input type="text" id="token" name="token" placeholder="token" required="required" ><br>

                <label id="zapamtiMeRadio" for="zapamtiMeDa">Zapamti me:</label>
                <input type="radio" id="zapamtiMeDa" name="zapamtiMe" value="DA" />DA
                <label id="zapamtiMeLBrisi" for="zapamtiMeNe">Zapamti me:</label>
                <input type="radio" id="zapamtiMeNe" name="zapamtiMe" value="NE" checked="checked"/>NE<br>

                <input type="submit" class="gumb" id="posaljiPrijavu" name="posaljiPrijavu" value="Prijava">
                <a id="neReg" href="registracija.php"> Registracija</a>
            </form>
        </section>

        <div id="korisnici">
            <?php
            echo "Administrator -> korisničko ime: nikfluks, lozinka: NNnn11" . " - 2. razina<br>";
            echo "Moderator -> korisničko ime: nik123, lozinka: NIko12" . "<br>";
            echo "Obični korisnik -> korisničko ime: kedjut, lozinka: KKkk11" . "<br>";
            ?>
        </div>

        <footer>
            <p>Vrijeme potrebno za rješavanje aktivnog dokumenta: 3h </p>
            <a href="https://validator.w3.org/nu/?doc=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Fprijava.php" target="html5">
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
