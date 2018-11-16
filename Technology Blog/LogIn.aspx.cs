using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

namespace Technology_Blog
{
    public partial class LogIn : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["logout"] != "True")
            {
                if (Request.Cookies["username"] != null)
                {
                    this.Dispose();
                    Response.Redirect("Profile.aspx?redirect=True", false);
                }
            }
            
            if(Request.QueryString["signedup"]=="True")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sign up successful!')", true);
            }
            if(Request.QueryString["login"]=="False")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Login to continue.')", true);
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Puneet Saini\Documents\Users.mdf';Integrated Security=True;Connect Timeout=30");
            String query = "Select * from blogUsers where username='" + username.Text + "' and password='" + FormsAuthentication.HashPasswordForStoringInConfigFile(password.Text, "SHA1") + "'";
            SqlDataAdapter sda = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count==1)
            {
                this.Dispose();
                string cookieValue = username.Text;
                HttpCookie cookie = new HttpCookie("username", cookieValue);
                Response.Cookies.Add(cookie);
                Response.Redirect("Profile.aspx", false);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect Username or Password.')", true);
            }
        }

    }
}