<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Team.aspx.cs" Inherits="Team" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function isValidEmpName() {
            var id;
            var temp = document.getElementById("<%=empname.ClientID %>");
            id = temp.value;
            if (id == "") {
                alert("Please enter employee name" + "\n");
            }
            else {
                return true;
            }
        }
        function isValidEmail() {
            var id;
            var temp = document.getElementById("<%=empemail.ClientID%>");
            id = temp.value;
            var re = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if (id == "") {
                alert("Please Enter Email" + "\n");
            } else if (re.test(id)) {
                return true;
            } else {
                alert("Email should be in the form ex:abc@xyz.com" + "\n");
            }
        }
        function isValidPassword() {
            var id;
            var temp = document.getElementById("<%=emppass.ClientID %>");
            id = temp.value;
            if (id == "") {
                alert("Please enter password" + "\n");
            }
            else {
                return true;
            }
        }
        function isValidConfirmPass() {
            var uidpwd;
            var uidcnmpwd;
            var tempcnmpwd = document.getElementById("<%=emprpass.ClientID %>");
            uidcnmpwd = tempcnmpwd.value;
            var temppwd = document.getElementById("<%=emppass.ClientID %>");
            uidpwd = temppwd.value;
            if (uidcnmpwd == "" || uidcnmpwd != uidpwd) {
                alert("Please re-enter password to confirm" + "\n");
            }
        }
        function ShowPopup() {
            $("#MyPopup").modal("show");
        }
    </script>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Team
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#" onclick="ShowPopup()"><i class="fa fa-plus-circle"></i>Add Employee</a></li>
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Zabbnet</a></li>
                <li class="active"><a href="Team.aspx">Team</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3>0</h3>
                            <p>Total Employees</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-android-people"></i>
                            
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>0</h3>
                            <p>Active Employees</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-android-contact"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <h3>0</h3>
                            <p>Online Employees</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-android-person"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3>0</h3>
                            <p>Archive Employees</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-android-delete"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Employee Details</h3>
                        </div>
                        <div class="box-body">
                            <table id="example" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Employee ID</th>
                                        <th>Employee Name</th>
                                        <th>Employee Designation</th>
                                        <th>Employee Email</th>
                                        <th>Employee Access</th>
                                        <th>Archive</th>
                                    </tr>
                                
                                </thead>
                                <tbody id="tlist" runat="server">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <aside class="control-sidebar control-sidebar-dark" style="display: none;">
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-user bg-yellow"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                <p>New phone +1(800)555-1234</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                <p>nora@example.com</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-file-code-o bg-green"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                <p>Execution time 5 seconds</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">Custom Template Design
                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">Update Resume
                <span class="label label-success pull-right">95%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">Laravel Integration
                <span class="label label-warning pull-right">50%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">Back End Framework
                <span class="label label-primary pull-right">68%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <div>
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
              <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Other sets of options are available
                        </p>
                    </div>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Allow the user to show his name in blog posts
                        </p>
                    </div>

                    <h3 class="control-sidebar-heading">Chat Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Show me as online
              <input type="checkbox" class="pull-right" checked>
                        </label>
                    </div>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Turn off notifications
              <input type="checkbox" class="pull-right">
                        </label>
                    </div>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </aside>
    <div class="control-sidebar-bg"></div>
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title">Employee Registration</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="empid" CssClass="form-control" placeholder="Employee Id" runat="server"></asp:TextBox>
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="empname" CssClass="form-control" placeholder="Employee Name" onblur="isValidEmpName()" runat="server"></asp:TextBox>
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="empdesig" CssClass="form-control" placeholder="Employee Designation" runat="server"></asp:TextBox>
                        <span class="glyphicon glyphicon-briefcase form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="empemail" CssClass="form-control" placeholder="Employee Email" onblur="isValidEmail()" runat="server"></asp:TextBox>
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="emppass" CssClass="form-control" placeholder="Password" TextMode="Password" onblur="isValidPassword()" runat="server"></asp:TextBox>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="emprpass" CssClass="form-control" placeholder="Retype password" TextMode="Password" onblur="isValidConfirmPass()" runat="server"></asp:TextBox>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <asp:DropDownList ID="emprole" DataTextField="RName" DataValueField="Rid" CssClass="form-control" runat="server">
                            
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btn_Add" CssClass="btn btn-primary" Text="Add" OnClick="btn_Add_Click" runat="server" />
                    <asp:Label ID="lbl1" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

