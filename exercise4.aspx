<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="exercise4.aspx.cs" Inherits="exercise4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <asp:Label class="left" ID="LabelName" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorName" runat="server" ErrorMessage="Enter valid Name!" ControlToValidate="TextBoxName" ValidationExpression="^[a-zA-Z]{2,40}$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required name!" ControlToValidate="TextBoxName"></asp:RequiredFieldValidator>

    </p>
    <p>
        <asp:Label class="left" ID="LabelSurname" runat="server" Text="Surname"></asp:Label>
        <asp:TextBox ID="TextBoxSurname" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid Surname!" ControlToValidate="TextBoxSurname" ValidationExpression="^[a-zA-Z]{2,40}$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required surname!" ControlToValidate="TextBoxSurname"></asp:RequiredFieldValidator>

    </p>
    <p>
        <asp:Label class="left" ID="LabelAddress" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required address!" ControlToValidate="TextBoxAddress"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label class="left" ID="LabelPostCode" runat="server" Text="PostCode"></asp:Label>
        <asp:TextBox ID="TextBoxPostCode" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid Post Code!" ControlToValidate="TextBoxPostCode" ValidationExpression="[A-Z]{1,2}[0-9][0-9A-Z]?\s?[0-9][A-Z]{2}"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required post code!" ControlToValidate="TextBoxPostCode"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label class="left" ID="LabelPhone" runat="server" Text="Phone"></asp:Label>
        <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter valid phone number!" ControlToValidate="TextBoxPhone" ValidationExpression="^[0-9()-+]+$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required number!" ControlToValidate="TextBoxPhone"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label class="left" ID="LabelEmail" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter valid Email!" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required email!" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label class="left" ID="LabelAge" runat="server" Text="Age"></asp:Label>
        <asp:TextBox ID="TextBoxAge" runat="server"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Enter valid Age!" MinimumValue="18" MaximumValue="70" ControlToValidate="TextBoxAge"></asp:RangeValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required age!" ControlToValidate="TextBoxAge"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_CLick" />
    </p>
    <div class="alert alert-warning" role="alert">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </div>
</asp:Content>

