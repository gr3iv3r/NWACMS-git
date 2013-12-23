<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Trackcomplaint.aspx.cs" EnableEventValidation="true" Inherits="NWACMS.Trackcomplaint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <div style="display:inline-block; width:100%">
       <div style="display:inline-block;margin:5% 0% 0% 3%"> <span style="font-size:15pt;font-weight:500">What to do:</span><span style="font-size:13pt;font-style:italic">Enter the tracking number of  the complaint you want to see.</span></div>
          <%--   dividder--%>
            <%--<table  ><tr><td style="width:5%"><div class="aligncenter" ><hr/></div></td><td class="divider" style="white-space:nowrap;width:1%; "></td><td><div class="aligncenter"  ><hr /></div></td></tr></table>--%>
        
         <hr style="margin:.5%" />
         <div style="display:inline-block;margin:10% 0% 0% 25%">
            
             <div >
                 <div style="display: inline-block; float: left">
                     <div >
                        
                         <div>
                             <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red" Text="*No match...marke sure the <b>Tracking number</b> entered is correct"></asp:Label>
                         </div>
                         <div >
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Must enter a tracking number to track " ValidationGroup="track" ControlToValidate="txtTrackno" ForeColor="Red"></asp:RequiredFieldValidator>
                         </div>
                         <div style="padding-bottom:4%">
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Tracking number must be numeric" ControlToValidate="txtTrackno" ValidationExpression="^[0-9]+$" ForeColor="Red" ValidationGroup="track"></asp:RegularExpressionValidator>
                         </div>
                     </div>
                 </div>
             </div>
       
                    
             <div style="background-color:Aquamarine;" >
                 <div style="float: left;">
                     <div style="float: left; padding-top: 3%;display:table-cell">
                         <span>Tracking Number:</span>
                     </div>
                     <div style="float: right;display:table-cell">
                         <asp:TextBox ID="txtTrackno" runat="server" Height="300%" ViewStateMode="Disabled" Width="100%" Font-Size="14pt" CausesValidation="True" ValidationGroup="track"></asp:TextBox>
                     </div>
                 </div>
                 <div style="float:left;">
                         <div style="  ; padding-left: 3%;">
                             <asp:Button ID="btnTrack" runat="server" Text="Track" ValidationGroup="track" CausesValidation="True" OnClick="btnTrack_Click" />
                         </div>
                 </div>
             </div >
                  
            
        </div >
 </div>
</asp:Content>
