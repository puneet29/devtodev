<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPost.aspx.cs" Inherits="Technology_Blog.EditPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 576px;
        }
        .auto-style2 {
            width: 1213px;
        }
        .auto-style4 {
            width: 1213px;
            height: 116px;
        }
        .auto-style5 {
            height: 116px;
        }
        .auto-style6 {
            margin-top: 0px;
        }
        .auto-style7 {
            width: 1213px;
            height: 100px;
            text-align: center;
        }
        .auto-style8 {
            height: 100px;
        }
        .auto-style9 {
            width: 1213px;
            height: 246px;
        }
        .auto-style10 {
            height: 246px;
        }
        .auto-style11 {
            color: #990000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style7" style="font-family: Arvo; font-size: 42px;">
                        Edit your post here</td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:TextBox ID="heading" runat="server" Placeholder="Write the Heading here" ToolTip="Write your heading here" Width="1200px" Height="46px"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="heading" CssClass="auto-style11" ErrorMessage="Enter heading"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:TextBox ID="content" runat="server" Placeholder="Enter your post here" CssClass="auto-style6" Height="199px" Width="1200px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="auto-style10">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="content" CssClass="auto-style11" ErrorMessage="Enter the content"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="editButton" class="btn btn-info" runat="server" Text="Edit" OnClick="editButton_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="backButton" class="btn btn-warning" runat="server" Text="Back to Profile" CausesValidation="False" OnClick="backButton_Click" />

                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
