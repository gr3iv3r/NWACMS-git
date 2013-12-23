<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="NWACMS.UpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="padding-top:2%;height:100%;   " >
 <div style="padding-bottom:10px"><asp:Label ID="lblCreateErr" runat="server" Text="Label"></asp:Label></div>  

     <fieldset>
     <legend>Update User</legend>
              <table style="width:100%">
                 <tr> 
                     <td style="border:none" class="style1">Select User:</td><td style="border:none" 
                         class="style3"><asp:DropDownList ID="drpSelUser"  runat="server" Height="32px" Width="100%"></asp:DropDownList></td>  
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="drpSelUser" ForeColor="Red" ValidationGroup="updateUser"></asp:RequiredFieldValidator></td>
                     <td style="border:none" class="style2">Select Role:</td><td style="border:none" 
                         class="style4"><asp:DropDownList ID="drpNewRole"  runat="server" Height="32px" Width="100%"></asp:DropDownList></td>  
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="drpNewRole" ForeColor="Red" ValidationGroup="updateUser"></asp:RequiredFieldValidator></td>
                 
                 </tr>


                 <tr>
                     <td style="border:none" class="style1">Primary E-mail:</td>
                     <td style="border:none" class="style3"><asp:DropDownList ID="drpNewEmail"  runat="server" Height="32px" Width="100%"></asp:DropDownList></td>  
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="drpNewEmail" ForeColor="Red" ValidationGroup="updateUser"></asp:RequiredFieldValidator></td>
                      <td style="border:none;">Department</td><td style="border:none"><asp:DropDownList ID="drpNewDept" runat="server" Height="32px" Width="100%"></asp:DropDownList></td>
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="drpNewDept" ForeColor="Red" ValidationGroup="updateUser"></asp:RequiredFieldValidator></td>
                 </tr>
                 <tr>
                     <td style="border:none" class="style1">Primary Contact:</td>
                     <td style="border:none" class="style3"><asp:DropDownList ID="drpNewContact"  runat="server" Height="32px" Width="100%"></asp:DropDownList></td>  
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="drpNewContact" ForeColor="Red" ValidationGroup="updateUser"></asp:RequiredFieldValidator></td>
                 </tr>

                 <tr>
                     <td style="border-style: none; border-color: inherit; border-width: medium;" 
                         class="style1">Title:</td><td style="border:none" class="style3"><div class="input-control text"><input type="text" runat="server" ID="txtNewTitle" placeholder="Enter Title" ><button class="btn-clear"></button></div></td> 
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtNewTitle" ForeColor="Red" ValidationGroup="updateUser"></asp:RequiredFieldValidator></td>
                 </tr>
                 <tr>
                      <td style="border:none" class="style1"></td><td style="border:none" 
                          class="style3"><asp:Button style="width:50%;float:right;background-color:#4C4A4B" ID="Button1" ValidationGroup="updateUser" runat="server" Text="Update User"  /> </td>
                 </tr>
              </table>
     </fieldset> 
        
  </div>   
</asp:Content>
