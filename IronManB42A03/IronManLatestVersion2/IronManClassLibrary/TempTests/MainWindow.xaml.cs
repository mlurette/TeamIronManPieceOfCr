using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using IronManhvkDB;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace TempTests
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            insertReservation(Convert.ToDateTime("06-JUN-2017"), Convert.ToDateTime("09-JUN-2017"));
        }
                    public void insertReservation(DateTime start, DateTime end)
        {

            String startDate = start.ToString("dd-MMM-yyyy");
            String endDate = end.ToString("dd-MMM-yyyy");
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @" INSERT
INTO HVK_RESERVATION
  (
    RESERVATION_NUMBER,
    RESERVATION_START_DATE,
    reservation_end_date
  )
  VALUES
  (
    hvk_reservation_seq.nextval,
    to_date(:RESERVATION_START_DATE,'dd-MON-YYYY'),
    to_date(:RESERVATION_END_DATE,'dd-MON-YYYY')
  )";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            cmd.Parameters.Add("RESERVATION_START_DATE", startDate);
            cmd.Parameters.Add("RESERVATION_END_DATE", endDate);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.InsertCommand = cmd;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                label.Content = "Shit worked fam";
            }
            catch (Exception e)
            {
                label.Content = e.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
    
}
