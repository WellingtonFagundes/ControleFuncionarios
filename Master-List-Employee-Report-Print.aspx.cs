using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_List_Employee_Report_Print : System.Web.UI.Page
{
    clsDepartment objDepartment = new clsDepartment();
    clsEmployee objEmployee = new clsEmployee();

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["LoginName"] == null) || Session["LoginName"].ToString() == "")
        {
            Response.Redirect("Login.aspx");
        }

        if (!Page.IsPostBack)
        {
            PreencherDetalhesFuncionario();
        }
    }

    protected void PreencherDetalhesFuncionario()
    {
        gvMaster.DataSource = objEmployee.Select();
        gvMaster.DataBind();
    }

    public string getFormattedDate(DateTime dDate)
    {
        if (dDate.CompareTo(Convert.ToDateTime("01/01/1900")) > 0)
        {
            return dDate.ToString("dd/MM/yyyy");
        }
        else
        {
            return "";
        }
    }
    public string getDepartmentName(int DepartmentID)
    {
        objDepartment.DepartmentId = DepartmentID;
        objDepartment.SelectById();

        return objDepartment.DepartmentName.ToString();
    }
}