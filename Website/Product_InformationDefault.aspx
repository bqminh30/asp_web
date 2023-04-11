﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Product_InformationDefault.aspx.cs" Inherits="Website.Product_InformationDefault" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./styles/product_information.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-information-page-content">
            <asp:ListView ID="ListViewProductInformation1" runat="server">
                <ItemTemplate>
                    <div class="product__image">
                        <span id="nav-target-image" class="nav-target-fix-first-element"></span>
                        <img src="<%# Eval("img") %>" alt="">
                    </div>
                    <div class="product__sidebar">
                        <div class="sticky-wrapper">
                            <h1 class="product__name"><%# Eval("name") %></h1>
                            <p class="product__price"><%# Eval("price") %><span>đ</span></p>
                </ItemTemplate>
            </asp:ListView>
                            <div class="product__colors">
                                <asp:ListView ID="ListViewProductColors" runat="server">
                                    <ItemTemplate>
                                        <a href="product_information.aspx?id=<%# Eval("id") %>"><img src="<%# Eval("img") %>" alt=""></img></a>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                            <%--<div class="product__size">
                                <p>Chọn size</p>
                                <div class="size-container">
                                    <button class="size-btn" type="button">12K</button>
                                    <button class="size-btn" type="button">13K</button>
                                    <button class="size-btn" type="button">1UK</button>
                                    <button class="size-btn" type="button">2UK</button>
                                </div>
                            </div>--%>
                            <div class="product__buy">
                                <button type="button" class="product__buy" runat="server" ID="AddToCartButton" onserverclick="AddToCartButton_Click">Thêm vào giỏ hàng</button>
                            </div>
                            <div class="product__guarantee">
                                <div class="free-ship">
                                    <img src="./Images/Icons/Delivery.svg" alt="">
                                    <p>Miễn phí giao hàng trong vòng 5km</p>
                                </div>
                                <div class="return">
                                    <img src="./Images/Icons/Money.svg" alt="">
                                    <p>Không đúng hàng? Đổi trả lại hàng & Hoàn tiền</p>
                                </div>
                                <div class="return">
                                    <img src="./Images/Icons/Money.svg" alt="">
                                    <p>Giao hàng tận tay</p>
                                </div>
                                <div class="return">
                                    <img src="./Images/Icons/Money.svg" alt="">
                                    <p>Thanh toán dễ dàng</p>
                                </div>
                                <div class="return">
                                    <img src="./Images/Icons/Money.svg" alt="">
                                    <p>Trả hàng tiện lợi</p>
                                </div>
                                <div class="return">
                                    <img src="./Images/Icons/Money.svg" alt="">
                                    <p>Không đúng hàng? Đổi trả lại hàng & Hoàn tiền</p>
                                </div>
                                <div class="return">
                                    <img src="./Images/Icons/Money.svg" alt="">
                                    <p>Không đúng kích cỡ đổi size</p>
                                </div>
                               
                              
                             
                            
                            </div>
                        </div>
                    </div>
                    <div class="product__information">
                        <div class="navigation">
                            <ul>
                                <li><a href="#nav-target-image">Ảnh sản phẩm</a></li>
                                <li><a href="#nav-target-description">MÔ TẢ</a></li>
                                <li><a href="#nav-target-specifications">THÔNG TIN CHI TIẾT</a></li>
                            </ul>
                        </div>
                        <div class="content">
                            <div id="description">
                                <span id="nav-target-description" class="nav-target-fix"></span>
                                <asp:ListView ID="ListViewProductInformation2" runat="server">
                                    <ItemTemplate>
                                        <h1><%# Eval("name") %></h1>
                                        <h2><%# Eval("detail_heading") %></h2>
                                        <p><%# Eval("detail") %></p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                            <div id="specifications">
                                <span id="nav-target-specifications" class="nav-target-fix"></span>
                                <%--<h1>Thông số</h1>--%>
                                <ul>
                                    <%--<li>Thiết kế kiểu slip-on với quai dán phía trên</li>
                                    <li>Giày lót đệm linh hoạt</li>
                                    <li>Thân giày bằng vải dệt với các chi tiết phủ ngoài bằng chất liệu tổng hợp</li>
                                    <li>Đế ngoài bằng cao su không lưu dấu</li>--%>
                                    <li>Đóng túi chắc chắn</li>
                                    <li>Bảo quản sạch sẽ</li>
                                </ul>
                            </div>
                        </div>
                    </div>
        </div>
</asp:Content>
