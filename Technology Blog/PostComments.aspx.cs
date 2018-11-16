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
    public partial class PostComments : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Puneet Saini\Documents\Users.mdf';Integrated Security=True;Connect Timeout=30");
        String mId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["id"] != null)
            {
                mId = Request.QueryString["id"];
                SqlDataAdapter display = new SqlDataAdapter("SELECT Heading, Username, Post FROM blogFeed WHERE Id=" + mId, con);
                DataTable dt = new DataTable();
                display.Fill(dt);
                foreach (DataRow row in dt.Rows)
                {
                    headingLabel.Text = row["Heading"].ToString();
                    usernameLabel.Text = row["Username"].ToString();
                    postLabel.Text = row["Post"].ToString();
                }
            }
            else
            {
                Response.Redirect("Feed.aspx", false);
            }
        }

        protected void commentButton_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["username"] == null)
            {
                Response.Redirect("Login.aspx?login=False", false);
            }
            else
            {
                String mUsername = Request.Cookies["username"].Value;
                String comment = commentBox.Text;
                SqlCommand cmd = new SqlCommand("INSERT INTO blogComments(postId, Username, Comment) VALUES(" + mId + ", '" + mUsername + "', '"+ comment +"')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }
}