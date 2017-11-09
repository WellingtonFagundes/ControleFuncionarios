<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage-Login.aspx.cs" Inherits="Manage_Login" MasterPageFile="~/default.master"%>

<%@ Register Src="~/Includes/ucRightMenu.ascx" TagPrefix="uc1" TagName="ucRightMenu" %>

<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="cphMain">
    <center><div class="title">Detalhes do Login</div></center>

    <div style="text-align:center">
        <asp:Label runat="server" ID="lblMensagem"></asp:Label>
    </div>
    <div style="text-align:right">
        <asp:Button runat="server" ID="btnSave" Text="Adicionar Novo Login" 
            CssClass="buttonBlue" Width="116px" OnClick="btnSave_Click" />
    </div>

    <asp:GridView runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333"
        GridLines="Horizontal" BorderStyle="Solid" BorderColor="#000000" Width="100%" PageSize="10"
        OnRowCommand="Unnamed_RowCommand" OnRowDataBound="Unnamed_RowDataBound"
        OnRowDeleting="Unnamed_RowDeleting" OnPageIndexChanging="Unnamed_PageIndexChanging" ID="grvMaster">

        <Columns>
            <asp:TemplateField HeaderText="Direitos">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblRights" Text='<%# getRights(Convert.ToInt32(Eval("Rights")))%>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="70px" HorizontalAlign="center" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:BoundField DataField="LoginName" HeaderText="Nome">
                <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>    

            <asp:BoundField DataField="UserName" HeaderText="Login">
                <HeaderStyle HorizontalAlign="Center" />    
            </asp:BoundField>

            <asp:TemplateField HeaderText="Editar">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbEdit" Text="Editar" CommandName="Edit" CommandArgument='<%#Eval("LoginId") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="50px" HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Deletar">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbDelete" Text="Excluir" CommandName="Delete" CommandArgument='<%#Eval("LoginId") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="50px" HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
                
            
        </Columns>

        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Font-Bold="true" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="true" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <AlternatingRowStyle BackColor="#EFF3FB" />
    </asp:GridView>

</asp:Content>

<asp:Content runat="server" ID="cRightContent" ContentPlaceHolderID="cphRight">
    <uc1:ucRightMenu runat="server" />
</asp:Content>