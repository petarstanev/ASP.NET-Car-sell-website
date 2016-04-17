<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProfileSettings.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Change profile settings:</h2>
    <asp:Label ID="LabelPassword" CssClass="col-md-2" runat="server" Text="Password: "></asp:Label>
    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassowrd" runat="server" ErrorMessage="Please enter password between 4 and 15 characters. Only letters, numbers and the underscore are allowed!" ControlToValidate="TextBoxPassword" ValidationExpression="^[a-zA-Z0-9]\w{3,14}$"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="LabelPasswordConfirm" CssClass="col-md-2" runat="server" Text="Password confirm: "></asp:Label>
    <asp:TextBox ID="TextBoxPasswordConfirm" runat="server" TextMode="Password"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Enter the same password!" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxPasswordConfirm" Operator="Equal"></asp:CompareValidator>
    <br />
    <br />
    <asp:Label ID="LabelAddress" CssClass="col-md-2" runat="server" Text="Address: "></asp:Label>
    <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxAddress" runat="server" ErrorMessage="Enter address!" ControlToValidate="TextBoxAddress"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="LabelMobile" CssClass="col-md-2" runat="server" Text="Mobile number: "></asp:Label>
    <asp:TextBox ID="TextBoxMobile" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ErrorMessage="Enter mobile number!" ControlToValidate="TextBoxMobile"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ErrorMessage="Please enter correct mobile number!" ControlToValidate="TextBoxMobile" ValidationExpression="^\+?\d{6,18}$"></asp:RegularExpressionValidator>
    <br />
    <asp:Button ID="ButtonUpdate" CssClass="btn btn-warning" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
    <br />
    <asp:ValidationSummary ID="ValidationSummary" runat="server" />
</asp:Content>

