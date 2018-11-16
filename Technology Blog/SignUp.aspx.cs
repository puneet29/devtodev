using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Data.SqlClient;

namespace Technology_Blog
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["username"]!=null)
            {
                Response.Redirect("LogIn.aspx?signedup=True", false);
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            String mUsername = username.Text.ToString();
            String passHashed = FormsAuthentication.HashPasswordForStoringInConfigFile(pass.Text, "SHA1");
            String mEmail = email.Text.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Puneet Saini\Documents\Users.mdf';Integrated Security=True;Connect Timeout=30");
            SqlCommand com = new SqlCommand("INSERT INTO blogUsers VALUES(@param1, @param2, @param3)", con);
            com.Parameters.AddWithValue("@param1", mUsername);
            com.Parameters.AddWithValue("@param2", passHashed);
            com.Parameters.AddWithValue("@param3", mEmail);
            con.Open();
            SqlCommand check = new SqlCommand("Select count(*) from blogUsers where username=@param1 or email=@param2", con);
            check.Parameters.AddWithValue("@param1", mUsername);
            check.Parameters.AddWithValue("@param2", mEmail);
            if ((int)check.ExecuteScalar() > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User already exists. Choose another username')", true);
            }
            else
            {
                com.ExecuteNonQuery();
            }
            
            con.Close();
        }

        protected void username_TextChanged(object sender, EventArgs e)
        {

        }
    }
}