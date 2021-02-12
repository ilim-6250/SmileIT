using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToolBox
{
    public class Connection
    {
        private string _connectionString;

        public Connection(string connectionString)
        {
            if (string.IsNullOrWhiteSpace(connectionString))
            {
                throw new ArgumentException("Invalid Connection String!");
            }

            _connectionString = connectionString;

            using (DbConnection connection = CreateConnection())
            {
                connection.Open();
            }

        }


        public IEnumerable<T> ExecuteReader<T>(Command cmd, Func<IDataRecord, T> selector)
        {
            using (DbConnection connection = CreateConnection())
            {

                using (DbCommand dbCommand = CreateCommand(connection, cmd))
                {
                    connection.Open();
                    using (DbDataReader reader = dbCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            yield return selector(reader);
                        }
                    }
                }
            }
        }



        public object ExecuteScalar<T>(Command cmd)
        {
            using (DbConnection connection = CreateConnection())
            {

                using (DbCommand dbCommand = CreateCommand(connection, cmd))
                {
                    connection.Open();
                    object o = dbCommand.ExecuteScalar();
                    return (o is DBNull) ? null : o;
                }
            }
        }

        public int ExecuteNonQuery(Command cmd)
        {
            using (DbConnection connection = CreateConnection())
            {
                using (DbCommand dbCommand = CreateCommand(connection, cmd))
                {
                    connection.Open();
                    return dbCommand.ExecuteNonQuery();
                }
            }
        }

        private DbConnection CreateConnection()
        {
            DbConnection connection = new SqlConnection();
            connection.ConnectionString = _connectionString;

            return connection;
        }

        private DbCommand CreateCommand(DbConnection connection, Command cmd)
        {
            DbCommand dbCommand = connection.CreateCommand();
            dbCommand.CommandText = cmd.Query;

            if (cmd.IsStoredProcedure) { dbCommand.CommandType = CommandType.StoredProcedure; }
            foreach (KeyValuePair<string, object> kvp in cmd.Parameters)
            {
                DbParameter dbParameter = dbCommand.CreateParameter();
                dbParameter.ParameterName = kvp.Key;
                dbParameter.Value = kvp.Value;

                dbCommand.Parameters.Add(dbParameter);
            }

            return dbCommand;
        }
    }
}
