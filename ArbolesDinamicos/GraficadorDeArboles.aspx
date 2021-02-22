<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraficadorDeArboles.aspx.cs" Inherits="ArbolesDinamicos.GraficadorDeArboles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <title>Graficador de Arboles</title>
</head>
<body>
    <form id="form1" runat="server">
        <style>
            body{
                background:rgba(51,51,51,.3);
            }
            .principal {
                width: 100%;
            }

                .principal tr th {
                    background: rgb(255, 0, 0);
                    color: #fff;
                }

                .principal tr td {
                    background: rgba(255, 0, 0,.3);
                    color: #000;
                }

            * {
                margin: 0;
                padding: 0;
                font-family: Arial;
            }

            table {
                width: 100%;
                border-spacing: 0;
                height: 100%;
                max-width: 800px;
            }

                table tr td {
                    padding: 5px 10px;
                    text-align: center;
                }



            .nivel1 tr th {
                height: 20px;
                background: rgb(0, 0, 255);
                color: #fff;
            }

            .nivel1 tr td {
                background: rgba(0, 0, 255,.3);
                color: #000;
            }

            .nivel2 tr th {
                background: rgb(0, 255,0);
                color: #fff;
            }

            .nivel2 tr td {
                background: rgba(0, 255,0,.3);
                color: #000;
            }

            .btn-accion {
                padding: 10px 5px;
                text-decoration: none;
                background: #17a2b8;
                border-color: #17a2b8;
                color: #fff;
                vertical-align: middle;
                display: inline-block;
                border-radius: 3px;
            }
            .btn-regresar{
                padding: 10px 5px;
                text-decoration: none;
                background: #6c757d;
                border-color: #6c757d;
                color: #fff;
                vertical-align: middle;
                display: inline-block;
                border-radius: 3px;
                margin-bottom:10px;
            }

            .filtros {
                background: #333;
                color: #fff;
                text-align:center;
                width:100%;
                max-width:800px;
                font-size:1rem;
                margin :auto;
                margin-top:30vh;
                border-radius:5px;
                padding:.5rem 1rem;
                }
            .pnlresul{
                background: #fff;
                color: #333;
                text-align:center;
                width:100%;
                max-width:800px;
                font-size:1rem;
                margin :auto;
                margin-top:30vh;
                border-radius:5px;
                padding:.5rem 1rem;
            }
            .txt-generador{
                width:80%;
                height:20px;
                margin-bottom:10px;
                margin-top:10px;
            }
        </style>
        <div>
            <asp:Panel ID="pnlfiltros" CssClass="filtros" runat="server">
                <asp:Label ID="lblInstrucciones" runat="server"></asp:Label>
                <br />
                <asp:TextBox ID="txtGraficador" CssClass="txt-generador" placeholder="Ingrese su cadena para generar un arbol" runat="server"></asp:TextBox>
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-accion" OnClick="btnGraficar_Click">Graficar <i class="fad fa-project-diagram"></i></asp:LinkButton>
            </asp:Panel>
            <asp:Panel ID="pnlresultado" CssClass="pnlresul" runat="server">
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn-regresar" OnClick="LinkButton2_Click">Regresar <i class="fad fa-undo"></i></asp:LinkButton>
            <asp:Panel ID="pnlgraficador" runat="server"></asp:Panel>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
