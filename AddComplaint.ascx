<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddComplaint.ascx.cs" Inherits="NWACMS.AddComplaint" %>







<div style="padding-bottom:0px"><asp:Label ID="Label1" runat="server" 
        Visible="False"></asp:Label></div>
<div class="content" >
 <div style="height:30%">
        <fieldset   >
              <legend> Complainant Infomation: </legend>
     
             <div class="inputrow">
                 <div  class="lbl"> <Label >First Name:</Label></div> <div > <asp:TextBox CssClass="txtinput"  ID="txtFName" runat="server" /></div>  
             </div>

             <div class="inputrow">
                  <div  class="lbl"> <Label >Last Name:</Label></div> <div ><asp:TextBox CssClass="txtinput" ID="txtLName" runat="server"></asp:TextBox></div>
             </div>

             <div class="inputrow">
                  <div  class="lbl"> <Label >Email:</Label></div> <div ><asp:TextBox  CssClass="txtinput" ID="txtEmail" runat="server"></asp:TextBox></div>
             </div>

             <div class="inputrow" >
                  <div  class="lbl"> <Label >Contact Number:</Label> </div> <div><asp:TextBox CssClass="txtinput" ID="txtContact" runat="server"></asp:TextBox></div>
             </div>

            
            
         </fieldset>
</div>

 
<div style="padding-top:15px;width:100%" >        
<fieldset>
         <legend> Complaint Infomation:</legend>
 <%--        <div style="float:left;width:60%;background-color:Aquamarine">

             <div class="inputrow">
                  <div  class="lbl"> <Label >Category:</Label></div>  <div><asp:DropDownList CssClass="txtinput" ID="DropDownList1" runat="server"></asp:DropDownList></div> 
             </div>

             <div class="inputrow">
                  <div  class="lbl" > <Label >Parish:</Label></div>  <div><asp:DropDownList CssClass="txtinput" ID="Parish" runat="server"></asp:DropDownList></div> 
             </div>

              
              
             <div class="inputrow">
                  <div  class="lbl"> <Label >Street:</Label></div>  <div><asp:TextBox  CssClass="txtinput" ID="txtStreet" runat="server"></asp:TextBox></div>
             </div>

             <div class="inputrow">
                  <div  class="lbl"> <Label >Complaint Description:</Label></div> <div><textarea   style="resize:none; max-width:50%; width:45%"  runat ="server" id="txtAreaDesc" maxlength="256" rows="5"></textarea></div>
             </div>

             <div class="inputrow" style="padding-left:19.5%"><asp:Button style="width:40%;background-color:#4C4A4B" ID="btnSubmit" runat="server" Text="Submit" /></div>
         </div>

         <div class="inputrow"  style="width:40%;float:right">
                  <div  class="lbl" > <Label >Parish:</Label></div>  <div><asp:DropDownList style="width:20%"   CssClass="txtinput" ID="DropDownList2" runat="server"></asp:DropDownList></div> 
         </div>
--%>



<table id="ctab " style="height:100%;padding:none;" >
    <tr >
        <td  style="border:none"> <Label >Category:</Label></td> <td style="border:none">
        <asp:DropDownList CssClass="txtinput" ID="drpCategory" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="cat_Name" 
            DataValueField="cat_Id" AutoPostBack="True"></asp:DropDownList><div style= "float:right"> <Label >Sub-category:</Label></div> 
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
            SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        </td>
        <td style="width:19.5%;border:none">
            <asp:DropDownList style="width:100%" 
                CssClass="txtinput" ID="drpSubcategory" runat="server" 
                DataSourceID="SqlDataSource3" DataTextField="sub_Name" 
                DataValueField="sub_Id"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
                SelectCommand="SELECT * FROM [Subcategory] WHERE ([cat_Id] = @cat_Id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="drpCategory" Name="cat_Id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td><td style="border:none" ></td> 
        
    </tr>

    <tr>
        <td style="border:none"><div   > <Label >Parish:</Label></div></td> <td style="border:none">
        <asp:DropDownList CssClass="txtinput" ID="drpParish" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="parish" 
            DataValueField="parish_ID"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>" 
            SelectCommand="SELECT * FROM [Parish]"></asp:SqlDataSource>
        </td>
        <td style="border:none"> </td>
        <td style="border:none"> </td>
        
         
    </tr>

    <tr>
        <td style="border:none"><div> <Label >Street:</Label></div></td> <td style="border:none"><asp:TextBox  CssClass="txtinput" ID="txtStreet" runat="server"></asp:TextBox></td>
        <td style="border:none"> </td>
        <td style="border:none"> </td>
    </tr>
    <tr>
       <td style=" width:21%;border:none"><div   > <Label >Complaint Description:</Label></div></td> <td style="width:40%;border:none"><textarea   style="resize:none;    width:100%"  runat ="server" id="txtAreaDesc" maxlength="256" rows="5"></textarea></td>
        <td style="border:none"> </td>
        <td style="border:none"> </td>
        
    </tr>
    <tr>
       <td style="border:none"></td>
       <td style="border:none;padding-top:1%">
           <asp:Button style="width:40%;background-color:#4C4A4B" ID="btnSubmit" 
               runat="server" Text="Submit" onclick="btnSubmit_Click" ForeColor="White"  /></td>
           
       <td style="border:none"></td>
    </tr>

</table>



        </fieldset>
    
 </div>
</div>

