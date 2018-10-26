<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnaSayfa.aspx.cs" Inherits="StajTakipProgrami.AnaSayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="css/AnaSayfa.css" type="text/css" rel="stylesheet" />

</head>

<body onload="getir() , tblgetir()">
    <div style="text-align: center">
        <label id="AdSoyadGetir"  width: 90%; color: blue"></label>
        <input type="image" value="Submit" src="images/icon.png" style="float:right; height: 15px; width: 15px" onclick="cikis()" />
        <hr style="border-color: blue" />
    </div>
    

    
    <br />
        
    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="İstediğin isimi ara.." title="Arama" />

    <table id="table_baslik">

    </table>

    
    <table id="table_sonuc">
       
    </table>
    <div id="sonuc">
    </div>
    <div id="sayfalama" style="text-align: center"></div>


    <div style="text-align: center">
        <input type="button" class="eklesilguncellebutton" id="myBtn" value="Stajyer Ekle" />
        <input type="button" class="eklesilguncellebutton" id="Silbtn" value="Stajyer Sil" />
        <input type="button" class="eklesilguncellebutton" id="updatebtn" value="Stajyer Güncelle" />
    </div>




    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <form method="post">
                <div class="input-group">
                    <h3>Stajyer Adı</h3>
                    <input type="text" class="txtinput" value="" id="txtstajyerekle1" />
                </div>
                <div class="input-group">
                    <label>Stajyer Soyadı</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerekle2" />
                </div>
                <div class="input-group">
                    <label>Stajyer Numarası</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerekle3" />
                </div>
                <div class="input-group">
                    <label>Başlangıç Tarihi</label>
                    <input type="date" class="txtinput" id="txtstajyerekle4" name="trip"
                        value="2018-07-22"
                        min="2018-01-01" max="2018-12-31" />
                </div>
                <div class="input-group">
                    <label>Bitiş Tarihi</label>
                    <input type="date" class="txtinput" id="txtstajyerekle5" name="trip"
                        value="2018-07-22"
                        min="2018-01-01" max="2018-12-31" />
                </div>
                <div class="input-group">
                    <label>Çalışma Günü</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerekle6" />
                </div>
                <div class="input-group">
                    <label>Stayer Sorumlusu</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerekle7" />
                </div>
                <div class="input-group">
                    <label>Staj Konusu</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerekle8" />
                </div>
                <div class="input-group">
                    <input type="button" class="btn" onclick="EkleStajyer(); return false" value="Kaydet" />
                    <input type="button" class="btn" onclick="div_kapat(); return false" value="İptal" />
                </div>
            </form>
        </div>
    </div>


    <div id="SilDiv" class="modalSil">
        <div class="modalSil-content">
            <span class="closeSil">&times;</span>

            <form method="post">
                <div class="input-group">
                    <h3>Stajyer No</h3>
                    <input type="text" class="txtinput" value="" id="txtstajyersil1" />
                </div>
                <div class="input-group">
                    <input type="button" class="btn" onclick="SilStajyer(); return false" value="Kaydet" />
                    <input type="button" class="btn" onclick="div_kapat(); return false" value="İptal" />
                </div>

            </form>
        </div>
    </div>

    <div id="YorumDiv" class="modalYorum">
        <div class="modalYorum-content">
            <span class="closeYorum">&times;</span>

            <form class="form2" method="post">
                <div class="input-group">
                   <div id="myProgress">
                      <div id="myBar">10%</div>
                    </div>
                    <div>
                        <p id="demo"></p>
                    </div>
                        
                    </div>
               
            </form>
        </div>
    </div>
    <div id="updateDiv" class="modalupdate">
        <div class="modalupdate-content">
            <span class="closeupdate">&times;</span>

            <form method="post">
                <div class="input-group">
                    <label>Güncellemek İstediğiniz Stajyer Numarası :</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerguncelle0" />
                    <br />
                    <br />
                    <input type="button" class="btn" onclick="GuncelleGetir(); return false" value="Ara" />
                </div>
            </form>
            <form method="post" id="frmguncelle" style="display: none">


                <div class="input-group">
                    <label>Stajyer Numarası</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerguncelle3" disabled="disabled" />
                </div>
                <div class="input-group">
                    <label>Stajyer Adı</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerguncelle1" />
                </div>
                <div class="input-group">
                    <label>Stajyer Soyadı</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerguncelle2" />
                </div>

                <div class="input-group">
                    <label>Başlangıç Tarihi</label>
                    <input type="date" class="txtinput" id="txtstajyerguncelle4" name="trip"
                        value="2018-07-22"
                        min="2018-01-01" max="2018-12-31" />
                </div>
                <div class="input-group">
                    <label>Bitiş Tarihi</label>
                    <input type="date" class="txtinput" id="txtstajyerguncelle5" name="trip"
                        value="2018-07-22"
                        min="2018-01-01" max="2018-12-31" />
                </div>
                <div class="input-group">
                    <label>Çalışma Günü</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerguncelle6" />
                </div>
                <div class="input-group">
                    <label>Stayer Sorumlusu</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerguncelle7" />
                </div>
                <div class="input-group">
                    <label>Staj Konusu</label>
                    <input type="text" class="txtinput" value="" id="txtstajyerguncelle8" />
                </div>
                <div class="input-group">
                    <input type="button" class="btn" onclick="GuncelleStajyer(); return false" value="Kaydet" />
                    <input type="button" class="btn" onclick="div_kapat(); return false" value="İptal" />
                </div>
            </form>
        </div>

    </div>
    
    <div id="comment" style="border-style: solid;">
        <h3 style="text-align:center; padding-top:5px; color:white">Stajyer Günlük Yorum Sayfası</h3>
        <div style="text-align:left; padding:10px;">
           Ad-Soyad :  <input type="text" class="txtinput" id="adsoyad" style="border: 1px solid #0f3e9f;" />
           <br />
            <br />
           StajyerNo:  <input type="text" class="txtinput" id="no" style="border: 1px solid #0f3e9f;" />
            <br />
            <br />
            
              Tarih:  <input type="date" class="txtinput" id="yorumtarih" name="trip" 
                        
                        min="2018-01-01" max="2019-12-31"/>
        </div>
        <div style="text-align:left; padding:10px;">
             Not: <textarea rows="6" cols="50" id="yorum"   class="txtareainput"  placeholder="Günlük Yorumunuzu buraya yazınız..."></textarea>
            <div style="text-align:right">
                <input type="button" class="eklesilguncellebutton" style="margin:15px;" value="Kaydet" id="YorumKaydet" onclick="YorumEkle()"/>
                <input type="button" class="eklesilguncellebutton" style="margin:15px;" value="Yorumlar" id="Yorumlar" onclick="Yorumlar()"/>
            </div>
        </div>
       
        
    </div>


