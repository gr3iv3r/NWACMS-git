<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ComplaintDetailsControl.ascx.cs" Inherits="NWACMS.complaintDetails" %>
 

 <style type="text/css">
    .data
    {
        font-size:small;
        
    }
   /* table tbody tr td
    {
    	border: 1px solid black;
    	width:1%;
    	white-space:nowrap;
    	
    }
   
   table
   {
   	border-collapse:collapse;
   }*/
   
   
    .cssPager td
            {
                  padding-left: 4px;     
                  padding-right: 4px;    
              }
              
    
    
 </style>



<div style="height:100%;width:100%;float:left;margin-top:3%">

    <div>
        <div id="banner" runat="server" style="height: 20px; width: 80%; margin-left: 10%;
            margin-bottom: 3%; text-align: center; vertical-align: middle; background-color: #4C4A4B">
            <asp:Label ID="lblBan" runat="server" ForeColor="White" Font-Bold="True"></asp:Label></div>
       
        <div style="float:right;" >
          

                    <span runat="server" id="spnConfirmStat" 
                        style="height:26px;background-color:#008287;color:white;text-align:center;font-weight:400;font-size:14px;display:inline-block;padding: 4px 10px;float: left;margin-right: 5px;font-family: 'Segoe UI', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;" 
                        visible="false" ClientIDMode ="Static">
                          Resolve request pending...
                    </span>
                   <asp:Button ID="btnResolve" runat="server" Text="Resolve" 
                        ToolTip="Request this Complaint be &quot;Resolved&quot;" onclick="btnResolve_Click" 
                        CssClass="resBtns" />
                   <asp:Button ID="btnResConfirm" runat="server" Text="Confirm Resolve Request" Visible="False" 
                        Height="26px" onclick="btnResConfirm_Click" />
                   <asp:Button ID="btnCancelRes" runat="server" Text="Cancel Request" Height="26px" 
                        CssClass="resBtns" onclick="btnCancelRes_Click" Visible="False" />
        </div>
    </div>

         <%--   dividder--%>
            <table  ><tr><td style="width:5%"><div class="aligncenter" ><hr/></div></td><td class="divider" style="white-space:nowrap;width:1%; ">Complainant Information</td><td><div class="aligncenter"  ><hr /></div></td></tr></table>



                   
            <table class="data" 
                style="margin-top:2%;width:100%; border-collapse:separate;border-spacing:10px">
                <tr>
                    <td> Complainant: </td>
                    <td> <asp:Label ID="lblcompName" runat="server"></asp:Label></td>
                   
                </tr>
                <tr>
                    <td> Email: </td>
                    <td> <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                    <td> Contact: </td>
                    <td> <asp:Label ID="lblContact" runat="server"></asp:Label></td>
                </tr>
            </table>

             <%--   dividder--%>
            <table  ><tr><td style="width:5%"><div class="aligncenter" ><hr/></div></td><td class="divider" style="white-space:nowrap;width:1%; ">Complaint Information</td><td><div class="aligncenter"  ><hr /></div></td></tr></table>

             <table class="data" style="margin-top:3%;width:100%;border-collapse:separate;border-spacing:10px">
                <tr>
                    <td> ID: </td>
                    <td> <asp:Label ID="lblID" runat="server"></asp:Label> </td>
                    <td> Tracking No.:</td>
                    <td> <asp:Label ID="lblTrack" runat="server"></asp:Label>  </td>
                     
                </tr>
                <tr>
                    <td> Category:</td>
                    <td> <asp:Label ID="lblCat" runat="server"></asp:Label>  </td>
                        <td> Sub-Category: </td> 
                    <td> <asp:Label ID="lblSub" runat="server"></asp:Label>  </td>
                </tr>
                <tr>
                    <td> Parish:</td>
                    <td> <asp:Label ID="lblParish" runat="server"></asp:Label> </td>
                    <td>Street:</td>
                    <td> <asp:Label ID="lblStreet" runat="server"></asp:Label>  </td>
                     
                </tr>
                <tr>
                    <td> Submitted by:</td>
                    <td> <asp:Label ID="lblSubmit" runat="server"></asp:Label> <asp:Label ID="lbltitle" runat="server" ForeColor="#2E92CF" Font-Bold="True" Font-Size="12px"></asp:Label>  </td>
                    <td> Date: </td>
                    <td> <asp:Label ID="lblDate" runat="server"></asp:Label>  </td>
                </tr>

                 <tr>
                    <td> Priority:</td>
                    <td> <asp:Label ID="lblpriority" runat="server"></asp:Label>  
                          
                         <asp:LinkButton runat="server" id="lnkBtnChgPrty" type="submit" 
                            value="Show Dialog" Text="Change"  onclick="lnkBtnChgPrty_Click" 
                            Font-Size="Small" Font-Underline="True"></asp:LinkButton> 

                         <asp:LinkButton runat="server" ID="lnkBtnConfirm" Font-Size="Small" 
                            Font-Underline="True" ClientIDMode="Static" 
                            onclick="lnkBtnConfirm_Click" Text="Confirm" Visible="False"></asp:LinkButton> 

                         <asp:LinkButton runat="server" ID="lnkBtnCancel" Font-Size="Small" 
                            Font-Underline="True" ClientIDMode="Static" 
                             Text="Cancel" onclick="lnkBtnCancel_Click" Visible="False"></asp:LinkButton> 
                     </td>
                    <td> Complaint Life:</td>
                    <td> <asp:Label ID="lblLife" runat="server"></asp:Label>  </td>
                </tr>
                 <tr>
                   
                    <td> Status: </td>
                    <td> <asp:Label ID="lblStat" runat="server"></asp:Label>  </td>
                </tr>

                 <tr>
                   
                    <td> Description: </td>
                    <td> <asp:Label ID="lblDesc" runat="server" Font-Underline="True"></asp:Label> </td>
                </tr>


            </table>

               <%--   dividder--%>
            <table  ><tr><td style="width:5%"><div class="aligncenter" ><hr/></div></td><td class="divider" style="white-space:nowrap;width:1%; ">Complaint Activity</td><td><div class="aligncenter"  ><hr /></div></td></tr></table>


               <table class="data" 
                style="margin-top:2%;width:100%; border-collapse:separate;border-spacing:10px">
                <tr>
                    <td > Complaint seen by: </td>
                    <td>   
                         <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="--" 
                            PageSize="1" Font-Size="Small" CellPadding="5">
                             <Columns>
                                 <asp:BoundField DataField="emp_name" HeaderText="Name" ReadOnly="True" 
                                     SortExpression="emp_name" />
                                 <asp:BoundField DataField="_role" HeaderText="Role" SortExpression="_role" 
                                     Visible="False" />
                                 <asp:BoundField DataField="dep_Name" HeaderText="Department" 
                                     SortExpression="dep_Name" Visible="False" />
                                 <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                                 <asp:BoundField DataField="date_seen" HeaderText="Date Seen" 
                                     SortExpression="date_seen" DataFormatString="{0:MMM dd, yyyy h:m:s tt}" >
                                 <ItemStyle HorizontalAlign="Right" />
                                 </asp:BoundField>
                             </Columns>
                             <EditRowStyle Wrap="False" />
                             <HeaderStyle BackColor="#4C4A4B" ForeColor="White" Font-Size="Small" />
                         
                             <PagerSettings FirstPageText="First &amp;lt;&amp;lt;" 
                                 LastPageText="Last &amp;gt;&amp;gt;" Mode="NextPrevious" 
                                 NextPageText="Next &amp;gt;" PreviousPageText="Previous &amp;lt;" />
                             <PagerStyle Font-Size="11px" Font-Underline="True" />
                         
                             <RowStyle BorderColor="#D2D2D2" BorderStyle="Solid" Wrap="False" />
                         
                         </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
                            SelectCommand="seen_Who" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblTrack" Name="track_no" PropertyName="Text" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                     
                </tr>
                <tr>
                    <td > Marked as resolved by: </td>
                    <td> <asp:Label ID="lblRes" runat="server"></asp:Label>  </td>
                    <td > Date marked as resolved : </td>
                    <td > <asp:Label ID="lblResDate" runat="server"></asp:Label>   </td>
                </tr>
               </table>


               <table class="data" style="margin-top:2%;width:100%;border-collapse:separate;border-spacing:10px">
                <tr>
                     <td >Remarks:</td>
                     <td>
                         <asp:GridView ID="grdVwRmk" runat="server" AllowPaging="True" PageSize="1" AutoGenerateColumns="False" 
                             DataSourceID="SqlDataSource2" CellPadding="5" 
                             onprerender="grdVwRmk_PreRender">
                             <Columns>
                                 <asp:BoundField DataField="emp_name" HeaderText="Name" ReadOnly="True" 
                                     SortExpression="Name" />
                                 <asp:BoundField DataField="_role" HeaderText="_role" SortExpression="_role" 
                                     Visible="False" />
                                 <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" 
                                     SortExpression="Title" />
                                 <asp:BoundField DataField="Remark" HeaderText="Remark" 
                                     SortExpression="Remark" />
                                 <asp:BoundField DataField="date_recieved" HeaderText="Date" 
                                     SortExpression="date_recieved" />
                             </Columns>
                             <EditRowStyle Wrap="True" />
                             <HeaderStyle BackColor="#4C4A4B" ForeColor="White" Font-Size="Small" 
                                 Wrap="False" />
                         
                             <PagerSettings FirstPageText="First &amp;lt;&amp;lt;" 
                                 LastPageText="Last &amp;gt;&amp;gt;" Mode="NextPrevious" 
                                 NextPageText="Next &amp;gt;" PreviousPageText="Previous &amp;lt;" />
                             <PagerStyle Font-Size="11px" CssClass="cssPager"   />
                         
                             <RowStyle BorderColor="#D2D2D2" BorderStyle="Solid" Font-Size="Small" 
                                 Wrap="False" />
                         
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
                             SelectCommand="remark_Who" SelectCommandType="StoredProcedure">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="lblTrack" Name="track_no" PropertyName="Text" 
                                     Type="Int32" />
                             </SelectParameters>
                         </asp:SqlDataSource>
                         <textarea runat="server" id="txtAreaRemark" cols="50" name="S1" rows="5" 
                             maxlength="256" visible="False"></textarea>
                             
                             <asp:Button style="width:30%;background-color:#4C4A4B;margin-top:6px" 
                             ID="btnDone" runat="server" Text="Done"  ForeColor="White" Visible="False" 
                             onclick="btnDone_Click"  />
                          
                         <asp:LinkButton runat="server" ID="lnkBtnAddRmrk" CssClass="lnkBtnAddRmrk" 
                             onclick="lnkBtnAddRmrk_Click" Font-Size="Small" Font-Underline="True" 
                             ClientIDMode="Static" >Add Remark</asp:LinkButton> 
                     </td>
                     <td ><div id="question" style="display:none; cursor: default"> <h1>Would you like to contine?.</h1> <input type="button" id="yes" value="Yes" /> <input type="button" id="no" value="No" /> </div>  </td>
                     <td > </td>
                </tr>
                <tr>
                     <td > </td>
                   
                          
                     <td > </td>
                     <td > <a href="Genworkorder.aspx">View WorkOrder</a></td>
                </tr>
            </table>
</div>