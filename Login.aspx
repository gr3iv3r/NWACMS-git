<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NWACMS.Account.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
      <link href="Styles/aSite.css" rel="stylesheet" type="text/css" />
    <link href="Styles/modern.css" rel="stylesheet" type="text/css" />


   <script>
       $(document).ready(function () {


           $('#loginbtn').click(function () {
               //$("#loginForm").load('login.aspx #loginForm1');
               // 
               $('#loginForm').find("input[type=text], UserName1").val("");
               $('#loginForm').find("input[type=password], UserName1").val("");
               $('#loginForm').find("[id*='Validator']").css('visibility', ' hidden');
//               $.blockUI({ message: $('#loginForm'), onOverlayClick: $.unblockUI });

//               $('#loginForm').parent().appendTo($("form:first"));
//               alert("afdafdaf");

//               $('#loginbtn').click(function () {





//               });
           });
       });

   
   
   </script>

        <script src="Scripts/input-control.js">
    </script>
</head>
<body class="metrouicss" style="width:40%;margin-left:30%;margin-top:25%;overflow:hidden;position:fixed" >
    <form id="form1" runat="server">
        <div id="loginForm1">
        <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false"
            OnAuthenticate="LoginUser_Authenticate">
            <LayoutTemplate>
            <div style="text-align:left;height:100%;background-color:#4C4A4B;color:white"><span style="margin-left:3%;font-size:16pt;font-weight:bolder">Login</span></div>
                <span class="failureNotification">
                    <asp:Literal  ID="FailureText" runat="server"></asp:Literal>
                </span>
              <%--  <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                    ValidationGroup="LoginUserValidationGroup" />--%>
                
                   <table ><tr><td  style="border:none"><label style="color:White">UserName: </label></td> <td  style="border:none"><div id="Div1" class="input-control text"><input type="text" runat="server" ID="UserName1" placeholder="Enter Username" ><button class="btn-clear"></button></div></td><td  style="border:none;color:red" ><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="UserName1"  ValidationGroup="LoginUser"></asp:RequiredFieldValidator></td></tr><tr><td  style="border:none"><label style="color:White"> Password: </label></td> <td  style="border:none"><div id="Div2" class="input-control password"><input type="password" ID="Password1" runat="server" placeholder="Enter Password"><button class="btn-reveal"></button></div></td><td  style="border:none;color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="Password1"  ValidationGroup="LoginUser"></asp:RequiredFieldValidator></td></tr></table>


                 <div style="display:none">
                        <p>
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Visible="False">Username:</asp:Label>
                            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:CheckBox ID="RememberMe" runat="server" />
                            <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                        </p>
                  </div>
                

                    <asp:Button ID="LoginButton" Text="Login" runat="server" CommandName="Login"  ValidationGroup="LoginUser" />
                    <%--<p class="submitButton">
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup" />
                    </p>--%>
                 
            </LayoutTemplate>
        </asp:Login>

    </div>
    </form>
</body>
</html>
