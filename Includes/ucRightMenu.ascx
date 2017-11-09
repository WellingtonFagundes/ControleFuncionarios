<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucRightMenu.ascx.cs" Inherits="Includes_ucRightMenu" %>

<ul class="menu">
    <div id="divAdmin" runat="server">
        <li><a href="Manage-login.aspx">Detalhes do Login</a></li>
        <li><a href="Manage-Department.aspx">Departamentos</a></li>
        <li><a href="Manage-Employee.aspx">Detalhes de Funcionários</a></li>
    </div>

    <li><a href="Master-List-Employee-Report.aspx">Lista de Funcionários</a></li>
    <li><a href="Employee-Service-Report.aspx">Relatório de Serviços</a></li>
    <li><asp:LinkButton runat="server" id="btnLogout" OnClick="btnLogout_Click">Logout</asp:LinkButton></li>
</ul>
<br />

<div class="section_box">
    <div class="subtitle">Aniversariantes</div>
    <asp:Label runat="server" ID="lblMessage"></asp:Label>
    <asp:DataList runat="server" ID="dlBirhtday" Width="100%">
        <ItemTemplate>
            <b><asp:Label runat="server" ID="lblName" Text='<%# Eval("Name") %>'></asp:Label></b><br />
                <asp:Label runat="server" ID="lblDOB" Text='<%# Convert.ToDateTime(Eval("DOB")).ToString("dd MMM, yyyy") %>'></asp:Label>
                <br />
                <hr style="border:dotted 1px #333333"/>
        </ItemTemplate>
    </asp:DataList>
    <br />
</div>

<div class="section_box">
    <div class="subtitle">Total de Funcionários</div>
    <br />
    <center><h1><asp:Label runat="server" ID="lblEmpCount"></asp:Label></h1></center>
</div>