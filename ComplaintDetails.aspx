<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComplaintDetails.aspx.cs" Inherits="NWACMS.ComplaintDetails" EnableEventValidation="false" %>
<%@ Register TagPrefix="UC" TagName="ComplaintDetailsControl" Src="~/ComplaintDetailsControl.ascx"   %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   
    

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div>
                <UC:ComplaintDetailsControl runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

   
</asp:Content>
