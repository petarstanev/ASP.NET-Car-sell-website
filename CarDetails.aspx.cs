using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CarDetails : System.Web.UI.Page
{
    Car car;
    WishCarCollection wishList;

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
                pageImaage.ImageUrl = image.Url;
                images.Controls.Add(pageImaage);
            }

            if (Session["WishList"] == null)
            {
                wishList = new WishCarCollection();
            }
            else
            {
                wishList = Session["WishList"] as WishCarCollection;

                foreach (WishCar carCheck in wishList)
                {
                    if (carCheck.id == car.id)
                    {
                        ButtonAddtoWishlist.Visible = false;
                        TextBoxWishListComment.Text = carCheck.Notes;
                        TextBoxWishListComment.ReadOnly = true;
                        ButtonRemoveFromWishList.Visible = true;
                    }
                }

            }
            if (Session["user"] == null || car.buyer_id > 0)
            {
                ButtonMakeOffer.Visible = false;
                ButtonAddtoWishlist.Visible = false;
                TextBoxWishListComment.Visible = false;
                if (Session["user"] == null)
                    LabelLoginWarning.Visible = true;

                if (car.buyer_id > 0)
                    LabelCarSold.Visible = true;
            }

        }
        else
        {
            Response.Redirect("~/AdvanceSearch.aspx");
        }
    }
    protected void ButtonAddtoWishlist_Click(object sender, EventArgs e)
    {

        WishCar wishCar = new WishCar(car.id, TextBoxWishListComment.Text);
        wishList.Add(wishCar);
        Session["WishList"] = wishList;
        ButtonAddtoWishlist.Visible = false;
        TextBoxWishListComment.ReadOnly = true;
        ButtonRemoveFromWishList.Visible = true;

    }
    protected void ButtonRemoveFromWishList_Click(object sender, EventArgs e)
    {
        wishList.RemoveCar(car);
        Session["WishList"] = wishList;
        ButtonAddtoWishlist.Visible = true;
        TextBoxWishListComment.ReadOnly = false;
        ButtonRemoveFromWishList.Visible = false;
    }

    protected void ButtonMakeOffer_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buy.aspx?id=" + car.id);
    }
}