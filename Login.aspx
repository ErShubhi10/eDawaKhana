<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eDawaKhana.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
        <title>HRML :: Login</title>
        <link href="assets/img/favicon.png" rel="icon" />
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

  <link href="https://fonts.gstatic.com" rel="preconnect" />
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet" />

  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
  <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet" />

  <link href="/assets/css/style.css" rel="stylesheet" />
        <style>

            .wrapper {
                display: flex;
                align-items: center;
                flex-direction: column;
                justify-content: center;
                width: 100%;
                min-height: 100%;
                padding: 20px;
                margin-top:10%;
            }

            #formContent {
                -webkit-border-radius: 10px 10px 10px 10px;
                border-radius: 10px 10px 10px 10px;
                background: #fff;
                padding: 30px;
                width: 90%;
                max-width: 450px;
                position: relative;
                padding: 0px;
                -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                text-align: center;
            }

            #formFooter {
                background-color: #f6f6f6;
                border-top: 1px solid #dce8f1;
                padding: 25px;
                text-align: center;
                -webkit-border-radius: 0 0 10px 10px;
                border-radius: 0 0 10px 10px;
            }

            /* FORM TYPOGRAPHY*/

            input[type=button], input[type=submit], input[type=reset] {
                background-color: #56baed;
                border: none;
                color: white;
                padding: 15px 80px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                text-transform: uppercase;
                font-size: 13px;
                -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
                box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
                -webkit-border-radius: 5px 5px 5px 5px;
                border-radius: 5px 5px 5px 5px;
                margin: 5px 20px 40px 20px;
                -webkit-transition: all 0.3s ease-in-out;
                -moz-transition: all 0.3s ease-in-out;
                -ms-transition: all 0.3s ease-in-out;
                -o-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out;
            }

                input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover {
                    background-color: #39ace7;
                }

                input[type=button]:active, input[type=submit]:active, input[type=reset]:active {
                    -moz-transform: scale(0.95);
                    -webkit-transform: scale(0.95);
                    -o-transform: scale(0.95);
                    -ms-transform: scale(0.95);
                    transform: scale(0.95);
                }

            input[type=text], input[type=password] {
                background-color: #f6f6f6;
                border: none;
                color: #0d0d0d;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 5px;
                width: 85%;
                border: 2px solid #f6f6f6;
                -webkit-transition: all 0.5s ease-in-out;
                -moz-transition: all 0.5s ease-in-out;
                -ms-transition: all 0.5s ease-in-out;
                -o-transition: all 0.5s ease-in-out;
                transition: all 0.5s ease-in-out;
                -webkit-border-radius: 5px 5px 5px 5px;
                border-radius: 5px 5px 5px 5px;
            }

                input[type=text]:focus, input[type=password]:focus {
                    background-color: #fff;
                    border-bottom: 2px solid #5fbae9;
                }

                input[type=text]:placeholder, input[type=password]:placeholder {
                    color: #cccccc;
                }



            /* Simple CSS3 Fade-in Animation */
            .underlineHover:after {
                display: block;
                left: 0;
                bottom: -10px;
                width: 0;
                height: 2px;
                background-color: #56baed;
                content: "";
                transition: width 0.2s;
            }

            .underlineHover:hover {
                color: #0d0d0d;
            }

                .underlineHover:hover:after {
                    width: 100%;
                }



            /* OTHERS */

            *:focus {
                outline: none;
            }

            #icon {
                margin-top: 15px;
                width: 100px;
                margin-bottom: 15px;
            }
            .error_message{
                color:red;
                font-size:16px;
                text-transform:uppercase;
                text-align:center;
            }
  
        </style>

    </head>

<body style="background-image: linear-gradient(to right, #010727 , #8ad9fd);">
    <div class="wrapper">

        <div id="formContent">

            <div class="error_message">
            </div>
            <!-- Tabs Titles -->
            <!-- Icon -->
            <div class="first">
                <img src="/assets/img/apple-touch-icon.png" id="icon" alt="User Icon" class="img-responsive" />
            </div>

            <form runat="server">
                <asp:TextBox CssClass="second" runat="server" ID="txtLogin" placeholder="User Name" required></asp:TextBox>
                <asp:TextBox CssClass="third" runat="server" ID="txtPassword" placeholder="Password" required></asp:TextBox>
                <asp:Button runat="server" ID="btnLogin" CssClass="fourth" Text="Login" OnClick="btnLogin_Click" />
                </form>

            <div id="formFooter">
                <a class="underlineHover" href="#">Forgot Password?</a>
            </div>

        </div>
    </div>

</body>
</html>
