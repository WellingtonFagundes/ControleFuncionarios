using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Department_Add : System.Web.UI.Page
{
    clsDepartment objDepartment = new clsDepartment();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["DepartmentId"] != null)
            {
                getDepartmentDetails(Convert.ToInt32(Request["DepartmentId"].ToString()));
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            else
            {
                btnSave.Visible = true;
                btnUpdate.Visible = false;
            }
        }
    }

    protected void getDepartmentDetails(int DepartmentId)
    {
        objDepartment.DepartmentId = DepartmentId;
        objDepartment.SelectById();
        txtDepartamento.Text = objDepartment.DepartmentName.ToString();
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        objDepartment.DepartmentName = txtDepartamento.Text.Trim();
        objDepartment.Insert();
        Response.Redirect("Manage-Department.aspx");
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objDepartment.DepartmentId = Convert.ToInt32(Request["DepartmentId"].ToString());
        objDepartment.DepartmentName = txtDepartamento.Text.Trim();
        objDepartment.Update();
        Response.Redirect("Manage-Department.aspx");
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manage-Department.aspx");
    }
}