<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/default.master"%>
<%@ Register Src="~/Includes/ucRightMenu.ascx" TagName="ucRightMenu" TagPrefix="uc1" %>

<asp:Content ID="cMainContent" runat="server" ContentPlaceHolderID="cphMain">
    <div class="text_area" align="justify">
        <div class="title" style="text-align:center">Controle de Funcionários</div>
        <center><img src="Images/funcionarios 2.jpg"/></center>
    </div>
</asp:Content>

<asp:Content ID="cRightContent" runat="server" ContentPlaceHolderID="cphRight">
    <uc1:ucRightMenu runat="server" ID="ucRightMenu1" />
</asp:Content>
