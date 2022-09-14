<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/Admin.Master" AutoEventWireup="true" CodeBehind="frmRole.aspx.cs" Inherits="eDawaKhana.WebForms.User_Management.frmRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="modal fade" id="myModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <asp:Label runat="server" ID="lblModalTitle">Message</asp:Label></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label runat="server" ID="lblModalBody">Message Body</asp:Label>
                </div>
               <%-- <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>             
                </div>--%>
                
            </div>
        </div>
    </div>
    <section class="section">
        <div class="row">

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
                        <div class="text-left">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Create" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary" Text="Update" OnClick="btnUpdate_Click" Visible="false" />
                            <asp:Button ID="btnReset" runat="server" class="btn btn-secondary" Text="Reset" OnClick="btnReset_Click" />

                            <input type="button" value="POPUP" class="btn btn-primary" onclick="displayPopup()" />
                        </div>

                        <!-- End Horizontal Form -->

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

     <script type="text/javascript">

         function displayPopup() {
             debugger;
             $('#myModal').modal("show");
         }
     </script>
</asp:Content>