<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Technology_Blog.SignUp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1 class="text-center" style="font-family: Arvo">Register with us</h1>
    
    <table class="nav-justified">
        <tr>
            <td style="height: 19px"></td>
            <td class="text-center" style="height: 19px">
                &nbsp;</td>
            <td style="height: 19px"></td>
        </tr>
        <tr>
            <td class="text-right" style="font-family: Arvo; font-size: medium; height: 42px;">Username: </td>
            <td style="height: 42px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="username" runat="server" AutoCompleteType="DisplayName" Width="185px" OnTextChanged="username_TextChanged"></asp:TextBox>
            </td>
            <td style="height: 42px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="username" ErrorMessage="Please enter a username" style="color: #990000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="font-size: medium; font-family: Arvo; height: 42px;">Password: </td>
            <td style="height: 42px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="pass" runat="server" TextMode="Password" Width="185px"></asp:TextBox>
            </td>
            <td style="height: 42px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pass" ErrorMessage="Please enter a password" style="color: #990000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="font-family: Arvo; font-size: medium; height: 42px;">Confirm Password: </td>
            <td style="height: 42px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="confirmpass" runat="server" TextMode="Password" Width="185px"></asp:TextBox>
            </td>
            <td style="height: 42px">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="confirmpass" ControlToValidate="pass" ErrorMessage="Passwords do not match" style="color: #990000"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="font-family: Arvo; font-size: medium; height: 42px;">E-mail: </td>
            <td style="height: 42px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="email" runat="server" AutoCompleteType="Email" Width="185px"></asp:TextBox>
            </td>
            <td style="height: 42px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email" ErrorMessage="Please enter valid email id" style="color: #990000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 42px"></td>
            <td style="height: 42px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Register" class="btn btn-default" BackColor="#222222" ForeColor="White" runat="server" Text="Register" OnClick="Register_Click" />
            </td>
            <td style="height: 42px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must contain minimum eight characters,<br> at least one letter and one number" ControlToValidate="pass" style="color: #990000" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    
    
    
</asp:Content>
