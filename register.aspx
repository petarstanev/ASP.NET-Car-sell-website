<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="login_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelFailed" runat="server" Text=""></asp:Label>
    <br />
    <asp:Label ID="LabelEmail" runat="server" Text="Email: "></asp:Label>
    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxEmail" runat="server" ErrorMessage="Enter email!" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="LabelPassword" runat="server" Text="Password: "></asp:Label>
    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxPassword" runat="server" ErrorMessage="Enter password!" ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="LabelAddress" runat="server" Text="Address: "></asp:Label>
    <asp:TextBox ID="TextBoxAddress" runat="server" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxAddress" runat="server" ErrorMessage="Enter address!" ControlToValidate="TextBoxAddress"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="LabelMobile" runat="server" Text="Mobile number: "></asp:Label>
    <asp:TextBox ID="TextBoxMobile" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ErrorMessage="Enter mobile number!" ControlToValidate="TextBoxMobile"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="LabelBotCheckInfo" runat="server" Text="Type the symbols:"></asp:Label>
    <asp:TextBox ID="LabelBotCheck" runat="server" Text="" ReadOnly="True"></asp:TextBox>
    <asp:TextBox ID="TextBoxBotCheck" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidatorBotCheck" runat="server" ErrorMessage="Please enter the same symbols!" ControlToCompare="LabelBotCheck" ControlToValidate="TextBoxBotCheck" Operator="Equal"></asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxBotCheck" runat="server" ErrorMessage="Enter the symbols!" ControlToValidate="TextBoxBotCheck"></asp:RequiredFieldValidator>
    <br />
    <asp:Button ID="ButtonRegister" runat="server" Text="Login" OnClick="ButtonRegister_Click" />
    <br />
    <asp:ValidationSummary ID="ValidationSummary" runat="server" />
</asp:Content>

