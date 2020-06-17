<%@ Page Title="" Language="C#" MasterPageFile="~/Auth/AuthMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Auth_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div class="login-box">
            <div class="login-logo">
                <div>
                    <img src="../dist/img/logo.jpg" alt="Logo" />
                </div>
                <a href="#"><b>Kirti Telnet Pvt Ltd</b></a>
            </div>
            <div class="login-box-body">
                <p class="login-box-msg">Sign in to start your session</p>

                <div>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="cemail" CssClass="form-control" placeholder="Corporate Email only" runat="server"></asp:TextBox>
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="cpass" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox">
                                    Login for a week
                                </label>
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                        </div>
                    </div>
                </div>
                <a href="#">I forgot my password</a><br>
                <a href="Registration.aspx" class="text-center">Register your company</a>
                <asp:Label ID="lbl" runat="server"></asp:Label>
            </div>
        </div>
    
</asp:Content>

