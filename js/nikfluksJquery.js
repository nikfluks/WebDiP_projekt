$(document).ready(function () {
    //registracija
    var ime = $('#ime');
    var prezime = $('#prezime');
    var korIme = $('#korIme');
    var email = $('#email');
    var lozinka = $('#lozinka');
    var lozinka2 = $('#lozinka2');

    $("#lozinka2").attr("disabled", true);

    ime.blur(provjeriIme);
    prezime.blur(provjeriPrezime);
    korIme.blur(provjeriKorIme);
    email.blur(provjeriEmail);
    lozinka.blur(provjeriLozinku);
    lozinka2.blur(provjeriPonovljenuLozinku);

    lozinka.change(ocistiPonovljenuLozinku);

    //stranicenje, navigacija
    if ($('table.tablicaZaStranicenje').length) {
        stranicenje();
    }
    $('.broj_str').click(prikaziRedove);

    //prijava
    var korImePrijava = $('#korImePrijava');
    korImePrijava.blur(provjeriKorImePrijava);

    //zaboravljena lozinka
    var zabLozEmail = $('#zaboravljenaLozEmail');
    zabLozEmail.keyup(provjeriZabLozEmail);

    //korisnici - ajax
    var korImeFilter = $('#korImeFilter');
    korImeFilter.keyup(provjeriKorImeFilterAjax);

    var tipFilter = $('#tipFilter');
    tipFilter.keyup(provjeriTipFilterAjax);

    //otkljucavanje_korisnika
    var emailFilter = $('#emailFilter');
    emailFilter.keyup(provjeriEmailFilterAjax);

    var brPrijava = $('#brPrijava');
    brPrijava.keyup(provjeriBrPrijavaFilterAjax)

    //dnevnik
    var korImeDnevnikFilter = $('#korImeDnevnikFilter');
    korImeDnevnikFilter.keyup(provjeriKorImeDnevnikFilterAjax);
    
    var radnjaFilter = $('#radnjaFilter');
    radnjaFilter.keyup(provjeriRadnjaDnevnikFilterAjax);

});

function provjeriRadnjaDnevnikFilterAjax() {
    var radnja = $('#radnjaFilter');
    var radnjaVrij = $('#radnjaFilter').val();

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "ajax_RadnjaDnevnik.php",
        data: 'radnjaVrij=' + radnjaVrij,
        cache: false,
        timeout: 1000,
        success: function (json) {
            var redak = '';

            $.each(json, function (kljuc, vr) {
                redak += '<tr>';
                redak += '<td>' + vr.sakupljeni + '</td>';
                redak += '<td>' + vr.potroseni + '</td>';
                redak += '<td>' + vr.datum + '</td>';
                redak += '<td>' + vr.vrijeme + '</td>';
                redak += '<td>' + vr.radnja + '</td>';
                redak += '<td>' + vr.adresa + '</td>';
                redak += '<td>' + vr.skripta + '</td>';
                redak += '<td>' + vr.preglednik + '</td>';
                redak += '<td>' + vr.korIme + '</td>';
                redak += '<td>' + vr.akcija + '</td>';
                redak += '</tr>\n';

            });
            $('.tablicaZaStranicenje').find('tbody tr:has(td)').hide();
            $('.tablicaZaStranicenje').append(redak);

            if (!($.isEmptyObject(json))) {
                isprazniGreskeKorisnici(radnja);
            } else {
                upisiGreskuKorisnici(radnja);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("ajax status: " + textStatus + " greska: " + errorThrown);
        }
    });
}

function provjeriKorImeDnevnikFilterAjax() {
    var korImeDnevnik = $('#korImeDnevnikFilter');
    var korImeDnevnikVrij = $('#korImeDnevnikFilter').val();

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "ajax_KorImeDnevnik.php",
        data: 'korImeDnevnikVrij=' + korImeDnevnikVrij,
        cache: false,
        timeout: 1000,
        success: function (json) {
            var redak = '';

            $.each(json, function (kljuc, vr) {
                redak += '<tr>';
                redak += '<td>' + vr.sakupljeni + '</td>';
                redak += '<td>' + vr.potroseni + '</td>';
                redak += '<td>' + vr.datum + '</td>';
                redak += '<td>' + vr.vrijeme + '</td>';
                redak += '<td>' + vr.radnja + '</td>';
                redak += '<td>' + vr.adresa + '</td>';
                redak += '<td>' + vr.skripta + '</td>';
                redak += '<td>' + vr.preglednik + '</td>';
                redak += '<td>' + vr.korIme + '</td>';
                redak += '<td>' + vr.akcija + '</td>';
                redak += '</tr>\n';

            });
            $('.tablicaZaStranicenje').find('tbody tr:has(td)').hide();
            $('.tablicaZaStranicenje').append(redak);

            if (!($.isEmptyObject(json))) {
                isprazniGreskeKorisnici(korImeDnevnik);
            } else {
                upisiGreskuKorisnici(korImeDnevnik);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("ajax status: " + textStatus + " greska: " + errorThrown);
        }
    });
}

