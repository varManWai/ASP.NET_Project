﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Ertist.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <link rel="stylesheet" href=".\css\Wishlist.css">



    <section class="cart_section">
        <div class="page_header">
            <h1>Wishlist</h1>
        </div>

        <% if (Session["UserID"] == null)
            {

        %>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div style="font-size: 50px; padding-top: 50px">Please login first</div>
        </div>




        <% 
            }
            else
            {
        %>

        <div class="cart_all">
            <div class="artwork_container_all">
                <div class="total_artwork_cart">
                    <span>Artworks in Wishlist</span>
                </div>

                <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="rpt2_ItemDataBound">
                    <ItemTemplate>
                        <div class="artwork_container">
                            <div class="artwork_image">
                                <img src="<%# GetImage(Eval("picture")) %>" alt="An Artwork Picture">
                            </div>
                            <asp:HiddenField ID="hdfUserId" runat="server" Value='<%# Eval("artworkID") %>' />
                            <div class="artwork_details" style="width: 614px; height: 302px;">
                                <span class="artwor_details_name"><%# Eval("name") %></span>
                                <div class="artist">
                                    <asp:Repeater ID="Repeater3" runat="server">
                                        <ItemTemplate>
                                            <img src=" <%#  GetImage(Eval("picture")) %>" alt="An Artist Picture">
                                            <span><%# Eval("username") %></span>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="artwork_description">
                                    <%# Eval("description") %>
                                </div>
                                <div class="price_remove">
                                    <span class="price">$<%# Eval("price") %></span><asp:TextBox runat="server" Style="display: none;" ID="txtWishlistID" Text='<%# Eval("wishlistId")%>'></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" OnClick="btnRemove_Click" CustomParameter='<%# Eval("wishlistId") %>' Text="Remove" Style="background-color: #ca3f49; outline: none; border: none; border-radius: 300px; width: 100%; max-width: 158px; height: 38px; color: white; font-size: clamp(10px, 1.5vw, 15px); margin-left: 20px; letter-spacing: 0.12em;" />

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ertistDB %>" SelectCommand="SELECT Artwork.artworkID, Artwork.name, Artwork.price, Artwork.description, Artwork.picture, [User].username, [User].picture AS Expr1, Wishlist.wishlistID FROM Artwork INNER JOIN Wishlist ON Artwork.artworkID = Wishlist.artworkID INNER JOIN [User] ON Wishlist.userID = [User].UserID WHERE [User].UserID = @userID">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <%--<asp:Button ID="Button1" runat="server" Text="Button" Width="156px" />--%>
    </section>
    <%}
    %>
</asp:Content>
