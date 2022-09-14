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
    public partial class frmRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                #region Validate User
                bindGrid();
                #endregion
            }
            //if (Session[App_SessionKeys.IsValidUser.ToString()] != null && Convert.ToBoolean(Session[(App_SessionKeys.IsValidUser).ToString()]))
            //{
            //    if (!Page.IsPostBack)
            //    {
            //        bool isValid = true;
            //        string menuURL = HttpContext.Current.Request.Url.AbsolutePath;
            //        List<AccessRight> accessRights = Session[App_SessionKeys.AccessRights.ToString()] as List<AccessRight>;
            //        isValid = SessionHelper.isPageAccessible(menuURL, accessRights);
            //        if (!isValid)
            //        {
            //            Response.Redirect("~/WebPages/Shared/AccessDenied.aspx");
            //        }

            //        if (isValid)
            //        {                       
            //            bindGrid();
            //        }
            //    }
            //}
            //else
            //{
            //    Response.Redirect("~/Login.aspx");
            //}
        }
        protected void bindGrid()
        {
            try
            {
                reset();
                TList<UserRoles> roleList = new TList<UserRoles>();
                roleList = DataRepository.UserRolesProvider.GetAll();
                rpList.DataSource = roleList;
                rpList.DataBind();
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
            int idx = item.ItemIndex;
            HiddenField hdnId = (HiddenField)rpList.Items[idx].FindControl("hdnRoleId");

            UserRoles role = new UserRoles();
            role = DataRepository.UserRolesProvider.GetByRoleId(Convert.ToInt32(hdnId.Value));
            ViewState.Add("ID", hdnId.Value.Trim());
            txtRoleName.Text = role.RoleName;
            chkIsActive.Checked = role.IsActive.GetValueOrDefault();

            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            reset();
        }

        private void reset()
        {
            btnUpdate.Visible = false;
            btnSubmit.Visible = true;
            txtRoleName.Text = string.Empty;
            chkIsActive.Checked = true;
            ViewState["ID"] = null;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {        

            try
            {
                if (ViewState["ID"] != null)
                {
                    int roleId = Convert.ToInt32(ViewState["ID"].ToString());
                    UserRoles role = new UserRoles();
                    int count = DataRepository.UserRolesProvider.GetAll().FindAll(x => x.RoleName == txtRoleName.Text.Trim() && x.RoleId!= roleId).Count;
                    if (count == 0)
                    {
                        role =DataRepository.UserRolesProvider.GetByRoleId(roleId);
                        role.RoleName = txtRoleName.Text.Trim();
                        role.IsActive = chkIsActive.Checked;
                        role.ModTs = DateTime.Now;
                        role.CreatedByUserId = 1;
                        DataRepository.UserRolesProvider.Save(role);

                        bindGrid();
                        lblModalTitle.Text = "Success";
                        lblModalBody.Text = "Record has been saved successfully.";
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                        //upModal.Update();
                        return;
                    }
                    else
                    {
                        lblModalTitle.Text = "Errors";
                        lblModalBody.Text = "Role Name is already exist.";
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                        // upModal.Update();
                        return;
                    }
                }
                else
                {
                    lblModalTitle.Text = "Errors";
                    lblModalBody.Text = "Something went wrong. Please try again";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                    // upModal.Update();
                    return;
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try 
            {

                lblModalTitle.Text = "Errors";
                lblModalBody.Text = "Role Name is already exist.";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "displayPopup();", true);
                //UserRoles role = new UserRoles();
                //int count = DataRepository.UserRolesProvider.GetAll().FindAll(x => x.RoleName == txtRoleName.Text.Trim()).Count;
                //if (count == 0)
                //{
                //    role.RoleName = txtRoleName.Text.Trim();
                //    role.IsActive = chkIsActive.Checked;
                //    role.CreateTs = DateTime.Now;
                //    role.ModTs = DateTime.Now;
                //    role.CreatedByUserId = 1;
                //    DataRepository.UserRolesProvider.Save(role);

                //    bindGrid();

                //    lblModalTitle.Text = "Success";
                //    lblModalBody.Text = "Record has been saved successfully.";
                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "displayPopup()", true);

                //    return;
                //}
                //else
                //{
                //    lblModalTitle.Text = "Errors";
                //    lblModalBody.Text = "Role Name is already exist.";
                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                //    // upModal.Update();
                //    return;
                //}
            } catch(Exception ex)
            {
                lblModalTitle.Text = "Errors";
                lblModalBody.Text = ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                // upModal.Update();
                return;
            }

        }
    }
}