function provjeriBrPrijavaFilterAjax() {
    var brPrijava = $('#brPrijava');
    var brPrijavaVrij = $('#brPrijava').val();

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "ajax_BrojPrijavaOtkljucavanje.php",
        data: 'brPrijavaVrij=' + brPrijavaVrij,
        cache: false,
        success: function (json) {
            var redak = '';

            $.each(json, function (kljuc, vr) {
                redak += '<tr>';
                redak += "<td><input type='radio' id=" + parseInt(vr.id) + " name='otkljBlokRadio' value=" + parseInt(vr.id) + " /></td>";
                redak += '<td>' + vr.ime + '</td>';
                redak += '<td>' + vr.prezime + '</td>';
                redak += '<td>' + vr.korIme + '</td>';
                redak += '<td>' + vr.email + '</td>';
                redak += '<td>' + vr.brPrijava + '</td>';
                redak += '</tr>\n';

            });
            $('.tablicaZaStranicenje').find('tbody tr:has(td)').hide();
            $('.tablicaZaStranicenje').append(redak);

            if (!($.isEmptyObject(json))) {
                isprazniGreskeKorisnici(brPrijava);
            } else {
                upisiGreskuKorisnici(brPrijava);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("ajax status: " + textStatus + " greska: " + errorThrown);
        }
    });
}

function provjeriEmailFilterAjax() {
    var emailFilter = $('#emailFilter');
    var emailFilterVrij = $('#emailFilter').val();

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "ajax_EmailOtkljucavanje.php",
        data: 'emailFilterVrij=' + emailFilterVrij,
        cache: false,
        success: function (json) {
            var redak = '';

            $.each(json, function (kljuc, vr) {
                redak += '<tr>';
                redak += "<td><input type='radio' id=" + parseInt(vr.id) + " name='otkljBlokRadio' value=" + parseInt(vr.id) + " /></td>";
                redak += '<td>' + vr.ime + '</td>';
                redak += '<td>' + vr.prezime + '</td>';
                redak += '<td>' + vr.korIme + '</td>';
                redak += '<td>' + vr.email + '</td>';
                redak += '<td>' + vr.brPrijava + '</td>';
                redak += '</tr>\n';

            });
            $('.tablicaZaStranicenje').find('tbody tr:has(td)').hide();
            $('.tablicaZaStranicenje').append(redak);

            if (!($.isEmptyObject(json))) {
                isprazniGreskeKorisnici(emailFilter);
            } else {
                upisiGreskuKorisnici(emailFilter);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("ajax status: " + textStatus + " greska: " + errorThrown);
        }
    });
}


function provjeriTipFilterAjax() {
    var tipFilter = $('#tipFilter');
    var tipFilterVrij = $('#tipFilter').val();

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "../ajax_TipKorisnici.php",
        data: 'tipFilterVrij=' + tipFilterVrij,
        cache: false,
        success: function (json) {
            var redak = '';

            $.each(json, function (kljuc, vr) {
                redak += '<tr>';
                redak += '<td>' + vr.ime + '</td>';
                redak += '<td>' + vr.prezime + '</td>';
                redak += '<td>' + vr.email + '</td>';
                redak += '<td>' + vr.korIme + '</td>';
                redak += '<td>' + vr.lozinka + '</td>';
                redak += '<td>' + vr.tip + '</td>';
                redak += '</tr>\n';

            });
            $('.tablicaZaStranicenje').find('tbody tr:has(td)').hide();
            $('.tablicaZaStranicenje').append(redak);

            if (!($.isEmptyObject(json))) {
                isprazniGreskeKorisnici(tipFilter);
            } else {
                upisiGreskuKorisnici(tipFilter);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("ajax status: " + textStatus + " greska: " + errorThrown);
        }
    });
}

