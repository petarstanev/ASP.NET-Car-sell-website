using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// This class is used to represent car from and to Database.
/// </summary>
public class Car : SQLItem
{
    public int id { get; set; }
    public string type { get; set; }
    public string make { get; set; }
    public string model { get; set; }
    public string colour { get; set; }
    public List<Image> images { get; private set; }
    public string mainImageUrl { get; private set; }
    public int price { get; set; }
    public int year { get; set; }
    public string location { get; set; }
    public int user_id { get; set; }
    public int buyer_id { get; private set; }


    public Car(int id, string type, string make, string model, string colour, int price, int year, string location, int user_id)
    {
        this.id = id;
        this.type = type;
        this.make = make;
        this.model = model;
        this.colour = colour;
        this.price = price;
        this.year = year;
        this.location = location;
        this.user_id = user_id;
        images = new List<Image>();
    }

    public Car(string type, string make, string model, string colour, int price, int year, string location, int user_id)
    {
        this.type = type;
        this.make = make;
        this.model = model;
        this.colour = colour;
        this.price = price;
        this.year = year;
        this.location = location;
        this.user_id = user_id;
        images = new List<Image>();
    }

    public Car(int car_id)
    {
        images = new List<Image>();
        SqlCommand command = new SqlCommand("GetCar", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        Connection.Open();
        command.Parameters.AddWithValue("@id", car_id);
        SqlDataReader reader = command.ExecuteReader();

        if (reader.HasRows)
        {
            reader.Read();
            id = car_id;
            type = reader.GetString(0);
            make = reader.GetString(1);
            model = reader.GetString(2);
            colour = reader.GetString(3);
            price = reader.GetInt32(4);
            year = reader.GetInt32(5);
            location = reader.GetString(6);

            if (!reader.IsDBNull(8))
            {
                buyer_id = reader.GetInt32(8);
            }
            else
            {
                buyer_id = 0;
            }
            user_id = reader.GetInt32(9);
            do
            {
                if (!reader.IsDBNull(7))
                {
                    Image image = new Image(reader.GetString(7));
                    images.Add(image);
                }
            } while (reader.Read());
            GetMainImageUrl();
        }
        Connection.Close();
    }

    public Car()
    {
    }

    public void Upload()
    {
        SqlCommand command = new SqlCommand("AddCar", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@type", type);
        command.Parameters.AddWithValue("@make", make);
        command.Parameters.AddWithValue("@model", model);
        command.Parameters.AddWithValue("@colour", colour);
        command.Parameters.AddWithValue("@price", price);
        command.Parameters.AddWithValue("@year", year);
        command.Parameters.AddWithValue("@location", location);
        command.Parameters.AddWithValue("@user_id", user_id);
        command.Parameters.Add("@car_id", SqlDbType.Int).Direction = ParameterDirection.Output;
        command.Connection = Connection;
        Connection.Open();
        command.ExecuteNonQuery();
        id = Convert.ToInt32(command.Parameters["@car_id"].Value);
        Connection.Close();

        foreach (Image image in images)
        {
            image.Upload(id);
        }
    }

    public void AddImage(Image image)
    {
        images.Add(image);
    }

    public List<Image> getImages(int id)
    {
        return new Car(id).images;
    }

    public void removeImage(int imageId)
    {
        images.RemoveAt(imageId);
    }

    public void GetMainImageUrl()
    {
        if (images.Count > 0)
        {
            mainImageUrl = images[0].Url;
        }
    }

    public void Update()
    {
        SqlCommand command = new SqlCommand("UpdateCar", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@id", id);
        command.Parameters.AddWithValue("@type", type);
        command.Parameters.AddWithValue("@make", make);
        command.Parameters.AddWithValue("@model", model);
        command.Parameters.AddWithValue("@colour", colour);
        command.Parameters.AddWithValue("@price", price);
        command.Parameters.AddWithValue("@year", year);
        command.Parameters.AddWithValue("@location", location);
        command.Connection = Connection;
        Connection.Open();
        command.ExecuteNonQuery();
        Connection.Close();
    }
}
