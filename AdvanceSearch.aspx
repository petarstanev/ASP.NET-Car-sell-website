<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdvanceSearch.aspx.cs" Inherits="AdvanceSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    Search by:
    Type:<asp:TextBox ID="TextBoxType" runat="server"></asp:TextBox>
    <br />
    Make:<asp:TextBox ID="TextBoxMake" runat="server"></asp:TextBox>
    <br />
    Model:<asp:TextBox ID="TextBoxModel" runat="server"></asp:TextBox>
    <br />
    Colour:<asp:TextBox ID="TextBoxColour" runat="server"></asp:TextBox>
    <br />
    Price between:<asp:TextBox ID="TextBoxPriceStarting" runat="server"></asp:TextBox>
    and 
    <asp:TextBox ID="TextBoxPriceMaximum" runat="server"></asp:TextBox>
    <br />
    Year:<asp:TextBox ID="TextBoxYearStarting" runat="server"></asp:TextBox>
    and
    <asp:TextBox ID="TextBoxYearEnding" runat="server"></asp:TextBox>
    <br />
    Location:<asp:TextBox ID="TextBoxLocation" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
    <asp:GridView ID="GridViewCars" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AllowPaging="True">
        <Columns>
            <asp:BoundField HeaderText="type" DataField="type" SortExpression="type"></asp:BoundField>
            <asp:ImageField DataImageUrlField="mainImageUrl" HeaderText="image" NullImageUrl="~/images/no-image.gif">
            </asp:ImageField>
            <asp:BoundField HeaderText="make" DataField="make" SortExpression="make"></asp:BoundField>
            <asp:BoundField HeaderText="model" DataField="model" SortExpression="model"></asp:BoundField>
            <asp:BoundField HeaderText="colour" DataField="colour" SortExpression="colour"></asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
           
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAll" TypeName="CarCollection">
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

