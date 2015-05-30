<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_Admin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style6 {
            font-size: x-large;
        }
        .auto-style7 {
            width: 284px;
            text-align: left;
        }
        .auto-style8 {
            width: 437px;
        }
        .auto-style9 {
            width: 437px;
            height: 30px;
        }
        .auto-style10 {
            width: 284px;
            text-align: left;
            height: 30px;
        }
        .auto-style11 {
            text-align: left;
            height: 30px;
            width: 118px;
        }
        .auto-style12 {
            height: 30px;
        }
        .auto-style13 {
            text-align: left;
            width: 118px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <span class="auto-style6">Admin ID</span> :
    <asp:Label ID="LabUserId" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6">Admin Username : </span>
    <asp:Label ID="LabUserName" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="4" style="font-weight: 700; font-size: x-large; text-align: center">Manage Other Admins</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style7">Add an Admin</td>
            <td class="auto-style13">
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add Admin" Width="95px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9"></td>
            <td class="auto-style10">View /Modify/Delete an Admin</td>
            <td class="auto-style11">
        <asp:Button ID="Button3" runat="server" Text="View Admin" OnClick="Button3_Click" Width="95px" />
            </td>
            <td class="auto-style12"></td>
        </tr>
    </table>
</asp:Content>

