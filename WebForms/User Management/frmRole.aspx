<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/Admin.Master" AutoEventWireup="true" CodeBehind="frmRole.aspx.cs" Inherits="eDawaKhana.WebForms.User_Management.frmRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Role Detail</h5>
                         <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="col-sm-2 col-form-label">Role Name </label>
                                <asp:TextBox ID="txtRoleName" runat="server" class="col-sm-8 form-control-sm"></asp:TextBox>

                            </div>
                            <div class="col-md-6">
                                <div class="col-12">
                                    <label class="col-sm-2 col-form-label">Is Active</label>
                                    <asp:CheckBox ID="chkIsActive" runat="server" class="col-sm-8 form-control-sm" />

                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Create" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnReset" runat="server" class="btn btn-secondary" Text="Reset" OnClick="btnReset_Click" />

                        </div>

                        <!-- End Horizontal Form -->

                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">List Of Roles</h5>
                    <asp:Repeater runat="server" ID="rpList">
                        <HeaderTemplate>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Role Name</th>
                                        <th scope="col">Is Active</th>
                                        <th scope="col">Created On</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <tr>
                                <th scope="row"><%# Container.ItemIndex+1 %>
                                    <asp:HiddenField runat="server" ID="hdnRoleId" Value='<%# Eval("RoleId") %>' />
                                </th>
                                <td><%# Eval("RoleName") %></td>
                                <td><%# Eval("IsActive") %></td>
                                <td><%# Eval("CreateTs") %></td> 
                                <td><asp:Button ID="btnEdit" runat="server" class="btn btn-secondary" Text="Edit" OnClick="btnEdit_Click" /></td>                               
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>
</asp:Content>