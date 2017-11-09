<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee-Training-Report.aspx.cs" Inherits="Employee_Training_Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id="Head1">
    <title>Controle de Funcionários</title>
    <style type="text/css">
        body
        {
            margin:0;
            padding:0;
            line-height:1.5em;
            font-family:'Trebuchet MS';
            font-size:12px;
            color:#000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="5" cellspacing="5" width="700px" border="0" align="center">
        <tr>
            <td>
                <hr style="border:dotted 1px #333333" />
            </td>
        </tr>

        <tr>
            <td align="center">
                <h3 style="margin:0px;">
                    Treinamentos no Trabalho
                </h3>
                <hr style="border:dotted 1px #333333" />
            </td>
        </tr>

        <tr>
            <td>
                <table cellspacing="0" cellpadding="5" width="100%" border="0">
                    <tr>
                        <td><strong>Nome</strong></td>
                        <td>: <asp:Label runat="server" ID="lblEmployeeName"></asp:Label></td>
                        <td><strong>Funci ID</strong></td>
                        <td>: <asp:Label runat="server" ID="lblEmpId"></asp:Label></td>
                        <td><strong>Departamento</strong></td>
                        <td>: <asp:Label runat="server" ID="lblDeparment"></asp:Label></td>
                    </tr>

                    <tr>
                        <td><strong>Cargo</strong></td>
                        <td>: <asp:Label runat="server" ID="lblDesignation"></asp:Label></td>
                        <td><strong>DOJ</strong></td>
                        <td>: <asp:Label runat="server" ID="lblDOJ"></asp:Label></td>
                        <td><strong>Grau</strong></td>
                        <td>: <asp:Label runat="server" ID="lblDegree"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>
                <asp:GridView ID="gvOnJob" runat="server" Width="100%" GridLines="Both" ForeColor="Black"
                    cellpadding="4" BorderStyle="None" BorderColor="#CCCCCC" BackColor="White"
                    AutoGenerateColumns="false" BorderWidth="1px">

                    <Columns>
                        <asp:TemplateField HeaderText="Treinamento no Trabalho">
                            <ItemTemplate>
                                <b>Data: </b><%# getDurationDate(Convert.ToDateTime(Eval("StartDate")),Convert.ToDateTime(Eval("EndDate"))) %><br /><br />
                                <b>Programa: </b><asp:Label runat="server" ID="lblTraining" Text='<%# Eval("TrainingDetails") %>'></asp:Label><br /><br />
                                <b>Efetividade: </b> <asp:Label runat="server" ID="lblEffectiveness" Text='<%# Eval("Effectiveness") %>'></asp:Label><br /><br />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right"/>
                    <SelectedRowStyle BackColor="#CC3333" ForeColor="white" Font-Bold="true"/>
                    <HeaderStyle BackColor="#666666" Font-Bold="true" ForeColor="White"/>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black"/>

                </asp:GridView>
            </td>
        </tr>

        <tr>
            <td>
                <asp:GridView ID="gvOffJob" runat="server" Width="100%" GridLines="Both" ForeColor="Black" 
                    CellPadding="4" BorderStyle="None" BorderColor="#CCCCCC" BackColor="White"
                     AutoGenerateColumns="false" BorderWidth="1px">

                    <Columns>
                        <asp:TemplateField HeaderText="Treinamentos fora do Trabalho">
                            <ItemTemplate>
                                <b>Data :</b><%# getDurationDate(Convert.ToDateTime(Eval("StartDate")),Convert.ToDateTime(Eval("EndDate"))) %><br /><br />
                                <b>Programa: </b><asp:Label runat="server" ID="lblTraining" Text='<%# Eval("TrainingDetails") %>'></asp:Label><br /><br />
                                <b>Efetividade: </b> <asp:Label runat="server" ID="lblEffectiveness" Text='<%# Eval("Effectiveness") %>'></asp:Label><br /><br />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="white" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="true" ForeColor="White" />
                    <HeaderStyle BackColor="#666666" Font-Bold="true" ForeColor="White" />
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />

                </asp:GridView>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
