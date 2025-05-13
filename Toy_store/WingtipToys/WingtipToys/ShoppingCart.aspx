<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WingtipToys.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div id="ShoppingCartTitle" runat="server" class="ContentHead">
          </div>
    <div style="background: linear-gradient(to right, #f3e5f5, #e1bee7); padding: 15px; border-radius: 8px; margin-bottom: 20px; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
        <h1 style="color: #6a1b9a; margin: 0; text-align: center;">Shopping Cart</h1>
    </div>

    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True"
        GridLines="None" CellPadding="10" ItemType="WingtipToys.Models.CartItem"
        SelectMethod="GetShoppingCartItems"
        Style="width: 100%; border-collapse: separate; border-spacing: 0; margin-bottom: 25px;"
        HeaderStyle-BackColor="#6a1b9a" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#6a1b9a" HeaderStyle-Font-Bold="true"
        RowStyle-BackColor="#fce4ec" AlternatingRowStyle-BackColor="white"
        FooterStyle-BackColor="#e1bee7" FooterStyle-Font-Bold="true"
        BorderColor="#e1bee7" BorderWidth="1px" BorderStyle="Solid">
        
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" 
                ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                
            <asp:BoundField DataField="Product.ProductName" HeaderText="Name" 
                ItemStyle-Width="30%" ItemStyle-Font-Bold="true" ItemStyle-ForeColor="#4a148c" />
                
            <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" 
                DataFormatString="{0:c}" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Right" />
                
            <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" runat="server" Text="<%#: Item.Quantity %>"
                        Style="width: 50px; text-align: center; border: 1px solid #ce93d8; border-radius: 4px; padding: 5px;"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Item Total" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Right" ItemStyle-Font-Bold="true">
                <ItemTemplate>
                    <span style="color: #6a1b9a;">
                        <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) * Convert.ToDouble(Item.Product.UnitPrice))) %>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Remove" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:CheckBox ID="Remove" runat="server"
                        Style="transform: scale(1.3); accent-color: #6a1b9a; cursor: pointer;" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div style="background-color: white; padding: 15px; border-radius: 8px; text-align: right; border: 1px solid #e1bee7; margin-bottom: 20px;">
        <strong style="font-size: 18px; color: #6a1b9a;">
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false" 
                Style="color: #4a148c; font-size: 20px;"></asp:Label>
        </strong>
    </div>

    <div style="display: flex; justify-content: space-between; align-items: center;">
        <asp:Button ID="UpdateBtn" runat="server" Text="Update Cart" OnClick="UpdateBtn_Click"
            Style="background: linear-gradient(to right, #f8bbd0, #f48fb1); 
                   color: #6a1b9a; border: none; padding: 10px 25px; 
                   border-radius: 25px; font-weight: bold; cursor: pointer;
                   box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                   transition: all 0.3s ease;"
            onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 4px 8px rgba(0,0,0,0.15)'"
            onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 5px rgba(0,0,0,0.1)'" />
        
        <!-- يمكن إضافة زر الدفع هنا لاحقًا -->
    </div>
</asp:Content>