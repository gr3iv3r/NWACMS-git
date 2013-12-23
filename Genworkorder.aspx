<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Genworkorder.aspx.cs" Inherits="NWACMS.Genworkorder" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style>
    /* .tabWk th
     {
     	border-bottom:1px solid gray;
     	 
     }
     
   */
    /*.tabWk tr
     {
          
      padding-top:200px;
      
     }*/ 
      .tabWk input[id*="Title"],input[id*="Item"],input[id*="txtDesc"]
     {
         min-width:100%;
     }
       .tabWk td
     {
     	/*margin-top:10%;*/
        padding:10px 0px 0px 10px;
     	white-space:nowrap;
        vertical-align:bottom;	 
     	/*background-color:Olive;
     	/*border:1px solid gray; */
     }
     .tabWk select
     {
     	
     	margin-bottom:0px;
        width:85px;
        height:26px;
        padding: 1px 4px 1px 3px;
        
       
     }
     
     div[id*="panTitle"],div[id*="UpdatePanel1"]
     {
     	overflow:hidden;
     	
     }
     select[id*="GridView1_DropDownList2"] 
     {
     	-moz-appearance: none;
     	-webkit-appearance: none;
     	appearance:none;
        border:none;
     	margin: 0px 0px 0px 0px;
        height: 26px;
        padding: 0px 0px 0px 0px;
        width:80%;
     }
     span[id*="lblWrkOdertotal"]
     {  
     	padding:5px 154px 0px 0px;
     	font-weight:bold;
        font-size:small;
     	float:right;
     }
     
     a[class*="crud"]
     {
     	padding:0px 2px 0px 3px;
     	vertical-align: sub;
     }
     
     #pnlNoWo
     {
     	 
     	margin-top:20%;
     	
     	margin-left:17%;
     	Width:80%;
     }
     
