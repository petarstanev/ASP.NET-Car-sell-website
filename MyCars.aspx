<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyCars.aspx.cs" Inherits="MyCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridViewCars" runat="server" CssClass="table table-striped" UseAccessibleHeader="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AllowSorting="True" AllowPaging="True" GridLines="None">
        <Columns>
            <asp:BoundField HeaderText="type" DataField="type" SortExpression="type"></asp:BoundField>
            <asp:ImageField DataImageUrlField="mainImageUrl" ItemStyle-Height="120" ItemStyle-Width="160" HeaderText="image" NullImageUrl="~/images/no-image.gif" ControlStyle-CssClass="img-thumbnail">
                <ControlStyle CssClass="img-thumbnail"></ControlStyle>

                <ItemStyle Height="120px" Width="160px"></ItemStyle>
            </asp:ImageField>
            <asp:BoundField HeaderText="make" DataField="make" SortExpression="make"></asp:BoundField>
            <asp:BoundField HeaderText="model" DataField="model" SortExpression="model"></asp:BoundField>
            <asp:BoundField HeaderText="colour" DataField="colour" SortExpression="colour"></asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
            <asp:HyperLinkField AccessibleHeaderText="Link" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/CarDetails.aspx?id={0}" HeaderText="Link" Text="link" />
            <asp:HyperLinkField AccessibleHeaderText="Edit" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/CarEdit.aspx?id={0}" HeaderText="Edit" Text="Edit" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllNotSearched" SortParameterName="sortExpression"
        TypeName="UserCarCollection">
        
    </asp:ObjectDataSource>
</asp:Content>

