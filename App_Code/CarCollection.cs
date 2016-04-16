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

    public List<Car> GetAll(string type, string make, string model, string colour, string startingPriceText, string endPriceText, string startingYearText, string endingYearText,string location)
    {
        Car car;
        for (int i = 0; i < Count; i++)
        {
            car = this[i];

            if (type != "")
            {
                if (!car.type.Contains(type))
                {
                    RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (make != "")
            {
                if (!car.make.Contains(make))
                {
                    RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (model != "")
            {
                if (!car.model.Contains(model))
                {
                    RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (colour != "")
            {
                if (!car.colour.Contains(colour))
                {
                    RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (startingPriceText != "" || endPriceText != "")
            {
                int startingPrice = 0, maximumPrice = Int32.MaxValue;
                if (startingPriceText != "")
                {
                    startingPrice = Int32.Parse(startingPriceText);
                }
                if (endPriceText != "")
                {
                    maximumPrice = Int32.Parse(endPriceText);
                }


                if (!(maximumPrice > car.price && car.price > startingPrice))
                {
                    RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (startingYearText != "" || endingYearText != "")
            {
                int startingYear = 0, endingYear = Int32.MaxValue;
                if (startingYearText != "")
                {
                    startingYear = Int32.Parse(startingYearText);
                }
                if (endingYearText != "")
                {
                    endingYear = Int32.Parse(endingYearText);
                }


                if (!(endingYear > car.year && car.year > startingYear))
                {
                    RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (location != "")
            {
                if (!car.location.Contains(location))
                {
                    RemoveAt(i);
                    i--;
                    continue;
                }
            }
        }

        return this;
    }

    public int GetAllCount( )
    {
        return Count;
    }
}