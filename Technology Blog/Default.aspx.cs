using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Technology_Blog
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void getStartedbtnSec_Click(object sender, EventArgs e)
        {
            if(Request.Cookies["username"]!=null)
            {
                Response.Redirect("Feed.aspx", false);
            }
            else
            {
                Response.Redirect("SignUp.aspx", false);
            }
        }

        protected void getStartedbtn_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["username"] != null)
            {
                Response.Redirect("Feed.aspx", false);
            }
            else
            {
                Response.Redirect("SignUp.aspx", false);
            }
        }
    }
}