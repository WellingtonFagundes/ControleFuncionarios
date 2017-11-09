using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_List_Employee_Report : System.Web.UI.Page
{
    clsEmployee objEmployee = new clsEmployee();
    clsDepartment objDepartment = new clsDepartment();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PreencherDetalhesFuncionário();
        }
    }

    protected void PreencherDetalhesFuncionário()
    {
        gvEmployee.DataSource = objEmployee.Select();
        gvEmployee.DataBind();
    }

    public string getDepartment(int DepartmentId)
    {
        objDepartment.DepartmentId = DepartmentId;
        objDepartment.SelectById();

        return objDepartment.DepartmentName.ToString();
    }
}