<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CarEdit.aspx.cs" Inherits="CarEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-group">
        <div class="col-md-6" id="images" runat="server">
            <asp:GridView ID="GridView1" HeaderStyle="hiden" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" Visible="False" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                    <asp:ImageField DataImageUrlField="image_url" HeaderText="image" NullImageUrl="~/images/no-image.gif" ControlStyle-CssClass="img-thumbnail">
                        <ControlStyle CssClass="img-thumbnail"></ControlStyle>
                    </asp:ImageField>
                   
                    <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>


            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DeleteImage" DeleteCommandType="StoredProcedure" SelectCommand="GetCarImages" SelectCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="id" Name="car_id" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:FileUpload ID="FileUploadImage" runat="server" />
            <asp:Button ID="ButtonAddImage" runat="server" CssClass="btn bg-info" Text="Add Image" OnClick="ButtonAddImage_Click" />
        </div>
        <div class="col-md-4">
            Type:
            <asp:TextBox ID="TextBoxType" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Make:
            <asp:TextBox ID="TextBoxMake" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Model:
            <asp:TextBox ID="TextBoxModel" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Colour:
            <asp:TextBox ID="TextBoxColour" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Price:
            <asp:TextBox ID="TextBoxPrice" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Year:
            <asp:TextBox ID="TextBoxYear" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Location:
            <asp:TextBox ID="TextBoxLocation" CssClass="form-control" placeholder="Location" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonUpdate" CssClass="btn btn-lg btn-primary" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
        </div>
    </div>
</asp:Content>

