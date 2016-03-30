<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login_form.aspx.cs" Inherits="login_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelFailed" runat="server" Text=""></asp:Label>
    <br/>
    <asp:Label ID="LabelUsername" runat="server" Text="Username: "></asp:Label>
    <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxUsername" runat="server" ErrorMessage="Enter username!" ControlToValidate="TextBoxUsername"></asp:RequiredFieldValidator>
    <br/>
    <asp:Label ID="LabelPassword" runat="server" Text="Password: "></asp:Label>
    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxPassword" runat="server" ErrorMessage="Enter password!" ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator>
    <br/>
    <asp:Label ID="LabelBotCheckInfo" runat="server" Text="Type the symbols:"></asp:Label>
    <asp:TextBox ID="LabelBotCheck" runat="server" Text="" ReadOnly="True"></asp:TextBox>
    <asp:TextBox ID="TextBoxBotCheck" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidatorBotCheck" runat="server" ErrorMessage="Please enter the same symbols!" ControlToCompare="LabelBotCheck" ControlToValidate="TextBoxBotCheck" Operator="Equal"></asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxBotCheck" runat="server" ErrorMessage="Enter the symbols!" ControlToValidate="TextBoxBotCheck"></asp:RequiredFieldValidator>
    <br/>
    <asp:Button ID="ButtonLogin" runat="server" Text="Login" />
    <br/>
    <asp:ValidationSummary ID="ValidationSummary" runat="server" />
</asp:Content>

