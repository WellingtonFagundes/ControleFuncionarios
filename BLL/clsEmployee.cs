using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace BLL
{
    public class clsEmployee
    {
        #region variables
        DBBridge objDBBridge = new DBBridge();
        protected int _employeeId;
        protected string _name = String.Empty;
        protected DateTime _dob;
        protected string _degree = String.Empty;
        protected string _address = String.Empty;
        protected string _city = String.Empty;
        protected string _state = String.Empty;
        protected string _zip = String.Empty;
        protected string _phone = String.Empty;
        protected string _mobile = String.Empty;
        protected string _email = String.Empty;
        protected string _designation = String.Empty;
        protected int _departmentID;
        protected DateTime _doj;
        protected DateTime _doc;
        protected string _bio = String.Empty;
        protected string _photo = String.Empty;
        protected int _status;
        protected int _years;
        const string _spName = "sp_tblEmployee";
        #endregion

        #region class property

        public int EmployeeID {

            get { return _employeeId; }

            set { _employeeId = value; }
        }

        public string Name
        {

            get { return _name; }

            set { _name = value; }
        }

        public DateTime DOB
        {

            get { return _dob; }

            set { _dob = value; }
        }

        public string Degree
        {

            get { return _degree; }

            set { _degree = value; }
        }

        public string Address
        {

            get { return _address; }

            set { _address = value; }
        }

        public string City
        {

            get { return _city; }

            set { _city = value; }
        }

        public string State
        {

            get { return _state; }

            set { _state = value; }
        }

        public string Zip
        {

            get { return _zip; }

            set { _zip = value; }
        }

        public string Phone
        {

            get { return _phone; }

            set { _phone = value; }
        }

        public string Mobile
        {

            get { return _mobile; }

            set { _mobile = value; }
        }

        public string Email
        {

            get { return _email; }

            set { _email = value; }
        }

        public string Designation
        {

            get { return _designation; }

            set { _designation = value; }
        }

        public int DepartmentId
        {
            get { return _departmentID; }
            set { _departmentID = value; }
        }

        public DateTime DOJ
        {

            get { return _doj; }

            set { _doj = value; }
        }

        public DateTime DOC
        {

            get { return _doc; }

            set { _doc = value; }
        }

        public string Bio
        {
            get { return _bio; }
            set { _bio = value; }
        }

        public string Photo
        {
            get { return _photo; }
            set { _photo = value; }
        }

        public int Status
        {
            get { return _status; }
            set { _status = value; }
        }

        public int Years {

            get { return _years; }
            set { _years = value; }
        }
        #endregion


        #region methods

        public int Insert()
        {
            SqlParameter[] param = new SqlParameter[18];
            param[0] = new SqlParameter("@Mode", "Insert");
            param[1] = new SqlParameter("@Name", _name);
            param[2] = new SqlParameter("@DOB", _dob);
            param[3] = new SqlParameter("@Degree", _degree);
            param[4] = new SqlParameter("@Address", _address);
            param[5] = new SqlParameter("@City", _city);
            param[6] = new SqlParameter("@State", _state);
            param[7] = new SqlParameter("@Zip", _zip);
            param[8] = new SqlParameter("@Phone", _phone);
            param[9] = new SqlParameter("@Mobile", _mobile);
            param[10] = new SqlParameter("@Email", _email);
            param[11] = new SqlParameter("@Designation", _designation);
            param[12] = new SqlParameter("@DepartmentID", _departmentID);
            param[13] = new SqlParameter("@DOJ", _doj);
            param[14] = new SqlParameter("@DOC", _doc);
            param[15] = new SqlParameter("@Bio", _bio);
            param[16] = new SqlParameter("@Photo", _photo);
            param[17] = new SqlParameter("@Status", _status);
            return objDBBridge.ExecuteNonQuery(_spName, param);
        }

        public int Update()
        {
            SqlParameter[] param = new SqlParameter[19];
            param[0] = new SqlParameter("@Mode", "Update");
            param[1] = new SqlParameter("@Name", _name);
            param[2] = new SqlParameter("@DOB", _dob);
            param[3] = new SqlParameter("@Degree", _degree);
            param[4] = new SqlParameter("@Address", _address);
            param[5] = new SqlParameter("@City", _city);
            param[6] = new SqlParameter("@State", _state);
            param[7] = new SqlParameter("@Zip", _zip);
            param[8] = new SqlParameter("@Phone", _phone);
            param[9] = new SqlParameter("@Mobile", _mobile);
            param[10] = new SqlParameter("@Email", _email);
            param[11] = new SqlParameter("@Designation", _designation);
            param[12] = new SqlParameter("@DepartmentID", _departmentID);
            param[13] = new SqlParameter("@DOJ", _doj);
            param[14] = new SqlParameter("@DOC", _doc);
            param[15] = new SqlParameter("@Bio", _bio);
            param[16] = new SqlParameter("@Photo", _photo);
            param[17] = new SqlParameter("@Status", _status);
            param[18] = new SqlParameter("@EmployeeId", _employeeId);
            return objDBBridge.ExecuteNonQuery(_spName, param);
        }

        public int Delete()
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Mode", "Delete");
            param[1] = new SqlParameter("@EmployeeID", _employeeId);

            return objDBBridge.ExecuteNonQuery(_spName, param);
        }


        public DataSet Select() {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Mode", "ViewActive");
            return objDBBridge.ExecuteDataSet(_spName, param);
        }


        public DataSet SelectByExperience()
        {
            SqlParameter[] param = new SqlParameter[2];
            if (_years == -1)
            {
                param[0] = new SqlParameter("@Mode", "ViewService");
            }
            else {
                param[0] = new SqlParameter("@Mode", "FilterService");
            }

            param[1] = new SqlParameter("Years", _years);

            return objDBBridge.ExecuteDataSet(_spName, param);
        }


        public DataSet ViewYears()
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Mode", "ViewYears");
            return objDBBridge.ExecuteDataSet(_spName, param);
        }


        public DataSet SelectInActive() {

            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Mode", "ViewInActive");

            return objDBBridge.ExecuteDataSet(_spName, param);
            
        }

        public DataSet SelectAll() {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Mode", "View");

            return objDBBridge.ExecuteDataSet(_spName, param);
        }

        public DataSet Birthday()
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Mode", "Birthday");

            return objDBBridge.ExecuteDataSet(_spName, param);
        }

        public void SelectById() {

            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Mode", "ViewById");
            param[1] = new SqlParameter("@EmployeeId", _employeeId);

            DataTable dtEmployee = new DataTable();
            dtEmployee = objDBBridge.ExecuteDataSet(_spName, param).Tables[0];

            if (dtEmployee.Rows.Count > 0)
            {
                DataRow drEmployee;

                drEmployee = dtEmployee.Rows[0];

                _name = drEmployee["Name"].ToString();
                _dob = Convert.ToDateTime(drEmployee["DOB"]);
                _degree = Convert.ToString(drEmployee["Degree"]);
                _address = Convert.ToString(drEmployee["Address"]);
                _city = Convert.ToString(drEmployee["City"]);
                _state = Convert.ToString(drEmployee["State"]);
                _zip = Convert.ToString(drEmployee["Zip"]);
                _phone = Convert.ToString(drEmployee["Phone"]);
                _mobile = Convert.ToString(drEmployee["Mobile"]);
                _email = Convert.ToString(drEmployee["Email"]);
                _designation = Convert.ToString(drEmployee["Designation"]);
                _departmentID = Convert.ToInt32(drEmployee["DepartmentId"]);
                _doj = Convert.ToDateTime(drEmployee["DOJ"]);
                _doc = Convert.ToDateTime(drEmployee["DOC"]);
                _bio = Convert.ToString(drEmployee["Bio"]);
                _photo = Convert.ToString(drEmployee["Photo"]);
                _status = Convert.ToInt32(drEmployee["Status"]);
            }
            
        }

        public string EmpCount() {

            string count = "0";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Mode", "EmpCount");

            DataTable dtEmployee = new DataTable();
            dtEmployee = objDBBridge.ExecuteDataSet(_spName, param).Tables[0];

            if (dtEmployee.Rows.Count > 0)
            {
                DataRow drEmployee;
                drEmployee = dtEmployee.Rows[0];
                count = drEmployee["EmpCount"].ToString();
            }

            return count;
        }
        #endregion
    }
}
