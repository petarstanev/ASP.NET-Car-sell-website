using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CarDetails : System.Web.UI.Page
{
    Car car;
    CarCollection wishList;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] != null)
        {
            int car_id = Int32.Parse(Request.QueryString["Id"]);
            car = new Car(car_id);
            Labelmake.Text = car.make;
            LabelModel.Text = car.model;
            LabelType.Text = car.type;
            LabelColour.Text = car.colour;
            LabelYear.Text = car.year.ToString();
            LabelLocation.Text = car.location;
            LabelPrice.Text = car.price.ToString();
            foreach (Image image in car.images)
            {
                System.Web.UI.WebControls.Image pageImaage = new System.Web.UI.WebControls.Image();
                pageImaage.CssClass = "image-responsive col-xs-12";
                pageImaage.ImageUrl = image.url;
                images.Controls.Add(pageImaage);
            }

            if (Session["WishList"] == null)
            {
                wishList = new CarCollection(
                    true);
            }
            else
            {
                wishList = Session["WishList"] as CarCollection;

                foreach (Car carCheck in wishList)
                {
                    if (carCheck.id == car.id)
                    {
                        ButtonAddtoWishlist.Visible = false;
                        ButtonRemoveFromWishList.Visible = true;
                    }
                }

            }
        }
        else
        {
            Response.Redirect("~/AdvanceSearch.aspx");
        }
    }
    protected void ButtonAddtoWishlist_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {

            wishList.Add(car);
            Session["WishList"] = wishList;
            ButtonAddtoWishlist.Visible = false;
            ButtonRemoveFromWishList.Visible = true;
        }
        else
        {
            LabelLoginWarning.Visible = true;
        }
    }
    protected void ButtonRemoveFromWishList_Click(object sender, EventArgs e)
    {
        wishList.RemoveCar(car);
        Session["WishList"] = wishList;
        ButtonAddtoWishlist.Visible = true;
        ButtonRemoveFromWishList.Visible = false;
    }

}