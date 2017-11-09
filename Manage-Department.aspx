<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage-Department.aspx.cs" Inherits="Manage_Department" 
    MasterPageFile="~/default.master"%>
<%@ Register Src="~/Includes/ucRightMenu.ascx" TagName="ucRightMenu" TagPrefix="uc1" %>

<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="cphMain">
    
    <div class="title" align="center">Departamentos</div>

    <div style="text-align:center">
        <asp:Label runat="server" ID="lblMessage"></asp:Label>
    </div>

    <div style="text-align:right">
        <asp:Button runat="server" ID="btnSave" CssClass="buttonBlue" Text="Adicionar Departamento" OnClick="btnSave_Click"
            width="140px"/>
    </div>

    <asp:GridView runat="server" ID="grvDepartamentos" AutoGenerateColumns="false" BorderStyle="Solid"
            cellpadding="4" ForeColor="#333333" GridLines="Both" BorderColor="#000000" Width="100%"
            OnRowCommand="grvDepartamentos_RowCommand" OnRowDataBound="grvDepartamentos_RowDataBound"
            OnPageIndexChanging="grvDepartamentos_PageIndexChanging" OnRowDeleting="grvDepartamentos_RowDeleting"
            AllowPaging="true">

        <Columns>
            <asp:BoundField DataField="DepartmentName" HeaderText="Nome Departamento">
               <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="Editar">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbEdit" CommandName="Edit" CommandArgument='<%# Eval("DepartmentId") %>'
                         Text="Editar"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="50px" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Deletar">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbDelete" CommandName="Delete" CommandArgument='<%# Eval("DepartmentId") %>'
                        text="Deletar"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="50px" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#507CD1" ForeColor="White" Font-Bold="true" />
        <PagerStyle BackColor="#2461BF" Font-Bold="true" ForeColor="White" HorizontalAlign="Center"/>
        <AlternatingRowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF"/>
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="true" ForeColor="White" />
        <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White"/>
        <RowStyle BackColor="#EFF3FB" />


    </asp:GridView>
</asp:Content>

<asp:Content runat="server" ID="cRightContent" ContentPlaceHolderID="cphRight">
    <uc1:ucRightMenu runat="server" ID="ucRightMenu" />
</asp:Content>

