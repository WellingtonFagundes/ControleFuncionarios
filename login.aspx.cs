using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    clsLogin objLogin = new clsLogin();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        objLogin.UserName = txtUserName.Text;
        objLogin.Password = txtPassword.Text;

        DataTable dtLogin = null;

        dtLogin = objLogin.ValidateLogin();

        if (dtLogin.Rows.Count == 0)
        {
            lblMessage.Text = "Login Inválido";
        }
        else
        {
            DataRow drLogin;
            drLogin = dtLogin.Rows[0];
            Session["LoginName"] = drLogin["LoginName"].ToString();
            Session["Rights"] = drLogin["Rights"].ToString();
            Session.Timeout = 7200;

            Response.Redirect("default.aspx");
        }
    }
}