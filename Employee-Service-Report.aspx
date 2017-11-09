<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee-Service-Report.aspx.cs" 
    MasterPageFile="~/default.master" Inherits="Employee_Service_Report" %>

<%@ Register Src="~/Includes/ucRightMenu.ascx" TagName="uc1RightMenu" TagPrefix="uc1" %>

<asp:Content ID="cMainContent" runat="server" ContentPlaceHolderID="cphMain">
    <div class="title" style="text-align:center">Relatório de Serviços</div>
    <div>
        <hr style="border:solid" />
    </div>
    <strong>Filtrar Funcionários por</strong>
    <asp:DropDownList ID="ddlExperience" runat="server" OnSelectedIndexChanged="ddlExperience_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
    <strong>experiência</strong><br /><br />
    
    <asp:GridView runat="server" ID="gvRelatorioServicos" BorderColor="#000000" BorderStyle="Dashed" CellPadding="4"
        GridLines="Both" ForeColor="#333333" Width="100%"
        AutoGenerateColumns="false">

        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblEmpId" Text='<%# Eval("EmployeeId").ToString() %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" width="40px"/>
            </asp:TemplateField>

            <asp:BoundField DataField="Name" HeaderText="Nome">
                <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="Designation" HeaderText="Cargo">
                <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="DOJ" HeaderText="Admissão" DataFormatString="{0:dd MMM, yyyy}">
                <ItemStyle HorizontalAlign="Center" Width="80px" Font-Bold="true" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="Experience" HeaderText="Anos">
                <ItemStyle HorizontalAlign="Center" Width="50px" Font-Bold="true" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center"/>
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="true" ForeColor="#333333"/>
        <HeaderStyle BackColor="#507CD1" ForeColor="White" Font-Bold="true"/>
        <EditRowStyle BackColor="#2461BF"/>
        <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White"/>
        <RowStyle BackColor="#EFF3FB"/>
        <AlternatingRowStyle BackColor="#EFF3FB"/>


    </asp:GridView>
</asp:Content>

<asp:Content ID="cRightContent" runat="server" ContentPlaceHolderID="cphRight">
    <uc1:uc1RightMenu runat="server" ID="ucRightMenu" />
</asp:Content>