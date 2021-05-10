using DBRealEstateAgency.Models;
using MySql.Data.MySqlClient;
using System.Data;
using System.Windows;

namespace DBRealEstateAgency
{
    public partial class TablesWindow : Window
    {
        private DataTable Table;
        private MySqlDataAdapter Data;
        private MySqlCommandBuilder ComBuild;
        public TablesWindow()
        {
            InitializeComponent();
            if (UserModel.login == "admin" || UserModel.login == "sanya")
            {
                AdminSeparator.Visibility = Visibility.Visible;
                SaveChanges.Visibility = Visibility.Visible;
                InfoGrid.IsReadOnly = false;
            }
            else
            {
                AdminSeparator.Visibility = Visibility.Collapsed;
                SaveChanges.Visibility = Visibility.Collapsed;
                InfoGrid.IsReadOnly = true;
            }
        }

        private void ChangeUser_Click(object sender, RoutedEventArgs e)
        {
            LogInWindow liw = new LogInWindow();
            DataBaseModel.CloseConnection();
            Close();
            liw.Show();
        }

        private void NewUser_Click(object sender, RoutedEventArgs e)
        {
            SignUpWindow suw = new SignUpWindow();
            DataBaseModel.CloseConnection();
            Close();
            suw.Show();
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            DataBaseModel.CloseConnection();
            Close();
        }

        private void SelectData(string request)
        {
            DataBaseModel.OpenConnection();
            MySqlDataAdapter data = new MySqlDataAdapter(request, DataBaseModel.GetConnection());
            DataTable table = new DataTable();
            data.Fill(table);
            InfoGrid.DataContext = table;
            Table = table;
            Data = data;
            ComBuild = new MySqlCommandBuilder(Data);
        }

        private void Sellers_Click(object sender, RoutedEventArgs e)
        {
            loadDataButton.Visibility = Visibility.Hidden;
            loadDataField.Visibility = Visibility.Hidden;
            SelectData("SELECT * FROM sellers;");
            InfoGrid.Columns[0].Header = "Sellers №";
            InfoGrid.Columns[1].Header = "Name";
            InfoGrid.Columns[2].Header = "Birth date";
            InfoGrid.Columns[3].Header = "Address";
            InfoGrid.Columns[4].Header = "Phone number";
            InfoGrid.Columns[5].Header = "Bank details";
        }

        private void Buyers_Click(object sender, RoutedEventArgs e)
        {
            loadDataButton.Visibility = Visibility.Hidden;
            loadDataField.Visibility = Visibility.Hidden;
            SelectData("SELECT * FROM buyers;");
            InfoGrid.Columns[0].Header = "Buyers №";
            InfoGrid.Columns[1].Header = "Name";
            InfoGrid.Columns[2].Header = "Birth date";
            InfoGrid.Columns[3].Header = "Address";
            InfoGrid.Columns[4].Header = "Phone number";
            InfoGrid.Columns[5].Header = "Bank details";
        }

        private void Premises_Click(object sender, RoutedEventArgs e)
        {
            loadDataButton.Visibility = Visibility.Hidden;
            loadDataField.Visibility = Visibility.Hidden;
            SelectData("SELECT * FROM premises;");
            InfoGrid.Columns[0].Header = "Premises №";
            InfoGrid.Columns[1].Header = "Sellers №";
            InfoGrid.Columns[2].Header = "Code";
            InfoGrid.Columns[3].Header = "Type";
            InfoGrid.Columns[4].Header = "Destination";
        }

