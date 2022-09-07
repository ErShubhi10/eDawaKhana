using eDawaKhana.Common;
using SSJY.eDawaKhana.Data;
using SSJY.eDawaKhana.DataObjects;
using System;
using System.Collections.Generic;
using System.Configuration;
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
                Users user = new Users();
                string username = txtLogin.Text.Trim();
                string password = txtPassword.Text.Trim();
                int isValid = 0;
                user = DataRepository.UsersProvider.GetByUserName(username);
                if (user != null)
                {
                    isValid = CheckIsUserValid(password,user.Salt, user.SaltedHash );
                }
                if (isValid==1)
                {
                    Session[(App_SessionKeys.IsValidUser).ToString()] = "True";
                    Session[(App_SessionKeys.UserId).ToString()] = user.UserId;
                    Session[(App_SessionKeys.UserName).ToString()] = user.UserName;
                    Session[(App_SessionKeys.FullName).ToString()] = user.FullName;
                    Session[(App_SessionKeys.UserSession).ToString()] = Guid.NewGuid();


                    PermissionContext permission = new PermissionContext(user);
                    Session[(App_SessionKeys.SecurityProfileId).ToString()] = permission.FormPermissions.Role.RoleId;
                    Session[(App_SessionKeys.AccessRights).ToString()] = permission.FormPermissions.UIAccessRights;
                    Session[(App_SessionKeys.DynamicMenuCSS).ToString()] = permission.FormPermissions.DynamicMenuCSS;
                    Response.Redirect("Dashboard", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else if (isValid == -1)
                {
                    string msg = "Invalid User Name or Password";
                }

            }
        }

        private int CheckIsUserValid(string password, byte[] salt, byte[] saltedHash)
        {
            using (var hmac = new System.Security.Cryptography.HMACSHA512(salt))
            {
                var computedSaltedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                for (int i = 0; i < computedSaltedHash.Length; i++)
                {
                    if (saltedHash[i] != computedSaltedHash[i])
                    {
                        return -1;
                    }
                }
            }          
            return 1;
        }

        private void InitializeSession()
        {
            Session.Add((App_SessionKeys.IsValidUser).ToString(), null);
            Session.Add((App_SessionKeys.UniversityId).ToString(), 1);//university.UniversityId);
            Session.Add((App_SessionKeys.UserId.ToString()), null);
            Session.Add((App_SessionKeys.SecurityProfileId.ToString()), null);
            Session.Add((App_SessionKeys.SessionId.ToString()), null);
            Session.Add((App_SessionKeys.AccessRights.ToString()), null);
        }
    }
}