<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<head>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 260px;
        }
    </style>
</head>

<form id="Form1" method="post" runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Button" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="Button" style="height: 26px" />
    <br />
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <br />
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                <br />
                <br />
            </td>
            <td>
                <asp:Panel ID="Panel2" runat="server">
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" style="margin-left: 445px" Width="216px">
    </asp:Panel>
</form>