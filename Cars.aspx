<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cars.aspx.cs" Inherits="Cars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridViewCars" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            <asp:ImageField DataImageUrlField="image_url" HeaderText="Image">
                <ControlStyle CssClass="img-thumbnail" />
            </asp:ImageField>
            <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
            <asp:BoundField DataField="colour" HeaderText="colour" SortExpression="colour" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
            
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetAllCars" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>

