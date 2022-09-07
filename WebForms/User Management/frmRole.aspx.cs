using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eDawaKhana.DataLayer;
using SSJY.eDawaKhana.Data;
using SSJY.eDawaKhana.DataObjects;

namespace eDawaKhana.WebForms.User_Management
{
    public partial class frmRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Validate User
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
            #endregion
        }
        protected void bindGrid() { }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UserRoles userRoles = new UserRoles();
            userRoles.RoleName = txtRoleName.Text.Trim();
            userRoles.CreateTs = DateTime.Now;
            userRoles.CreatedByUserId = 1;
            DataRepository.UserRolesProvider.Save(userRoles);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

        }
    }
}