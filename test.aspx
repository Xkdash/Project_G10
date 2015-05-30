<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>


<form id="form1" runat="server">
    <div>
        <asp:Table ID="tbl" runat="server">
        </asp:Table>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>Select...</asp:ListItem>
        <asp:ListItem>Generate</asp:ListItem>
    </asp:DropDownList>
        <asp:Button ID="btnSet" runat="server" Text="Button" onclick="btnSet_Click" /> </div>
    </form>