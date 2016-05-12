using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// x
/// </summary>
public class BoughtAndSold : CarCollection
{
    public int MinYear { get; set; }
    public int AverageYear { get; set; }
    public int MaxYear { get; set; }

    public int MinMoney { get; set; }
    public int AverageMoney { get; set; }
    public int MaxMoney { get; set; }
    public int TotalMoney { get; set; }


    public List<Car> GetBought(string sortExpression)
    {
        Clear();
        SqlCommand command = new SqlCommand("GetBought", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        User user = (User)HttpContext.Current.Session["user"];
        command.Parameters.AddWithValue("@user_id", user.id);
        Connection.Open();

        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
            ReadCar(reader);
        }
        Connection.Close();
        if (Count > 0)
        {
            CalculateMoney();
            CalculateYears();
        }
        return GetAllNotSearched(sortExpression);
    }

    public List<Car> GetSold(string sortExpression)
    {
        Clear();
        SqlCommand command = new SqlCommand("GetSold", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        User user = (User)HttpContext.Current.Session["user"];
        command.Parameters.AddWithValue("@user_id", user.id);
        Connection.Open();

        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
            ReadCar(reader);
        }

        Connection.Close();
        if (Count > 0)
        {
            CalculateMoney();
            CalculateYears();
        }

        return GetAllNotSearched(sortExpression);
    }

    private void CalculateMoney()
    {

        MinMoney = this.Min(car => car.price);
        AverageMoney = Convert.ToInt32(this.Average(car => car.price));
        MaxMoney = this.Max(car => car.price);
        TotalMoney = this.Sum(car => car.price);
    }

    private void CalculateYears()
    {
        MinYear = this.Min(car => car.year);
        AverageYear = Convert.ToInt32(this.Average(car => car.year));
        MaxYear = this.Max(car => car.year);
    }


}