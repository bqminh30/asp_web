﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="All_ProductsDefault.aspx.cs" Inherits="Website.All_ProductsDefault" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./styles/all_products.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="header__search">
        <img src="./Images/Icons/Search.png" alt="">
        <input type="text" name="search" placeholder="Search" runat="server" id="search_text">
        <button type="button" runat="server" id="search_button">Tìm</button>
    </div>--%>
    <div class="all-products-page-content">
            <div class="filter">
                <h3 class="filter__heading">Bộ lọc</h3>
                <ul class="filter__list">
                    <li class="filter__item"><a href="#" runat="server" id="Filter_01">&le; 1 triệu</a></li>
                    <li class="filter__item"><a href="#" runat="server" id="Filter_02">1 - 3 triệu</a></li>
                    <li class="filter__item"><a href="#" runat="server" id="Filter_03">&ge; 3 triệu</a></li>
                </ul>
            </div>
            <div class="all-products">
                <div class="all-products_heading">
                    <h2 class="all-products_brand-name" runat="server" id="all_products_brand_name"></h2>
                </div>
                <div class="all-products__container">
                    <asp:ListView ID="ListViewAllProducts" runat="server">
                        <ItemTemplate>
                            <div class="products__wrapper">
                                <a href="Product_InformationDefault.aspx?id=<%# Eval("iSanPhamId") %>">
                                    <img class="products__image" src="<%# Eval("sAnh") %>" alt="">
                                </a>
                                &nbsp;<div class="products__content">
                                    <h4 class="products__name"><%# Eval("sTenSanPham") %></h4>
                                    <%--<div class="products__colors">
                                        <div class="products__color--white"></div>
                                        <div class="products__color--black"></div>
                                        <div class="products__color--red"></div>
                                    </div>--%>
                                    <p class="products__price">Giá: <%# Convert.ToDecimal(Eval("fDonGia")).ToString("N0").Replace(",", ".") %><span class="products__price-unit">VNĐ</span></p>
                                    <a class="products__button" href="Product_InformationDefault.aspx?id=<%# Eval("iSanPhamId") %>">Chi tiết</a>
                                </div>
                            </div>   
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
</asp:Content>
