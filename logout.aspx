<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="logout.aspx.cs" Inherits="login_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p class="lead">Are you sure you want to logout ?</p>
    <asp:Button ID="ButtonLogout" runat="server" CssClass="btn btn-danger" Text="Logout" OnClick="ButtonLogout_Click" />

</asp:Content>

