using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eDawaKhana.Common;
using SSJY.eDawaKhana.Data;
using SSJY.eDawaKhana.DataObjects;

namespace eDawaKhana.WebForms.User_Management
{
    public partial class frmNewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Validate User
            //if (Session[App_SessionKeys.IsValidUser.ToString()] != null && Convert.ToBoolean(Session[(App_SessionKeys.IsValidUser).ToString()]))
            //{
            if (!Page.IsPostBack)
            {
                //        bool isValid = true;
                //        string menuURL = HttpContext.Current.Request.Url.AbsolutePath;
                //        //List<AccessRight> accessRights = Session[App_SessionKeys.AccessRights.ToString()] as List<AccessRight>;
                //        //isValid = SessionHelper.isPageAccessible(menuURL, accessRights);
                //        if (!isValid)
                //        {
                //            Response.Redirect("~/WebPages/Shared/AccessDenied.aspx");
                //        }

                //        if (isValid)
                //        {
                TList<UserRoles> roles = new TList<UserRoles>();
                roles = DataRepository.UserRolesProvider.GetAll();
                ddlSecurtyProfile.DataSource = roles;
                ddlSecurtyProfile.DataTextField = "RoleName";
                ddlSecurtyProfile.DataValueField = "RoleId";
                ddlSecurtyProfile.DataBind();
                //        }

            }
            //}
            //else
            //{
            //    Response.Redirect("~/Login.aspx");
            //}
            #endregion
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                byte[] salt, saltedHash;
            string password = txtPassword.Text.Trim();
            Security security = new Security();
            security.CreatePasswordHash(password, out salt, out saltedHash);
            Users user = new Users();
            user.Salt = salt;
            user.SaltedHash = saltedHash;
            user.IsActive = true;
            user.UserName= txtUserName.Text.Trim();
            user.RoleId = Convert.ToInt32(ddlSecurtyProfile.SelectedValue);
            user.FullName = txtFullName.Text;
            user.Emailid = txtEmail.Text.Trim();
            user.MobileNo = Convert.ToInt64(txtMobile.Text.Trim());
            user.ModTs = DateTime.Now;
            user.CreateTs = DateTime.Now;
            user.CreatedByUserId = Convert.ToInt32(Session[App_SessionKeys.UserId.ToString()]);
            DataRepository.UsersProvider.Save(user);
                lblModalTitle.Text = "Success";
                lblModalBody.Text = "Record has been updated successfully.";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
            }
            catch (Exception ex)
            {
                lblModalTitle.Text = "Errors";
                lblModalBody.Text = ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                // upModal.Update();
                return;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                Users user = new Users();
                user = DataRepository.UsersProvider.GetByUserId(Convert.ToInt32(hdnUserId.Value));
                if (user != null)
                {
                    user.FullName = txtFullName.Text;
                    user.Emailid = txtEmail.Text.Trim();
                    user.MobileNo = Convert.ToInt64(txtMobile.Text.Trim());
                    user.ModTs = DateTime.Now;
                    DataRepository.UsersProvider.Save(user);
                    lblModalTitle.Text = "Success";
                    lblModalBody.Text = "Record has been updated successfully.";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                }
            }
            catch (Exception ex)
            {
                lblModalTitle.Text = "Errors";
                lblModalBody.Text = ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                // upModal.Update();
                return;
            }
        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            try { 
            byte[] salt, saltedHash;
            string password = txtPassword.Text.Trim();
            Users user = new Users();
            user = DataRepository.UsersProvider.GetByUserId(Convert.ToInt32(hdnUserId.Value));
            if (user != null)
            {
                Security security = new Security();
                security.CreatePasswordHash(password, out salt, out saltedHash);
                user.Salt = salt;
                user.SaltedHash = saltedHash;
                user.ModTs = DateTime.Now;
                DataRepository.UsersProvider.Save(user);
                lblModalTitle.Text = "Success";
                lblModalBody.Text = "Record has been saved successfully.";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                }
            }
            catch (Exception ex)
            {
                lblModalTitle.Text = "Errors";
                lblModalBody.Text = ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                // upModal.Update();
                return;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            ddlSecurtyProfile.SelectedIndex = 0;
            txtFullName.Text = "";
            txtPassword.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtConfirmPassword.Text = "";
            hdnUserId.Value = "";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Users user = new Users();
            user = DataRepository.UsersProvider.GetByUserName(txtSearchUserName.Text.Trim());
            if (user != null)
            {
                hdnUserId.Value = user.UserId.ToString();
                txtUserName.Text = user.UserName;
                txtFullName.Text = user.FullName;
                ddlSecurtyProfile.SelectedValue = user.RoleId.ToString();
                txtEmail.Text = user.Emailid;
                txtMobile.Text = user.MobileNo.ToString();
            }
            else
            {
                lblModalTitle.Text = "Error";
                lblModalBody.Text = "No user found";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
            }
        }

        protected void lnkBtnUserId_Click(object sender, EventArgs e)
        {
            Users user = new Users();
            user = DataRepository.UsersProvider.GetByUserName(txtSearchUserName.Text.Trim());
            if (user != null)
            {
                hdnUserId.Value = user.UserId.ToString();
                txtUserName.Text = user.UserName;
                txtFullName.Text = user.FullName;
                ddlSecurtyProfile.SelectedValue = user.RoleId.ToString();
                txtEmail.Text = user.Emailid;
                txtMobile.Text = user.MobileNo.ToString();
            }
        }
    }

}