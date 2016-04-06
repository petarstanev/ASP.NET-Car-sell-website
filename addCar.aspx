<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addCar.aspx.cs" Inherits="addCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Add new car:</h2>
    Type:
    <asp:DropDownList ID="DropDownListTypes" runat="server">
        <asp:ListItem Text="Sports" Value="Sports"></asp:ListItem>
        <asp:ListItem Text="Saloon" Value="Saloon"></asp:ListItem>
        <asp:ListItem Text="Hatch-back" Value="Hatch-back"></asp:ListItem>
        <asp:ListItem Text="Cabriolet" Value="Cabriolet"></asp:ListItem>
    </asp:DropDownList>
    <br />
    Make:<asp:TextBox ID="TextBoxMake" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMake" runat="server" ErrorMessage="Please enter make!" ControlToValidate="TextBoxMake"></asp:RequiredFieldValidator>
    <br />
    Model:<asp:TextBox ID="TextBoxModel" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter model!" ControlToValidate="TextBoxModel"></asp:RequiredFieldValidator>
    <br />
    Colour:
    <asp:TextBox ID="TextBoxColour" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorColour" runat="server" ErrorMessage="Please enter colour!" ControlToValidate="TextBoxColour"></asp:RequiredFieldValidator>
    <br />
    Picture: <asp:FileUpload ID="FileUploadImage" AllowMultiple="true" runat="server" />
    <br />
    Price:<asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ErrorMessage="Please enter price!" ControlToValidate="TextBoxPrice"></asp:RequiredFieldValidator>
    <br />
     Year of registration:<asp:TextBox ID="TextBoxYear" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorYear" runat="server" ErrorMessage="Please enter year!" ControlToValidate="TextBoxYear"></asp:RequiredFieldValidator>
    <br />
     Location:<asp:TextBox ID="TextBoxLocation" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocation" runat="server" ErrorMessage="Please enter location!" ControlToValidate="TextBoxLocation"></asp:RequiredFieldValidator>
    <br />
    <asp:Button ID="ButtonAddCar" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="ButtonAddCar_Click" />
</asp:Content>

