<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="exercise6.aspx.cs" Inherits="exercise6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="grd_myGrid" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="personId" DataSourceID="dsrc_myDatabase" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="personId" HeaderText="personId" InsertVisible="False" ReadOnly="True"/>
            <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
            <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:ButtonField Text=" Select"  HeaderText="Select Row" CommandName="Select" ItemStyle-Width="80"  >
<ItemStyle Width="80px"></ItemStyle>
            </asp:ButtonField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsrc_myDatabase" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [personId], [lastName], [firstName], [address], [phone] FROM [people] ORDER BY [lastName]" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"></asp:SqlDataSource>
</asp:Content>


