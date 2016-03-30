<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="login_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-signin">
        <asp:Label ID="LabelEmail" CssClass="col-md-2" runat="server" Text="Email: "></asp:Label>
        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxEmail" runat="server" ErrorMessage="Enter email!" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Please enter valid email !" ControlToValidate="TextBoxEmail" ValidationExpression=".+\@.+\..+"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="LabelPassword" CssClass="col-md-2" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxPassword" runat="server" ErrorMessage="Enter password!" ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassowrd" runat="server" ErrorMessage="Please enter password between 4 and 15 characters. Only letters, numbers and the underscore are allowed!" ControlToValidate="TextBoxPassword" ValidationExpression="^[a-zA-Z]\w{3,14}$"></asp:RegularExpressionValidator>
       
        <br />
        <asp:Label ID="LabelPasswordConfirm" CssClass="col-md-2" runat="server" Text="Password confirm: "></asp:Label>
        <asp:TextBox ID="TextBoxPasswordConfirm" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxPasswordConfirm" runat="server" ErrorMessage="Enter password!" ControlToValidate="TextBoxPasswordConfirm"></asp:RequiredFieldValidator>
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
        <br />
        <asp:Label ID="LabelBotCheckInfo" CssClass="col-md-2" runat="server" Text="Type the symbols:"></asp:Label>
        <asp:TextBox ID="LabelBotCheck" runat="server" Text="" ReadOnly="True"></asp:TextBox>
        <asp:TextBox ID="TextBoxBotCheck" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidatorBotCheck" runat="server" ErrorMessage="Please enter the same symbols!" ControlToCompare="LabelBotCheck" ControlToValidate="TextBoxBotCheck" Operator="Equal"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxBotCheck" runat="server" ErrorMessage="Enter the symbols!" ControlToValidate="TextBoxBotCheck"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="ButtonRegister" CssClass="btn btn-primary" runat="server" Text="Register" OnClick="ButtonRegister_Click" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary" runat="server" />
    </div>
</asp:Content>

