<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Master-List-Employee-Report.aspx.cs" 
    MasterPageFile="~/default.master" Inherits="Master_List_Employee_Report" %>

<%@ Register Src="~/Includes/ucRightMenu.ascx" TagName="uc1RightMenu" TagPrefix="uc1" %>

<asp:Content ID="cMainContent" runat="server" ContentPlaceHolderID="cphMain">
    <div class="title" style="text-align:center">Lista de Funcionários</div>
    <div style="text-align:right"><a href="Master-List-Employee-Report-Print.aspx" target="_blank">Imprimir Lista</a></div>
    <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="false" GridLines="Both"
        BorderColor="#000000" BorderStyle="Solid" CellPadding="4" ForeColor="#333333"
        Width="100%">

        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="lblEmpID" runat="server" Text='<%# "Emp" + Eval("EmployeeId").ToString() %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:BoundField DataField="Name" HeaderText="Nome">
                <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>    

            <asp:BoundField DataField="Designation" HeaderText="Cargo">
                <HeaderStyle HorizontalAlign="Center" />    
            </asp:BoundField> 

            <asp:TemplateField HeaderText="Departamento">
                <ItemTemplate>
                    <asp:Label ID="lblDepartment" runat="server" Text='<%# getDepartment(Convert.ToInt32(Eval("DepartmentId"))) %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField> 

            <asp:TemplateField HeaderText="Treinamentos">
                <ItemTemplate>
                    <asp:HyperLink ID="lnkTreinamentos" runat="server" NavigateUrl='<%# "Employee-Training-Report.aspx?EmpId=" + Eval("EmployeeID") %>' Text="Ver" Target="_blank"></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle Width="50px" HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="true" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <AlternatingRowStyle BackColor="#EFF3FB" />
    </asp:GridView>


</asp:Content>

<asp:Content ID="cRightContent" runat="server" ContentPlaceHolderID="cphRight">
    <uc1:uc1RightMenu runat="server" ID="ucRightMenu" />
</asp:Content>