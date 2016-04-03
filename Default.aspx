<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="login" runat="server">
        <p class="lead">
            You are login as: 
            <asp:Label ID="LabelLoginMail" runat="server"></asp:Label>
        </p>
    </div>
    <div id="notLogin" runat="server">
        <p class="lead">
            You are not login please login from here:
        <asp:Button CssClass="btn btn-primary" ID="ButtonLogin" runat="server" Text="Login" PostBackUrl="login.aspx" />
            or 
            <asp:Button CssClass="btn btn-info" ID="ButtonRegister" runat="server" Text="Register" PostBackUrl="register.aspx" />
        </p>
    </div>
</asp:Content>

