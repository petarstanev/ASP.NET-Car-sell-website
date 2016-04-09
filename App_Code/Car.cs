using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

public class Car
{
    public int id { get; set; }
    public string type { get; set; }
    public string make { get; set; }
    public string model { get; set; }
    public string colour { get; set; }
    public List<Image> images { get; set; }
    public int price { get; set; }
    public int year { get; set; }
    public string location { get; set; }
    public int user_id { get; set; }


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

    public void Upload() {
        var cnnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cnnString))
        {
            using (SqlCommand cmd = new SqlCommand("AddCar"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@make", make);
                    cmd.Parameters.AddWithValue("@model", model);
                    cmd.Parameters.AddWithValue("@colour", colour);
                    cmd.Parameters.AddWithValue("@price", price);
                    cmd.Parameters.AddWithValue("@year", year);
                    cmd.Parameters.AddWithValue("@location", location);
                    cmd.Parameters.AddWithValue("@user_id", user_id);
                    cmd.Parameters.Add("@car_id", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    id = Convert.ToInt32(cmd.Parameters["@car_id"].Value);
                    con.Close();                   
                }
            }
        }
           foreach(Image image in images){
               image.Upload(id);
           }
        
    }

    public void addImage(Image image)
    {
        images.Add(image);
    }
}
