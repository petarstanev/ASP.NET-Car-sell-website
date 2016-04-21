using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Payment
/// </summary>
public class Payment
{
    private string cardNumber { get; set; }
    private string securityNumber { get; set; }
    private int car_id { get; set; }
    private int buyer_id { get; set; }

    public Payment(string cardNumber, string securityNumber, int car_id, int buyer_id)
    {
        this.cardNumber = cardNumber;
        this.securityNumber = securityNumber;
        this.car_id = car_id;
        this.buyer_id = buyer_id;
    }

    public bool PaymentCheck()
    {
        int i;
        bool carNumberParse = Int32.TryParse(cardNumber, out i);
        bool securityNumberparse = Int32.TryParse(securityNumber, out i);

        if (carNumberParse && securityNumberparse)
        {
            return true;
        }
        return false;
    }

    public void MakeThePayment()
    {

        var constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("UpdateCarWithBuyer", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", car_id);
                cmd.Parameters.AddWithValue("@buyer_id", buyer_id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}