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
    public partial class EditPost : System.Web.UI.Page
    {
        String mUsername, mHeading;
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Puneet Saini\Documents\Users.mdf';Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            mUsername = Request.Cookies["username"].Value;
            mHeading = Request.QueryString["Heading"];
            if(!IsPostBack)
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT Heading, Post from blogFeed WHERE Heading = @heading", conn);
                cmd.Parameters.AddWithValue("@heading", mHeading);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        heading.Text = reader["Heading"].ToString();
                        content.Text = reader["Post"].ToString();
                    }
                }
                conn.Close();

            }
        }

        protected void editButton_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("UPDATE blogFeed SET Post = @param1, Date = @param2 WHERE Heading=@heading and Username=@username", conn);
            cmd.Parameters.AddWithValue("@heading", mHeading);
            cmd.Parameters.AddWithValue("@param1", content.Text);
            cmd.Parameters.AddWithValue("@username", mUsername);
            cmd.Parameters.AddWithValue("@param2", DateTime.Now);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            this.Dispose();
            Response.Redirect("Profile.aspx");
        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            this.Dispose();
            Response.Redirect("Profile.aspx", false);
        }
    }
}