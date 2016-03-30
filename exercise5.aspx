<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="exercise5.aspx.cs" Inherits="exercise5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="LabelHeader" runat="server" Text="<h1>Exercise 5 - Session Variables and Cookies</h1>"></asp:Label>
    <asp:Label ID="LabelName" runat="server" Text="Please enter your name:"></asp:Label>
    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonSubmit" runat="server" Text="Session and Cookie Test" OnClick="ButtonSubmit_Click" />
</asp:Content>

