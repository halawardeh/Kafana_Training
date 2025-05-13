<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ProductDetails.aspx.cs" Inherits="WingtipToys.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-width: 1000px; margin: 0 auto; padding: 20px; background: linear-gradient(to right, #f9f0ff, #f3e5f5); border-radius: 15px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
        <asp:FormView ID="productDetail" runat="server" ItemType="WingtipToys.Models.Product" SelectMethod="GetProduct" RenderOuterTable="false">
            <ItemTemplate>
                <div style="display: flex; flex-wrap: wrap; gap: 30px;">
                    <!-- صورة المنتج -->
                    <div style="flex: 1; min-width: 300px;">
                        <asp:Image ID="ProductImage" runat="server"
                            ImageUrl='<%# "~/Images/Thumbs/"+Eval("ImagePath") %>'
                            Style="width: 100%; max-width: 400px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2); border: 3px solid #e1bee7;" />
                    </div>

                    <!-- تفاصيل المنتج -->
                    <div style="flex: 1; min-width: 300px;">
                        <h1 style="color: #6a1b9a; font-size: 28px; margin-bottom: 20px; border-bottom: 2px solid #ce93d8; padding-bottom: 10px;">
                            <%#: Item.ProductName %>
                        </h1>

                        <div style="background-color: #f8bbd0; padding: 20px; border-radius: 10px; margin-bottom: 20px;">
                            <h3 style="color: #6a1b9a; margin-top: 0;">Description:</h3>
                            <p style="color: #4a148c; font-size: 16px; line-height: 1.6;"><%#: Item.Description %></p>
                        </div>

                        <div style="display: flex; gap: 20px; flex-wrap: wrap;">
                            <div style="background-color: #e1bee7; padding: 15px; border-radius: 8px; flex: 1; min-width: 150px;">
                                <h4 style="color: #6a1b9a; margin-top: 0;">Price:</h4>
                                <span style="font-size: 18px; font-weight: bold; color: #4a148c;">
                                    <%#: String.Format("{0:c}", Item.UnitPrice) %>
                                </span>
                            </div>

                            <div style="background-color: #e1bee7; padding: 15px; border-radius: 8px; flex: 1; min-width: 150px;">
                                <h4 style="color: #6a1b9a; margin-top: 0;">Product ID:</h4>
                                <span style="font-size: 18px; font-weight: bold; color: #4a148c;">
                                    <%#: Item.ProductID %>
                                </span>
                            </div>
                            <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>"
                                style="display: inline-flex; align-items: center; justify-content: center; background: linear-gradient(145deg, #8e24aa, #6a1b9a); color: white; padding: 10px 24px; border-radius: 25px; text-decoration: none; font-weight: 600; font-size: 14px; transition: all 0.3s ease; box-shadow: 0 3px 6px rgba(0,0,0,0.1); width: calc(100% - 32px); margin: 0 auto;"
                                onmouseover="this.style.boxShadow='0 5px 15px rgba(142, 36, 170, 0.3)'; this.style.transform='translateY(-2px)'"
                                onmouseout="this.style.boxShadow='0 3px 6px rgba(0,0,0,0.1)'; this.style.transform='translateY(0)'">
                                <span style="margin-right: 8px;">🛒</span> Add To Cart
                            </a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
