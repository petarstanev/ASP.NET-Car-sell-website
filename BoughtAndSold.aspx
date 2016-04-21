<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BoughtAndSold.aspx.cs" Inherits="BoughtAndSold" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HiddenFieldUserId" runat="server" />
    <h2>Bought:</h2>
    <asp:GridView ID="GridViewBough" GridLines="None"  CssClass="table table-striped" UseAccessibleHeader="True" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="make" HeaderText="make" SortExpression="make"></asp:BoundField>
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type"></asp:BoundField>
            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model"></asp:BoundField>
            <asp:BoundField DataField="colour" HeaderText="colour" SortExpression="colour"></asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year"></asp:BoundField>
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location"></asp:BoundField>
            <asp:HyperLinkField AccessibleHeaderText="Link" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/CarDetails.aspx?id={0}" HeaderText="Link" Text="link" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id],[make], [type], [model], [colour], [price], [year], [location] FROM [cars] WHERE ([buyer_id] = @user_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenFieldUserId" PropertyName="Value" Name="user_id" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    
    <h2>Sold:</h2>
    <asp:GridView ID="GridViewSold" GridLines="None" CssClass="table table-striped" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="make" HeaderText="make" SortExpression="make"></asp:BoundField>
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type"></asp:BoundField>
            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model"></asp:BoundField>
            <asp:BoundField DataField="colour" HeaderText="colour" SortExpression="colour"></asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year"></asp:BoundField>
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location"></asp:BoundField>
            <asp:HyperLinkField AccessibleHeaderText="Link" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/CarDetails.aspx?id={0}" HeaderText="Link" Text="link" />
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [type], [make], [model], [colour], [price], [year], [location], [Id] FROM [cars] WHERE (([user_id] = @user_id) AND ([buyer_id] IS NOT NULL))">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenFieldUserId" PropertyName="Value" Name="user_id" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    
</asp:Content>

