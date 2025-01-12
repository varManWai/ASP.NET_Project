﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Ertist.Homepage" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="./css/Homepage.css">

    <section class="home">
        <div class="section_1">
            <div class="left_side">
                <div class="left_side_container">
                    <h2 class="home_header">Every Artwork has their own story and meaning</h2>
                    <p class="home_description" style="font-size: clamp(15px, 2vw, 20px);">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. At dolor diam odio
                    enim quam. Mauris quis vivamus nam varius. Volutpat suspendisse tristique adipiscing nec. Phasellus
                    ac nibh euismod sit sit id.
                    </p>
                    <a href="#">Let's see the Artwork<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path d="M9.99984 6L8.58984 7.41L13.1698 12L8.58984 16.59L9.99984 18L15.9998 12L9.99984 6Z"
                            fill="white" />
                    </svg>
                    </a>
                </div>
            </div>
            <div class="right_side">
                <div class="slide_image_1">
                    <img src="./Image/1.jpg" alt="a picture of art" srcset="">
                </div>
                <div class="slide_image_2">
                    <img src="./Image/2.jpg" alt="a picture of art" srcset="">
                </div>
                <div class="slide_image_3">
                    <img src="./Image/3.jpg" alt="a picture of art" srcset="">
                </div>
            </div>
        </div>

        <div class="section_2" >
            <a href="ArtworkPainting.aspx" class="cards">
                <img src="./Image/11.jpg" alt="a picture of art">
                <span class="card_title">Paintings
                </span>
            </a>
            <a href="ArtworkInk.aspx" class="cards">
                <img src="./Image/12.jpg" alt="a picture of art">
                <span class="card_title">Ink
                </span>
            </a>
            <a href="ArtworkWatercolor.aspx" class="cards">
                <img src="./Image/13.jpeg" alt="a picture of art">
                <span class="card_title">Watercolour
                </span>
            </a>
        </div>

        <div class="section_3">
            <div class="artwork_container">
                <div class="artwork_container_title">
                    <h2>Artwork</h2>
                </div>
                <div class="artworks">


                    <asp:Repeater ID="Repeater1" runat="server" >
                        <ItemTemplate>
                            <div class="artwork">
                                <a href="Description.aspx?artworkID=<%# DataBinder.Eval(Container.DataItem, "artworkID") %>">
                                    <img src="<%# GetImage(Eval("picture"))%>" alt="">
                                    <div class="artwork_name">
                                        <%# Eval("name") %>
                                    </div>
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="view_more_button">
                    <a href="ArtworkDisplay.aspx">Let’s see the Artwork<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path d="M9.99984 6L8.58984 7.41L13.1698 12L8.58984 16.59L9.99984 18L15.9998 12L9.99984 6Z"
                            fill="white" />
                    </svg></a>
                </div>
            </div>
        </div>


        <div class="section_4">
            <div class="artist_wall">
                <div class="artist_wall_title">
                    <h2>POPULAR ARTIST</h2>
                </div>
                <div class="section_artist">
                    <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="rpt2_ItemDataBound">
                        <ItemTemplate>
                            <div class="artist_contianer">
                                <a href="ClientArtistProfile?artistID=<%# Eval("userId") %>">
                                    <div class="artist_details">
                                        <asp:HiddenField ID="hdfUserId" runat="server" Value='<%# Eval("userId") %>' />
                                        <img src="<%# GetImage(Eval("picture")) %>" alt="" class="artist_img" style="height:100px;width:100px;object-fit:cover"/>
                                        <div class="artist_name"><%# Eval("username") %></div>
                                        <p class="artist_bio">
                                            <%# Eval("bio") %>
                                        </p>
                                    </div>
                                </a>
                                <div class="artist_artwork_container">
                                    <asp:Repeater ID="Repeater3" runat="server">
                                        <ItemTemplate>
                                            <a href="Description?artworkID=<%# Eval("artworkID") %>">
                                                <div class="artwork_image ">
                                                    <img src="<%# GetImage(Eval("picture")) %>" alt="" class="artwork_img" />
                                                </div>
                                            </a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>

    </section>


    </asp:Content>
