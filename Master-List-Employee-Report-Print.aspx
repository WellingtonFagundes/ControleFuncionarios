<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Master-List-Employee-Report-Print.aspx.cs" Inherits="Master_List_Employee_Report_Print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id="head1">
    <title>Controle de Funcionários</title>
    <style type="text/css">
        body
        {
            margin:0;
            padding:0;
            line-height: 1.5em;
            font-family:'Trebuchet MS';
            font-size:12px;
            color:#000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table cellspacing="5" cellpadding="5" width="700px" border="0" align="center">
            <tr>
                <td>
                    <hr style="border:dotted 1px #333333" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <h3 style="margin:0px">Lista de Funcionários</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <hr style="border:dotted 1px #333333" />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:GridView ID="gvMaster" runat="server" Width="100%" GridLines="Both" ForeColor="Black" CellPadding="4" BorderStyle="None"
                        BorderColor="#CCCCCC" AutoGenerateColumns="false" BackColor="White" BorderWidth="1px">

                        <Columns>
                            <asp:TemplateField HeaderText="Funci ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpId" runat="server" Text='<%# "EMP" + Eval("EmployeeID").ToString() %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="Name" HeaderText="Nome" >
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Designation" HeaderText="Cargo">
                                 <HeaderStyle HorizontalAlign="Center" />    
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Departamento">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblDepartment" Text='<%# getDepartmentName(Convert.ToInt32(Eval("DepartmentId"))) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Nascimento">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblDOB" Text='<%# getFormattedDate(Convert.ToDateTime(Eval("DOB"))) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle width="75px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Admissão">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblDOJ" Text='<%# getFormattedDate(Convert.ToDateTime(Eval("DOJ"))) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle width="75px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="true" ForeColor="White"/>
                        <HeaderStyle BackColor="#666666" Font-Bold="true" ForeColor="white"/>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black"/>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
