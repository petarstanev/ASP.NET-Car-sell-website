<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdvanceSearch.aspx.cs" Inherits="AdvanceSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Search by:
    Type:<asp:TextBox ID="TextBoxType" runat="server"></asp:TextBox>
    <br />
    Make:<asp:TextBox ID="TextBoxMake" runat="server"></asp:TextBox>
    <br />
    Model:<asp:TextBox ID="TextBoxModel" runat="server"></asp:TextBox>
    <br />
    Colour:<asp:TextBox ID="TextBoxColour" runat="server"></asp:TextBox>
    <br />
    Price:<asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
    <br />
    Year:<asp:TextBox ID="TextBoxYear" runat="server"></asp:TextBox>
    <br />
    Location:<asp:TextBox ID="TextBoxLocation" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
    <asp:GridView ID="GridViewCars" runat="server"  >
     
    </asp:GridView>
</asp:Content>

