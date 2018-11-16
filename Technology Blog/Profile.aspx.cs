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
    public partial class Profile : System.Web.UI.Page
    {
        String mUsername;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["username"]!=null)
            {
                if (Request.QueryString["redirect"] == "True")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You are already logged in!')", true);
                }
                mUsername = Request.Cookies["username"].Value;
                usernameLabel.Text = mUsername;
                articleCount.Text = GridView1.Rows.Count.ToString();
            }
            else
            {
                this.Dispose();
                Response.Redirect("LogIn.aspx", false);
            }
        }

        protected void post_Click(object sender, EventArgs e)
        {
            this.Dispose();
            Response.Redirect("postArticle.aspx", false);

        }

        protected void editButton_Click(object sender, EventArgs e)
        {
            this.Dispose();
            Response.Redirect("EditPost.aspx?Heading=" + headingDropDown.SelectedValue, false);
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["username"] != null)
            {
                Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                Response.Redirect("LogIn.aspx?logout=True", false);
            }
        }

        protected void deleteCommentBtn_Click(object sender, EventArgs e)
        {
            String comment = commentsDropDown.SelectedValue;
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Puneet Saini\Documents\Users.mdf';Integrated Security=True;Connect Timeout=30");
            SqlCommand cmd = new SqlCommand("DELETE FROM blogComments WHERE Comment='"+ comment +"'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Page.Response.Redirect(Page.Request.Url.ToString(), false);

        }
    }
}