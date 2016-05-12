using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WishList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (Session["WishList"] == null)
        {
            LabelWishListEmpty.Visible = true;
        }
        else
        {
            List<WishCar> wishList = Session["WishList"] as List<WishCar>;
            if (wishList.Count == 0)
            {
                LabelWishListEmpty.Visible = true;
            }
        }
    }
}