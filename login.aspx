<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="login_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-4 col-md-offset-2">
        <h2>
            <asp:Label ID="LabelLogin" runat="server" Text="Please login:"></asp:Label></h2>
        <div class="form-group">
            <asp:Label ID="LabelEmail" runat="server" Text="Email: "></asp:Label>
            <asp:TextBox ID="TextBoxEmail" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxEmail" runat="server" ErrorMessage="Enter email!" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelPassword" runat="server" Text="Password: "></asp:Label>

            <asp:TextBox ID="TextBoxPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxPassword" runat="server" ErrorMessage="Enter password!" ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <asp:Label ID="LabelBotCheckInfo" runat="server" Text="Type the symbols:"></asp:Label>
            <asp:TextBox ID="LabelBotCheck" CssClass="form-control" runat="server" Text="" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="TextBoxBotCheck" placeholder="here" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:CompareValidator Display="Dynamic" ID="CompareValidatorBotCheck" runat="server" ErrorMessage="Please enter the same symbols!" ControlToCompare="LabelBotCheck" ControlToValidate="TextBoxBotCheck" Operator="Equal"></asp:CompareValidator>
            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorTextBoxBotCheck" runat="server" ErrorMessage="Enter the symbols!" ControlToValidate="TextBoxBotCheck"></asp:RequiredFieldValidator>
        </div>
        <asp:Button ID="ButtonLogin" CssClass="btn btn-primary btn-lg" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
        <asp:Label ID="LabelFailed" Visible="False"  runat="server" Text="Wrong email or password !"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" />
    </div>
</asp:Content>

