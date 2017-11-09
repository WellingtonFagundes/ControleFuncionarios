<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage-Login-Add.aspx.cs" MasterPageFile="~/default.master" Inherits="Manage_Login_Add" %>

<%@ Register Src="~/Includes/ucRightMenu.ascx" TagName="ucRightMenu" TagPrefix="uc1" %>

<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="cphMain">
    
    <div class="title" style="text-align:center">Adicionar/Editar Login</div>

    <table cellpadding="5" cellspacing="5" border="0" width="450" align="center">
        <tr>
            <td colspan="2" align="center">
                <asp:Label runat="server" ID="lblMessage"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>Nome</td>
            <td>
                <asp:TextBox runat="server" ID="txtName" CssClass="input300"></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtName"
                    ErrorMessage="Informe o nome" Font-Bold="true" Font-Size="Small"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            
            <td>Email</td>
            <td>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="input300"></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ID="reqEmail" Font-Size="Small" ControlToValidate="txtEmail"
                    Font-Bold="true" ErrorMessage="Informe o Email"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>Login</td>
            <td>
                <asp:TextBox runat="server" ID="txtUserName" CssClass="input300"></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ID="reqLogin" Font-Size="Small"
                    Font-Bold="true" ControlToValidate="txtUserName"
                    ErrorMessage="Informe o Login"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>Senha</td>
            <td>
                <asp:TextBox runat="server" ID="txtSenha" CssClass="input300"></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSenha" ID="reqSenha"
                    Font-Size="Small" Font-Bold="true" ErrorMessage="Informe a senha"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>
                Direitos
            </td>

            <td>
                <asp:DropDownList runat="server" ID="ddlRights" style="width:300px">
                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                    <asp:ListItem Value="0">Usuário</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <asp:Button runat="server" ID="btnSave" CssClass="buttonBlue" Text="Salvar" OnClick="btnSave_Click" />
                <asp:Button runat="server" ID="btnAtualizar" CssClass="buttonBlue" Text="Atualizar" OnClick="btnAtualizar_Click" />
                <asp:Button runat="server" ID="btnCancel" CssClass="buttonBlue" Text="Cancelar" 
                    CausesValidation="false" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>

</asp:Content>

<asp:Content runat="server" ID="cRightContent" ContentPlaceHolderID="cphRight">
    <uc1:ucRightMenu runat="server" ID="ucMenu" />
</asp:Content>
