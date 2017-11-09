using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Includes_ucRightMenu : System.Web.UI.UserControl
{
    clsEmployee objEmployee = new clsEmployee();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Rights"].ToString() == "0")
        {
            divAdmin.Visible = false;
        }


        if (!Page.IsPostBack)
        {
            lblEmpCount.Text = objEmployee.EmpCount();
            dlBirhtday.DataSource = objEmployee.Birthday();
            dlBirhtday.DataBind();

            if (dlBirhtday.Items.Count == 0)
            {
                lblMessage.Text = "Sem aniversariantes";
            }
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["LoginName"] = null;
        Session["Rights"] = null;

        Response.Redirect("login.aspx");
    }
}