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
    public partial class postArticle : System.Web.UI.Page
    {
        String mUsername;
        protected void Page_Load(object sender, EventArgs e)
        {
            mUsername = Request.Cookies["username"].Value;
        }

        protected void postButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Puneet Saini\Documents\Users.mdf';Integrated Security=True;Connect Timeout=30");
            SqlCommand cmd = new SqlCommand("INSERT INTO blogFeed(Post, Heading, Username, Date) VALUES (@param1, @param2, @param3, @param4)", conn);
            cmd.Parameters.AddWithValue("@param1", content.Text);
            cmd.Parameters.AddWithValue("@param2", heading.Text);
            cmd.Parameters.AddWithValue("@param3", mUsername);
            cmd.Parameters.AddWithValue("@param4", DateTime.Now);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            this.Dispose();
            Response.Redirect("Profile.aspx", false);
        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            this.Dispose();
            Response.Redirect("Profile.aspx", false);
        }
    }
}