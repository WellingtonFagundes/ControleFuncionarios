using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace BLL
{
    public class clsDepartment
    {
        public clsDepartment() { }

        #region Variables
        DBBridge objDBBridge = new DBBridge();
        protected int _departmentId;
        protected string _departmentName = String.Empty;
        const string _spName = "sp_tblDepartment";
        #endregion


        #region Class Property
        public int DepartmentId
        {
            get { return _departmentId; }

            set { _departmentId = value; }

        }

        public string DepartmentName {

            get { return _departmentName; }

            set { _departmentName = value; }
        }
        #endregion


        #region Public Methods

        public int Insert()
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Mode", "Insert");
            param[1] = new SqlParameter("@DepartmentName", _departmentName);
            return objDBBridge.ExecuteNonQuery(_spName, param);
        }

        public int Update() {
            
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@Mode", "Update");
            param[1] = new SqlParameter("@DepartmentId", _departmentId);
            param[2] = new SqlParameter("@DepartmentName", _departmentName);

            return objDBBridge.ExecuteNonQuery(_spName, param);
        }


        public int Delete() {

            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Mode", "Delete");
            param[1] = new SqlParameter("@DepartmentId", _departmentId);

            return objDBBridge.ExecuteNonQuery(_spName, param);
        
        }


        public DataSet SelectAll() {

            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Mode", "View");

            return objDBBridge.ExecuteDataSet(_spName, param);

        }


        public void SelectById() {

            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Mode", "ViewById");
            param[1] = new SqlParameter("@DepartmentId", _departmentId);

            DataTable dtDepartment;

            dtDepartment = objDBBridge.ExecuteDataSet(_spName, param).Tables[0];

            if (dtDepartment.Rows.Count > 0)
            {
                DataRow drDepartment;

                drDepartment = dtDepartment.Rows[0];

                _departmentId = Convert.ToInt32(drDepartment["DepartmentId"]);
                _departmentName = drDepartment["DepartmentName"].ToString();
            }
        }
        #endregion
    }
}
