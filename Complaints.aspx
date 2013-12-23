<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false"
    CodeBehind="Complaints.aspx.cs" Inherits="NWACMS.Complaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top: 15px; margin-left: 20%;">
       <div style="overflow: hidden;"> 
        <div class="lable">
            <asp:Label runat="server" ID="lblUrgent" Style="margin-left: 3%; font-weight: bolder;"
                Text="Urgent" ForeColor="White"></asp:Label>
        </div>


        
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>"
                    SelectCommand="getInboxUrgent" SelectCommandType="StoredProcedure"> 
                    <SelectParameters>
                        <asp:Parameter Name="role" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="grdVwUrgent" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource3" GridLines="Horizontal" 
               Font-Size="Small" HorizontalAlign="Left"
                    Width="100%" ShowHeader="False" ShowFooter="True" 
               onrowcreated="grdVwUrgent_RowCreated" 
               onselectedindexchanged="grdVwUrgent_SelectedIndexChanged" 
               DataKeyNames="comp_ID" CellPadding="5">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="comp_ID" HeaderText="comp_ID" SortExpression="comp_ID"
                            ShowHeader="False" Visible="False" />
                        <asp:BoundField DataField="parish" HeaderText="parish" SortExpression="parish" ShowHeader="False" />
                        <asp:BoundField DataField="cat_Name" HeaderText="cat_Name" SortExpression="cat_Name"
                            ShowHeader="False"></asp:BoundField>
                        <asp:BoundField DataField="Descrip" HeaderText="Descrip" SortExpression="Descrip"
                            ShowHeader="False" />
                        <asp:BoundField DataField="isResolved" HeaderText="isResolved" SortExpression="isResolved"
                            Visible="False" />
                        <asp:BoundField DataField="date_recieved" HeaderText="date_recieved" SortExpression="date_recieved"
                            DataFormatString="{0:MMM dd, yyyy}" ShowHeader="False">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="text-align: center; font-style: italic; font-size: large">
                            -No Data-</div>
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#4C4A4B" ForeColor="White" />
                    <RowStyle BorderColor="#D2D2D2" BorderStyle="Solid" HorizontalAlign="Left" />
                </asp:GridView>
         </div>




        <div style="overflow: hidden;">

                <div class="lable">
                    <asp:Label runat="server" ID="lblUnread" Style="margin-left: 3%; font-weight: bolder;"
                        Text="Unread" ForeColor="White"></asp:Label>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>"
                    SelectCommand="getInboxUnread" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="role" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="grdVwUnread" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="comp_ID" DataSourceID="SqlDataSource1" 
                    GridLines="Horizontal" Font-Size="Small"
                    HorizontalAlign="Left" Width="100%" 
                    OnRowCreated="grdVwUnread_RowCreated"
                    OnSelectedIndexChanged="grdVwUnread_SelectedIndexChanged" 
                    ShowHeader="False" CellPadding="5">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" Visible="true" />
                        <asp:BoundField DataField="comp_ID" HeaderText="comp_ID" SortExpression="comp_ID"
                            ShowHeader="False" Visible="False" />
                        <asp:BoundField DataField="parish" HeaderText="parish" SortExpression="parish" ShowHeader="False" />
                        <asp:BoundField DataField="cat_Name" HeaderText="cat_Name" SortExpression="cat_Name"
                            ShowHeader="False"></asp:BoundField>
                        <asp:BoundField DataField="Descrip" HeaderText="Descrip" SortExpression="Descrip"
                            ShowHeader="False" />
                        <asp:BoundField DataField="isResolved" HeaderText="isResolved" SortExpression="isResolved"
                            Visible="False" ShowHeader="False" />
                        <asp:BoundField DataField="date_recieved" HeaderText="date_recieved" SortExpression="date_recieved"
                            DataFormatString="{0:MMM dd, yyyy}" ShowHeader="False">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="text-align: center; font-style: italic; font-size: large">
                            -No Data-</div>
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#4C4A4B" ForeColor="White" />
                    <RowStyle BorderColor="#D2D2D2" BorderStyle="Solid" HorizontalAlign="Left" />
                </asp:GridView>
      </div>

      <div style="overflow: hidden;">

                <div class="lable">
                    <asp:Label runat="server" ID="lblRead" Style="margin-left: 3%; font-weight: bolder;"
                        Text="Read" ForeColor="White"></asp:Label>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NWACMSConnectionString %>"
                    SelectCommand="getInboxRead" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="role" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="grdVwRead" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource2" GridLines="Horizontal" Font-Size="Small" HorizontalAlign="Left"
                    Width="100%" ShowFooter="True" ShowHeader="False"  onrowcreated="grdVwRead_RowCreated" 
                       onselectedindexchanged="grdVwRead_SelectedIndexChanged" 
                    DataKeyNames="comp_ID" CellPadding="5">
                    <Columns>
                        <asp:BoundField DataField="comp_ID" HeaderText="comp_ID" SortExpression="comp_ID"
                            ShowHeader="False" Visible="False" />
                        <asp:BoundField DataField="parish" HeaderText="parish" SortExpression="parish" />
                        <asp:BoundField DataField="cat_Name" HeaderText="cat_Name" SortExpression="cat_Name">
                        </asp:BoundField>
                        <asp:BoundField DataField="Descrip" HeaderText="Descrip" SortExpression="Descrip" />
                        <asp:BoundField DataField="isResolved" HeaderText="isResolved" SortExpression="isResolved"
                            Visible="False" />
                        <asp:BoundField DataField="date_recieved" HeaderText="date_recieved" SortExpression="date_recieved"
                            DataFormatString="{0:MMM dd, yyyy}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="text-align: center; font-style: italic; font-size: large">
                            -No Data-</div>
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#4C4A4B" ForeColor="White" />
                    <RowStyle BorderColor="#D2D2D2" BorderStyle="Solid" HorizontalAlign="Left" />
                </asp:GridView>
        </div>
    </div>
</asp:Content>
