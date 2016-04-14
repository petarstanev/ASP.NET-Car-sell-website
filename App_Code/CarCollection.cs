using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CarCollection
/// </summary>
public class CarCollection : List<Car>
{
    
    public CarCollection()
    {
    
        var cnnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(cnnString);

        SqlCommand command = new SqlCommand("GetAllCars", connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {

            Car car = new Car(reader.GetInt32(0), reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetString(5), reader.GetInt32(6), reader.GetInt32(7), reader.GetString(8), reader.GetInt32(9));
            if (UniqueCarID(car))
            {
                if (!reader.IsDBNull(1))
                {
                    Image img = new Image(reader.GetString(1));
                    car.AddImage(img);
                }
                car.GetMainImageUrl();
                Add(car);
            }
        }

    }

    private bool UniqueCarID(Car car)
    {
        foreach (Car carCheck in this)
        {
            if (car.id == carCheck.id)
                return false;
        }
        return true;
    }
}