using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _default : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Timeout = 7200;

        if ((Session["LoginName"] == null) || (Session["LoginName"].ToString() == ""))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            lblHeaderMessage.Text = "Bem vindo " + Session["LoginName"].ToString(); 
        }
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session["LoginName"] = null;
        Session["Rights"] = null;
        Response.Redirect("Login.aspx");
    }
}
