using MySql.Data.MySqlClient;
using System.Data;

namespace DBRealEstateAgency.Models
{
    class UserModel
    {
        // Field which contains logins to DB access
        public static string login;
        // Field which contains passwords to DB access
        public static string password;
        // Field which contains state of connection (true/false)
        public static bool state;

        // Method of check available user
        public static void CheckUser(string userLogin, string userPassword)
        {
            login = "root";
            password = "root";
            DataBaseModel.OpenConnection();
            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM users;", DataBaseModel.GetConnection());
            DataTable table = new DataTable();
            adapter.Fill(table);

            for (int i = 0; i < table.Rows.Count; i++)
            {
                if (userLogin == table.Rows[i].Field<string>("login") && userPassword == table.Rows[i].Field<string>("password"))
                {
                    state = true;
                    login = userLogin;
                    password = userPassword;
                    break;
                }
                else
                {
                    state = false;
                }
            }
            DataBaseModel.CloseConnection();
        }

        // Method of log in user
        public static void LogInUser(string userLogin, string userPassword)
        {
            state = true;
            if (userLogin == "admin" || userLogin == "sanya")
            {
                login = "admin";
                password = "admin";
                DataBaseModel.OpenConnection();
            }
            else
            {
                login = "user";
                password = "user";
                DataBaseModel.OpenConnection();
            }
        }

        // Method of cretae new user (new user save to 'users' table in DB)
        public static void CreateUser(string userLogin, string userPassword)
        {
            login = "root";
            password = "root";
            DataBaseModel.OpenConnection();

            string request = "INSERT INTO users (login, password) VALUES (@login, @password)";

            MySqlCommand cmd = DataBaseModel.GetConnection().CreateCommand();
            cmd.CommandText = request;

            MySqlParameter uLogin = cmd.Parameters.Add("@login", MySqlDbType.VarChar, 16);
            uLogin.Value = userLogin;
            MySqlParameter uPassword = cmd.Parameters.Add("@password", MySqlDbType.VarChar, 16);
            uPassword.Value = userPassword;
            cmd.ExecuteNonQuery();
            DataBaseModel.CloseConnection();
        }
    }
}
