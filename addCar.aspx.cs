using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonAddCar_Click(object sender, EventArgs e)
    {
        User user = (User)Session["user"];
        Car car = new Car(DropDownListTypes.SelectedValue, TextBoxMake.Text, TextBoxModel.Text, TextBoxColour.Text, Int32.Parse(TextBoxPrice.Text), Int32.Parse(TextBoxYear.Text), TextBoxLocation.Text, user.id);
        
        
        HttpFileCollection uploadedFiles = Request.Files;

        foreach (HttpPostedFile file in uploadedFiles)
            {
           
                string fileName = Path.GetFileName(file.FileName);
                string url = Server.MapPath("~/images/") + fileName;
                FileUploadImage.PostedFile.SaveAs(url);
                Image image = new Image(url);
                car.addImage(image);
            }
        car.Upload();
    }
}