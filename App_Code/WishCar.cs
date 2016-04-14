using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for WishCar
/// </summary>
public class WishCar : Car
{
    public string notes{get;set;}
    
    public WishCar(int car_id, String notes)
        : base(car_id)
	{
        this.notes = notes;
	}

 

}