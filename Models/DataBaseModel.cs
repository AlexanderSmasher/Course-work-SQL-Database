using MySql.Data.MySqlClient;

namespace DBRealEstateAgency.Models
{
    class DataBaseModel
    {
        // Field which save connection info for DB
        private static MySqlConnection connection = new MySqlConnection("server=localhost;port=3306;username=" + UserModel.login + ";password=" + UserModel.password + ";database=odz_slobodianyk");

        // Method of connecting to DB
        public static void OpenConnection()
        {
            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
        }

        // Method of disconnecting from DB
        public static void CloseConnection()
        {
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
        }

        // Getter of 'MySqlConnection connection'
        public static MySqlConnection GetConnection()
        {
            return connection;
        }
    }
}
