<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CarEdit.aspx.cs" Inherits="CarEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-group">
        <div class="col-md-6" id="images" runat="server">
            <asp:GridView ID="GridView1" HeaderStyle="hiden" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:ImageField DataImageUrlField="url"  HeaderText="image" NullImageUrl="~/images/no-image.gif" ControlStyle-CssClass="img-thumbnail">
                <ControlStyle CssClass="img-thumbnail"></ControlStyle>
            </asp:ImageField>
                    <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getImages" TypeName="Car">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="id" Name="id" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="col-md-4">
            Type:
            <asp:TextBox ID="TextBoxType" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Make:
            <asp:TextBox ID="TextBoxMake" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Model:
            <asp:TextBox ID="TextBoxModel" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Colour: <asp:TextBox ID="TextBoxColour" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
        </div>
        <div class="col-md-4">
            Price: <asp:TextBox ID="TextBoxPrice" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Year: <asp:TextBox ID="TextBoxYear" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Location: <asp:TextBox ID="TextBoxLocation" CssClass="form-control" placeholder="Location" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonEdit" CssClass="btn btn-lg btn-primary col-md-offset-2" runat="server" Text="Edit"  />
        </div>
    </div>
</asp:Content>

