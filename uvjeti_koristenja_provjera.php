<?php

include_once("aplikacijskiOkvir.php");

//ako kuki ne postoji ili ako je proslo 3 dana s pomakom za pomak_vremena
if (!isset($_COOKIE[$cookieIme]) || time() > ($_COOKIE[$cookieIme] - (dohvatiStupac("pomak_vremena") * 60 * 60))) {
    if (isset($_POST["prihvacamUvjete"]) && isset($_POST["prihvacam"])) {
        setcookie($cookieIme, $cookieIstjece, $cookieIstjece, $cookiePath);
        header("Location: index.php");
    } else {
        header("Location: uvjeti_koristenja.php");
    }
} 
$dbc->zatvoriDB();
?>







