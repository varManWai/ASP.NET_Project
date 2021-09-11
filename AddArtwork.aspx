﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="Ertist.AddArtwork1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="css/button.css" rel="stylesheet" />
    <style>        
        .auto-style1 {
            width: 140px;
            height: 21px;
        }
        .auto-style2 {
            height: 21px;
        }
    </style>

    <div style="font-size:14px; padding:5%;">
            <h3>Add Artwork</h3><br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Width="500px" />
            <table class="auto-style5">
                <tr>
                    <td class="auto-style3" style="width: 140px">Image</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="auto-style2" />
                        <asp:RequiredFieldValidator ID="rfvImage" runat="server" ErrorMessage="Image is Required" Text="*" ControlToValidate="FileUpload1" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revImage" runat="server" ErrorMessage="File must be in .PNG/.JPG/.JEPG " Text="*" ForeColor="Red" ControlToValidate="FileUpload1" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.png|.PNG|.jpg|.JPG|.jpeg|.JPEG)$"></asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="cvImage" runat="server" ControlToValidate="FileUpload1" ErrorMessage="File size should not be greater than 100X100." OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="width: 140px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="height: 22px; width: 140px">Artwork Name</td>
                    <td style="height: 22px">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is Required" Text="*" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                       <%-- <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name should not be more than 100 words " Text="*" ForeColor="Red" ControlToValidate="txtName" ValidationExpression="^[a-zA-Z''-'\s]{33,57}$"></asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="width: 140px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="width: 140px">Artwork Price</td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ErrorMessage="Price is Required" Text="*" ForeColor="Red" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPrice" runat="server" ErrorMessage="Price must in Number" Text="*" ForeColor="Red" ControlToValidate="txtPrice" ValidationExpression="^(\d+)?$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style1" style="width: 140px">&nbsp;</td>
                    <td>&nbsp;</tr>
                 <tr>
                    <td class="auto-style3" style="width: 140px">Artwork Description</td>

                    <td> <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ErrorMessage="Artwork Description is Required" ControlToValidate="txtDesc" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style3" style="width: 140px">&nbsp;</td>
                    <td> &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="width: 140px">Dimensions</td>
                    <td><asp:TextBox ID="txtSize" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSize" runat="server" ErrorMessage="Dimensions is Required" ControlToValidate="txtSize" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="rgvSize" runat="server" ErrorMessage="Invalid Format" ControlToValidate="txtSize" Text="*" ForeColor="Red" ValidationExpression="^\d+(\.\d+)+(cm\s)+(x|X)"></asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="width: 140px">&nbsp;</td>
                    <td> &nbsp;</td>
                </tr>
                  <tr>
                    <td class="auto-style3" style="width: 140px">Stock</td>
                    <td><asp:TextBox ID="txtStock" ReadOnly="True" placeHolder="1" runat="server"></asp:TextBox></td>
                </tr>
                  <tr>
                    <td class="auto-style3" style="width: 140px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="width: 140px; height: 22px;">Available</td>
                    <td style="height: 22px"><asp:DropDownList ID="ddlAvailable" runat="server">
                <asp:ListItem>Available</asp:ListItem>
                <asp:ListItem>Not Available</asp:ListItem>
            </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvAvailable" runat="server" ErrorMessage="Available is Required" ControlToValidate="ddlAvailable" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td class="auto-style3" style="width: 140px; height: 22px;">&nbsp;</td>
                    <td style="height: 22px">&nbsp;</td>
                </tr>
               
                <tr>
                    <td class="auto-style3">Category</td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlCategory" DataTextField="name" DataValueField="categoryID">
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ErrorMessage="Category is Required" ControlToValidate="ddlCategory" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
               <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Gallery</td>
                    <td>
                        <asp:DropDownList ID="ddlGallery" runat="server" DataSourceID="SqlGallery" DataTextField="name" DataValueField="galleryID"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvGallery" runat="server" ErrorMessage="Gallery is Required" ControlToValidate="ddlGallery" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style1" style="width: 140px"><asp:Button ID="btnAdd" class="art-pg-btn" runat="server" Text="Add Artwork" OnClick="btnAdd_Click" /></td>
                    <td class="auto-style4"><asp:Button ID="btnCancel" class="art-pg-btn" runat="server" Text="Cancel" OnClick="btnCancel_Click"  /></td>
                </tr>             
            </table>

        <asp:SqlDataSource ID="SqlGallery" runat="server" ConnectionString="<%$ ConnectionStrings:ertistDB %>" SelectCommand="SELECT * FROM [Gallery] WHERE ([userID] = @userID)">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="UserID" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ertistDB %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
            <br />
    </div>
</asp:Content>
