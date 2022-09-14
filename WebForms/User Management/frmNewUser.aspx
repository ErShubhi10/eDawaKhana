<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/Admin.Master" AutoEventWireup="true" CodeBehind="frmNewUser.aspx.cs" Inherits="eDawaKhana.WebForms.User_Management.frmNewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pagetitle">
      <h1>USER (Add/Edit)</h1>      
    </div>

    <div class="modal fade" id="myModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <asp:Label runat="server" ID="lblModalTitle" CssClass="modal-title">Message</asp:Label></h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label runat="server" ID="lblModalBody">Message Body</asp:Label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-xs" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="row">

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Search by UserId (उपयोगकर्ता आईडी द्वारा खोजें)</h5>
                    <div class="col-lg-8">
                        <div class="row mb-3">
                            <label class="col-sm-3 col-form-label">User Id: (उपयोगकर्ता आईडी)</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtSearchUserName" runat="server" class="col-sm-8 form-control"></asp:TextBox>
                            </div> <div class="col-sm-3">  <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Search (खोज)" OnClick="btnSearch_Click" /></div>
                        </div>
                        <div class="text-left">
                          

                        </div>
                    </div>

                    <!-- End Horizontal Form -->

                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Create new USER</h5>
                    <div class="col-lg-12">

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="col-sm-3 col-form-label">Role :</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlSecurtyProfile" CssClass="col-sm-8 form-control" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator CssClass="req" ID="rfv_ddlSecurtyProfile" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="ddlSecurtyProfile" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />
                                </div>
                            </div>
                            </div>
                       
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="col-sm-3 col-form-label">User Name :</label>
                                <div class="col-sm-9">
                                    <asp:HiddenField ID="hdnUserId" runat="server" />
                                    <asp:TextBox ID="txtUserName" CssClass="col-sm-8 form-control" placeholder="User Id" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="req" ID="rfv_txtUserID" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="txtUserName" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />

                                </div> </div>
                            <div class="col-md-6">
                                <label class="col-sm-3 col-form-label">Full Name :</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtFullName" CssClass="col-sm-8 form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="req" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="txtFullName" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="col-sm-3 col-form-label">Mobile :</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtMobile" CssClass="col-sm-8 form-control" placeholder="Mobile" runat="server" onkeypress="return isNumber(event);" ondrop="return false;" onpaste="return false;" MaxLength="10"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="col-sm-3 col-form-label">Full Name :</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtEmail" CssClass="col-sm-8 form-control" placeholder="Email" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="rev_txtEmail" CssClass="req" ControlToValidate="txtEmail" runat="server" ErrorMessage="You have entered wrong EmailId (आपने गलत ईमेल दर्ज किया है)" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <asp:Panel runat="server" ID="pnlPassword">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="col-sm-3 col-form-label">Password :</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtPassword" CssClass="col-sm-8 form-control" placeholder="Password" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="req" ID="rfv_txtPassword" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="col-sm-3 col-form-label">Confirm Password :</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtConfirmPassword" CssClass="col-sm-8 form-control" placeholder="Confirm Password" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="req" ID="rfv_txtConfirmPassword" runat="server" ErrorMessage="Mandatory information (अनिवार्य जानकारी)" ControlToValidate="txtConfirmPassword" ForeColor="Red" ValidationGroup="vg_btnSubmit" SetFocusOnError="True" Display="Dynamic" />
                                        <asp:CompareValidator ID="cmpConfirmPassword" runat="server" ForeColor="Red" ErrorMessage="Your password not matched Please fill again" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Operator="Equal"></asp:CompareValidator>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <div class="text-left">

                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" ValidationGroup="vg_btnSubmit" runat="server" Text="SUBMIT (जमा करें)" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnUpdate" Visible="false" CssClass="btn btn-primary" ValidationGroup="vg_btnSubmit" runat="server" Text="UPDATE (अद्यतन करें)" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnChangePassword" Visible="false" CssClass="btn btn-primary" OnClick="btnChangePassword_Click" runat="server" Text="Change Password (पासवर्ड बदलें)" UseSubmitBehavior="False" />
                            <asp:HiddenField runat="server" ID="togglebtnChnagePassword" Value="1" />
                            <asp:Button ID="btnReset" CssClass="btn btn-danger" ValidationGroup="Group1" runat="server" Text="Reset (रीसेट करें)" OnClick="btnReset_Click" />

                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Search Result</h5>
                    <div class="col-lg-12"> 
        <asp:Panel runat="server" ID="pnlSearch" CssClass="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Search Results </h3>
            </div>
            <div class="panel-body">
                <asp:GridView ID="grdView_User" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" Visible="true">
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
        </asp:Panel></div>
                </div>
            </div>


        </div>
    </section>


</asp:Content>
