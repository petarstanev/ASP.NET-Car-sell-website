<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyCars.aspx.cs" Inherits="MyCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="form-group">
        <div class="col-md-4">

            <asp:TextBox ID="TextBoxType" CssClass="form-control" placeholder="Type" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBoxMake" CssClass="form-control" placeholder="Make" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBoxModel" CssClass="form-control" placeholder="Model" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBoxColour" CssClass="form-control" placeholder="Colour" runat="server"></asp:TextBox>
            <br/>
            <asp:TextBox ID="TextBoxLocation" CssClass="form-control" placeholder="Location" runat="server"></asp:TextBox>
            <br/>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="TextBoxPriceStarting" CssClass="form-control" placeholder="Starting Price" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBoxPriceMaximum" CssClass="form-control" placeholder="Maximum Price" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="TextBoxYearStarting" CssClass="form-control" placeholder="Starting Year" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBoxYearEnding" CssClass="form-control" placeholder="Ending year" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonSearch" CssClass="btn btn-lg btn-primary col-md-offset-2" runat="server" Text="Search" />
        </div>
    </div>
    <asp:GridView ID="GridViewCars" runat="server" CssClass="table table-striped" UseAccessibleHeader="True"  AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AllowSorting="True" AllowPaging="True" GridLines="None">
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAll" SortParameterName="sortExpression"
        TypeName="UserCarCollection">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxType" ConvertEmptyStringToNull="False" Name="type" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxMake" ConvertEmptyStringToNull="False" Name="make" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxModel" ConvertEmptyStringToNull="False" Name="model" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxColour" ConvertEmptyStringToNull="False" Name="colour" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxPriceStarting" ConvertEmptyStringToNull="False" Name="startingPriceText" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxPriceMaximum" ConvertEmptyStringToNull="False" Name="endPriceText" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxYearStarting" ConvertEmptyStringToNull="False" Name="startingYearText" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxYearEnding" ConvertEmptyStringToNull="False" Name="endingYearText" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxLocation" ConvertEmptyStringToNull="False" Name="location" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

