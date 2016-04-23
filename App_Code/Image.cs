using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Image is used in List collection of images for Car.
/// </summary>
public class Image : SQLItem
{
    public string Url { get; set; }

    public Image(string url)
    {
        this.Url = url;
    }

    public void Upload(int car_id)
    {
        SqlCommand command = new SqlCommand("AddImage", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@car_id", car_id);
        command.Parameters.AddWithValue("@image_url", Url);
        command.Connection = Connection;
        Connection.Open();
        command.ExecuteScalar();
        Connection.Close();

    }
}