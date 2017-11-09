<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage-Employee-Trainings.aspx.cs" 
    Inherits="Manage_Employee_Trainings" MasterPageFile="~/default.master" %>

<%@ Register Src="~/Includes/ucRightMenu.ascx" TagName="ucRightMenu" TagPrefix="uc1" %>

<asp:Content ID="cMainContent" runat="server" ContentPlaceHolderID="cphMain">
    
    <div class="title" style="text-align:center"><asp:Label ID="lblTraining" runat="server"></asp:Label></div>
    <div class="title" style="text-align:center"><asp:Label ID="lblEmployeeName" runat="server"></asp:Label></div>

    <hr style="border-style:dotted;border-color:#CDCDCD" />
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td align="left">
                    <asp:label ID="lblMessage" runat="server"></asp:label>
                </td>
                <td align="right">
                    <asp:Button ID="btnCancel" CausesValidation="false" runat="server" OnClick="btnCancel_Click"
                        Text="Back" CssClass="buttonBlue" />
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Incluir Treinamentos" 
                        style="width:120px" CssClass="buttonBlue" />
                </td>
            </tr>
        </table> 
        
        <asp:GridView ID="grdTreinamentos" runat="server" ForeColor="#333333" AutoGenerateColumns="false"
                CellPadding="4" GridLines="Both" BorderStyle="Solid" BorderColor="#000000" Width="100%"
            
            OnRowCommand="grdTreinamentos_RowCommand" OnRowDeleting="grdTreinamentos_RowDeleting"
            OnRowDataBound="grdTreinamentos_RowDataBound" OnPageIndexChanging="grdTreinamentos_PageIndexChanging"
            PageSize="15" AllowPaging="true">

            <Columns>
                <asp:TemplateField HeaderText="Treinamentos">
                    <ItemTemplate>
                        <b>Date: </b><%# getDurationDate(Convert.ToDateTime(Eval("StartDate")),Convert.ToDateTime(Eval("EndDate"))) %></b><br />
                        <asp:Label ID="lblTraining" runat="server" Text='<%#Eval("TrainingDetails") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Editar">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" runat="server" Text="Editar" CommandName="Edit" CommandArgument='<%# Eval("TrainingId") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Deletar">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("TrainingId") %>' Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White"/>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center"/>
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="true" ForeColor="#333333" />
            <AlternatingRowStyle BackColor="#EFF3FB"/>
            <EditRowStyle BackColor="#2461BF"/>
            <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White"/>
            <RowStyle BackColor="#EFF3FB" />
        </asp:GridView>
        

</asp:Content>

<asp:Content ID="cRightContent" runat="server" ContentPlaceHolderID="cphRight">
    <uc1:ucRightMenu runat="server" ID="ucRightMenu" /> 
</asp:Content>