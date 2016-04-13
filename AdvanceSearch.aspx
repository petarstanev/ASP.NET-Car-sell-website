<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdvanceSearch.aspx.cs" Inherits="AdvanceSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    Search by:
    Type:<asp:TextBox ID="TextBoxType" runat="server"></asp:TextBox>
    <br />
    Make:<asp:TextBox ID="TextBoxMake" runat="server"></asp:TextBox>
    <br />
    Model:<asp:TextBox ID="TextBoxModel" runat="server"></asp:TextBox>
    <br />
    Colour:<asp:TextBox ID="TextBoxColour" runat="server"></asp:TextBox>
    <br />
    Price between:<asp:TextBox ID="TextBoxPriceStarting" runat="server"></asp:TextBox>
    and 
    <asp:TextBox ID="TextBoxPriceMaximum" runat="server"></asp:TextBox>
    <br />
    Year:<asp:TextBox ID="TextBoxYearStarting" runat="server"></asp:TextBox>
    and
    <asp:TextBox ID="TextBoxYearEnding" runat="server"></asp:TextBox>
    <br />
    Location:<asp:TextBox ID="TextBoxLocation" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
    <asp:GridView ID="GridViewCars" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="Type" DataField="Type"></asp:BoundField>
            <asp:ImageField HeaderText="Image" ControlStyle-CssClass="img-responsive" DataImageUrlField="Image" ItemStyle-Height="120" ItemStyle-Width="160" NullImageUrl="images/no-image.gif"></asp:ImageField>
            <asp:BoundField HeaderText="Make" DataField="Make"></asp:BoundField>
            <asp:BoundField HeaderText="Model" DataField="Model"></asp:BoundField>
            <asp:BoundField HeaderText="Colour" DataField="Colour"></asp:BoundField>
            <asp:BoundField HeaderText="Price" DataField="Price"></asp:BoundField>
            <asp:BoundField HeaderText="Year" DataField="Year"></asp:BoundField>
            <asp:BoundField HeaderText="Location" DataField="Location"></asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>

