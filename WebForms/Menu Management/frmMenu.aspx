<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/Admin.Master" AutoEventWireup="true" CodeBehind="frmMenu.aspx.cs" Inherits="eDawaKhana.WebForms.Menu_Management.frmMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Menu Detail</h5>
                        <asp:UpdatePanel runat="server" ID="up">
                            <ContentTemplate>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="col-sm-2 col-form-label">Menu Type </label>
                                        <asp:DropDownList ID="ddlMenuType" runat="server" class="col-sm-8 form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlMenuType_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Parent Menu</asp:ListItem>
                                            <asp:ListItem Value="1">Child Menu</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="col-sm-2 col-form-label">Menu Under <span class="required">*</span> </label>
                                        <asp:DropDownList ID="ddlMenu" runat="server" class="col-sm-8 form-control-sm">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvddlMenu" ControlToValidate="ddlMenu" ValidationGroup="vg_btnSubmit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="col-sm-2 col-form-label">Menu Name  <span class="required">*</span></label>
                                        <asp:TextBox ID="txtMenuName" runat="server" class="col-sm-8 form-control-sm"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtMenuName" ControlToValidate="txtMenuName" ValidationGroup="vg_btnSubmit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-12">
                                            <label class="col-sm-2 col-form-label">Sequence Of Menu <span class="required">*</span></label>
                                            <asp:TextBox ID="txtSeq" runat="server" class="col-sm-8 form-control-sm"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvtxtSeq" ControlToValidate="txtSeq" ValidationGroup="vg_btnSubmit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="col-12">
                                            <label class="col-sm-2 col-form-label">Is Active</label>
                                            <asp:CheckBox ID="chkIsActive" runat="server" class="col-sm-8 form-control-sm" />

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-12">
                                            <label class="col-sm-2 col-form-label">URL <span class="required">*</span></label>
                                            <asp:TextBox ID="txtUrl" runat="server" class="col-sm-8 form-control-sm" Text="#"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvtxtUrl" ControlToValidate="txtUrl" ValidationGroup="vg_btnSubmit" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="text-center">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Create" OnClick="btnSubmit_Click" ValidationGroup="vg_btnSubmit" />
                            <asp:Button ID="btnReset" runat="server" class="btn btn-secondary" Text="Reset" OnClick="btnReset_Click" />
                        </div>
                        <!-- End Horizontal Form -->
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">List Of Menu</h5>
                    <asp:Repeater runat="server" ID="rpList">
                        <HeaderTemplate>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Menu Type</th>
                                        <th scope="col">Menu Name</th>
                                        <th scope="col">Menu Under</th>
                                        <th scope="col">URL</th>
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
                                    <asp:HiddenField runat="server" ID="hdnMenuId" Value='<%# Eval("MenuId") %>' />
                                </th>
                                <td><%# Eval("MenuType") %></td>
                                <td><%# Eval("MenuName") %></td>
                                <td><%# Eval("SubMenuName") %></td>
                                <td><%# Eval("URL") %></td>
                                <td><%# Eval("IsActive") %></td>
                                <td><%# Eval("CreateTs") %></td>
                                <td>
                                    <asp:Button ID="btnEdit" runat="server" class="btn btn-secondary" Text="Edit" OnClick="btnEdit_Click" /></td>
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
