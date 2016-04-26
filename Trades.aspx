<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Trades.aspx.cs" Inherits="Trades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="nav nav-tabs">
        <li id="boughtLi" role="presentation" runat="server" class="active"><a href="Trades.aspx">Bought</a></li>
        <li id="soldLi" role="presentation" runat="server"><a href="Trades.aspx?type=sold">Sold</a></li>
    </ul>
    <div id="row">
        <div id="contentTrades" runat="server">
            <asp:GridView ID="GridViewBough" GridLines="None" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSourceBoughtAndSold" AllowPaging="True" AllowSorting="True">
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

                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="ObjectDataSourceBoughtAndSold" SelectMethod="GetBought" SortParameterName="sortExpression" TypeName="BoughtAndSold"></asp:ObjectDataSource>

            Year:
    <ul>
        <li>Min -
            <asp:Label ID="LabelYearMin" runat="server"></asp:Label></li>
        <li>Average -
            <asp:Label ID="LabelYearAverage" runat="server"></asp:Label></li>
        <li>Max -
            <asp:Label ID="LabelYearMax" runat="server"></asp:Label></li>
    </ul>

            Money:
    <ul>
        <li>Min -
            <asp:Label ID="LabelMoneyMin" runat="server"></asp:Label></li>
        <li>Average -
            <asp:Label ID="LabelMoneyAverage" runat="server"></asp:Label></li>
        <li>Max -
            <asp:Label ID="LabelMoneyMax" runat="server"></asp:Label></li>
        <li>Total -
            <asp:Label ID="LabelMoneyTotal" runat="server"></asp:Label></li>
    </ul>
        </div>
        <asp:Label ID="LabelEmpty" Visible="False" runat="server" CssClass="lead alert-danger" Text="No cars found."> </asp:Label>
    </div>
</asp:Content>