function provjeriKorImeFilterAjax() {
    var korImeFilter = $('#korImeFilter');
    var korImeFilterVrij = $('#korImeFilter').val();

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "../ajax_KorImeKorisnici.php",
        data: 'korImeFilterVrij=' + korImeFilterVrij,
        cache: false,
        success: function (json) {
            var redak = '';

            $.each(json, function (kljuc, vr) {
                redak += '<tr>';
                redak += '<td>' + vr.ime + '</td>';
                redak += '<td>' + vr.prezime + '</td>';
                redak += '<td>' + vr.email + '</td>';
                redak += '<td>' + vr.korIme + '</td>';
                redak += '<td>' + vr.lozinka + '</td>';
                redak += '<td>' + vr.tip + '</td>';
                redak += '</tr>\n';

            });
            $('.tablicaZaStranicenje').find('tbody tr:has(td)').hide();
            $('.tablicaZaStranicenje').append(redak);

            if (!($.isEmptyObject(json))) {
                isprazniGreskeKorisnici(korImeFilter);
            } else {
                upisiGreskuKorisnici(korImeFilter);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("ajax status: " + textStatus + " greska: " + errorThrown);
        }
    });
}

function isprazniGreskeKorisnici(input) {
    $(input).removeClass("greska_border");
    $(input).addClass("ispravno_border");
}

function upisiGreskuKorisnici(input) {
    $(input).removeClass("ispravno_border");
    $(input).addClass("greska_border");
}


function provjeriZabLozEmailAjax() {
    var email = $('#zaboravljenaLozEmail');
    var emailVrij = $('#zaboravljenaLozEmail').val();

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "ajax_ZabLozEmail.php",
        data: 'email=' + emailVrij,
        cache: false,
        success: function (json) {
            if (!($.isEmptyObject(json))) {
                isprazniGreskeZabLoz(email);
            } else {
                upisiGreskuZabLoz("Ne postoji!", email);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("ajax status: " + textStatus + " greska: " + errorThrown);
        }
    });
}

function isprazniGreskeZabLoz(input) {
    var greskeZabLoz = $('#zaboravljenaLozinka');
    greskeZabLoz.empty();
    $(input).removeClass("greska_border");
    $(input).addClass("ispravno_border");
}

function upisiGreskuZabLoz(greska, input) {
    var greskeZabLoz = $('#zaboravljenaLozinka');
    greskeZabLoz.text(greska);
    $(input).removeClass("ispravno_border");
    $(input).addClass("greska_border");
}

function provjeriZabLozEmail() {
    var emailVrij = $(this).val();
    var email = $(this);

    if (emailVrij.length == 0) {
        upisiGreskuZabLoz("Email nije unesen!", email);
    } else if (predlozakSpecZnak.test(emailVrij)) {
        upisiGreskuZabLoz("Email sadrži specijalni znak!", email);
    } else if (!predlozakEmail.test(emailVrij)) {
        upisiGreskuZabLoz("Email nije formata nesto@nesto.nesto!", email);
    } else {
        provjeriZabLozEmailAjax();
    }
}

function provjeriKorImePrijavaAjax() {
    var korIme = $('#korImePrijava');
    var korImeVrij = $('#korImePrijava').val();

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "ajax_KorImePrijavaReg.php",
        data: 'username=' + korImeVrij,
        cache: false,
        success: function (json) {
            if (!($.isEmptyObject(json))) {
                isprazniGreskePrijava(korIme);
            } else {
                upisiGreskuPrijava("Ne postoji!", korIme);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("ajax status: " + textStatus + " greska: " + errorThrown);
        }
    });
}

function isprazniGreskePrijava(input) {
    var greskePrijava = $('#greskePrijava');
    greskePrijava.empty();
    $(input).removeClass("greska_border");
    $(input).addClass("ispravno_border");
}

function upisiGreskuPrijava(greska, input) {
    var greskePrijava = $('#greskePrijava');
    greskePrijava.text(greska);
    $(input).removeClass("ispravno_border");
    $(input).addClass("greska_border");
}

function provjeriKorImePrijava() {
    var korImeVrij = $(this).val();
    var korIme = $(this);

    if (korImeVrij.length == 0) {
        upisiGreskuPrijava("Korisničko ime nije uneseno!", korIme);
    } else if (predlozakSpecZnak.test(korImeVrij)) {
        upisiGreskuPrijava("Specijalni znak!", korIme);
    } else {
        provjeriKorImePrijavaAjax();
    }
}

