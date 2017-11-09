using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Login : System.Web.UI.Page
{
    clsLogin objLogin = new clsLogin();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillLoginDetails();
        }
    }

    public void FillLoginDetails() {

        grvMaster.DataSource = objLogin.SelectAll();
        grvMaster.DataBind();
        
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manage-Login-Add.aspx");
    }


    protected void Unnamed_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString().ToUpper() == "EDIT")
        {
            Response.Redirect("Manage-Login-Add.aspx?LoginId=" + e.CommandArgument.ToString());
        }
        
        if (e.CommandName.ToString().ToUpper() == "DELETE")
        {
            objLogin.LoginId = Convert.ToInt32(e.CommandArgument.ToString());
            objLogin.Delete();
            lblMensagem.Text = "Login excluído com sucesso!!";
        }
    }
    protected void Unnamed_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lbDelete = (LinkButton)e.Row.FindControl("lbDelete");
            lbDelete.Attributes.Add("onclick", "return confirm('Deseja excluir este login?');");
        }
    }

    protected void Unnamed_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        FillLoginDetails();
    }


    protected void Unnamed_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvMaster.PageIndex = e.NewPageIndex;
        FillLoginDetails();
    }

    public string getRights(int nRights)
    {
        if (nRights == 1)
        {
            return "Admin";
        }

        return "User";

    }
}