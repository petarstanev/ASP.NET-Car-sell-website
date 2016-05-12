using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Class to represent Payment for selling/buying car.
/// </summary>
public class Payment : SQLItem
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
        //update database
        SqlCommand command = new SqlCommand("UpdateCarWithBuyer", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;

        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@id", car_id);
        command.Parameters.AddWithValue("@buyer_id", buyer_id);
        Connection.Open();
        command.ExecuteNonQuery();
        Connection.Close();

        //remove from wish list
        Car car = new Car(car_id);
        WishCarCollection wishCollection = new WishCarCollection();
        wishCollection.RemoveCar(car);
    }
}