function stranicenje() {
    var brojRedovaUkupno = $('table.tablicaZaStranicenje').find('tbody tr:has(td)').length;
    var brojRedovaPoStranici = parseInt($('#brojRedovaPoStranici').val());

    console.log($('#brojRedovaPoStranici').val());

    var brojStranica = Math.ceil(brojRedovaUkupno / brojRedovaPoStranici);
    var $straniceDiv = $('<div id="straniceDiv"></div>');

    var brojStranicaPlus4 = brojStranica + 4;//+4 -> prva prethodna sljedeca zadnja

    for (i = 1; i <= brojStranicaPlus4; i++) {
        if (i == 1) {
            $('<span class="broj_str">&nbsp;<<&nbsp;</span>').appendTo($straniceDiv);
        } else if (i == 2) {
            $('<span class="broj_str">&nbsp;<&nbsp;</span>').appendTo($straniceDiv);
        } else if (i == brojStranicaPlus4 - 1) {
            $('<span class="broj_str">&nbsp;>&nbsp;</span>').appendTo($straniceDiv);
        } else if (i == brojStranicaPlus4) {
            $('<span class="broj_str">&nbsp;>>&nbsp;</span>').appendTo($straniceDiv);
        } else {
            $('<span class="broj_str">&nbsp;' + (i - 2) + '&nbsp;</span>').appendTo($straniceDiv);
        }
    }
    $straniceDiv.appendTo('div.margina4040');

    $('span.broj_str:nth-child(3)').addClass('active').siblings().removeClass('active');

    $('span.broj_str').hover(
            function () {
                $(this).addClass('focus');
            },
            function () {
                $(this).removeClass('focus');
            }
    );

    $('table.tablicaZaStranicenje').find('tbody tr:has(td)').hide();

    var red = $('table.tablicaZaStranicenje tbody tr:has(td)');

    for (var i = 0; i < brojRedovaPoStranici; i++) {
        $(red[i]).show();
    }
}

var poljeInd = [1];//na pocetku sam na 1. str

function prikaziRedove() {
    var brojRedovaUkupno = $('table.tablicaZaStranicenje').find('tbody tr:has(td)').length;
    var brojRedovaPoStranici = parseInt($('#brojRedovaPoStranici').val());
    var brojStranica = Math.ceil(brojRedovaUkupno / brojRedovaPoStranici);

    var red = $('table.tablicaZaStranicenje tbody tr:has(td)');

    $('table.tablicaZaStranicenje').find('tbody tr:has(td)').hide();

    var ind = 0;

    if ($(this).text().trim() == "<<") {//uvijek bacam na pocetak
        ind = 1;
    } else if ($(this).text().trim() == "<") {//idem za 1 manje
        if (poljeInd[poljeInd.length - 1] == 1) {//ako nisam na 1. str
            ind = 1;
        } else {
            ind = poljeInd[poljeInd.length - 1] - 1;
        }
    } else if ($(this).text().trim() == ">") {//idemo za 1 vise
        if (poljeInd[poljeInd.length - 1] == brojStranica) {//ako nisam na zadnji str
            ind = brojStranica;
        } else {
            ind = poljeInd[poljeInd.length - 1] + 1;
        }
    } else if ($(this).text().trim() == ">>") {//uvijek bacam na kraj
        ind = brojStranica;
    } else {
        ind = parseInt($(this).text().trim());
    }

    poljeInd.push(ind);

    $('span.broj_str:nth-child(' + (ind + 2) + ')').addClass('active').siblings().removeClass('active');

    var pocetak = (poljeInd[poljeInd.length - 1] - 1) * brojRedovaPoStranici;
    var kraj = poljeInd[poljeInd.length - 1] * brojRedovaPoStranici;

    for (var i = pocetak; i < kraj; i++)
    {
        $(red[i]).show();
    }
}

//1 provjera korisničkog imena - AJAX
function provjeriKorImeAjax() {
    var korIme = $('#korIme');
    var korImeVrij = $('#korIme').val();

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "ajax_KorImePrijavaReg.php",
        data: 'username=' + korImeVrij,
        cache: false,
        success: function (json) {
            if (!($.isEmptyObject(json))) {
                //$.each(json, function (k, u) {
                upisiGresku("Korisničko ime zauzeto!", korIme);
                //});
            } else {
                isprazniGreskeReg(korIme);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("ajax status: " + textStatus + " greska: " + errorThrown);
        }
    });
}

