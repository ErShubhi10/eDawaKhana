<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/Admin.Master" AutoEventWireup="true" CodeBehind="frmUserMaster.aspx.cs" Inherits="eDawaKhana.WebForms.frmUserMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Create User</h5>
                         <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Full Name </label>
                                <asp:TextBox ID="txtName" runat="server" class="col-sm-8 form-control-sm"></asp:TextBox>

                            </div>
                            <div class="col-md-6">
                                <div class="col-12">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" class="col-sm-8 form-control-sm"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" class="col-sm-8 form-control-sm"></asp:TextBox>

                            </div>
                            <div class="col-md-6">

                                <label for="inputDepartment" class="col-sm-2 col-form-label">Department</label>

                                <asp:DropDownList ID="ddlDepartment" CssClass="col-sm-8 form-control-sm" runat="server"></asp:DropDownList>

                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="inputDepartment" class="col-sm-2 col-form-label">Role</label>
                                <asp:DropDownList ID="ddlRole" CssClass="col-sm-8 form-control-sm" runat="server"></asp:DropDownList>

                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">User Id</label>
                                <asp:TextBox ID="txtUserName" runat="server" class="col-sm-8 form-control-sm"></asp:TextBox>

                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Create" />
                            <asp:Button ID="btnReset" runat="server" class="btn btn-secondary" Text="Reset" />

                        </div>

                        <!-- End Horizontal Form -->

                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Table with hoverable rows</h5>

                    <!-- Table with hoverable rows -->
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Position</th>
                                <th scope="col">Age</th>
                                <th scope="col">Start Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Brandon Jacob</td>
                                <td>Designer</td>
                                <td>28</td>
                                <td>2016-05-25</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Bridie Kessler</td>
                                <td>Developer</td>
                                <td>35</td>
                                <td>2014-12-05</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Ashleigh Langosh</td>
                                <td>Finance</td>
                                <td>45</td>
                                <td>2011-08-12</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>Angus Grady</td>
                                <td>HR</td>
                                <td>34</td>
                                <td>2012-06-11</td>
                            </tr>
                            <tr>
                                <th scope="row">5</th>
                                <td>Raheem Lehner</td>
                                <td>Dynamic Division Officer</td>
                                <td>47</td>
                                <td>2011-04-19</td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- End Table with hoverable rows -->

                </div>
            </div>
        </div>
    </section>
</asp:Content>
