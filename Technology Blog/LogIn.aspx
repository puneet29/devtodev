<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Technology_Blog.LogIn" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1 class="text-center" style="font-family: Arvo">Log in</h1>
    <table class="auto-style1" align="center">
                <tr>
                    <td class="auto-style2" style="height: 42px">Username:</td>
                    <td style="width: 457px; height: 42px">
                        <asp:TextBox ID="username" runat="server" Width="445px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="height: 42px">Password:</td>
                    <td style="width: 457px; height: 42px">
                        <asp:TextBox ID="password" TextMode="Password" runat="server" Width="449px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 457px; height: 42px"></td>
                    <td class="text-center" style="height: 42px">
                        <asp:Button ID="Button1" class="btn btn-default" BackColor="#222222" ForeColor="White" runat="server" OnClick="Button1_Click" Text="Login" /></td>
                </tr>
            </table>
            

    </asp:Content>
