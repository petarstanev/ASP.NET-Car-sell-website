<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Lottery.aspx.cs" Inherits="Lottery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    <asp:Button ID="BtnGenerate" runat="server" OnClick="Generate_Click"  Text="Generate" />
    <asp:Button ID="BtnSort" runat="server" OnClick="Sort_Click" Text="Sort" />
</asp:Content>

