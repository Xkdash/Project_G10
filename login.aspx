<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
            font-size: xx-large;
        }
        .auto-style2 {
            width: 100%;
            height: 195px;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            width: 421px;
            text-align: right;
            height: 41px;
        }
        .auto-style5 {
            height: 23px;
            width: 421px;
            text-align: right;
        }
        .auto-style6 {
            width: 466px;
            text-align: center;
            height: 88px;
        }
        .auto-style8 {
            height: 41px;
        }
        .auto-style9 {
            font-size: x-large;
        }
        .auto-style10 {}
        .auto-style11 {
            height: 88px;
            background-color: #669999;
        }
    </style>
</head>
<body style="color: #000000; background-color: #669999">
    <form id="form1" runat="server">
        <div class="auto-style10">
    <div class="auto-style1">
    
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Welcome to IIT Patna<br />
        </strong>
    
    </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style6">
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">
                    <h3 style="font-size: x-large">User Name&nbsp;&nbsp;&nbsp;&nbsp; </h3>
                </td>
                <td class="auto-style8">
                    <h3>
                        <asp:TextBox ID="Textusername" runat="server"></asp:TextBox>
                    </h3>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <h3 style="height: 20px; width: 421px"><span class="auto-style9">Password&nbsp;&nbsp;&nbsp; </span>&nbsp;&nbsp; </h3>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="Textpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
                </td>
                <td class="auto-style11">
                    &nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style11">
                    &nbsp;</td>
            </tr>
        </table>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="text-align: left; margin-left: 303px; " Text="Login" Width="77px" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add User" Width="80px" style="text-align: justify; margin-left: 115px" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [loginDB]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
