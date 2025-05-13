<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WingtipToys.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Register</h2>
    <p>Create a new account.</p>
    <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
    <p class="text-danger">
        <asp:Literal runat="server" ID="Literal2" />
    </p>
</asp:PlaceHolder>

    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="true">
        <p class="text-danger">
            <asp:Literal runat="server" ID="Literal1" />
        </p>
    </asp:PlaceHolder>

    <asp:ValidationSummary runat="server" CssClass="text-danger" ValidationGroup="RegisterUserValidationGroup" />

    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="Email is required." ValidationGroup="RegisterUserValidationGroup" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Password is required." ValidationGroup="RegisterUserValidationGroup" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" CssClass="text-danger" ErrorMessage="Please confirm your password." ValidationGroup="RegisterUserValidationGroup" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" CssClass="text-danger" ErrorMessage="Passwords do not match." ValidationGroup="RegisterUserValidationGroup" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
<asp:Button runat="server" ID="RegisterButton" Text="Register" OnClick="RegisterButton_Click" CssClass="btn btn-primary" ValidationGroup="RegisterUserValidationGroup" />
            </div>
        </div>
    </div>
</asp:Content>
