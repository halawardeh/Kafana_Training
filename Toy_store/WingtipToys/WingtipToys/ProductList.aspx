<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ProductList.aspx.cs" Inherits="WingtipToys.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>

            <asp:ListView ID="productList" runat="server"
                DataKeyNames="ProductID" GroupItemCount="4"
                ItemType="WingtipToys.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table style="border-collapse: separate; border-spacing: 0; width: 100%; max-width: 220px;">

                            <tr>
                                <td style="padding: 12px 8px; background-color: #f8bbd0; border-radius: 0 0 10px 10px; text-align: center;">
                                    <div style="width: 220px; background: #fce4ec; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.08); transition: all 0.3s ease; border: 1px solid #f8bbd0;">
                                        <!-- Image Container -->
                                        <div style="height: 160px; overflow: hidden; position: relative;">
                                            <a href="ProductDetails.aspx?productID=<%#:Item.ProductID%>" style="text-decoration: none; display: block; height: 100%;">
                                                <asp:Image ID="ProductImage" runat="server"
                                                    ImageUrl='<%# "~/Images/Thumbs/" + Eval("ImagePath") %>'
                                                    Style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.5s ease;"
                                                    onmouseover="this.style.transform='scale(1.1)'"
                                                    onmouseout="this.style.transform='scale(1)'" />
                                                <div style="position: absolute; bottom: 0; left: 0; right: 0; height: 40px; background: linear-gradient(to top, rgba(106,27,154,0.5), transparent);"></div>
                                            </a>
                                        </div>

                                        <!-- Product Info -->
                                        <div style="padding: 16px; text-align: center; background: white;">
                                            <a href="ProductDetails.aspx?productID=<%#:Item.ProductID%>"
                                                style="text-decoration: none; color: #6a1b9a; font-weight: 600; font-size: 15px; display: block; margin-bottom: 8px; min-height: 40px;">
                                                <%#:Item.ProductName%>
                                            </a>

                                            <div style="color: #4a148c; font-weight: bold; font-size: 18px; margin-bottom: 16px;">
                                                <%#:String.Format("{0:c}", Item.UnitPrice)%>
                                            </div>

                                            <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>"
                                                style="display: inline-flex; align-items: center; justify-content: center; background: linear-gradient(145deg, #8e24aa, #6a1b9a); color: white; padding: 10px 24px; border-radius: 25px; text-decoration: none; font-weight: 600; font-size: 14px; transition: all 0.3s ease; box-shadow: 0 3px 6px rgba(0,0,0,0.1); width: calc(100% - 32px); margin: 0 auto;"
                                                onmouseover="this.style.boxShadow='0 5px 15px rgba(142, 36, 170, 0.3)'; this.style.transform='translateY(-2px)'"
                                                onmouseout="this.style.boxShadow='0 3px 6px rgba(0,0,0,0.1)'; this.style.transform='translateY(0)'">
                                                <span style="margin-right: 8px;">🛒</span> Add To Cart
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width: 100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>
