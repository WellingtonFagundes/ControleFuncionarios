using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Employee_Add : System.Web.UI.Page
{
    clsDepartment objDepartment = new clsDepartment();
    clsEmployee objEmployee = new clsEmployee();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillDepartments();
            if (Request["EmployeeID"] != null)
            {
                getEmployeeDetails(Convert.ToInt32(Request["EmployeeId"].ToString()));
                btnSave.Visible = false;
                btnUpdate.Visible = true;
                imgPhoto.Visible = true;
            }
            else {

                btnSave.Visible = true;
                btnUpdate.Visible = false;
                imgPhoto.Visible = false;
            }
        
        
        }
    }


    protected void FillDepartments()
    {
        DataSet dsDepartment = new DataSet();
        dsDepartment = objDepartment.SelectAll();
        ddlDepartment.DataTextField = "DepartmentName";
        ddlDepartment.DataValueField = "DepartmentId";
        ddlDepartment.DataSource = dsDepartment.Tables[0];
        ddlDepartment.DataBind();
    }

    protected void getEmployeeDetails(int employeeId)
    {
        objEmployee.EmployeeID = employeeId;
        objEmployee.SelectById();

        txtName.Text = objEmployee.Name.ToString();
        txtDesignation.Text = objEmployee.Designation.ToString();
        txtDegree.Text = objEmployee.Degree.ToString();
        ddlDepartment.SelectedValue = objEmployee.DepartmentId.ToString();

        //Data de Admissão
        if (objEmployee.DOJ.CompareTo(Convert.ToDateTime("01/01/1900")) > 0)
        {
            txtDOJ.Text = objEmployee.DOJ.ToShortDateString();
        }
        else
        {
            txtDOJ.Text = "";
        }

        //Data Confirmado em
        if (objEmployee.DOC.CompareTo(Convert.ToDateTime("01/01/1900")) > 0)
        {
            txtDOC.Text = objEmployee.DOC.ToShortDateString();
        }
        else
        {
            txtDOC.Text = "";
        }


        ddlStatus.SelectedValue = objEmployee.Status.ToString();

        //Data de Nascimento
        if (objEmployee.DOB.CompareTo(Convert.ToDateTime("01/01/1900")) > 0)
        {
            txtDOB.Text = objEmployee.DOB.ToShortDateString();
        }
        else
        {
            txtDOB.Text = "";
        }

        txtAddress.Text = objEmployee.Address.ToString();
        txtCity.Text = objEmployee.City.ToString();
        txtState.Text = objEmployee.State.ToString();
        txtZipCode.Text = objEmployee.Zip.ToString();
        txtPhone.Text = objEmployee.Phone.ToString();
        txtMobile.Text = objEmployee.Mobile.ToString();
        txtEmail.Text = objEmployee.Email.ToString();
        txtPhoto.Text = objEmployee.Photo.ToString();
        txtBio.Text = objEmployee.Bio.ToString();
       // imgPhoto.ImageUrl = "EmpPhotos\\" + objEmployee.Photo.ToString();
        imgPhoto.ImageUrl = objEmployee.Photo.ToString();

    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        objEmployee.Name = txtName.Text.Trim();
        objEmployee.Designation = txtDesignation.Text.Trim();
        objEmployee.Degree = txtDegree.Text.Trim();
        objEmployee.DepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
        
        if (txtDOJ.Text.Trim() != "")
        {
            objEmployee.DOJ = Convert.ToDateTime(txtDOJ.Text.Trim());
        }
        else
        {
            objEmployee.DOJ = Convert.ToDateTime("01/01/1900");
        }

        if (txtDOC.Text.Trim() != "")
        {
            objEmployee.DOC = Convert.ToDateTime(txtDOC.Text.Trim());
        }
        else
        {
            objEmployee.DOC = Convert.ToDateTime("01/01/1900");
        }

        objEmployee.Status = Convert.ToInt32(ddlStatus.SelectedValue);

        if (txtDOB.Text.Trim() != "")
        {
            objEmployee.DOB = Convert.ToDateTime(txtDOB.Text.Trim());
        }
        else
        {
            objEmployee.DOB = Convert.ToDateTime("01/01/1900");
        }

        objEmployee.Address = txtAddress.Text.Trim();
        objEmployee.City = txtCity.Text.Trim();
        objEmployee.State = txtState.Text.Trim();
        objEmployee.Zip = txtZipCode.Text.Trim();
        objEmployee.Phone = txtPhone.Text.Trim();
        objEmployee.Mobile = txtMobile.Text.Trim();
        objEmployee.Email = txtEmail.Text.Trim();
        objEmployee.Bio = txtBio.Text.Trim();

        string sFileName;
        string sPathName;

        if (filePhoto.HasFile)
        {
            sFileName = Guid.NewGuid().ToString();
            string sPath = "";
            string sFile = filePhoto.FileName.ToString();
            sPath = Server.MapPath("EmpPhotos");
            sFileName = sFileName + sFile.Substring(sFile.LastIndexOf("."));
            filePhoto.SaveAs(sPath + "\\" + sFileName);
            sPathName = "EmpPhotos\\" + sFileName;
        }
        else
        {
            if (imgPhoto.ImageUrl.ToString() == "")
            {
                lblMessage.Text = "Imagem não carregada favor selecionar";
                return;
            }

            sPathName = "NoImage.jpg";
        }
        objEmployee.Photo = sPathName;

        objEmployee.Insert();
        Response.Redirect("Manage-Employee.aspx");

    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objEmployee.EmployeeID = Convert.ToInt32(Request["EmployeeId"].ToString());
        objEmployee.Name = txtName.Text.Trim();
        objEmployee.Designation = txtDesignation.Text.Trim();
        objEmployee.Degree = txtDegree.Text.Trim();
        objEmployee.DepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue);

        if (txtDOJ.Text.Trim() != "")
        {
            objEmployee.DOJ = Convert.ToDateTime(txtDOJ.Text.Trim());
        }
        else
        {
            objEmployee.DOJ = Convert.ToDateTime("01/01/1900");
        }

        if (txtDOC.Text.Trim() != "")
        {
            objEmployee.DOC = Convert.ToDateTime(txtDOC.Text.Trim());
        }
        else
        {
            objEmployee.DOC = Convert.ToDateTime("01/01/1900");
        }

        objEmployee.Status = Convert.ToInt32(ddlStatus.SelectedValue);

        if (txtDOB.Text.Trim() != "")
        {
            objEmployee.DOB = Convert.ToDateTime(txtDOB.Text.Trim());
        }
        else
        {
            objEmployee.DOB = Convert.ToDateTime("01/01/1900");
        }

        objEmployee.Address = txtAddress.Text.Trim();
        objEmployee.City = txtCity.Text.Trim();
        objEmployee.State = txtState.Text.Trim();
        objEmployee.Zip = txtZipCode.Text.Trim();
        objEmployee.Phone = txtPhone.Text.Trim();
        objEmployee.Mobile = txtMobile.Text.Trim();
        objEmployee.Email = txtEmail.Text.Trim();
        objEmployee.Bio = txtBio.Text.Trim();


        string sFileName;
        string sPathName;

        if (filePhoto.HasFile)
        {
            string sPath = "";
            string sFile = filePhoto.FileName.ToString();

            sFileName = Guid.NewGuid().ToString();

            sPath = Server.MapPath("EmpPhotos");
            sFileName = sFileName + sFile.Substring(sFile.LastIndexOf("."));
            filePhoto.SaveAs(sPath + "\\" + sFileName);
            sPathName = "EmpPhotos\\" + sFileName;
        }
        else
        {
            if ((imgPhoto.ImageUrl.ToString() == "EmpPhotos\\NoImage.jpg") || (imgPhoto.ImageUrl.ToString() == "")) { 
                sPathName = "NoImage.jpg";
            }else
            {
                sPathName = imgPhoto.ImageUrl.ToString();
            }
        }
        objEmployee.Photo = sPathName;

        objEmployee.Update();
        Response.Redirect("Manage-Employee.aspx");
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manage-Employee.aspx");
    }
}