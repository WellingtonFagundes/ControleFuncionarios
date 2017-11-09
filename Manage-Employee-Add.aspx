<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage-Employee-Add.aspx.cs" Inherits="Manage_Employee_Add" 
    MasterPageFile="~/default.master"%>
<%@ Register Src="~/Includes/ucRightMenu.ascx" TagName="ucRightMenu" TagPrefix="uc1" %>

<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="cphMain">
    <center><div class="title">Adicionar/Editar Funcionários</div></center><br />
    <div style="text-align:center;color:red;"><asp:Label runat="server" ID="lblMessage"></asp:Label></div>
    <table cellspacing="5" cellpadding="5" border="0" width="450" align="center">
        <tr>
            <td colspan="2">
                <asp:Image runat="server" ID="imgPhoto" Height="100px" Width="100px" />
            </td>
        </tr>
        <tr>
            <td>Nome</td>
            <td>
                <asp:TextBox runat="server" ID="txtName" CssClass="input300"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtName"
                    ErrorMessage="*" Font-Bold="true" Font-Size="Small"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>Cargo</td>
            <td>
                <asp:TextBox runat="server" ID="txtDesignation" CssClass="input300"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="reqCargo" ControlToValidate="txtDesignation"
                    ErrorMessage="*" Font-Bold="true" Font-Size="Small"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>Grau</td>
            <td>
                <asp:TextBox runat="server" ID="txtDegree" CssClass="input300"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="reqGrau" ControlToValidate="txtDegree"
                    ErrorMessage="*" Font-Bold="true" Font-Size="Small"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>Departamento</td>
            <td>
                <asp:DropDownList runat="server" ID="ddlDepartment" style="width:300px"></asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>Data Admissão</td>
            <td>
                <asp:TextBox ID="txtDOJ" runat="server" CssClass="input300"></asp:TextBox>&nbsp;
                <a href="javascript:NewCal('<%=txtDOJ.ClientID %>','ddmmyyyy')">
                    <img src="Images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>
            </td>
        </tr>

        <tr>
            <td>Confirmado em</td>
            <td>
                <asp:TextBox runat="server" ID="txtDOC" CssClass="input300"></asp:TextBox>&nbsp;
                    <a href="javascript:NewCal('<%=txtDOC.ClientID %>','ddmmyyyy')">
                        <img src="Images/cal.gif" width="16" height="16" border="0" alt="Pick a date" />
                    </a>
            </td>
        </tr>

        <tr>
            <td>Status</td>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server" style="width:300px">
                    <asp:ListItem Value="1">Empregado</asp:ListItem>
                    <asp:ListItem Value="0">Demitido ou Aposentado</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td align="center" colspan="2">Dados Pessoais</td>
        </tr>

        <tr>
            <td>Nascimento</td>
            <td>
                <asp:TextBox ID="txtDOB" runat="server" CssClass="input300"></asp:TextBox>&nbsp;
                 <a href="javascript:NewCal('<%=txtDOB.ClientID %>','ddmmyyyy')">
                     <img src="Images/cal.gif" width="16" height="16" border="0" alt="Pick a date" />
                 </a>
            </td>
        </tr>

        <tr>
            <td>Endereço</td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="input300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Cidade</td>
            <td>
                <asp:TextBox ID="txtCity" runat="server" CssClass="input300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Estado</td>
            <td>
                <asp:TextBox ID="txtState" runat="server" CssClass="input300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Cep</td>
            <td>
                <asp:TextBox ID="txtZipCode" runat="server" CssClass="input300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Fone</td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="input300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Celular</td>
            <td>
                <asp:TextBox runat="server" ID="txtMobile" CssClass="input300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Foto</td>
            <td>
                <asp:FileUpload ID="filePhoto" runat="server" CssClass="input300" />
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <strong>Comentários e Observações<asp:TextBox ID="txtPhoto" runat="server" Visible="false" CssClass="input300"> </asp:TextBox></strong>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:TextBox ID="txtBio" runat="server" style="height:70px;width:450px" TextMode="MultiLine" CssClass="input300"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnSave" runat="server" CssClass="buttonBlue" Text="Salvar" OnClick="btnSave_Click" />
                <asp:Button ID="btnUpdate" runat="server" CssClass="buttonBlue" Text="Atualizar" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" CssClass="buttonBlue" Text="Cancelar" OnClick="btnCancel_Click"  CausesValidation="false"/>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ID="cRightContent" ContentPlaceHolderID="cphRight">
    <uc1:ucRightMenu runat="server" ID="ucRightMenu" />
</asp:Content>
