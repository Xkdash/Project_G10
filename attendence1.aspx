<%@ Page Language="C#" AutoEventWireup="true" CodeFile="attendence1.aspx.cs" Inherits="attendence1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 115px;
            }
        #hypdiv{
            float:left;
            padding-right:20px;
        }
        #head{
            background:linear-gradient(#8181F7,white);
        }
        #cont{
            background:linear-gradient(#D0A9F5,white);
        }
        #Image1{
            padding-right:180px;
        }
        
        .auto-style3 {
            font-size: larger;
        }
        
        .auto-style4 {
            width: 134px;
        }
        .auto-style5 {
            width: 212px;
        }
        
    </style>
</head>
<body style="background-color: #FFFFCC">
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="2" id="head"style="font-size: xx-large">
                    <asp:Image ID="Image1" runat="server" Height="148px" ImageUrl="~/images/iit patna.jpg" Width="178px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span class="auto-style3">Welcome To IIT Patna</span></strong></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;
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
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Take New Attandence" OnClick="Button1_Click" />
                    <br />
                    <table class="auto-style1">
                        <tr>
                            <td align="left" style="vertical-align: top ">Take Attandance<br />
                    <asp:GridView ID="GridView1" AutoPostback="true" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowcommand="GridView1_RowCommand" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                            <asp:ButtonField ButtonType="Button" CommandName="p" Text="P"  />
                            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="A" />
                        </Columns>
                    </asp:GridView>
                            </td>
                            <td align="left" style="vertical-align: top ">Present Student<br /> 
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" onrowcommand="GridView2_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                                        <asp:CommandField ButtonType="Button" SelectText="Absent" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentid] FROM [attendence] WHERE (([att] = @att) AND ([attid] = @attid))">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="att" Type="Int32" />
                                        <asp:SessionParameter Name="attid" SessionField="attid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td align="left" style="vertical-align: top ">Absent Student<br />
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" onrowcommand="GridView3_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                                        <asp:CommandField ButtonType="Button" SelectText="Present" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentid] FROM [attendence] WHERE (([att] = @att) AND ([attid] = @attid))">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="att" Type="Int32" />
                                        <asp:SessionParameter Name="attid" SessionField="attid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Present" />
&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Absence" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentid] FROM [attendence] WHERE (([att] = @att) AND ([attid] = @attid))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="-1" Name="att" Type="Int32" />
                            <asp:SessionParameter Name="attid" SessionField="attid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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