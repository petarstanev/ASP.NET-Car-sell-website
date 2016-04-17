<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WishList.aspx.cs" Inherits="WishList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridViewCars" runat="server" CssClass="table table-responsive table-hover table-striped" AutoGenerateColumns="False"  AllowSorting="True" AllowPaging="True" DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
            <asp:BoundField DataField="colour" HeaderText="colour" SortExpression="colour" />
            <asp:BoundField DataField="mainImageUrl" HeaderText="mainImageUrl" SortExpression="mainImageUrl" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
            <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
        </Columns>
    </asp:GridView>
    
   <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetWishList" 
 TypeName="CarCollection">
       
    </asp:ObjectDataSource>
</asp:Content>

