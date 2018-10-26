<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StajTakipProgrami.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/loginStyle.css" type="text/css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


</head>
<body onload="checkCookie()">
    <div class="login-page">
        <div class="form">
            <input id="SorumluMail" type="text" class="txtlogin" placeholder="E-mail" />
            <input id="SorumluSifre" type="password" class="txtlogin" placeholder="password" />
            <p id="SorumluAd"></p>
            <button onclick="girisSorumlu();return false;">login</button>
            <div id="mesaj">
            </div>
        </div>
    </div>
    <script type="text/javascript">


        function girisSorumlu() {
            $.ajax({
                url: "http://localhost:8939/Service1.svc/girisSorumlu", //url:"service/Service1.svc/girisSorumlu",
                type: "POST",
                data: JSON.stringify({
                    SorumluMail: $("#SorumluMail").val(),
                    SorumluSifre: $("#SorumluSifre").val(),
                }),
                dataType: "json",
                contentType: "application/json",
                success: function (result) {
                    if (result == 1) {
                        user = $("#SorumluMail").val();
                        if (user != "" && user != null) {
                            setCookie("username", user, 30);
                        }
                        $.ajax({
                            url: "http://localhost:8939/Service1.svc/SorumluGetir", //url:"service/Service1.svc/girisSorumlu",
                            type: "POST",
                            data: '{"SorumluMail": "' + user + '"}',
                            dataType: "json",
                            contentType: "application/json",
                            success: function (data) {
                                var ad = data.SorumluAd;
                                var soyad = data.SorumluSoyad;
                                var id = data.SorumluID;

                                $(location).attr("href", "AnaSayfa.aspx?SorumluAd=" + ad + "&SorumluID=" + id + "&SorumluSoyad=" + soyad + "");
                            },
                            error: function (error) {
                                console.error("başarısız");
                            }
                        });

                    }
                    else {
                        $("#mesaj").text("Kullanıcı adı veya Parola yanlış :)");
                    }
                },
                error: function (error) {
                    console.error("başarısız");
                }
            });
        }

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toGMTString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function checkCookie() {
            console.log("username : " + getCookie("username"));
            var user = getCookie("username");
            console.log("asdas  :" + user);
            if (user != "") {
                alert("Hoş Geldiniz " + user);
                $.ajax({
                    url: "http://localhost:8939/Service1.svc/SorumluGetir", //url:"service/Service1.svc/girisSorumlu",
                    type: "POST",
                    data: '{"SorumluMail": "' + user + '"}',
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {
                        var id = data.SorumluID;
                        var ad = data.SorumluAd;
                        var soyad = data.SorumluSoyad;
                        console.info(id);
                        console.info(ad);
                        $(location).attr("href", "AnaSayfa.aspx?SorumluID=" + id + "&SorumluAd=" + ad + "&SorumluSoyad=" + soyad + "");
                    },
                    error: function (error) {
                        console.error("başarısız");
                    }
                });

            }
            
        }

    </script>
</body>
</html>
