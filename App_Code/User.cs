using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    private string email { get; set; }
    private string password { get; set; }
    private string address { get; set; }
    private string mobile { get; set; }
    private List<Car> wishList { get; set; }
    private List<Car> offersMade { get; set; }
    private List<Car> offersReceived { get; set; }


    public User(String email, String password, String address, String mobile)
    {
        this.email = email;
        this.password = password;
        this.address = address;
        this.password = password;
        wishList = new List<Car>();
        offersMade = new List<Car>();
        offersReceived = new List<Car>();
    }
}