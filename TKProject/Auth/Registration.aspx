<%@ Page Title="" Language="C#" MasterPageFile="~/Auth/AuthMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Auth_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
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
                    <asp:TextBox ID="cname" CssClass="form-control" placeholder="Company Name" runat="server"></asp:TextBox>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="cnum" CssClass="form-control" placeholder="Phone Number" runat="server"></asp:TextBox>
                    <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="cemail" CssClass="form-control" placeholder="Corporate email only" runat="server"></asp:TextBox>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="cpass" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="crpass" CssClass="form-control" placeholder="Retype password" runat="server"></asp:TextBox>
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <input type="checkbox" id="ChckBox" runat="server" />
                                <span style="font-size: medium; padding: 10px;">I agree to the <a href="#">terms</a></span>
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <asp:Button CssClass="btn btn-primary btn-block btn-flat" ID="btn" runat="server" Text="Register" />
                    </div>
                </div>
            </div>
            <a href="login.html" class="text-center">I already have a account</a>
        </div>
    </div>
    
</asp:Content>

