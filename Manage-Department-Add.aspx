<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage-Department-Add.aspx.cs" Inherits="Manage_Department_Add" 
    MasterPageFile="~/default.master"%>

<%@ Register Src="~/Includes/ucRightMenu.ascx" TagName="ucRightMenu" TagPrefix="uc1" %>

<asp:Content runat="server" ID="cMainContent" ContentPlaceHolderID="cphMain">

    <center><div class="title">Adicionar/Editar Departamentos</div></center>

    <div class="text_area" align="center">
         <table cellspadding="4" cellspacing="4" border="0">

           <tr>
               <td colspan="2" style="text-align:center">
                   <asp:Label runat="server" ID="lblMessage"></asp:Label>
               </td>
           </tr>

           <tr>
               <td>
                   Departamento
               </td>
               <td>
                   <asp:TextBox runat="server" ID="txtDepartamento" CssClass="input300"></asp:TextBox>
                   <asp:RequiredFieldValidator runat="server" ID="reqDepartamento" ControlToValidate="txtDepartamento"
                       ErrorMessage="*" ForeColor="Red" Font-Bold="true" Font-Size="Small"></asp:RequiredFieldValidator>
               </td>
           </tr> 
            
             <tr>
                 <td colspan="2" align="center">
                     <asp:Button runat="server" ID="btnSave" CssClass="buttonBlue" OnClick="btnSave_Click" Text="Salvar"/>
                     <asp:Button runat="server" ID="btnUpdate" CssClass="buttonBlue" OnClick="btnUpdate_Click" Text="Atualizar" />
                     <asp:Button runat="server" ID="btnCancel" CssClass="buttonBlue" 
                         CausesValidation="false" OnClick="btnCancel_Click" Text="Cancelar" />
                 </td>

             </tr>



         </table>   
    </div>

</asp:Content>

<asp:Content runat="server" ID="cRightContent" ContentPlaceHolderID="cphRight">
    <uc1:ucRightMenu runat="server" ID="ucRightMenu" />
</asp:Content>