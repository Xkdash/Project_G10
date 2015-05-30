<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Leave_Approval.aspx.cs" Inherits="Leave_Approval" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: left;
            font-size: x-large;
            margin-top: 4px;
            margin-bottom: 0px;
            background-color: #F0F0F0;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style5 {
            width: 100%;
            height: 314px;
        }
        .auto-style6 {
            width: 437px;
        }
        .auto-style7 {
            width: 328px;
        }
        .auto-style8 {
            width: 273px;
            text-align: center;
        }
        .auto-style9 {
            font-size: x-large;
        }
        .auto-style10 {
            width: 620px;
        }
        #form1 {
            background:linear-gradient(90deg,white);
        }
        .auto-style11 {
            color: #006699;
        }
        .auto-style12 {
            color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" Height="88px" style="font-weight: 700; font-size: xx-large; text-align: center; color: #FFFFFF; background-color: #F0F0F0;" Width="1346px">
            <span class="auto-style11">WELCOME</span><br /> &nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style9"><span class="auto-style11">Issuer ID : </span>
            <asp:Label ID="Label1" runat="server" ForeColor="#006699" style="color: #006699"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style11">Issuer Username :</span>
            <asp:Label ID="Label2" runat="server" ForeColor="#33CC33" style="color: #006699"></asp:Label>
            </span>
        </asp:Panel>
        <p class="auto-style2" style="background-color:white">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unconfirmed Leave Requests&nbsp;&nbsp; :<span class="auto-style3">&nbsp;<span class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp; </span> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Logout" OnClick="Button2_Click" CssClass="btn btn-primary" />
        </p>
        <table class="auto-style5">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style10">
                    <asp:Panel ID="Panel2" runat="server" Height="353px" style="background-color: #F0F0F0" Width="652px">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource1" style="font-size: medium; text-align: center; margin-left: 5px; margin-top: 8px;" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-striped" Height="16px" PageSize="5" Width="574px">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="facid" HeaderText="Faculty ID" SortExpression="facid" />
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                                <asp:BoundField DataField="startdate" HeaderText="Beginning" SortExpression="startdate" />
                                <asp:BoundField DataField="enddate" HeaderText="Ending" SortExpression="enddate" />
                                <asp:BoundField DataField="textDescp" HeaderText="Description" SortExpression="textDescp" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="Panel3" runat="server" Height="354px" style="font-size: medium; margin-left: 45px; background-color: #F0F0F0;">
                        <p class="auto-style2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" style="font-weight: 700; font-size: xx-large; color: #2BAED5;" Text="Leave Details" Visible="False"></asp:Label>
                        </p>
                        <p class="auto-style2" >
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label7" runat="server" style="font-size: large" Text="Faculty ID" Visible="False"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label8" runat="server" style="font-size: large" Visible="False"></asp:Label>
                        </p>
                        <p class="auto-style2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label9" runat="server" CssClass="auto-style3" Text="Faculty Name" Visible="False"></asp:Label>
                            <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label10" runat="server" Visible="False"></asp:Label>
                            </span>
                        </p>
                        <p class="auto-style2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label12" runat="server" CssClass="auto-style3" Text="Beginning Date" Visible="False"></asp:Label>
                            <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label11" runat="server" Visible="False"></asp:Label>
                            </span>
                        </p>
                        <p class="auto-style2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label13" runat="server" CssClass="auto-style3" Text="Ending Date" Visible="False"></asp:Label>
                            <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label14" runat="server" Visible="False"></asp:Label>
                            </span>
                        </p>
                        <p class="auto-style2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Label ID="Label15" runat="server" CssClass="auto-style3" Text="Leave Type" Visible="False"></asp:Label>
                            <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label16" runat="server" Visible="False"></asp:Label>
                            &nbsp;&nbsp; </span>
                        </p>
                        <p class="auto-style2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label17" runat="server" CssClass="auto-style3" Text="Description" Visible="False"></asp:Label>
                            <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label18" runat="server" Visible="False"></asp:Label>
                            </span>
                        </p>
                        <p class="auto-style2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ACCEPT" Visible="False" CssClass="btn btn-info" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="REJECT" Visible="False" CssClass="btn btn-danger" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="SEE OTHER" Visible="False" CssClass="btn btn-warning" Width="125px" />
                        </p>
                    </asp:Panel>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style5">
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Label ID="Label22" runat="server" style="font-weight: 700; font-size: x-large; color: #0099CC" Text="Considerables for Granting the Leave" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
            <asp:Label ID="Label19" runat="server" style="font-weight: 700" Text="Leave History of the Selected Employee  :" Visible="False"></asp:Label>
                </td>
                <td class="auto-style7">
            <asp:Label ID="Label20" runat="server" style="font-weight: 700" Text="Remaining Leaves of the Selected Employee :" Visible="False"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="Label21" runat="server" style="font-weight: 700" Text="Leaves of other Employees during Same Dates" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Panel ID="Panel4" runat="server" Height="339px" style="background-color: #F0F0F0" Width="420px">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" style="font-size: medium; text-align: center; margin-left: 13px" Visible="False" Width="332px" AllowSorting="True" CssClass="table table-bordered table-striped" Height="16px" PageSize="5">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                                <asp:BoundField DataField="startdate" HeaderText="Beginning" SortExpression="startdate" />
                                <asp:BoundField DataField="enddate" HeaderText="Ending" SortExpression="enddate" />
                                <asp:BoundField DataField="textDescp" HeaderText="Description" SortExpression="textDescp" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
                <td class="auto-style7">
                    <asp:Panel ID="Panel5" runat="server" Height="341px" style="margin-left: 27px; background-color: #F0F0F0" Width="317px">
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" style="font-size: medium; text-align: center; margin-left: 4px" Visible="False" Width="299px" AllowSorting="True" CssClass="table table-bordered table-striped" Height="16px" PageSize="5">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                                <asp:BoundField DataField="remain" HeaderText="Remaining" SortExpression="remain" />
                                <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
                <td class="auto-style8">
                    <asp:Panel ID="Panel6" runat="server" Height="337px" Width="552px" style="margin-left: 29px; background-color: #F0F0F0">
                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Visible="False" AllowSorting="True" Width="537px" style="margin-left: 9px" CssClass="table table-bordered table-striped" Height="16px" PageSize="5">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="facid" HeaderText="Faculty ID" SortExpression="facid" />
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                                <asp:BoundField DataField="startdate" HeaderText="Beginning" SortExpression="startdate" />
                                <asp:BoundField DataField="enddate" HeaderText="Ending" SortExpression="enddate" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
        </table>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT leave_details.facid, leave_details.startdate, leave_details.enddate, leave_details.type, faculty.name FROM leave_details INNER JOIN faculty ON leave_details.facid = faculty.facid WHERE (leave_details.confirmflag = @confirmflag) AND (leave_details.startdate &lt;= @startdate) AND (leave_details.enddate &gt;= @enddate) OR (leave_details.confirmflag = @confirmflag) AND (leave_details.startdate &gt;= @startdate2) AND (leave_details.startdate &lt;= @startdate3) OR (leave_details.confirmflag = @confirmflag) AND (leave_details.enddate &gt;= @enddate2) AND (leave_details.enddate &lt;= @enddate3)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="confirmflag" Type="Int32" />
                            <asp:ControlParameter ControlID="Label11" DbType="Date" Name="startdate" PropertyName="Text" />
                            <asp:ControlParameter ControlID="Label14" DbType="Date" Name="enddate" PropertyName="Text" />
                            <asp:ControlParameter ControlID="Label11" DbType="Date" Name="startdate2" PropertyName="Text" />
                            <asp:ControlParameter ControlID="Label14" DbType="Date" Name="startdate3" PropertyName="Text" />
                            <asp:ControlParameter ControlID="Label11" DbType="Date" Name="enddate2" PropertyName="Text" />
                            <asp:ControlParameter ControlID="Label14" DbType="Date" Name="enddate3" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [type], [remain], [year] FROM [leave_remain] WHERE ([facid] = @facid) ORDER BY [year]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label8" Name="facid" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [startdate], [enddate], [type], [textDescp] FROM [leave_details] WHERE (([facid] = @facid) AND ([confirmflag] = @confirmflag))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label8" Name="facid" PropertyName="Text" Type="String" />
                    <asp:Parameter DefaultValue="3" Name="confirmflag" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT leave_details.facid, leave_details.startdate, leave_details.enddate, leave_details.type, leave_details.textDescp, faculty.name FROM leave_details INNER JOIN faculty ON leave_details.facid = faculty.facid WHERE (leave_details.confirmflag = @confirmflag)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="confirmflag" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
