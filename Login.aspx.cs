using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eDawaKhana
{
    public partial class Login : System.Web.UI.Page
    {

        #region Public Variables
        public enum MessageType { Success, Error, Info, Warning };
        public bool IsLoginSuccessful = false;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtLogin.Text.Trim()))
            {
                string message = "UserId is mandatory.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + message + "','" + MessageType.Error + "');", true);
                return;
            }
            if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
                string message = "Password is mandatory.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + message + "','" + MessageType.Error + "');", true);
                return;
            }

            if (!string.IsNullOrEmpty(txtLogin.Text.Trim()) && !string.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
                Response.Redirect("/Webforms/Dashboard", false);
                 Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}