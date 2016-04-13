<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cars.aspx.cs" Inherits="Cars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridViewCars" CssClass="table table-responsive table-hover table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            <asp:ImageField DataImageUrlField="image_url" HeaderText="Image" ItemStyle-Height="120" ItemStyle-Width="160" NullImageUrl="images/no-image.gif">
                <ControlStyle CssClass="img-thumbnail" />
            </asp:ImageField>
            <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
            <asp:BoundField DataField="colour" HeaderText="colour" SortExpression="colour" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />


            <asp:TemplateField HeaderText="Link:" ItemStyle-Width="30">
                <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='<%# Eval("id", "~/CarDetails.aspx?Id={0}") %>'
                        Text='Select' />
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetAllCars" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

