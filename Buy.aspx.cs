using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Buy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] == null)
        {
            Response.Redirect("AdvanceSearch.aspx");
        }
    }
    protected void ButtonPay_Click(object sender, EventArgs e)
    {
        User user = (User)Session["user"];

        Payment payment = new Payment(TextBoxCardNumber.Text, TextBoxSecurityNumber.Text, Int32.Parse(Request.QueryString["Id"]), user.id);
        if (payment.PaymentCheck())
        {
            payment.MakeThePayment();
            Response.Redirect("~/SuccessfulPayment.aspx?id=" + Request.QueryString["Id"]);
        }
        else
        {
            LabelFail.Visible = true;
        }
    }
}