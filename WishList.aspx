<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WishList.aspx.cs" Inherits="WishList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Repeater ID="RepeatWishList" runat="server">
        <HeaderTemplate>
            <table>
                <thead>
                    <tr>
                        <th>Type</th>
                        <th>Image</th>
                        <th>Make</th>
                        <th>Make</th>
                        <th>Model</th>
                        <th>Colour</th>
                        <th>Price</th>
                        <th>Year</th>
                        <th>Location</th>
                        <th>Notes</th>
                        <th>Link</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("type") %></td>
                <td >
                    <asp:Image CssClass="img-thumbnail img-responsive" ID="ImageCar" ImageUrl='<%# Eval("mainImageUrl")%>'  NullImageUrl="images/no-image.gif" runat="server" /></td>
                <td><%# Eval("make")%></td>
                <td><%# Eval("model")%></td>
                <td><%# Eval("colour")%></td>
                <td><%# Eval("price")%></td>
                <td><%# Eval("year")%></td>
                <td><%# Eval("location")%></td>
                <td><%# Eval("notes")%></td>
                <td><asp:HyperLink runat="server" NavigateUrl='<%# Eval("id", "~/CarDetails.aspx?Id={0}") %>'
                        Text='Select' /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
    </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>

