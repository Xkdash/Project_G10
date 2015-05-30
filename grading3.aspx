<%@ Page Language="C#" AutoEventWireup="true" CodeFile="grading3.aspx.cs" Inherits="grading3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        #hypdiv{
            float:left;
            padding-right:20px;
            width: 75px;
        }
        #head{
            background:linear-gradient(white);
        }
        #cont{
            background-color: #FFFFFF;
        }
        #Image1{
            padding-right:180px;
        }
        
        .auto-style3 {
            font-size: larger;
        }
        
        .auto-style4 {
            width: 19px;
            background-color: #FFFFFF;
        }
        
        .auto-style5 {
            width: 274px;
        }
        
    </style>
</head>
<body style="background-color: #e0e0e0">
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="2" id="head"style="font-size: xx-large">
                    <asp:Image ID="Image1" runat="server" Height="148px" ImageUrl="~/images/iit patna.jpg" Width="148px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span class="auto-style3">Welcome To IIT Patna</span></strong></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;
                    <div id="hypdiv">

                        &nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink1" runat="server">Attendence</asp:HyperLink>
                        <br />
                        <br />
&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/leave.aspx">Leave</asp:HyperLink>
                        <br />
                        <br />
&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/grading.aspx">Grading</asp:HyperLink>
                        <br />
                        <br />
&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink4" runat="server">courses</asp:HyperLink>
                        <br />
                        <br />
                        <br />
&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Home.aspx">LOGOUT</asp:HyperLink>

                    </div>
                </td>
                <td id="cont">
        <br />
                    <br />
                    <div>
                        <table class="nav-justified">
                            <tr>
                                <td class="auto-style5">
                                    <asp:Panel ID="Panel1" runat="server" Height="26px" Width="269px">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </asp:Panel>
                                </td>
                                <td>       
        <asp:Button ID="Button1" runat="server" Text="Export" OnClick="btnUpload_Click" CssClass="btn btn-success" />
                                </td>
                            </tr>
                        </table>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Select exam"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Maximum Marks :"></asp:Label>
&nbsp;&nbsp;&nbsp;
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Weightage      :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" CssClass="btn btn-info" Width="67px" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
