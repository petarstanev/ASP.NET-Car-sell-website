using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;

/// <summary>
/// CarCollection is a  abstract parent class for AllCarCollection and UserCarCollection.
/// That extend List<Car> and it is used by the grid view for sorting and searching cars.</Car>
/// </summary>
public abstract class CarCollection : List<Car>
{
    private string ConnectionString { get; set; }
    protected SqlConnection Connection { get; private set; }

    protected CarCollection()
    {
        ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        Connection = new SqlConnection(ConnectionString);
    }

    private List<Car> Sort(string sortExpression)
    {
        List<Car> sortedCars = new List<Car>();
        string sortBy = sortExpression;
        bool isDescending = false;

        if (sortExpression.ToLowerInvariant().EndsWith(" desc"))
        {
            sortBy = sortExpression.Substring(0, sortExpression.Length - 5);
            isDescending = true;
        }

        switch (sortBy)
        {
            case "type":
                sortedCars = isDescending ? this.OrderByDescending(o => o.type).ToList() : this.OrderBy(o => o.type).ToList();
                break;
            case "make":
                sortedCars = isDescending ? this.OrderByDescending(o => o.make).ToList() : this.OrderBy(o => o.make).ToList();
                break;
            case "model":
                sortedCars = isDescending ? this.OrderByDescending(o => o.model).ToList() : this.OrderBy(o => o.model).ToList();
                break;
            case "colour":
                sortedCars = isDescending ? this.OrderByDescending(o => o.colour).ToList() : this.OrderBy(o => o.colour).ToList();
                break;
            case "price":
                sortedCars = isDescending ? this.OrderByDescending(o => o.price).ToList() : this.OrderBy(o => o.price).ToList();
                break;
            case "year":
                sortedCars = isDescending ? this.OrderByDescending(o => o.year).ToList() : this.OrderBy(o => o.year).ToList();
                break;
            case "location":
                sortedCars = isDescending ? this.OrderByDescending(o => o.location).ToList() : this.OrderBy(o => o.location).ToList();
                break;
        }
        return sortedCars;
    }

    private bool UniqueCarId(Car car)
    {
        return this.All(carCheck => car.id != carCheck.id);
    }

    public List<Car> GetAll(string type, string make, string model, string colour, string startingPriceText, string endPriceText, string startingYearText, string endingYearText, string location, string sortExpression)
    {
        Car car;
        for (int i = 0; i < Count; i++)
        {
            car = this[i];

            if (type != "All")
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
        if (sortExpression != "")
            return Sort(sortExpression);

        return this;
    }

    public List<Car> GetAllNotSearched(string sortExpression)
    {
        if (sortExpression != "")
            return Sort(sortExpression);

        return this;
    }

    protected void ReadCar(SqlDataReader reader)
    {
        Car car = new Car(reader.GetInt32(0), reader.GetString(2), reader.GetString(3), reader.GetString(4),
            reader.GetString(5), reader.GetInt32(6), reader.GetInt32(7), reader.GetString(8), reader.GetInt32(9));
        if (UniqueCarId(car))
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