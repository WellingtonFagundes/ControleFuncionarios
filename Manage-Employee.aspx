<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage-Employee.aspx.cs" Inherits="Manage_Employee" MasterPageFile="~/default.master" %>
<%@ Register Src="~/Includes/ucRightMenu.ascx" TagName="ucRightMenu" TagPrefix="uc1" %>

<asp:Content ID="cMainContent" runat="server" ContentPlaceHolderID="cphMain">
    <center><div class="title">Funcionários <br /></div></center>

    <div style="text-align:center"><asp:Label runat="server" ID="lblMessage"></asp:Label></div>

    <div style="text-align:right">
        <asp:CheckBox runat="server" ID="chkStatus" Text="Ver Demitidos e/ou Aposentados" AutoPostBack="true" OnCheckedChanged="chkStatus_CheckedChanged" />
        <asp:Button ID="btnSave" runat="server" Text="Incluir Funcionário" CssClass="buttonBlue" width="130px" OnClick="btnSave_Click" />
    </div>

    <asp:GridView runat="server" AllowPaging="true" AutoGenerateColumns="false" CellPadding="4" Forecolor="#333333"
        GridLines="Both" BorderStyle="Solid" BorderColor="#000000" ID="grvEmployee"
        OnRowCommand="Unnamed_RowCommand" OnRowDataBound="Unnamed_RowDataBound" OnRowDeleting="Unnamed_RowDeleting"
        OnPageIndexChanging="Unnamed_PageIndexChanging" PageSize="15">

        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="lblEmpID" runat="server" Text='<%# "EMP" + Eval("EmployeeID").ToString() %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Nome">
                <HeaderStyle HorizontalAlign="Center" Width="190px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Treinamentos">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbOnJob" Text="Em Serviço" CommandName="OnJob" CommandArgument='<%# Eval("EmployeeID") %>'></asp:LinkButton>
                  | <asp:LinkButton runat="server" ID="lbOffJob" Text="Fora de Serviço" CommandName="OffJob" CommandArgument='<%# Eval("EmployeeID") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="110px" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Editar">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbEditar" Text="Editar" CommandName="Edit" CommandArgument='<%# Eval("EmployeeID") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="50px" HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Deletar">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbDelete" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("EmployeeID") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="50px" HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>

        <SelectedRowStyle BackColor="#D1D1D1" Font-Bold="true" ForeColor="#333333" />
        <AlternatingRowStyle BackColor="#EFF3FB"/>
        <EditRowStyle BackColor="#2461BF"/>
        <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" ForeColor="White" Font-Bold="true"/>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center"/>
        <RowStyle BackColor="#EFF3FB" />
    </asp:GridView>
</asp:Content>

<asp:Content ID="cRightContent" runat="server" ContentPlaceHolderID="cphRight">
    <uc1:ucRightMenu runat="server" ID="ucRightMenu" />
</asp:Content>