//3 Validacija na strani klijenta
var predlozakSpecZnak = new RegExp(/[(){}\'!#\"\\/]/);
var predlozakKorIme = new RegExp(/^[A-ZČĆŠĐŽa-zčćšđž0-9]{3,}$/);
var predlozakEmail = new RegExp(/^[A-ZČĆŠĐŽa-zčćšđž0-9]+@\w+\.\w+$/);
var predlozakLozinka = new RegExp(/^(?=(.*[A-Z]){2,})(?=(.*[a-z]){2,})(?=(.*[0-9]){1,})[^\s]{5,15}$/);

function isprazniGreskeReg(input) {
    var greskeReg = $('#greskeReg');
    greskeReg.empty();
    $(input).removeClass("greska_border");
    $(input).addClass("ispravno_border");
}

function upisiGresku(greska, input) {
    var greskeReg = $('#greskeReg');
    greskeReg.text(greska);
    $(input).removeClass("ispravno_border");
    $(input).addClass("greska_border");
}

function ocistiPonovljenuLozinku() {
    var loz2 = $('#lozinka2');
    loz2.removeClass("ispravno_border");
    loz2.removeClass("greska_border");
    loz2.val("");
}

function provjeriIme() {
    var imeVrij = $('#ime').val();
    var ime = $("#ime");

    if (imeVrij.length == 0) {
        upisiGresku("Ime nije uneseno!", ime);
    } else if (predlozakSpecZnak.test(imeVrij)) {
        upisiGresku("Ime sadrži specijalni znak!", ime);
    } else {
        isprazniGreskeReg(ime);
    }
}

function provjeriPrezime() {
    var prezimeVrij = $('#prezime').val();
    var prezime = $('#prezime');

    if (prezimeVrij.length == 0) {
        upisiGresku("Prezime nije uneseno!", prezime);
    } else if (predlozakSpecZnak.test(prezimeVrij)) {
        upisiGresku("Prezime sadrži specijalni znak!", prezime);
    } else {
        isprazniGreskeReg(prezime);
    }
}

function provjeriKorIme() {
    var korImeVrij = $(this).val();
    var korIme = $(this);

    console.log(korImeVrij);

    if (korImeVrij.length == 0) {
        upisiGresku("Korisničko ime nije uneseno!", korIme);
    } else if (predlozakSpecZnak.test(korImeVrij)) {
        upisiGresku("Korisničko ime sadrži specijalni znak!", korIme);
    } else if (!predlozakKorIme.test(korImeVrij)) {
        upisiGresku("Korisničko ime mora biti duljine minimalno 3 znaka!", korIme);
    } else {
        provjeriKorImeAjax();
    }
}

function provjeriEmail() {
    var emailVrij = $('#email').val();
    var email = $('#email');

    if (emailVrij.length == 0) {
        upisiGresku("Email nije unesen!", email);
    } else if (predlozakSpecZnak.test(emailVrij)) {
        upisiGresku("Email sadrži specijalni znak!", email);
    } else if (!predlozakEmail.test(emailVrij)) {
        upisiGresku("Email nije formata nesto@nesto.nesto!", email);
    } else {
        isprazniGreskeReg(email);
    }
}

function provjeriLozinku() {
    var lozinkaVrij = $('#lozinka').val();
    var lozinka = $('#lozinka');
    var ponLozinka = $("#lozinka2");
    var lozinkaIspravna = false;

    if (lozinkaVrij.length == 0) {
        upisiGresku("Lozinka nije unesena!", lozinka);
    } else if (predlozakSpecZnak.test(lozinkaVrij)) {
        upisiGresku("Lozinka sadrži specijalni znak!", lozinka);
    } else if (!predlozakLozinka.test(lozinkaVrij)) {
        upisiGresku("Lozinka mora sadržavati barem 2 velika i 2 mala slova, 1 broj i duljina 5-15 znakova, bez razmaka!", lozinka);
    } else {
        isprazniGreskeReg(lozinka);
        lozinkaIspravna = true;
    }

    if (lozinkaIspravna) {
        ponLozinka.removeAttr("disabled");
    } else {
        ponLozinka.val("");
        ponLozinka.attr("disabled", true);
    }
}

function provjeriPonovljenuLozinku() {
    var ponLozinkaVrij = $('#lozinka2').val();
    var ponlozinka = $('#lozinka2');

    if (ponLozinkaVrij.length == 0) {
        upisiGresku("Ponovljena lozinka nije unesena!", ponlozinka);
    } else if (predlozakSpecZnak.test(ponLozinkaVrij)) {
        upisiGresku("Ponovljena lozinka sadrži specijalni znak!", ponlozinka);
    } else if (ponLozinkaVrij != $('#lozinka').val()) {
        upisiGresku("Lozinka i ponovljena lozinka se ne podudaraju!", ponlozinka);
    } else {
        isprazniGreskeReg(ponlozinka);
    }
}



