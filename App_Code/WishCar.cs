using System;

/// <summary>
/// Extends Car and add notes when user is adding car to wish list.
/// </summary>
public class WishCar : Car
{
    public string Notes{get;set;}
    
    public WishCar(int car_id, String notes)
        : base(car_id)
	{
        this.Notes = notes;
	}


}