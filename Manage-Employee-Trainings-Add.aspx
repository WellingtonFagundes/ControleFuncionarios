<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage-Employee-Trainings-Add.aspx.cs" 
    Inherits="Manage_Employee_Trainings_Add" MasterPageFile="~/default.master" %>

<%@ Register src="~/Includes/ucRightMenu.ascx" TagName="uc1RightMenu" TagPrefix="uc1" %>

<asp:Content ID="cMainContent" runat="server" ContentPlaceHolderID="cphMain">
    <div class="title" style="text-align:center"><asp:Label ID="lblTraining" runat="server"></asp:Label> </div>
    <div class="title">Nome:&nbsp; <asp:Label ID="lblEmployeeName" runat="server"></asp:Label></div>
    <hr style="border-style:dotted;border-color:#CDCDCD" />
        <table cellpadding="5" cellspacing="5" border="0" width="450px" align="center">
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    Data de Início
                </td>
                <td>
                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="input300"></asp:TextBox>&nbsp;
                    <a href="javascript:NewCal('<%=txtStartDate.ClientID %>','ddmmyyyy')"><img src="images/cal.gif" width="16" height="16" border="0" alt="Selecione uma data" /></a>
                </td>
            </tr>

            <tr>
                <td>
                    Data final
                </td>
                <td>
                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="input300"></asp:TextBox>&nbsp;
                    <a href="javascript:NewCal('<%=txtEndDate.ClientID %>','ddmmyyyy')"><img src="Images/cal.gif" height="16" width="16" border="0" alt="Selecione uma data" /></a>
                </td>
            </tr>

            <tr>
                <td valign="top">Treinamento</td>
                <td>
                    <asp:TextBox ID="txtTrainings" runat="server" CssClass="input300" TextMode="MultiLine" Height="100px"></asp:TextBox> 
                </td>
            </tr>

            <tr>
                <td valign="top">Efetividade</td>
                <td>
                    <asp:TextBox ID="txtEffectiveness" runat="server" CssClass="input300" Height="100px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnSave" runat="server" CssClass="buttonBlue" Text="Salvar" OnClick="btnSave_Click" />&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" CssClass="buttonBlue" Text="Atualizar" OnClick="btnUpdate_Click" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" CssClass="buttonBlue" Text="Cancelar" OnClick="btnCancel_Click" />
                </td>
            </tr>

        </table>
     
</asp:Content>

<asp:Content ID="cRightContent" runat="server" ContentPlaceHolderID="cphRight">
    <uc1:uc1RightMenu runat="server" ID="uc1RightMenu" />
</asp:Content>