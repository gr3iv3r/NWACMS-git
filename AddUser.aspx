<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="NWACMS.AddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:2%;height:100%;   " >

        <div style="padding-bottom:10px"><asp:Label ID="lblCreateErr" runat="server" Text="Label"></asp:Label></div>  

       <fieldset>
     <legend>Create User</legend>
           <div id="divAduser" >
              <table style="width:100%">
                 <tr> 
                      <td style="border:none">First Name:</td><td style="border:none"><div class="input-control text"><input type="text" runat="server" ID="txtfName" placeholder="Enter First Name" ><button class="btn-clear"></button></div></td>  
                      <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtfName" ForeColor="Red" ValidationGroup="createUser"></asp:RequiredFieldValidator></td>
                      <td style="border:none;padding-left:4%">Title:</td><td style="border:none"><div class="input-control text"><input type="text" runat="server" ID="txtTitle" placeholder="Enter Employee Title" ><button class="btn-clear"></button></div></td>
                      <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtTitle" ForeColor="Red" ValidationGroup="createUser"></asp:RequiredFieldValidator></td>
                </tr>
                  
                 <tr>
                     <td style="border:none">Last Name:</td><td style="border:none"><div class="input-control text"><input type="text" runat="server" ID="txtlName" placeholder="Enter Last Name" ><button class="btn-clear"></button></div></td> 
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtlName" ForeColor="Red" ValidationGroup="createUser"></asp:RequiredFieldValidator></td>
                     <td style="border:none;padding-left:4%">Department:</td><td style="border:none">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
                         SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                     <asp:DropDownList ID="drpDept" runat="server" Height="32px" Width="100%" 
                         DataSourceID="SqlDataSource1" DataTextField="dep_Name" 
                         DataValueField="dep_Id"></asp:DropDownList></td>
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="drpDept" ForeColor="Red" ValidationGroup="createUser"></asp:RequiredFieldValidator></td>
                 </tr>
                 <tr>
                     <td style="border:none">Primary Contact:</td><td style="border:none"><div class="input-control text"><input type="text" runat="server" ID="txtContact" placeholder="Enter Last Name" ><button class="btn-clear"></button></div></td> 
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtContact" ForeColor="Red" ValidationGroup="createUser"></asp:RequiredFieldValidator></td>
                     <td style="border:none;padding-left:4%">
                         User Type:</td>
                     <td>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                         SelectCommand="SELECT RoleName, RoleId FROM vw_aspnet_Roles WHERE (RoleName &lt;&gt; 'admin')"></asp:SqlDataSource>
                     <asp:DropDownList ID="drpRole" runat="server" Height="32px" Width="100%" 
                         DataSourceID="SqlDataSource2" DataTextField="RoleName" DataValueField="RoleId"></asp:DropDownList>
                     </td>
                     <td>
                     </td>
                     <%--<td style="border:none"><a id="lnkAdCntct" href="#">   Add </a></td><td style="border:none"></td>--%>
                 </tr>

                 <tr>
                     <td style="border:none;width:20%">Employee E-mail:</td><td style="border:none"><div class="input-control text"><input type="text" runat="server" ID="txtEmail" placeholder="Enter E-mail" ><button class="btn-clear"></button></div></td> 
                     <td style="border:none"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="createUser"></asp:RequiredFieldValidator></td>
                     <%--<td style="border:none"><a id="lnkAdEmail" href="#"> Add </a></td><td style="border:none"></td>--%>
                 </tr>
                 <tr>
                    <td style="border:none"></td> <td style="border:none"></td>
                 </tr>
                 <tr>
                      <td style="border:none"></td><td style="border:none">
                      <asp:Button style="width:50%;float:right;background-color:#4C4A4B" 
                          ID="btnCreateUser" ValidationGroup="createUser" runat="server" 
                          Text="Create User" onclick="btnCreateUser_Click"  /> </td>
                      <td style="border:none"></td>
                 </tr>
              </table>
          </div>   

             <%-- CONTACTS--%>
          
               <%--<div style="padding-top:20px"> <label class="input-control radio"><input id="email" type="radio" name="contact" runat="server" value="email"><span class="helper">Email</span></label>
                     <label class="input-control radio"><input id="tel" type="radio" name="contact" runat="server" value="Tel"><span class="helper">Telphone</span></label>
              </div>--%>

             <div id="divTel" style="display:none"> 
                  <span style="font-size:14pt;font-weight:bolder;">Now Add contacts for this user</span>
               <table style="margin-top:15px">
                 <tr>
                     <td style="border:none" class="style5">Telphone:</td><td style="border:none" 
                         class="style6"><div class="input-control text"><input type="text" runat="server" ID="txtAddTel" placeholder="Enter Contact" ><button class="btn-clear"></button></div></td> 
                     <td style="border:none" class="style13"><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txtAddTel" ForeColor="Red" ValidationGroup="AddCntct"></asp:RequiredFieldValidator></td>
                     <td style="border:none" class="style12" ><asp:Button style="width:50%;float:left;background-color:#4C4A4B" ID="btnAddTel" ValidationGroup="AddCntct" runat="server" Text="Add Contact"  /> </td>
                     <td style="border:none" class="style12" ><asp:Button style="width:50%;float:left;background-color:#4C4A4B" ID="btnTelDone"  runat="server" Text="Done"  /> </td>
                    <td> <asp:Label ID="lblContctSuces" runat="server" Text="Label"></asp:Label></td>
                 </tr>
              </table>
            </div>

             <div id="divEmail" style="display:none">
                   <span style="font-size:14pt;font-weight:bolder;">Now Add e-mails for this user</span>
               <table style="margin-top:15px">
                 <tr>
                     <td style="border:none" class="style5">Email:</td><td style="border:none" 
                         class="style6"><div class="input-control text"><input type="text" runat="server" ID="txtAdEmail" placeholder="Enter Email" ><button class="btn-clear"></button></div></td> 
                     <td style="border:none" class="style9"><asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="txtAdEmail" ForeColor="Red" ValidationGroup="AddEmail"></asp:RequiredFieldValidator></td>
                     <td style="border:none" class="style12" ><asp:Button style="width:50%;float:left;background-color:#4C4A4B" ID="btnAddEmail" ValidationGroup="AddEmail" runat="server" Text="Add E-mail"  /> </td>
                     <td style="border:none" class="style12" ><asp:Button style="width:50%;float:left;background-color:#4C4A4B" ID="btnEmailDone"  runat="server" Text="Done"  /> </td>
                     <td > <asp:Label style="float:left" ID="lblEmailSuces" runat="server" Text="Label"></asp:Label></td>
                 </tr>
              </table>
            </div>
     
     </fieldset>  
    </div>   
</asp:Content>
