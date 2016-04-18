<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WishList.aspx.cs" Inherits="WishList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label runat="server" Text="Wish list"></asp:Label>
    <asp:GridView ID="GridViewCars" DataKeyNames="id" runat="server" CssClass="table table-responsive table-hover table-striped" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" DataSourceID="ObjectDataSource1">
        <Columns>
            
            <asp:BoundField HeaderText="type" DataField="type" SortExpression="type"></asp:BoundField>
            <asp:ImageField DataImageUrlField="mainImageUrl" ItemStyle-Height="120" ItemStyle-Width="160" HeaderText="image" NullImageUrl="~/images/no-image.gif" ControlStyle-CssClass="img-thumbnail">
                <ControlStyle CssClass="img-thumbnail"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField HeaderText="make" DataField="make" SortExpression="make"></asp:BoundField>
            <asp:BoundField HeaderText="model" DataField="model" SortExpression="model"></asp:BoundField>
            <asp:BoundField HeaderText="colour" DataField="colour" SortExpression="colour"></asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
            <asp:HyperLinkField AccessibleHeaderText="Link" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/CarDetails.aspx?id={0}" HeaderText="Link" Text="link" />
            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetWishList" 
        TypeName="CarCollection" DataObjectTypeName="Car"  DeleteMethod="RemoveCar">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridViewCars" Name="newparameter" PropertyName="ID" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>

