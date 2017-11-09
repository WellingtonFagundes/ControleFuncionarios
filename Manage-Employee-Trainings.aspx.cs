using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Employee_Trainings : System.Web.UI.Page
{
    clsTrainings objTrainings = new clsTrainings();
    clsEmployee objEmployee = new clsEmployee();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PreencherDetalhesTreinamento();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manage-Employee.aspx");
    }

    private void PreencherDetalhesTreinamento()
    {
        if (Request["JobType"].ToString() == "1")
        {
            lblTraining.Text = "Treinamento em serviço";
        }
        else if (Request["JobType"].ToString() == "2")
        {
            lblTraining.Text = "Treinamento fora de serviço";
        }
        objEmployee.EmployeeID = Convert.ToInt32(Request["EmpId"].ToString());
        objEmployee.SelectById();
        lblEmployeeName.Text = objEmployee.Name.ToString();

        objTrainings.EmployeeId = Convert.ToInt32(Request["EmpId"].ToString());
        objTrainings.JobType = Convert.ToInt32(Request["JobType"].ToString());
        grdTreinamentos.DataSource = objTrainings.SelectByEmployee();
        grdTreinamentos.DataBind();
    }
    
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manage-Employee-Trainings-Add.aspx?EmpId=" + Request["EmpId"].ToString() + "&JobType=" + Request["JobType"].ToString());
    }


    protected void grdTreinamentos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString().ToUpper() == "EDIT")
        { 
            Response.Redirect("Manage-Employee-Trainings-Add.aspx?EmpId=" + Request["EmpId"].ToString() + "&JobType=" + Request["JobType"].ToString() + "&TrainingId=" + e.CommandArgument.ToString());
        }

        if (e.CommandName.ToString().ToUpper() == "DELETE")
        {
            objTrainings.TrainingId = Convert.ToInt32(e.CommandArgument.ToString());
            objTrainings.Delete();
            lblMessage.Text = "Treinamento excluído com sucesso";
        }


    }
    protected void grdTreinamentos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        PreencherDetalhesTreinamento();
    }


    protected void grdTreinamentos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lbDelete = (LinkButton)e.Row.FindControl("lbDelete");
            lbDelete.Attributes.Add("onclick", "return confirm('Deseja excluir este treinamento?');");
        }
    }
    protected void grdTreinamentos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdTreinamentos.PageIndex = e.NewPageIndex;
        PreencherDetalhesTreinamento();
    }

    public string getDurationDate(DateTime dStartDate, DateTime dEndDate)
    {
        string sStartDate = "";
        string sEndDate = "";

        if (dStartDate.CompareTo(Convert.ToDateTime("01/01/1900")) > 0)
        {
            sStartDate = dStartDate.ToString("dd/MM/yyyy");
        }
        else
        {
            sStartDate = "";
        }

        if (dEndDate.CompareTo(Convert.ToDateTime("01/01/1900")) > 0)
        {
            sEndDate = dEndDate.ToString("dd/MM/yyyy");
        }
        else
        {
            sEndDate = "";
        }

        return sStartDate + " - " + sEndDate;
    
    }
}