<%@ Page Title="Feed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="Technology_Blog.Feed" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
<div style="background:#1D1D1B; height:250px" class="text-center" >
    <asp:Image ID="logo" runat="server" class="btn btn-default" style="background-color:#1D1D1B; margin-top:30px; border-color:white" ImageUrl="favicon.png" Height="175px" Width="175px" />
</div>
<div style="margin-right:35px ;margin-top:50px">

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" OnItemDataBound="ListView1_ItemDataBound">
        <AlternatingItemTemplate>
            <li class="jumbotron" style="background-color: #1D1D1B;color: #DDDDDD; margin:20px">
                <asp:Label ID="HeadingLabel" runat="server" style="font-family:Montserrat; font-size:xx-large" Text='<%# Eval("Heading") %>' />
                <br />~
                <asp:Label ID="UsernameLabel" runat="server" style="font-family:'Arciform Sans'; font-size:larger"  Text='<%# Eval("Username")%>' />
                <br />
                <asp:Label ID="PostLabel" runat="server" style="font-family:Garamond; font-size:large; white-space:pre-line" Text='<%# Eval("Post") %>' />
                <br /><br />
                <asp:Label ID="likeLabel" runat="server" Text="" style="vertical-align:bottom"></asp:Label>&nbsp;<asp:ImageButton ID="likeButton" CommandArgument='<%# Eval("Id")%>' OnClick="likeButton_Click" ImageAlign="Middle" Height="30px" Width="30px" runat="server" />
                <asp:Label ID="pipe" runat="server" Text=" | " style="vertical-align:bottom"></asp:Label><asp:LinkButton ID="commentLink" style="vertical-align:bottom" CommandArgument='<%# Eval("Id")%>' OnClick="commentLink_Click" runat="server">Comments</asp:LinkButton>
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">Username:
                <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' />
                <br />
                Heading:
                <asp:TextBox ID="HeadingTextBox" runat="server" Text='<%# Bind("Heading") %>' />
                <br />
                Post:
                <asp:TextBox ID="PostTextBox" runat="server" Text='<%# Bind("Post") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">Username:
                <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' />
                <br />Heading:
                <asp:TextBox ID="HeadingTextBox" runat="server" Text='<%# Bind("Heading") %>' />
                <br />Post:
                <asp:TextBox ID="PostTextBox" runat="server" Text='<%# Bind("Post") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li class="jumbotron" style="background-color: #1D1D1B;color: #DDDDDD; margin:20px">
                <asp:Label ID="HeadingLabel" runat="server" style="font-family:Montserrat; font-size:xx-large" Text='<%# Eval("Heading") %>' />
                <br />~
                <asp:Label ID="UsernameLabel" runat="server" style="font-family:'Arciform Sans'; font-size:larger"  Text='<%# Eval("Username")%>' />
                <br />
                <asp:Label ID="PostLabel" runat="server" style="font-family:Garamond; font-size:large; white-space:pre-line" Text='<%# Eval("Post") %>' />
                <br /><br />
                <asp:Label ID="likeLabel" runat="server" Text="" style="vertical-align:bottom"></asp:Label>&nbsp;<asp:ImageButton ID="likeButton" ImageAlign="Middle" CommandArgument='<%# Eval("Id")%>' OnClick="likeButton_Click" Height="30px" Width="30px" runat="server" />
                <asp:Label ID="pipe" runat="server" Text=" | " style="vertical-align:bottom"></asp:Label><asp:LinkButton ID="commentLink" style="vertical-align:bottom" CommandArgument='<%# Eval("Id")%>' OnClick="commentLink_Click" runat="server">Comments</asp:LinkButton>
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family:Verdana, Arial, Helvetica, sans-serif">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">Username:
                <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                <br />
                Heading:
                <asp:Label ID="HeadingLabel" runat="server" Text='<%# Eval("Heading") %>' />
                <br />
                Post:
                <asp:Label ID="PostLabel" runat="server" Text='<%# Eval("Post") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT [Heading], [Username], [Post], [Id] FROM [blogFeed]"></asp:SqlDataSource>

</div>

</asp:Content>
