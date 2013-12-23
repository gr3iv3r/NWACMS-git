<%@ Page Title="Change Password" Language="C#" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="NWACMS.Account.ChangePassword" %>

 
 <html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
      <link href="../Styles/aSite.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/modern.css" rel="stylesheet" type="text/css" />


    

        <script src="Scripts/input-control.js">
    </script>
</head>
<body class="metrouicss" style="width:40%;margin-left:30%;margin-top:25%;overflow:hidden;position:fixed;color:White" >
    <form id="form1" runat="server">
    <asp:Label runat="server" id="lblChngpass" 
        Text="You must change your password at first logon" Visible=False 
        ForeColor="#2E92CF" ></asp:Label>
    <p>
        New passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %>characters in length.
    </p>
          
         
         
       
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
           
            <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="ChangeUserPasswordValidationGroup"/>
            
                 <div style="text-align:left;background-color:#4C4A4B;color:white"><span style="margin-left:3%;font-size:16pt;font-weight:bolder">Change Password</span></div>
                    <table >

                      <tr>
                           <td> <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password:</asp:Label></td>
                           <td> <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" 
                                 CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Old Password is required." 
                                 ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator></td>
                     </tr> 
                     <tr>
                               <td><asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label></td> 
                                <td><asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                                     CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required." 
                                     ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator></td>
                      </tr>
                      <tr>
                               <td> <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label></td>
                               <td><asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                                     ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                                     ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator></td>
                     </tr>
                 
                 
                 
                
              </table>
              <table>
                 <tr>    
                          <td style="padding-left:105px"> <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClientClick="JavaScript:window.history.back(1);return false;"/>
                               <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                  CommandName="ChangePassword" Text="Change Password" 
                               ValidationGroup="ChangeUserPasswordValidationGroup" 
                                  onclick="ChangePasswordPushButton_Click"/>
                               <asp:Button ID="btnbktologin" runat="server" Text="Go back to Login" 
                                  onclick="ChangePasswordPushButton_Click" CausesValidation="False" 
                                  PostBackUrl="~/Login.aspx" Visible="False"/></td>
                    </tr>
              
              </table>
 
       

    </form>
</body>
</html>
     
     
    
   