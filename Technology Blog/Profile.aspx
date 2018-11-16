<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Technology_Blog.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="parent" style="padding-top:20px">
        <div class="child1" style="float:left">
        <table class="nav-justified" style="height: 700px; margin-bottom: 92px">
            <tr>
                <td style="width: 270px; height: 225px" class="text-center">
                    <asp:Image ID="Image1" runat="server" Height="250px" ImageUrl="favicon.png" Width="250px" />
                </td>
            </tr>
            <tr>
                <td style="width: 315px; height:54px" class="text-center">
                    <strong>
                    <asp:Label ID="Label2" runat="server" style="font-size: medium" Text="Username:"></asp:Label>
                    &nbsp;</strong><asp:Label ID="usernameLabel" runat="server" style="font-size: medium; font-family:'Arciform Sans'"></asp:Label>
                    <br />
                    <strong>
                    <asp:Label ID="Label1" runat="server" style="font-size: medium;" Text="Number of posts: "></asp:Label>
                    &nbsp;</strong><asp:Label ID="articleCount" runat="server" style="font-size: medium; font-weight:bold"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 315px; height:80px">
                    <div class="text-center">
                        <hr style="width:80%" />
                        <asp:Button ID="post" class="btn btn-primary" runat="server" Text="Post Articles" OnClick="post_Click" />
                        <hr style="width:80%" />
                        <asp:DropDownList ID="headingDropDown" class="btn btn-primary dropdown-toggle" runat="server" DataSourceID="HeadingDB" DataTextField="Heading" DataValueField="Heading"></asp:DropDownList> 
                        <br /><br />
                        <asp:SqlDataSource ID="HeadingDB" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT [Heading] FROM [blogFeed] WHERE ([Username] = @Username)">
                            <SelectParameters>
                                <asp:CookieParameter CookieName="username" Name="Username" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        &nbsp; <asp:Button ID="editButton" runat="server" Text="Edit post" class="btn btn-info" OnClick="editButton_Click" />
                        <hr style="width:80%" />
                        <asp:DropDownList ID="commentsDropDown" class="btn btn-primary dropdown-toggle" runat="server" DataSourceID="SqlDataSource1" DataTextField="Comment" DataValueField="Comment"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT [Comment] FROM [blogComments] WHERE ([Username] = @Username)">
                            <SelectParameters>
                                <asp:CookieParameter CookieName="username" Name="Username" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br /><br />
                        <asp:Button ID="deleteCommentBtn" runat="server" OnClick="deleteCommentBtn_Click" class="btn btn-info" Text="Delete Comment" />
                        
                        <hr style="width:80%" />
                        <asp:Button ID="logout" runat="server" Text="Log Out"  class="btn btn-default" BackColor="#222222" ForeColor="White" OnClick="logoutButton_Click" />
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 315px; height:100px">
                    &nbsp;</td>
            </tr>
        </table>
        </div>
        <div class="child2" style="margin-left:50px; padding-top:35px">
        <asp:GridView ID="GridView1" style="margin-left:100px; margin-top:-30px" runat="server" Height="632px" Width="75%" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="0" DataSourceID="ProfileDB" ForeColor="Black" GridLines="Horizontal" DataKeyNames="Heading" PageSize="5" RowHeaderColumn="Heading">
                        <Columns>
                            <asp:BoundField DataField="Heading" HeaderText="Heading" ItemStyle-Width="200px" SortExpression="Heading" >
<ItemStyle Width="200px"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField>
                                <HeaderTemplate>Post</HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("Post").ToString().Length>500 ? (Eval("Post") as string).Substring(0,500) : Eval("Post")  %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="Date" HeaderText="Date" ItemStyle-Width="150px" SortExpression="Date" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:CommandField ControlStyle-ForeColor="Red" ShowDeleteButton="True" />
                            
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#222222" Font-Bold="True" ForeColor="White" Height="50px" Wrap="True" />
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Left" Height="50px" Wrap="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="ProfileDB" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT [Heading], [Post], [Date] FROM [blogFeed] WHERE ([Username] = @Username)" DeleteCommand="DELETE FROM blogFeed WHERE (Heading = @heading)">
                        <DeleteParameters>
                            <asp:ControlParameter Name="heading" Type="String" ControlID="GridView1" PropertyName="SelectedDataKey" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:CookieParameter CookieName="username" Name="Username" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
    </div>
        </div>
</asp:Content>
