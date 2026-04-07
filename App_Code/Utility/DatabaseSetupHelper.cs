using System;
using System.Configuration;
using System.Data.SqlClient;

namespace LearnSite.DBUtility
{
    public class DatabaseConnectionSettings
    {
        public string Server { get; set; }
        public string Database { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
    }

    public static class DatabaseSetupHelper
    {
        public static bool TryGetCurrentConnectionSettings(out DatabaseConnectionSettings settings)
        {
            settings = null;
            try
            {
                string myconnstr = ConfigurationManager.ConnectionStrings["SqlServer"].ConnectionString;
                string[] constr = DbLinkEdit.ReadSqlConfig(myconnstr);
                if (constr != null && constr.Length > 3)
                {
                    DatabaseConnectionSettings current = new DatabaseConnectionSettings();
                    current.Server = constr[0];
                    current.Database = constr[1];
                    current.User = constr[2];
                    current.Password = constr[3];
                    if (current.Server != "" && current.Database != "" && current.User != "")
                    {
                        settings = current;
                        return true;
                    }
                }
            }
            catch
            {
            }
            return false;
        }

        public static bool MasterDbExist(DatabaseConnectionSettings settings)
        {
            if (settings == null)
            {
                return false;
            }
            string masterConnstring = String.Format("Data Source={0};Initial Catalog=master;uid={1};pwd={2};", settings.Server, settings.User, settings.Password);
            return DbLinkEdit.DatabaseExist(masterConnstring);
        }

        public static bool TargetDbExist(DatabaseConnectionSettings settings)
        {
            if (settings == null)
            {
                return false;
            }
            string masterConnstring = String.Format("Data Source={0};Initial Catalog=master;uid={1};pwd={2};", settings.Server, settings.User, settings.Password);
            using (SqlConnection conn = new SqlConnection(masterConnstring))
            {
                using (SqlCommand cmd = new SqlCommand("select count(1) from sys.databases where name=@dbname", conn))
                {
                    cmd.Parameters.AddWithValue("@dbname", settings.Database);
                    conn.Open();
                    object obj = cmd.ExecuteScalar();
                    return obj != null && Convert.ToInt32(obj) > 0;
                }
            }
        }

        public static void CreateDatabase(DatabaseConnectionSettings settings)
        {
            if (settings == null)
            {
                throw new ArgumentNullException("settings");
            }
            string safeDbName = settings.Database.Replace("]", "]]");
            string masterConnstring = String.Format("Data Source={0};Initial Catalog=master;uid={1};pwd={2};", settings.Server, settings.User, settings.Password);
            string sql = "if db_id(N'" + settings.Database.Replace("'", "''") + "') is null create database [" + safeDbName + "]";
            DbLinkEdit.CreatSql(masterConnstring, sql);
        }
    }
}
