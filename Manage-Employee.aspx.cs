using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Employee : System.Web.UI.Page
{
    clsEmployee objEmployee = new clsEmployee();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PreencherDetalhesFuncionario();
        }
    }

    protected void PreencherDetalhesFuncionario()
    {
        if (chkStatus.Checked)
        {
            //Ver demitidos
            grvEmployee.DataSource = objEmployee.SelectInActive();
        }
        else
        {
            //Ver todos os funcionários ativos na empresa
            grvEmployee.DataSource = objEmployee.Select();
        }

        grvEmployee.DataBind();
    }


    protected void chkStatus_CheckedChanged(object sender, EventArgs e)
    {
        PreencherDetalhesFuncionario();
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manage-Employee-Add.aspx");
    }


    protected void Unnamed_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString().ToUpper() == "ONJOB")
        {
            Response.Redirect("Manage-Employee-Trainings.aspx?EmpId=" + e.CommandArgument.ToString() + "&JobType=1");
        }

        if (e.CommandName.ToString().ToUpper() == "OFFJOB")
        {
            Response.Redirect("Manage-Employee-Trainings.aspx?EmpId=" + e.CommandArgument.ToString() + "&JobType=2");
        }

        if (e.CommandName.ToString().ToUpper() == "EDIT")
        {
            Response.Redirect("Manage-Employee-Add.aspx?EmployeeId=" + e.CommandArgument.ToString());
        }

        if (e.CommandName.ToString().ToUpper() == "DELETE")
        {
            objEmployee.EmployeeID = Convert.ToInt32(e.CommandArgument.ToString());
            objEmployee.Delete();
            lblMessage.Text = "Funcionário excluído com sucesso";
        }
    }
    protected void Unnamed_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lbDelete = (LinkButton)e.Row.FindControl("lbDelete");
            lbDelete.Attributes.Add("onclick", "return confirm('Deseja deletar este registro?');");
        }
    }

    protected void Unnamed_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        PreencherDetalhesFuncionario();
    }

    protected void Unnamed_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvEmployee.PageIndex = e.NewPageIndex;
        PreencherDetalhesFuncionario();
    }
}