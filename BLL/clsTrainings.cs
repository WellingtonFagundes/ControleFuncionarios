using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace BLL
{
    public class clsTrainings
    {
        #region Variables
        DBBridge objDBBridge = new DBBridge();
        protected int _trainingId;
        protected DateTime _startDate;
        protected DateTime _endDate;
        protected string _trainingDetails = String.Empty;
        protected string _effectiveness = String.Empty;
        protected int _jobType;
        protected int _employeeId;
        const string _spname = "sp_tblTrainings";
        #endregion


        #region Class Property
        
        public int TrainingId
        {
            get { return _trainingId; }
            set { _trainingId = value; }
        }

        public DateTime StartDate {

            get { return _startDate; }
            set { _startDate = value; }
        }

        public DateTime EndDate
        {
            get { return _endDate; }
            set { _endDate = value; }
        }

        public string TrainingDetails
        {
            get { return _trainingDetails; }
            set { _trainingDetails = value; }
        }

        public string Effectiveness
        {
            get { return _effectiveness; }
            set { _effectiveness = value; }
        }

        public int JobType
        {
            get { return _jobType; }
            set { _jobType = value; }
        }

        public int EmployeeId
        {
            get { return _employeeId; }
            set { _employeeId = value; }
        }
        #endregion


        #region Public Methods

        public int Insert()
        {
            SqlParameter[] param = new SqlParameter[7];
            param[0] = new SqlParameter("@StartDate",_startDate);
            param[1] = new SqlParameter("@EndDate",_endDate);
            param[2] = new SqlParameter("@TrainingDetails",_trainingDetails);
            param[3] = new SqlParameter("@Effectiveness",_effectiveness);
            param[4] = new SqlParameter("@JobType",_jobType);
            param[5] = new SqlParameter("@EmployeeId",_employeeId);
            param[6] = new SqlParameter("@Mode", "Insert");
            return objDBBridge.ExecuteNonQuery(_spname, param);
        }


        public int Update()
        {
            SqlParameter[] param = new SqlParameter[8];
            param[0] = new SqlParameter("@StartDate", _startDate);
            param[1] = new SqlParameter("@EndDate", _endDate);
            param[2] = new SqlParameter("@TrainingDetails", _trainingDetails);
            param[3] = new SqlParameter("@Effectiveness", _effectiveness);
            param[4] = new SqlParameter("@JobType", _jobType);
            param[5] = new SqlParameter("@EmployeeId", _employeeId);
            param[6] = new SqlParameter("@Mode", "Update");
            param[7] = new SqlParameter("@TrainingId", _trainingId);
            return objDBBridge.ExecuteNonQuery(_spname, param);
        }

        public int Delete()
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Mode", "Delete");
            param[1] = new SqlParameter("@TrainingId", _trainingId);
            return objDBBridge.ExecuteNonQuery(_spname, param);
        }

        public DataSet SelectByEmployee()
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@Mode", "ViewByEmployee");
            param[1] = new SqlParameter("@EmployeeId", _employeeId);
            param[2] = new SqlParameter("@JobType", _jobType);

            return objDBBridge.ExecuteDataSet(_spname, param);
        }

        public void SelectById()
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Mode", "ViewById");
            param[1] = new SqlParameter("@TrainingId", _trainingId);

            DataTable dtTrainings = new DataTable();
            dtTrainings = objDBBridge.ExecuteDataSet(_spname, param).Tables[0];

            if (dtTrainings.Rows.Count > 0)
            { 
                DataRow drTraining = dtTrainings.Rows[0];

                _employeeId = Convert.ToInt32(drTraining["EmployeeId"].ToString());
                _trainingId = Convert.ToInt32(drTraining["TrainingId"].ToString());
                _startDate = Convert.ToDateTime(drTraining["StartDate"].ToString());
                _endDate = Convert.ToDateTime(drTraining["EndDate"].ToString());
                _effectiveness = Convert.ToString(drTraining["effectiveness"].ToString());
                _jobType = Convert.ToInt32(drTraining["JobType"].ToString());
                _trainingDetails = Convert.ToString(drTraining["TrainingDetails"].ToString());
            }
        }
        #endregion

    }
}
