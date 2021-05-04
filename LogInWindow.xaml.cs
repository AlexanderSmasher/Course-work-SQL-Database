using DBRealEstateAgency.Models;
using System.Windows;

namespace DBRealEstateAgency
{
	public partial class LogInWindow : Window
	{
		public LogInWindow()
		{
			InitializeComponent();
		}

		public void IncorrectUser()
		{
			if (UserModel.state == false)
			{
				Mistake.Visibility = Visibility.Visible;
				return;
			}
			if (UserModel.state == true)
			{
				Mistake.Visibility = Visibility.Hidden;
				DataBaseModel.CloseConnection();
				UserModel.LogInUser(UserModel.login, UserModel.password);
				TablesWindow tw = new TablesWindow();
				Close();
				tw.Show();
			}
		}

		private void LogInButton_Click(object sender, RoutedEventArgs e)
		{
			UserModel.CheckUser(LoginField.Text, PasswordField.Password);
			IncorrectUser();
		}

		private void SignUpButton_Click(object sender, RoutedEventArgs e)
		{
			SignUpWindow suw = new SignUpWindow();
			Close();
			suw.Show();
		}

	}
}
