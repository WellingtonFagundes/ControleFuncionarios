<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login"%>

<!DOCTYPE html>
<html>
    <head></head>
    <title>Controle de Funcionários</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</html>

<body>
    <form id="frmMain" runat="server">
        <div id="container_wrapper">
            <div class="spacer"></div>
            <div id="container">
                <div id="top"></div>
                <div id="header">
                    <div id="inner_header">
                        <div id="site_title">Controle de Funcionários</div>
                        <div id="site_slogan">Versão 1.0</div>
                    </div>
                </div>

                <div id="left_column">
                    <div class="text_area" align="justify">
                        <div class="title" style="text-align:center">Controle de Funcionários</div>
                        <center><img src="Images/funcionarios 2.jpg" /></center>
                    </div>
                </div>

                <div id="right_column">
                    <div class="section_box" align="justify">
                        <center><div class="subtitle">Área de Membros</div></center>
                        <table cellpadding="3" cellspacing="3" width="100%" border="0">
                            <tr>
                                <td>Login</td>
                                <td><asp:TextBox ID="txtUserName" runat="server" CssClass="input100"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Senha</td>
                                <td><asp:TextBox ID="txtPassword" runat="server" CssClass="input100" TextMode="Password"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button runat="server" ID="btnLogin" CssClass="buttonBlue" Text="Login" OnClick="btnLogin_Click"/> <br />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvUserName" ControlToValidate="txtUserName"
                                        Display="None" ErrorMessage="Por favor informe o usuário">
                                    </asp:RequiredFieldValidator><br />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtPassword"
                                        Display="None" ErrorMessage="Por favor informe a Senha"></asp:RequiredFieldValidator>

                                    <asp:ValidationSummary ID="validationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:center"><asp:Label runat="server" ID="lblMessage"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div class="section_box">
                        <div class="subtitle">Para Suporte e Consultas</div>
                        Email: <a href="mailto:wellington.fag@gmail.com">wellington.fag@gmail.com</a>
                    </div>
                    <br />
                </div>

                <div id="footer">
                    Adaptador por Wellington Fagundes
                </div>
            </div>
            <div class="spacer"></div>
        </div>
    </form>
</body>
</html>