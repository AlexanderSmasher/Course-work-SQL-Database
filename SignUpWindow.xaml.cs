using DBRealEstateAgency.Models;
using System.Windows;

namespace DBRealEstateAgency
{
    public partial class SignUpWindow : Window
    {
        public SignUpWindow()
        {
            InitializeComponent();
        }

        private void SignUpButton_Click(object sender, RoutedEventArgs e)
        {
            if (RepeatPasswordField.Password != PasswordField.Password)
            {
                Mistake.Visibility = Visibility.Visible;
            }
            else
            {
                LogInWindow liw = new LogInWindow();
                Mistake.Visibility = Visibility.Hidden;
                UserModel.CreateUser(LoginField.Text, PasswordField.Password);
                Close();
                liw.Show();
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            LogInWindow liw = new LogInWindow();
            Close();
            liw.Show();
        }
    }
}
