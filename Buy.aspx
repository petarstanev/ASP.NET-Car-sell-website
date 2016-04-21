<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Buy.aspx.cs" Inherits="Buy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Payment details:</h2>
    Card type:<asp:RadioButtonList ID="RadioButtonList1" runat="server">
        <asp:ListItem Text="Visa" Value="Visa" />
        <asp:ListItem Text="MasterCard" Value="MasterCard" />
    </asp:RadioButtonList>
    Card number(16 digits):<asp:TextBox ID="TextBoxCardNumber" runat="server"></asp:TextBox>
    Security number( last 3 digits on the back of the card):<asp:TextBox ID="TextBoxSecurityNumber" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonPay" CssClass="btn btn-primary" runat="server" Text="Pay" OnClick="ButtonPay_Click"  />
    <asp:Label ID="LabelFail" Visible="False" CssClass="alert alert-danger" runat="server" Text="There was a problem with the payment!<br/> Please include only numbers for card details!"></asp:Label>
</asp:Content>

