﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Auth/AuthMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Auth_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function isValidCompName() {
            var id;
            var temp = document.getElementById("<%=cname.ClientID %>");
            id = temp.value;
            if (id == "") {
                var errName = document.getElementById("<%=errorName.ClientID%>");
                errName.textContent = "Please enter company name";
                errName.style.color = "red";
            }
            else {
                return true;
            }
        }
        function isValidPhone() {
            var id;
            var temp = document.getElementById("<%=cnum.ClientID %>");
            id = temp.value;
            var re;
            re = /^[0-9]+$/;
            var digits = /\d(10)/;
            if (id == "") {
                var errNum = document.getElementById("<%=errorNumber.ClientID%>")
                errNum.textContent = "Please enter phone number";
                errNum.style.color = "red";
            } else if (re.test(id)) {
                return true;
            } else {
                errNum.textContent = "Phone number should be digits only";
                errNum.style.color = "red";
            }
        }
        function isValidEmail() {
            var id;
            var temp = document.getElementById("<%=cemail.ClientID %>");
            id = temp.value;
            var re = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if (id == "") {
                var errEmail = document.getElementById("<%=errorEmail.ClientID%>");
                errEmail.textContent = "Email is required";
                errEmail.style.color = "red";
                
            } else if (re.test(id)) {
                return true;
            } else {
                var errEmail = document.getElementById("<%=errorEmail.ClientID%>");
                errEmail.textContent = "Email should be in the form ex:abc@xyz.com";
                errEmail.style.color = "red";
            }
        }
        function isValidPassword() {
            var id;
            var temp = document.getElementById("<%=cpass.ClientID %>");
            id = temp.value;
            if (id == "") {
                var errPass = document.getElementById("<%=errorPass.ClientID%>");
                errPass.textContent = "Please enter password";
                errPass.style.color = "red";
            }
            else {
                return true;
            }
        }
        function isValidConfirmPass() {
            var uidpwd;
            var uidcnmpwd;
            var tempcnmpwd = document.getElementById("<%=crpass.ClientID %>");
            uidcnmpwd = tempcnmpwd.value;
            var temppwd = document.getElementById("<%=cpass.ClientID %>");
            uidpwd = temppwd.value;
            if (uidcnmpwd == "" || uidcnmpwd != uidpwd) {
                var errRPass = document.getElementById("<%=errorRPass.ClientID%>");
                errRPass.textContent = "Please re-enter password to confirm";
                errRPass.style.color = "red";
            }
        }
        function ShowPopup() {
            $("#MyPopup").modal("show");
        }
    </script>

    <div class="register-box">
        <div class="register-logo">
            <div>
                <img src="../dist/img/logo.jpg" alt="Logo" />
            </div>
            <a href="#"><b>Kirti Telnet Pvt Ltd</b></a>
        </div>

        <div class="register-box-body">
            <p class="login-box-msg">Register your Company</p>

            <div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="cname" CssClass="form-control" placeholder="Company Name" onblur="isValidCompName()" runat="server"></asp:TextBox>
                    <span><asp:Label EnableViewState="false" ID="errorName" runat="server"></asp:Label></span>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="cnum" CssClass="form-control" placeholder="Phone Number" onblur="isValidPhone()" runat="server"></asp:TextBox>
                    <span><asp:Label EnableViewState="false" ID="errorNumber" runat="server"></asp:Label></span>
                    <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="cemail" CssClass="form-control" placeholder="Corporate email only" onblur="isValidEmail()" runat="server"></asp:TextBox>
                    <span><asp:Label EnableViewState="false" ID="errorEmail" runat="server"></asp:Label></span>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="cpass" CssClass="form-control" placeholder="Password" onblur="isValidPassword()" runat="server" TextMode="Password"></asp:TextBox>
                    <span><asp:Label EnableViewState="false" ID="errorPass" runat="server"></asp:Label></span>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="crpass" CssClass="form-control" placeholder="Retype password" onblur="isValidConfirmPass()" runat="server" TextMode="Password"></asp:TextBox>
                    <span><asp:Label EnableViewState="false" ID="errorRPass" runat="server"></asp:Label></span>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <asp:Label runat="server" >
                                <asp:CheckBox ID="ChckBox" runat="server" />
                                <span style="font-size: medium; padding: 10px;">I agree to the <a href="#">terms</a></span>
                            </asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <asp:Button CssClass="btn btn-primary btn-block btn-flat" ID="btn" runat="server" OnClick="btn_Click" Text="Register" />
                    </div>
                </div>
            </div>
            <a href="Login.aspx" class="text-center">I already have a account</a>
        </div>
    </div>
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title">Company Registration</h4>
                </div>
                <div class="modal-body">
                    Company Registered Successfully..!!
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btn_Close" CssClass="btn btn-primary" Text="Close" OnClick="btn_Close_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

