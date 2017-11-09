using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public sealed class SQLHelper
    {
        private SQLHelper() { }


        #region Private utility métodos e construtores
            
            private static void AttachParameters(SqlCommand command,SqlParameter[] commandParameters){
            
                  if (command == null) throw new ArgumentNullException("command");
  
                  if (commandParameters != null)
                  {
                      foreach(SqlParameter param in commandParameters){
                           if (param != null)
                           {
                               if (param.Direction == ParameterDirection.InputOutput ||
                                   param.Direction == ParameterDirection.Input &&
                                   param.Value == null){
                                
                                   param.Value = DBNull.Value;
                               }

                               command.Parameters.Add(param);
                           }
                      }
                  }
            }


            private static void PrepareCommand(SqlCommand command,SqlConnection connection, SqlTransaction transaction,CommandType commandType,string commandText,SqlParameter[] commandParameters,out bool MustCloseConnection)
            {
                if (command == null) throw new ArgumentNullException("command");
                if (commandText == null || commandText.Length == 0) throw new ArgumentNullException("commandtext");

                if (connection.State != ConnectionState.Open)
                {
                    MustCloseConnection = true;

                    try
                    {
                        connection.Open();

                    }catch(Exception ex)
                    {
                        string msg = "Banco de Dados com erro";
                        throw new Exception(msg,ex);
                    }
                }else{
                   MustCloseConnection = false;
                }

                command.Connection = connection;
                command.CommandText = commandText;

                if (transaction != null)
                {
                    if (transaction.Connection == null) throw new ArgumentNullException("A transação está rollback ou commited, por favor abra o provedor da transação","transaction");

                    command.Transaction = transaction;
                }

                command.CommandType = commandType;

                if (commandParameters != null)
                {
                    AttachParameters(command,commandParameters);
                }

                return;
            }

        #endregion


        #region ExecuteNonQuery

        public static int ExecuteNonQuery(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (connectionString == null || connectionString.Length == 0)
                throw new ArgumentNullException("connectionstring");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                return ExecuteNonQuery(connection,commandType,commandText,commandParameters);
            }
        }

        public static int ExecuteNonQuery(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        { 
            if (connection == null) throw new ArgumentNullException("connection");
            
            SqlCommand cmd = new SqlCommand();

            bool mustCloseConnection = false;

            PrepareCommand(cmd,connection,(SqlTransaction)null,commandType,commandText,commandParameters,out mustCloseConnection);
            
            int retval = cmd.ExecuteNonQuery();

            cmd.Parameters.Clear();

            if (mustCloseConnection)
                connection.Close();
                
            return retval;
         }
            
        #endregion


        #region ExecuteDataSet

        public static DataSet ExecuteDataSet(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (connectionString == null || connectionString.Length == 0) throw new ArgumentNullException("connectionString");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                return ExecuteDataSet(connection, commandType, commandText, commandParameters);
            }
        
        }

        public static DataSet ExecuteDataSet(SqlConnection connection, CommandType commandType, string commandText)
        {
            return ExecuteDataSet(connection, commandType, commandText, (SqlParameter[])null);
        }


        public static DataSet ExecuteDataSet(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (connection == null) throw new ArgumentNullException("connection");

            SqlCommand cmd = new SqlCommand();
            bool mustCloseConnection = false;

            PrepareCommand(cmd, connection, (SqlTransaction)null, commandType, commandText, commandParameters, out mustCloseConnection);

            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();

                da.Fill(ds);

                cmd.Parameters.Clear();

                if (mustCloseConnection)
                    connection.Close();

                return ds;
            
            }
        }
        #endregion
    }
}