</body>
</html>
<script type="text/javascript">

    function move() {
        var stajyer_no = 1;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "http://localhost:8939/Service1.svc/StajyerGetirNo",
            data: '{"StajyerNo": "' + stajyer_no + '"}',
            contentType: "application/json",
            success: function (data) {
                var day = 1000 * 60 * 60 * 24;
                var date1 = new Date(data.BaslangicTarihi);
                var date2 = new Date(data.BitisTarihi);
                var a = new Date();
                var diff = (a - date1.getTime()) / day;
                var diff2 = (date2.getTime() - a) / day;
                var toplamgun = 0;
                var kalangun = 0;

                for (var i = 0; i <= diff; i++) {
                    toplamgun++;
                    var xx = date1.getTime() + day * i;
                    var yy = new Date(xx);

                    console.log(yy.getFullYear() + "-" + (yy.getMonth() + 1) + "-" + yy.getDate());

                }
                for (var i = 0; i <= diff2; i++) {
                    kalangun++;
                    var xx = date2.getTime() + day * i;
                    var yy = new Date(xx);

                    console.log(yy.getFullYear() + "-" + (yy.getMonth() + 1) + "-" + yy.getDate());

                }
                console.log("Çalıştıgı gun" + toplamgun);
                console.log("Kalan gun" + kalangun);
                var calismasuresi = toplamgun + kalangun;
                console.log("calisma suresi : " + calismasuresi);
                console.log("kalangun:" + kalangun);
                
                var a;
                a = (100 * toplamgun) / calismasuresi; 

                var elem = document.getElementById("myBar");
                var width = 1;
                var id = setInterval(frame, 10);
                function frame() {
                    if (width >= a) {
                        clearInterval(id);
                    } else {
                        width++;
                        elem.style.width = width + '%';
                        elem.innerHTML = '%' + width * 1    + " tamamlandı";
                    }
                }

                $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "http://localhost:8939/Service1.svc/YorumGetir",
                data: '{"StajyerID": "' + 2 + '"}',
                processData: false,
                contentType: "application/json",
                success: function (response) {
                    var text = "<ul style='list-style-type: none'>";
                        var a = eval(response);
                        $.each(a, function () {
                            text += "<li>" + this.Tarih + "</li><li>" + this.Yorum + "</li>";
                            text += "<hr style='border - color: blue' />";
                            text += "<br>";
                    });
                    text += "</ul>";
                    document.getElementById("demo").innerHTML = text;
                },
                error: function (error) {
                    console.error("başarısız");
                }
            });

            },
            error: function (error) {
                console.error("başarısız");
            }
        });



    }
    function tarih_ayarla(tarih) {
        var tarih = new Date(tarih);
        var yil = tarih.getFullYear();
        var ay = tarih.getMonth();
        var gun = tarih.getDay();
        var saat = tarih.getHours();
        var dakika = tarih.getMinutes();
        var saniye = tarih.getSeconds();
        console.info(gun + "-" + ay + "-" + yil);

    }
    function bugun() {
        var zaman = new Date();
        var aylar = new Array('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');
        var tarih = ((zaman.getDate() < 10) ? "0" : "") + zaman.getDate();
        function cevir(number) {
            return (number < 1000) ? number + 1900 : number;
        }
        var bugun = (cevir(zaman.getYear()) + "-" + aylar[zaman.getMonth()] + "-" + tarih);
        return bugun;
    }
    function Temizle() {
        document.getElementById('txtstajyerguncelle0').value = "";
        document.getElementById('txtstajyerekle1').value = "";
        document.getElementById('txtstajyerekle2').value = "";
        document.getElementById('txtstajyerekle3').value = "";
        document.getElementById('txtstajyerekle4').value = "";
        document.getElementById('txtstajyerekle5').value = "";
        document.getElementById('txtstajyerekle6').value = "";
        document.getElementById('txtstajyerekle7').value = "";
        document.getElementById('txtstajyerekle8').value = "";
        document.getElementById('txtstajyerguncelle1').value = "";
        document.getElementById('txtstajyerguncelle2').value = "";
        document.getElementById('txtstajyerguncelle3').value = "";
        document.getElementById('txtstajyerguncelle4').value = "";
        document.getElementById('txtstajyerguncelle5').value = "";
        document.getElementById('txtstajyerguncelle6').value = "";
        document.getElementById('txtstajyerguncelle7').value = "";
        document.getElementById('txtstajyerguncelle8').value = "";
        document.getElementById('txtstajyersil1').value = "";

    }
    // Popup Stajyer Ekle
    var modal = document.getElementById('myModal');

    // Kipi açan düğmeyi al
    var btn = document.getElementById("myBtn");

    // Kipi kapatan <span> öğesini edinin
    var span = document.getElementsByClassName("close")[0];

    // Kullanıcı düğmeyi tıklattığında
    btn.onclick = function () {
        modal.style.display = "block";
    }

    // Kullanıcı <span> (x) düğmesini tıkladığında, popup
    span.onclick = function () {
        var r = confirm("İşlemi bitirmek istiyormusunuz?");
        if (r == true) {
            modal.style.display = "none";
            Temizle();
        }

    }

    // Kullanıcı modelden başka herhangi bir yeri tıklattıysa, onu kapatın.
    window.onclick = function (event) {
        if (event.target == modal || event.target == modalSil || event.target == modalupdate) {

            var r = confirm("İşlemi bitirmek istiyormusunuz?");
            if (r == true) {
                modal.style.display = "none";
                modalSil.style.display = "none";
                modalupdate.style.display = "none";
                Temizle();
            }
        }
    }

    // Popup Stajyer Sil
    var modalSil = document.getElementById('SilDiv');

    // Kipi açan düğmeyi al
    var Silbtn = document.getElementById("Silbtn");

    // Kipi kapatan <span> öğesini edinin
    var span = document.getElementsByClassName("closeSil")[0];

    // Kullanıcı düğmeyi tıklattığında
    Silbtn.onclick = function () {
        modalSil.style.display = "block";
    }

    // Kullanıcı <span> (x) düğmesini tıkladığında, popup
    span.onclick = function () {
        var r = confirm("İşlemi bitirmek istiyormusunuz?");
        if (r == true) {
            modalSil.style.display = "none";
            Temizle();
        }

    }


    // Popup Stajyer Sil
    var modalYorum = document.getElementById('YorumDiv');

    // Kipi açan düğmeyi al
    var Yorumac = document.getElementById("Yorumlar");

    // Kipi kapatan <span> öğesini edinin
    var span = document.getElementsByClassName("closeYorum")[0];

    // Kullanıcı düğmeyi tıklattığında
    Yorumac.onclick = function () {
        move();
        modalYorum.style.display = "block";
    }

    // Kullanıcı <span> (x) düğmesini tıkladığında, popup
    span.onclick = function () {
        var r = confirm("İşlemi bitirmek istiyormusunuz?");
        if (r == true) {
            modalYorum.style.display = "none";
            Temizle();
        }

    }


    // Popup Stajyer update
    var modalupdate = document.getElementById('updateDiv');

    // Kipi açan düğmeyi al
    var updatebtn = document.getElementById("updatebtn");

    // Kipi kapatan <span> öğesini edinin
    var span = document.getElementsByClassName("closeupdate")[0];

    // Kullanıcı düğmeyi tıklattığında
    updatebtn.onclick = function () {
        modalupdate.style.display = "block";
        $("#frmguncelle").hide();

    }


    // Kullanıcı <span> (x) düğmesini tıkladığında, popup
    span.onclick = function () {

        var r = confirm("İşlemi bitirmek istiyormusunuz?");
        if (r == true) {
            modalupdate.style.display = "none";
            Temizle();
        }
    }
    function myFunction() {
        var input, filter, table, tr, td, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("table_sonuc");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }


    function div_kapat() {
        modal.style.display = "none";
        modalSil.style.display = "none";
        modalupdate.style.display = "none";
        modalYorum.style.display = "none";
    }

    $(document).ready(function () {
        var urlParams2 = new URLSearchParams(window.location.search);
        $("#txtstajyerekle7").val(urlParams2.get('SorumluID'));

        $("#insert").click(function () {
            div_kapat();
            $("#insert_div").show();
        });

        $("#delete").click(function () {
            div_kapat();
            $("#delete_div").show();
        });

        $("#update").click(function () {
            div_kapat();
            $("#update_div").show();
        });



    });


    var urlParams = new URLSearchParams(window.location.search);
    console.log("gelen id = " + urlParams.get('SorumluID'));
    console.log("gelen ad = " + urlParams.get('SorumluAd'));
    console.log("gelen soyad = " + urlParams.get('SorumluSoyad'));


    function cikis() {
        if (confirm('Çıkış yapmak istiyor musunuz ? ', 'Staj Takip Programı')) {
            document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
            $(location).attr("href", "Login.aspx");
        } else {
            // Do nothing!
        }

    }

    function getir() {
        var urlParams = new URLSearchParams(window.location.search);
        console.log(urlParams.get('SorumluAd')); // "SorumluID=1"

        $("#AdSoyadGetir").text("Stajyer Sorumlusu: " + urlParams.get('SorumluAd') + " " + urlParams.get('SorumluSoyad'));
        var date = new Date();
        document.getElementById('yorumtarih').value = bugun();
    }

    function SilStajyer() {
        modalSil.style.display = "none";
        var addValues = {
            "StajyerNo": $("#txtstajyersil1").val()
        };
        $.ajax({
            url: "http://localhost:8939/Service1.svc/SilStajyer",
            type: "POST",
            data: JSON.stringify(addValues),
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                if (data >= 1) {
                    alert("Silme işlemi başarılı");
                    console.info("başarılı");
                    Temizle();
                }
                else {
                    alert("Bu numaraya kayıtlı stajyer yokur...");
                }
            },
            error: function (error) {
                console.error("başarısız");
            }
        });
    }



    function EkleStajyer() {
        modal.style.display = "none";
        var addValues = {
            "StajyerAd": $("#txtstajyerekle1").val(),
            "StajyerSoyad": $("#txtstajyerekle2").val(),
            "StajyerNo": $("#txtstajyerekle3").val(),
            "BaslangicTarihi": $("#txtstajyerekle4").val(),
            "BitisTarihi": $("#txtstajyerekle5").val(),
            "CalismaGunu": $("#txtstajyerekle6").val(),
            "SorumluID": $("#txtstajyerekle7").val(),
            "StajKonusu": $("#txtstajyerekle8").val()
        };
        $.ajax({
            url: "http://localhost:8939/Service1.svc/EkleStajyer",
            type: "POST",
            data: JSON.stringify(addValues),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                alert("Ekleme işlemi başarılı");
                console.info("başarılı");
                Temizle();
            },
            error: function (error) {
                console.error("başarısız");
            }
        });

    }
    function GuncelleStajyer() {

        modalupdate.style.display = "none";
        var addValues = {
            "StajyerAd": $("#txtstajyerguncelle1").val(),
            "StajyerSoyad": $("#txtstajyerguncelle2").val(),
            "StajyerNo": $("#txtstajyerguncelle3").val(),
            "BaslangicTarihi": $("#txtstajyerguncelle4").val(),
            "BitisTarihi": $("#txtstajyerguncelle5").val(),
            "CalismaGunu": $("#txtstajyerguncelle6").val(),
            "SorumluID": $("#txtstajyerguncelle7").val(),
            "StajKonusu": $("#txtstajyerguncelle8").val()
        };
        $.ajax({
            url: "http://localhost:8939/Service1.svc/GuncelleStajyer",
            type: "POST",
            data: JSON.stringify(addValues),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                tblgetir();
                alert("Güncelleme işlemi başarılı");
                console.info("başarılı");

            },
            error: function (error) {
                console.error("başarısız");
            }
        });

    }

    function GuncelleGetir() {
        $("#frmguncelle").show();
        var stajyer_no = $("#txtstajyerguncelle0").val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "http://localhost:8939/Service1.svc/StajyerGetirNo",
            data: '{"StajyerNo": "' + stajyer_no + '"}',
            contentType: "application/json",
            success: function (data) {

                $("#txtstajyerguncelle1").val(data.StajyerAd),
                    $("#txtstajyerguncelle2").val(data.StajyerSoyad),
                    $("#txtstajyerguncelle3").val(data.StajyerNo),
                    $("#txtstajyerguncelle4").val(data.BaslangicTarihi),
                    $("#txtstajyerguncelle5").val(data.BitisTarihi),
                    $("#txtstajyerguncelle6").val(data.CalismaGunu),
                    $("#txtstajyerguncelle7").val(data.SorumluID),
                    $("#txtstajyerguncelle8").val(data.StajKonusu)
                console.info("asdasda");
            },
            error: function (error) {
                console.error("başarısız");
            }
        });

    }


    function tblgetir() {
        var urlParams1 = new URLSearchParams(window.location.search);
        var id = urlParams1.get('SorumluID');
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "http://localhost:8939/Service1.svc/GetStajyerler",
            data: '{"SorumluID": "' + id + '"}',

            processData: false,
            dataType: "json",
            success: function (response) {
                var a = eval(response);
                var toplam = 0;
                var verisayi = 3;
                var table = $("#table_sonuc");

                table += "<tr><th onclick='sortTable(0)'>Adı</th><th onclick='sortTable(1)'>Soyadı</th><th onclick='sortTable(2)'>No</th><th onclick='sortTable(3)'>Başlangıç Tarihi</th><th onclick='sortTable(4)'>Bitiş Tarihi</th><th onclick='sortTable(5)'>Çalışma Günü</th><th onclick='sortTable(6)'>Staj Konusu</th></tr>";
                 $.each(a, function () {
                    toplam += 1;

                    table += "<tr><td>" + this.StajyerAd + "</td><td>" + this.StajyerSoyad + "</td><td>" + this.StajyerNo + "</td><td>" + this.BaslangicTarihi +
                        "</td><td>" + this.BitisTarihi + "</td><td>" + this.CalismaGunu + "</td><td>" + this.StajKonusu + "</td></tr>";

                });
                table += "</table>";
                $("#table_sonuc").append(table);
                //$("#sonuc").html(html == "" ? "No results" : html);

                $("#table_sonuc tr:gt(" + verisayi + ")").hide();
                var sayfasayisi = Math.round(toplam / verisayi);
                for (var i = 1; i <= sayfasayisi; i++) {
                    $("#sayfalama").append('<a href="javascript:void(0)">' + i + '</a>');
                }
                $("#sayfalama a:first").addClass("aktif");

                $("#sayfalama a").click(function () {
                    var indis = $(this).index() + 1;
                    var gt = verisayi * indis;
                    $("#sayfalama a").removeClass("aktif");
                    $(this).addClass("aktif");
                    $("#table_sonuc tr").hide();
                    $("#table_sonuc tr:eq(" + 0 + ")").show();   //Sütün başlıklarını sürekli göstermek için
                    for (var i = gt - verisayi; i < gt; i++) {
                        $("#table_sonuc tr:eq(" + i + ")").show();
                    }
                });

                $("<table><td>:gt(" + verisayi + ")").hide();

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    // function TDStajyerNo(elem) {
    //    var a = document.getElementById("TDStajyerNo");
    //     alert(elem.innerHTML);

    //}
    $("#table_sonuc").on('click', 'tr', function () {
        var trValue = $(this).attr('value');
        var tdValue = $(this).children('td').map(function (index, val) {
            return $(this).text();
        }).toArray();
        //alert(tdValue[2]);

        //$('#adsoyad').text(tdValue[0] + tdValue[1] );
        // $('#no').text(tdValue[2]);

        document.getElementById("adsoyad").value = tdValue[0] + " " + tdValue[1];
        document.getElementById("no").value = tdValue[2];

    });

    function YorumEkle() {
        var urlParams = new URLSearchParams(window.location.search);
        console.log(urlParams.get('SorumluID')); // "SorumluID=1"

        var addValues = {
            "StajyerID": $("#no").val(),
            "SorumluID": urlParams.get('SorumluID'),
            "Yorum": $("#yorum").val(),
            "Tarih": $("#yorumtarih").val()
        };
        $.ajax({
            url: "http://localhost:8939/Service1.svc/Yorum",
            type: "POST",
            data: JSON.stringify(addValues),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                alert("Ekleme işlemi başarılı");
                console.info("başarılı");
                Temizle();
            },
            error: function (error) {
                console.error("başarısız");
            }
        });

    }

     function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("table_sonuc");
        switching = true;
        dir = "asc";
        while (switching) {
            switching = false;
            rows = table.getElementsByTagName("TR");
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
           
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                switchcount++;
            } else {
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }

</script>
