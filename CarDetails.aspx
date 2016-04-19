<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CarDetails.aspx.cs" Inherits="CarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-6" id="images" runat="server">
        </div>
        <div class="col-md-4 col-md-offset-2">
            <div class="form-inline">
                Make:<asp:Label ID="Labelmake" runat="server" />
                <br />
                Model:<asp:Label ID="LabelModel" runat="server" />
                <br />
                Type:<asp:Label ID="LabelType" runat="server" />
                <br />
                Colour:<asp:Label ID="LabelColour" runat="server" />
                <br />
                Year:<asp:Label ID="LabelYear" runat="server" />
                <br />
                Price:<asp:Label ID="LabelPrice" runat="server" />
                <br />
                Location:<asp:Label ID="LabelLocation" runat="server" />
                <br />
                <asp:Button ID="ButtonMakeOffer" runat="server" CssClass="btn btn-success" Text="Make offer" />
                <br />
                <asp:TextBox ID="TextBoxWishListComment" placeholder="Comment for wishlist." runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="ButtonAddtoWishlist" runat="server" CssClass="btn btn-info" Text="Add to Wish list" OnClick="ButtonAddtoWishlist_Click" />
                <br/>
                <asp:Label runat="server" ID="LabelLoginWarning" CssClass="text-danger" Visible="False" Text="You must login to save to wish list."></asp:Label>
                <br/>
                <asp:Button ID="ButtonRemoveFromWishList" runat="server" CssClass="btn btn-danger" Text="Remove from Wish list" Visible="False" OnClick="ButtonRemoveFromWishList_Click" />
            </div>
        </div>
    </div>
</asp:Content>

