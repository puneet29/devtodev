using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Technology_Blog
{
    public partial class Feed : System.Web.UI.Page
    {
        String username, mId;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Puneet Saini\Documents\Users.mdf';Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["username"] != null)
            {
                username = Request.Cookies["username"].Value;
            }
            
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ImageButton button = (ImageButton)e.Item.FindControl("likeButton");
            Label likeLabel = (Label)e.Item.FindControl("likeLabel");
            mId = button.CommandArgument;
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT count(*) FROM blogLikes WHERE postId=" + mId + " and Username='" + username + "'", con);
            SqlCommand likecmd = new SqlCommand("SELECT count(*) FROM blogLikes WHERE postId=" + mId, con);
            if ((int)cmd.ExecuteScalar() == 1)
            {
                button.ImageUrl = "liked.png";
            }
            else
            { 
                button.ImageUrl = "like.png";
            }
            likeLabel.Text = likecmd.ExecuteScalar().ToString();
            con.Close();
        }

        protected void commentLink_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            mId = button.CommandArgument;
            Response.Redirect("PostComments.aspx?id="+mId, false);
        }

        protected void likeButton_Click(object sender, EventArgs e)
        {
            if(Request.Cookies["username"]==null)
            {
                Response.Redirect("Login.aspx?login=False", false);
            }
            else
            {
                ImageButton button = (ImageButton)sender;
                mId = button.CommandArgument;

                con.Open();
                SqlCommand check = new SqlCommand("SELECT count(*) FROM blogLikes WHERE postId="+mId+" and Username='"+username+"'", con);
                SqlCommand cmd;
                if ((int)check.ExecuteScalar() > 0)
                {
                    cmd = new SqlCommand("DELETE FROM blogLikes WHERE postId=" + mId + " and Username='" + username + "'", con);
                    button.ImageUrl = "like.png";
                }
                else
                {
                    cmd = new SqlCommand("INSERT INTO blogLikes VALUES("+mId+", '"+username+"')", con);
                    button.ImageUrl = "liked.png";
                }
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Feed.aspx", false);
            }
            
        }
        
    }
}