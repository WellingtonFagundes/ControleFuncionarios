using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_Training_Report : System.Web.UI.Page
{
    clsEmployee objEmployee = new clsEmployee();
    clsDepartment objDepartment = new clsDepartment();
    clsTrainings objTrainings = new clsTrainings();

    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Timeout = 7200;

        if ((Session["LoginName"] == null) || (Session["LoginName"].ToString() == ""))
        {
            Response.Redirect("Login.aspx");
        }

        if (!Page.IsPostBack)
        {
            PreencherDetalhesTreinamento();
        }
    }


    protected void PreencherDetalhesTreinamento()
    {
        objEmployee.EmployeeID = Convert.ToInt32(Request["EmpId"].ToString());
        objEmployee.SelectById();
        lblEmployeeName.Text = objEmployee.Name.ToString();
        lblDesignation.Text = objEmployee.Designation.ToString();
        lblDegree.Text = objEmployee.Degree.ToString();
        if (objEmployee.DOJ.CompareTo(Convert.ToDateTime("01/01/1900")) > 0)
        {
            lblDOJ.Text = objEmployee.DOJ.ToString("dd/MM/yyyy");
        }else
        {
            lblDOJ.Text = "";
        }
        lblEmpId.Text = "EMP" + objEmployee.EmployeeID.ToString();

        objDepartment.DepartmentId = objEmployee.DepartmentId;
        objDepartment.SelectById();
        lblDeparment.Text = objDepartment.DepartmentName.ToString();

        //Configuração do gridview de treinamento no trabalho
        objTrainings.EmployeeId = Convert.ToInt32(Request["EmpId"].ToString());
        objTrainings.JobType = 1;
        gvOnJob.DataSource = objTrainings.SelectByEmployee();
        gvOnJob.DataBind();


        //Configuração do gridview de treinamento fora do trabalho
        objTrainings.EmployeeId = Convert.ToInt32(Request["EmpId"].ToString());
        objTrainings.JobType = 2;
        gvOffJob.DataSource = objTrainings.SelectByEmployee();
        gvOffJob.DataBind();


    }


    public string getDurationDate(DateTime dStartDate,DateTime dEndDate)
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
        }else
        {
            sEndDate = "";
        }

        return sStartDate + " - " + sEndDate;
    }
}