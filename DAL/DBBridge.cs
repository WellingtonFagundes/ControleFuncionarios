using DAL.Properties;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    [Serializable]
    public class DBBridge
    {
        public DBBridge() { 
        
        }

        public static string DBConnection()
        {
            try
            {
                //Aqui se utiliza-se o web.config
                //return System.Configuration.ConfigurationManager.ConnectionStrings["RecursosHumanos"].ConnectionString;

                //Aqui com app.config e settings properties
                return Settings.Default.RecursosHumanos;

            }catch(Exception ex){

                throw new ApplicationException("Erro na conexão.Detalhes: " + ex.Message);
            }
        }

        public int ExecuteNonQuery(string storedProcedure, SqlParameter[] param)
        {

            try
            {
                return SQLHelper.ExecuteNonQuery(DBConnection(), System.Data.CommandType.StoredProcedure, storedProcedure, param);
            }
            catch (Exception ex) {
                throw ex;
            }
        }

        public DataSet ExecuteDataSet(string storedProcedure, SqlParameter[] param)
        {
            try
            {
                return SQLHelper.ExecuteDataSet(DBConnection(), CommandType.StoredProcedure, storedProcedure, param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
