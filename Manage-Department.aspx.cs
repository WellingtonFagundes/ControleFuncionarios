using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Department : System.Web.UI.Page
{
    clsDepartment objDepartment = new clsDepartment();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillDepartmentDetails();
        }
    }

    protected void FillDepartmentDetails() {

        grvDepartamentos.DataSource = objDepartment.SelectAll();
        grvDepartamentos.DataBind();
    
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manage-Department-Add.aspx");
    }


    protected void grvDepartamentos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString().ToUpper() == "EDIT")
        {
            Response.Redirect("Manage-Department-Add.aspx?DepartmentId=" + e.CommandArgument.ToString());
        }

        if (e.CommandName.ToString().ToUpper() == "DELETE")
        {
            objDepartment.DepartmentId = Convert.ToInt32(e.CommandArgument.ToString());
            objDepartment.Delete();

            lblMessage.Text = "Departamento excluído com sucesso!!";
        }
    }
    protected void grvDepartamentos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lbDelete = (LinkButton)e.Row.FindControl("lbDelete");
            lbDelete.Attributes.Add("onclick", "return confirm('Deseja excluir este departamento?');");
        }
    }


    protected void grvDepartamentos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvDepartamentos.PageIndex = e.NewPageIndex;
        FillDepartmentDetails();
    }


    protected void grvDepartamentos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        FillDepartmentDetails();
    }
}