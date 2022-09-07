<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebForms/Admin.Master" CodeBehind="frmCreateUser.aspx.cs" Inherits="eDawaKhana.WebForms.User_Management.frmCreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header" style="background: #b71c1c; color: #fff; padding-bottom: 15px; padding-top: 15px;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color: #fff; opacity: 1;">&times;</button>
                            <h5 class="modal-title">
                                <asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label></h5>

                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer" style="border-top: 1px #eee solid; padding: 5px;">

                            <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close (बंद करे)</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <h3 class="page-header">User Management (उपयोगकर्ता प्रबंधन)</h3>
    <div class="row">

        <asp:Panel runat="server" ID="pnlAdvanceSearch" CssClass="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Search by UserId (उपयोगकर्ता आईडी द्वारा खोजें)</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="lblUserId" class="control-label">User Id: (उपयोगकर्ता आईडी)</label>
                            <asp:TextBox ID="txtSearchUserName" CssClass="form-control" placeholder="UserId" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:Button ID="btnSearch" CssClass="btn btn-raised btn-danger" runat="server" Text="Search (खोज)" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </div>
        </asp:Panel>


        <asp:Panel runat="server" ID="pnlSearchCriteria" CssClass="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Create new USER </h3>
            </div>
            <div class="panel-body">
                <div class="row">                    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="lblSecurtyProfile" class="control-label">Role : </label>
                            <asp:DropDownList ID="ddlSecurtyProfile" CssClass="form-control" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator CssClass="req" ID="rfv_ddlSecurtyProfile" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="ddlSecurtyProfile" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />
                        </div>
                    </div>                
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="lblUserId" class="control-label">User Name: </label>
                            <asp:HiddenField ID="hdnUserId" runat="server" />
                            <asp:TextBox ID="txtUserName" CssClass="form-control " placeholder="User Id" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="req" ID="rfv_txtUserID" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="txtUserName" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="lblUserName" class="control-label">Full Name: </label>
                            <asp:TextBox ID="txtFullName" CssClass="form-control " placeholder="User Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="req" ID="rfv_txtUserName" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="txtFullName" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="lblMobile" class="control-label">Mobile No.: </label>
                            <asp:TextBox ID="txtMobile" CssClass="form-control " placeholder="Mobile No." runat="server" onkeypress="return isNumber(event);" ondrop="return false;" onpaste="return false;" MaxLength="10"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="lblEmail" class="control-label">Email Id: </label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control " placeholder="Email Id" runat="server" MaxLength="100"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="rev_txtEmail" CssClass="req" ControlToValidate="txtEmail" runat="server" ErrorMessage="You have entered wrong EmailId (आपने गलत ईमेल दर्ज किया है)" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
                <asp:Panel runat="server" ID="pnlPassword" CssClass="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="lblPassword" class="control-label">Password:</label>
                            <asp:TextBox ID="txtPassword" CssClass="form-control " TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="req" ID="rfv_txtPassword" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="lblConfirmPassword" class="control-label">Confirm Password:</label>
                            <asp:TextBox ID="txtConfirmPassword" CssClass="form-control " TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="req" ID="rfv_txtConfirmPassword" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="txtConfirmPassword" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />
                            <asp:CompareValidator ID="cmpConfirmPassword" runat="server" ForeColor="Red" ErrorMessage="Your password not matched Please fill again" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Operator="Equal"></asp:CompareValidator>
                        </div>
                    </div>
                </asp:Panel>

                <div class="row" style="margin-bottom: 15px;">                   
                    <div class="col-md-6">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-raised btn-primary" ValidationGroup="vg_btnSubmit" runat="server" Text="SUBMIT (जमा करें)" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnUpdate" Visible="false" CssClass="btn btn-raised btn-primary" ValidationGroup="vg_btnSubmit" runat="server" Text="UPDATE (अद्यतन करें)" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnChangePassword" Visible="false" CssClass="btn btn-raised btn-primary" OnClick="btnChangePassword_Click" runat="server" Text="Change Password (पासवर्ड बदलें)" UseSubmitBehavior="False" />
                        <asp:HiddenField runat="server" ID="togglebtnChnagePassword" Value="1" />
                        <asp:Button ID="btnReset" CssClass="btn btn-raised btn-danger" ValidationGroup="Group1" runat="server" Text="Reset (रीसेट करें)" OnClick="btnReset_Click" />

                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlSearch" CssClass="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Search Results </h3>
            </div>
            <div class="panel-body">
                <asp:GridView ID="grdView_User" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" Visible="true" >
                    <Columns>
                        <asp:TemplateField HeaderText="UserId">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdnUserId" Value='<%# Bind("UserId") %>' runat="server" />
                                <asp:LinkButton ID="lnkBtnUserId" runat="server" Text='<%# Bind("UserName") %>' OnClick="lnkBtnUserId_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Role" HeaderText="Role" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="IsActive" HeaderText="Is Active" />
                        <asp:BoundField DataField="ModTs" HeaderText="Date Added" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>
   </div>
</asp:Content>