</style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    
        <asp:Panel ID="pnlNoWo" runat="server" ClientIDMode="Static">
          <div style="text-align:center;">  <label id="lblNoWo" style="text-align: center; font-size: 20pt; font-style: italic;
                font-weight: 400" runat="server" visible="true">
                Work Order Not Generated</label>
            <br />
            <br />
            <asp:Button ID="btnGenWO" runat="server" Text="Generate" Font-Size="15pt" 
                  onclick="btnGenWO_Click" />
         </div>

    </asp:Panel>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                 <div >
         
          <div id="banner" runat="server" style="height: 20px; width: 60%; margin-left: 20%;
            margin-top: 3%; text-align: center; vertical-align: middle; background-color: #4C4A4B"> 
            <asp:Label ID="lblBan" runat="server" ForeColor="White" Font-Bold="True"></asp:Label></div>
                     
             <div style="float:right;margin:20px 20px 0px 0px">

                      <%-- [APPROVED NOTIFICATION SPAN] ENABLE THIS LATER--%>
                     <span runat="server" id="spnAppv" class="wkBtns" display="none"
                                style="height:23px;background-color:#008287;color:white;text-align:center;font-weight:400;font-size:14px;display:inline-block;padding: 4px 10px;float: left;margin-right: 5px;font-family: 'Segoe UI', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;" 
                                visible="false" ClientIDMode ="Static">
                                  Resolve request pending...
                     </span>

                     <asp:Button ID="btnAppvWo" 
                             runat="server" Text="Appove WorkOrder"  CssClass="wkBtns" 
                             onclick="btnAppvWo_Click" Visible="False" />

                     <asp:Button ID="btnWOFinish" 
                             runat="server" Text="Project Finish"  CssClass="wkBtns" 
                               Visible="False" />
             </div>

        <%--   dividder--%>
            <table style="padding:5% 0px 5% 0px;" ><tr><td style="width:5%"><div class="aligncenter" ><hr/></div></td><td class="divider" style="white-space:nowrap;width:1%; ">WorkOrder Information</td><td><div class="aligncenter"  ><hr /></div></td></tr></table>



       <table style="width:60%;padding:0px 0px 0px 5%" class="tabWk">
           
           <tr>
                <td>Title:</td> <td><asp:TextBox ID="txtWoTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtWoTitle" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="addTitle"></asp:RequiredFieldValidator>
                </td><td> 
                <asp:Button ID="btnAddTitle" runat="server" Text="Add Title" Height="26px" 
                    CssClass="wkBtns" onclick="btnAddTitle_Click" ValidationGroup="addTitle" /></td>
           </tr>
           <tr>
                
               <td style="padding-top:48px; " >Item:</td> <td ><asp:TextBox ID="txtItem" runat="server" ></asp:TextBox></td>
               <td>Quantity:</td><td style="padding-left:20px">
               <asp:TextBox ID="txtQuan" runat="server" Width="80px" 
                   ontextchanged="txtQuan_TextChanged" AutoPostBack="True" onfocus="javascript:this.select();">0</asp:TextBox></td>
               <td>Unit<S/td><td><asp:DropDownList ID="drpUnit" runat="server" DataSourceID="SqlDataSource1" DataTextField="Unit" DataValueField="unit_ID" > </asp:DropDownList></td>
             
           </tr>
           <tr>
               <td>Description:</td><td><textarea id="txtDesc" runat="server" rows="2" cols="43" style="resize:none"></textarea></td>
               <td>Rate:</td><td>
               <b style="vertical-align: bottom;font-size: small">$</b><asp:TextBox ID="txtRate" runat="server" Width="80px" 
                   ontextchanged="txtRate_TextChanged" AutoPostBack="True" onfocus="javascript:this.select();">0</asp:TextBox></td>
               <td>Amount</td>
               <td><b style="font-size: small;">$</b><asp:Label ID="lblAmt" runat="server" Text="--" Font-Bold="True" Font-Size="Small"></asp:Label></td>
           </tr>
           <tr>
                   <td>In Storage:</td>
                   <td>
                       <asp:CheckBoxList ID="chkBxInStr" runat="server" RepeatDirection="Horizontal">
                           <asp:ListItem Value="true">Yes</asp:ListItem>
                           <asp:ListItem Value="false">No</asp:ListItem>
                       </asp:CheckBoxList>
                   </td>
                   <td>
                       <asp:Button ID="btnAddItem" runat="server" CssClass="wkBtns" Height="26px" 
                           Text="Add Item" onclick="btnAddItem_Click" />
                   </td>
           </tr>
            
              <tr>
                  <td>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
                          SelectCommand="getUnit" SelectCommandType="StoredProcedure">
                      </asp:SqlDataSource>
                  </td>
           </tr>
                      
 
       </table>


        <%--   dividder--%>
            <table style=";padding:5% 0px 5% 0px";  ><tr><td style="width:5%"><div class="aligncenter" ><hr/></div></td><td class="divider" style="white-space:nowrap;width:1%; ">
                WorkOrder Details</td><td><div class="aligncenter"  ><hr /></div></td></tr></table>
     
               <div style="padding:0px 15px 0px 15px;">
                     <asp:Panel ID=panTitle runat="server">
                     
                     
                         <%--<table style="border:1px solid black">
                             <tr>
                                   <td style="width:1%;white-space:nowrap">--%>

                                     <div style=" padding:7px 30px 5px 0px;border-bottom:1px solid #cfcfcf;display:inline-block; overflow:hidden"> <%--<span><asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label></span> --%>
                                         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                             DataKeyNames="workorder_Id" DataSourceID="SqlDataSource2" GridLines="None" 
                                             ShowHeader="False" Width="0px" ondatabound="GridView2_DataBound" 
                                             onrowdeleting="GridView2_RowDeleting" onrowupdating="GridView2_RowUpdating">
                                             <Columns>
                                                 <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                                 <ControlStyle CssClass="crud" />
                                                 <ItemStyle Font-Bold="True" Font-Size="Medium" Wrap="False" 
                                                     Font-Underline="False" />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="workorder_Id" HeaderText="workorder_Id" 
                                                     InsertVisible="False" ReadOnly="True" SortExpression="workorder_Id" 
                                                     Visible="False" />
                                                 <asp:CommandField DeleteText="Delete WorkOrder" EditText="Edit Title" 
                                                     ShowDeleteButton="True" ShowEditButton="True">
                                                 <ControlStyle CssClass="crud" />
                                                 <ItemStyle Font-Italic="False" Font-Size="Smaller" Font-Underline="False" 
                                                     Wrap="False" HorizontalAlign="Center" />
                                                 </asp:CommandField>
                                             </Columns>
                                         </asp:GridView>
                                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                             ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
                                             DeleteCommand="DELETE FROM [Item] WHERE [workorder_Id] = @workorder_Id DELETE FROM [Workorder] WHERE [workorder_Id] = @workorder_Id" 
                                             InsertCommand="INSERT INTO [Workorder] ([Title]) VALUES (@Title)" 
                                             SelectCommand="SELECT [Title], [workorder_Id] FROM [Workorder] WHERE ([workorder_Id] = @workorder_Id)" 
                                             
                                             UpdateCommand="UPDATE [Workorder] SET [Title] = @Title WHERE [workorder_Id] = @workorder_Id">
                                             <DeleteParameters>
                                                 <asp:Parameter Name="workorder_Id" Type="Int32" />
                                             </DeleteParameters>
                                             <InsertParameters>
                                                 <asp:Parameter Name="Title" Type="String" />
                                             </InsertParameters>
                                             <SelectParameters>
                                                 <asp:SessionParameter Name="workorder_Id" SessionField="workorder_Id" 
                                                     Type="Int32" />
                                             </SelectParameters>
                                             <UpdateParameters>
                                                 <asp:Parameter Name="Title" Type="String" />
                                                 <asp:Parameter Name="workorder_Id" Type="Int32" />
                                             </UpdateParameters>
                                         </asp:SqlDataSource>
                         </div>
                              <%--    </td>
                            </tr>
                           
                            <tr>
                             <td style="font-weight:small">--%>

                                
                           <%-- </td>
                                  <td> --%>
                                      <div style=" width:25%;white-space:nowrap;  padding:7px 30px 5px 0px;border-bottom:1px solid #cfcfcf;"><span style="font-weight:bold;font-size:small">Parish: <asp:Label ID="lblParish" runat="server" Font-Size="Small"></asp:Label> </span>  </div> 
                                      <div style=" width:20%;white-space:nowrap;  padding:0px 30px 5px 0px;border-bottom:1px solid #cfcfcf" ><span style=" font-weight:bold;font-size:small">Date: <asp:Label ID="lblWoDate" runat="server"  ></asp:Label></span></div>                           
                                <%-- </td>
                            </tr>
                             
                         </table>--%>
                         <div style="padding:0px 0px 30px 0px">
                             <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
                                 SelectCommand="SELECT [unit_ID], [Unit] FROM [Unit]"></asp:SqlDataSource>
                         </div>
                     </asp:Panel>
              

                    
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"    
                         Font-Size="Small" HorizontalAlign="Left"
                         DataKeyNames="Item_ID" DataSourceID="SqlDataSource3" 
                         onrowupdating="GridView1_RowUpdating" ondatabound="GridView1_DataBound" 
                         onload="GridView1_Load" onrowupdated="GridView1_RowUpdated" 
                         ShowFooter="True" onrowdeleting="GridView1_RowDeleting">
                         <Columns>
                             <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="Item_ID" Visible="False" />
                             <asp:BoundField DataField="item" HeaderText="Item" 
                                 SortExpression="item" >
                             <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Description" HeaderText="Description" 
                                 SortExpression="Description" />
                             <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                                 SortExpression="Quantity" />
                             <asp:TemplateField HeaderText="Unit" SortExpression="unit_ID">
                                 <EditItemTemplate>
                                     <asp:DropDownList ID="DropDownList1" runat="server" 
                                         DataSourceID="SqlDataSource4" DataTextField="Unit" DataValueField="unit_ID" 
                                         SelectedValue='<%# Bind("unit_ID") %>'>
                                     </asp:DropDownList>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("unit_ID") %>' 
                                         Visible="False"></asp:Label>
                                     <asp:DropDownList ID="DropDownList2" runat="server" 
                                         DataSourceID="SqlDataSource4" DataTextField="Unit" DataValueField="unit_ID" 
                                         Enabled="False" SelectedValue='<%# Eval("unit_ID") %>'>
                                     </asp:DropDownList>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:BoundField DataField="Rate" HeaderText="Rate" 
                                 SortExpression="Rate" DataFormatString="${0}" />
                             <asp:BoundField DataField="Amount" DataFormatString="${0}" 
                                 HeaderText="Sub-total" SortExpression="Amount" ReadOnly="True" />
                             <asp:CheckBoxField DataField="inStore" HeaderText="In storage" 
                                 SortExpression="inStore" >
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:CheckBoxField>
                             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                             
                             <ItemStyle Font-Size="Smaller" HorizontalAlign="Center" />
                             </asp:CommandField>
                             
                         </Columns>
                          <EmptyDataTemplate>
                                         <div style="text-align: center; font-style: italic; font-size: large">
                                             -No Data-</div>
                                     </EmptyDataTemplate>
                                     
                                     <HeaderStyle BackColor="#4C4A4B" ForeColor="White" HorizontalAlign="Center" />
                                      <RowStyle BorderColor="#D2D2D2" BorderStyle="Solid" HorizontalAlign="Left" />  
                                     
                                      
                     </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
                         DeleteCommand="DELETE FROM [Item] WHERE [Item_ID] = @Item_ID" 
                         InsertCommand="INSERT INTO [Item] ([unit_ID], [Quantity], [Rate], [Amount], [inStore], [item], [Description]) VALUES (@unit_ID, @Quantity, @Rate, @Amount, @inStore, @item, @Description)" 
                         SelectCommand="SELECT Quantity, Rate, Amount, inStore, item, Item_ID, Description, unit_ID FROM Item WHERE (workorder_Id = @workorder_Id)" 
                         
                         UpdateCommand="UPDATE [Item] SET [unit_ID] = @unit_ID, [Quantity] = @Quantity, [Rate] = @Rate, [Amount] = @Amount, [inStore] = @inStore, [item] = @item, [Description] = @Description WHERE [Item_ID] = @Item_ID" 
                        >
                         <DeleteParameters>
                             <asp:Parameter Name="Item_ID" Type="Int32" />
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="unit_ID" Type="Int32" />
                             <asp:Parameter Name="Quantity" Type="Int32" />
                             <asp:Parameter Name="Rate" Type="Decimal" />
                             <asp:Parameter Name="Amount" Type="Decimal" />
                             <asp:Parameter Name="inStore" Type="Boolean" />
                             <asp:Parameter Name="item" Type="String" />
                             <asp:Parameter Name="Description" Type="String" />
                         </InsertParameters>
                         <SelectParameters>
                             <asp:SessionParameter Name="workorder_Id" SessionField="workorder_Id" 
                                 Type="Int32" />
                         </SelectParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="unit_ID" Type="Int32" />
                             <asp:Parameter Name="Quantity" Type="Int32" />
                             <asp:Parameter Name="Rate" Type="Decimal" />
                             <asp:Parameter Name="Amount" Type="Decimal" />
                             <asp:Parameter Name="inStore" Type="Boolean" />
                             <asp:Parameter Name="item" Type="String" />
                             <asp:Parameter Name="Description" Type="String" />
                             <asp:Parameter Name="Item_ID" Type="Int32" />
                         </UpdateParameters>
                     </asp:SqlDataSource>
                     <asp:Label ID="lblWrkOdertotal" runat="server" Text="0" Visible="False"></asp:Label>
                     </div>
 </div>
   
        </ContentTemplate>
       <%-- <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
       </Triggers>--%>
    </asp:UpdatePanel>

</asp:Content>
