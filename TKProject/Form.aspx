<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Form.aspx.cs" Inherits="Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script type="text/javascript">
        function validationCheck() {
            var summary = "";
            summary += isValidEmail();
            summary += isValidPassword();
           // summary += isvalidConfirmpassword();
            if (summary != "") {
                alert(summary);
                return false;
            } else {
                return true;
            }  
        }
        function isValidEmail() {
            var id;
            var temp = document.getElementById("<%=txtemail.ClientID %>");
            id = temp.value;
            var re = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if (id == "") {
                return ("Please Enter Email" + "\n");
            } else if (re.test(id)) {
                return "";
            } else {
                return ("Email should be in the form ex:abc@xyz.com" + "\n");
            }  
        }
        function isValidPassword() {
            var id;
            var temp = document.getElementById("<%=txtpass.ClientID %>");
            id = temp.value;
            if (id == "") {
                return ("Please enter password" + "\n");
            } else {
                return "";
            }  
        }
        function isvalidConfirmpassword() {
            var uidpwd;
            var uidcnmpwd;
            var tempcnmpwd = document.getElementById("<%=txtrpass.ClientID %>");  
                uidcnmpwd = tempcnmpwd.value;  
            var temppwd = document.getElementById("<%=txtpass.ClientID %>");
            uidpwd = temppwd.value;
            if (uidcnmpwd == "" || uidcnmpwd != uidpwd) {
                alert("Please re-enter password to confirm" + "\n");
            } else {
                return "";
            }
        }  
    </script>
    <form id="myForm" runat="server">
        <div>
            Email:
            <asp:TextBox ID="txtemail" placeholder="Corporate email only" runat="server" onblur="validationCheck()" ></asp:TextBox>
        </div>
        <div>
             Password:
            <asp:TextBox ID="txtpass" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <div>
            Retype Password:
            <asp:TextBox ID="txtrpass" placeholder="Retype Password" TextMode="Password" runat="server" onblur="isvalidConfirmpassword()"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btn_submit" Text="Submit" runat="server" />
        </div>
    </form>
</body>
</html>
