using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Login_Add : System.Web.UI.Page
{
    clsLogin objLogin = new clsLogin();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["LoginId"] != null)
            {
                getLoginDetails(Convert.ToInt32(Request["LoginId"].ToString()));
                btnSave.Visible = false;
                btnAtualizar.Visible = true;
            }else
            {
                btnSave.Visible = true;
                btnAtualizar.Visible = false;
            }
        }
    }

    protected void getLoginDetails(int loginId)
    {
        objLogin.LoginId = loginId;
        objLogin.SelectById();

        txtName.Text = objLogin.LoginName.ToString();
        txtEmail.Text = objLogin.Email.ToString();
        txtUserName.Text = objLogin.UserName.ToString();
        txtSenha.Text = objLogin.Password.ToString();
        ddlRights.SelectedValue = objLogin.Rights.ToString();
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        objLogin.LoginName = txtName.Text.Trim();
        objLogin.Email = txtEmail.Text.Trim();
        objLogin.UserName = txtUserName.Text.Trim();
        objLogin.Password = txtSenha.Text.Trim();
        objLogin.Rights = Convert.ToInt32(ddlRights.SelectedValue.ToString());

        objLogin.Insert();
        Response.Redirect("Manage-Login.aspx");

    }


    protected void btnAtualizar_Click(object sender, EventArgs e)
    {
        objLogin.LoginId = Convert.ToInt32(Request["LoginId"].ToString());
        objLogin.LoginName = txtName.Text.Trim();
        objLogin.Email = txtEmail.Text.Trim();
        objLogin.UserName = txtUserName.Text.Trim();
        objLogin.Password = txtSenha.Text.Trim();
        objLogin.Rights = Convert.ToInt32(ddlRights.SelectedValue.ToString());

        objLogin.Update();
        Response.Redirect("Manage-Login.aspx");
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manage-Login.aspx");
    }
}