        private void TransLogs_Click(object sender, RoutedEventArgs e)
        {
            loadDataButton.Visibility = Visibility.Hidden;
            loadDataField.Visibility = Visibility.Hidden;
            SelectData("SELECT * FROM transaction_log;");
            InfoGrid.Columns[0].Header = "Transactions №";
            InfoGrid.Columns[1].Header = "Sellers №";
            InfoGrid.Columns[2].Header = "Buyers №";
            InfoGrid.Columns[3].Header = "Premises №";
            InfoGrid.Columns[4].Header = "Registrution №";
            InfoGrid.Columns[5].Header = "Transaction type";
            InfoGrid.Columns[6].Header = "Transaction value";
            InfoGrid.Columns[7].Header = "Rental period";
            InfoGrid.Columns[8].Header = "Rental terms";
        }

        private void FirstR_Click(object sender, RoutedEventArgs e)
        {
            loadDataButton.Visibility = Visibility.Visible;
            loadDataField.Visibility = Visibility.Visible;
        }

        private void SecondR_Click(object sender, RoutedEventArgs e)
        {
            loadDataButton.Visibility = Visibility.Hidden;
            loadDataField.Visibility = Visibility.Hidden;
            SelectData("SELECT premises.premises_ID, premises.sellers_ID, premises.code, premises.type, premises.destination " +
                "FROM premises WHERE premises.premises_ID NOT IN (SELECT transaction_log.premises_ID FROM transaction_log " +
                "WHERE transaction_log.premises_ID = premises.premises_ID) OR premises.premises_ID IN (SELECT transaction_log.premises_ID " +
                "FROM transaction_log WHERE transaction_log.premises_ID = premises.premises_ID AND SUBSTRING(rental_period, 12, 10) <= CURRENT_DATE()) " +
                "ORDER BY premises.type;");
            InfoGrid.Columns[0].Header = "Premises №";
            InfoGrid.Columns[1].Header = "Sellers №";
            InfoGrid.Columns[2].Header = "Premises code";
            InfoGrid.Columns[3].Header = "Type";
            InfoGrid.Columns[4].Header = "Destination";
        }

        private void ThirdR_Click(object sender, RoutedEventArgs e)
        {
            loadDataButton.Visibility = Visibility.Hidden;
            loadDataField.Visibility = Visibility.Hidden;
            SelectData("SELECT sellers.full_name, transaction_log.rental_terms, transaction_log.rental_period " +
                "FROM transaction_log, sellers WHERE sellers.sellers_ID = transaction_log.sellers_ID ORDER BY sellers.full_name ASC;");
            InfoGrid.Columns[0].Header = "Name";
            InfoGrid.Columns[1].Header = "Rental terms";
            InfoGrid.Columns[2].Header = "Rental period";
        }

        private void FourthR_Click(object sender, RoutedEventArgs e)
        {
            loadDataButton.Visibility = Visibility.Hidden;
            loadDataField.Visibility = Visibility.Hidden;
            SelectData("SELECT premises.premises_ID, transaction_log.rental_terms, transaction_log.rental_period " +
                "FROM transaction_log, premises WHERE premises.premises_ID = transaction_log.premises_ID ORDER BY premises.premises_ID ASC;");
            InfoGrid.Columns[0].Header = "Premises №";
            InfoGrid.Columns[1].Header = "Rental terms";
            InfoGrid.Columns[2].Header = "Rental period";
        }

        private void SaveChanges_Click(object sender, RoutedEventArgs e)
        {
            Data.UpdateCommand = ComBuild.GetUpdateCommand();
            Data.Update(Table);
        }

        private void loadDataButton_Click(object sender, RoutedEventArgs e)
        {
            string field = loadDataField.Text;
            SelectData("SELECT premises.premises_ID, premises.sellers_ID, premises.code, premises.type, premises.destination " +
                "FROM premises, transaction_log WHERE transaction_log.premises_ID = premises.premises_ID AND rental_period = '" + field + "';");
            InfoGrid.Columns[0].Header = "Premises №";
            InfoGrid.Columns[1].Header = "Sellers №";
            InfoGrid.Columns[2].Header = "Premises code";
            InfoGrid.Columns[3].Header = "Type";
            InfoGrid.Columns[4].Header = "Destination";
        }
    }
}
