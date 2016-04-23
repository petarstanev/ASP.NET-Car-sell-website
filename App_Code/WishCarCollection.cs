using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// WishList is collection from WishCars.
/// </summary>
public class WishCarCollection : List<WishCar>
{
    public WishCarCollection()
    {
        List<WishCar> wishList = HttpContext.Current.Session["WishList"] as List<WishCar>;
        if (wishList != null)
            foreach (WishCar car in wishList)
            {
                Add(car);
            }
    }

    public List<WishCar> GetWishList(string sortExpression)
    {
        if (sortExpression != "")
            return Sort(sortExpression);

        return this;
    }

    private List<WishCar> Sort(string sortExpression)
    {
        List<WishCar> sortedCars = new List<WishCar>();
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
            case "notes":
                sortedCars = isDescending ? this.OrderByDescending(o => o.Notes).ToList() : this.OrderBy(o => o.Notes).ToList();
                break;
        }

        return sortedCars;
    }

    public void RemoveCar(Car car)
    {
        for (int i = 0; i < Count; i++)
        {
            if (this[i].id == car.id)
                RemoveAt(i);
        }
        HttpContext.Current.Session["WishList"] = this;
    }
}