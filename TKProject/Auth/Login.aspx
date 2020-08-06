<%@ Page Title="" Language="C#" MasterPageFile="~/Auth/AuthMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Auth_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
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
        function errorMessage() {
            var errMessage = document.getElementById("<%=errlbl.ClientID%>");
            errMessage.textContent = "No such data found";
            errMessage.style.color = "red";
           
        }
    </script>
    <div class="login-box">
        <div class="login-logo">
            <div>
                <img src="../dist/img/logo.jpg" alt="Logo" />
            </div>
            <a href="#"><b>Kirti Telnet Pvt Ltd</b></a>
        </div>
        <div class="login-box-body">
            <p class="login-box-msg">Sign in to start your session</p>
            <span>
                <asp:Label ID="errlbl" EnableViewState="false" runat="server"></asp:Label></span>
            <div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="cemail" CssClass="form-control" placeholder="Corporate Email only" onblur="isValidEmail()" runat="server"></asp:TextBox>
                    <span>
                        <asp:Label EnableViewState="false" ID="errorEmail" runat="server"></asp:Label></span>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="cpass" CssClass="form-control" placeholder="Password" TextMode="Password" onblur="isValidPassword()" runat="server"></asp:TextBox>
                    <span>
                        <asp:Label EnableViewState="false" ID="errorPass" runat="server"></asp:Label></span>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <asp:CheckBox ID="ChckBox" runat="server" />
                                Login for a week
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <asp:Button ID="btn_login" CssClass="btn btn-primary btn-block btn-flat" runat="server" Text="Sign In" OnClick="btn_login_Click" />
                    </div>
                </div>
            </div>
            <a href="#">I forgot my password</a><br>
            <a href="Registration.aspx" class="text-center">Register your company</a>
            <asp:Label ID="lbl" runat="server"></asp:Label>
        </div>
    </div>

</asp:Content>

