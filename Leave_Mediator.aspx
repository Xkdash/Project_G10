<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Leave_Mediator.aspx.cs" Inherits="Leave_Mediator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 368px;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style4 {            background-color: #F0F0F0;
        }
        .auto-style5 {
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style8 {
            width: 585px;
            background-color: #FFFFFF;
        }
        .auto-style9 {            background-color: #FFFFFF;
        }
        .auto-style10 {
            width: 100%;
        }
        .auto-style11 {
            width: 32px;
            background-color: #FFFFFF;
        }
        .auto-style3 {
            font-size: large;
            color: #006699;
        }
        .auto-style12 {
            text-align: left;
        }
        .auto-style13 {
            width: 339px;
            background-color: #FFFFFF;
        }
        .auto-style14 {
            width: 428px;
            background-color: #FFFFFF;
        }
        .auto-style15 {
            height: 42px;
            background-color: #FFFFFF;
        }
        .auto-style16 {
            color: #006699;
        }
        .auto-style17 {
            background-color: #F0F0F0;
            margin-left: 0px;
        }
        .auto-style18 {
            width: 339px;
            background-color: #FEFFFF;
        }
        .auto-style19 {
            width: 428px;
            background-color: #FEFFFF;
        }
        .auto-style20 {
            width: 32px;
            background-color: #FEFFFF;
        }
        </style>
</head>
<body style="background:linear-gradient(90deg,white, #FFFFFF,white)">
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" style="text-align: center">
                    <asp:Panel ID="Panel6" runat="server" Height="91px" style="font-weight: 700; color: #FFFFFF; margin-bottom: 15px; background-color: #F0F0F0;">
                        <span class="auto-style16">WELCOME</span><br /> <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mediator ID : </span>
                        <asp:Label ID="LabMedId" runat="server" CssClass="auto-style3" ForeColor="#006699"></asp:Label>
                        <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mediator Username : </span>
                        <asp:Label ID="LabMedUserName" runat="server" CssClass="auto-style3" ForeColor="#006699"></asp:Label>
                        <br />
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <table class="auto-style1" style="background:linear-gradient(90deg,white)">
                        <tr>
                            <td class="auto-style15" colspan="3"><strong style="font-size: large">Unconfirmed Leave Requests&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Logout" CssClass="btn btn-primary" Height="33px" Width="75px" />
                                </strong></td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style8">
                                <asp:Panel ID="Panel1" runat="server" Height="327px" CssClass="auto-style4">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="text-align: center; margin-left: 0px;" Width="745px" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-striped" Height="16px" PageSize="5">
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
                                        <SelectedRowStyle BackColor="#e0e0e0" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                    </asp:GridView>
                                </asp:Panel>
                            </td>
                            <td class="auto-style4">
                                <asp:Panel ID="Panel2" runat="server" Height="324px" style="margin-left: 24px;" CssClass="auto-style4">
                                    <asp:Label ID="Label5" runat="server" style="font-weight: 700; font-size: x-large; color: #006600;" Text="Details of the Applied Leave" Visible="False"></asp:Label>
                                    <br />
                                    <p style="margin-bottom: 5px" class="auto-style12">

                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label1" runat="server" Text="Faculty ID" Visible="False"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>

                                    </p>
                                    <p style="text-align: left; margin-top: 5px; margin-bottom: 2px">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label3" runat="server" Text="Faculty Name" Visible="False"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
                                    </p><p style="text-align: left; margin-top: 6px; margin-bottom: 4px">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label6" runat="server" Text="Beginning Date" Visible="False"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Visible="False"></asp:Label>
                                    </p><p style="text-align: left; margin-top: 5px; margin-bottom: 3px">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label7" runat="server" Text="Ending Date" Visible="False"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label9" runat="server" Visible="False"></asp:Label>
                                    </p>
                                    <p style="text-align: left; margin-top: 3px; margin-bottom: 1px">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label10" runat="server" Text="Leave Type" Visible="False"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label11" runat="server" Visible="False"></asp:Label>
                                    </p><p style="text-align: left; margin-top: 5px; margin-bottom: 3px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label12" runat="server" Text="Description" Visible="False"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label13" runat="server" Visible="False"></asp:Label>
                                    </p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                    <br />
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="ACCEPT" Visible="False" CssClass="btn btn-info" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="REJECT" Visible="False" CssClass="btn btn-danger" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="SEE OTHER" Visible="False" CssClass="btn btn-warning" />
                                </asp:Panel>

                            </td>
                        </tr>
                    </table>
                    <table class="auto-style1" style="background:linear-gradient(90deg,white)">
                        <tr>
                            <td class="auto-style11">
                                &nbsp;</td>
                            <td class="auto-style4" colspan="3">
                                <asp:Label ID="Label16" runat="server" style="font-weight: 700; font-size: x-large; color: #0066CC" Text="Considerables for Granting the Leave" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                &nbsp;</td>
                            <td class="auto-style14">
                    <asp:Label ID="Label14" runat="server" style="font-size: large; font-weight: 700" Text="Leave History  of the Selected Employee" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style13">
                    <asp:Label ID="Label15" runat="server" style="font-weight: 700; font-size: large" Text="Remaining Leaves of the Selected Employee" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label17" runat="server" style="font-weight: 700; font-size: large" Text="Leaves of other Employees during Same Dates" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">
                                &nbsp;</td>
                            <td class="auto-style19">
                                <asp:Panel ID="Panel3" runat="server" Height="337px" CssClass="auto-style17" Width="371px">
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource3" style="margin-left: 5px;" Visible="False" Width="337px" AllowSorting="True" CssClass="table table-bordered table-striped" Height="16px" PageSize="5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                        <Columns>
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
                            <td class="auto-style18">
                                <asp:Panel ID="Panel4" runat="server" Height="331px" style="margin-left: 0px;" CssClass="auto-style17" Width="274px">
                                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource4" style="text-align: center; margin-left: 3px;" Visible="False" Width="209px" AllowSorting="True" CssClass="table table-bordered table-striped" Height="16px" PageSize="5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                        <Columns>
                                            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                                            <asp:BoundField DataField="remain" HeaderText="Remaining" SortExpression="remain" />
                                            <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
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
                            <td class="auto-style17" style="background-color:white">
                                <asp:Panel ID="Panel5" runat="server" Height="333px" CssClass="auto-style17">
                                    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource5" style="margin-left: 5px" Visible="False" AllowSorting="True" Width="592px" CssClass="table table-bordered table-striped" Height="16px" PageSize="5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                        <Columns>
                                            <asp:BoundField DataField="facid" HeaderText="Faculty ID" SortExpression="facid" />
                                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                                            <asp:BoundField DataField="startdate" HeaderText="Beginning" SortExpression="startdate" />
                                            <asp:BoundField DataField="enddate" HeaderText="Ending" SortExpression="enddate" />
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
                        </tr>
                    </table>
                </td>
            </tr>
            </table>
                                <table class="auto-style10">
                                    <tr>
                                        <td><asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT leave_details.facid, leave_details.startdate, leave_details.enddate, leave_details.type, faculty.name FROM leave_details INNER JOIN faculty ON leave_details.facid = faculty.facid WHERE (leave_details.confirmflag = @confirmflag) AND (leave_details.startdate &lt;= @startdate) AND (leave_details.enddate &gt;= @enddate) OR (leave_details.confirmflag = @confirmflag) AND (leave_details.startdate &gt;= @startdate2) AND (leave_details.startdate &lt;= @startdate3) OR (leave_details.confirmflag = @confirmflag) AND (leave_details.enddate &gt;= @enddate2) AND (leave_details.enddate &lt;= @enddate3)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="3" Name="confirmflag" Type="Int32" />
                                        <asp:ControlParameter ControlID="Label8" DbType="Date" Name="startdate" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="Label9" DbType="Date" Name="enddate" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="Label8" DbType="Date" Name="startdate2" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="Label9" DbType="Date" Name="startdate3" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="Label8" DbType="Date" Name="enddate2" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="Label9" DbType="Date" Name="enddate3" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                        </td>
                                        <td>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [type], [remain], [year] FROM [leave_remain] WHERE ([facid] = @facid) ORDER BY [year]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label2" Name="facid" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                        </td>
                                        <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT leave_details.facid, leave_details.startdate, leave_details.enddate, leave_details.type, leave_details.textDescp, faculty.name FROM leave_details INNER JOIN faculty ON leave_details.facid = faculty.facid WHERE (leave_details.confirmflag = @confirmflag)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="confirmflag" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                        </td>
                                        <td>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                        </td>
                                        <td>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [startdate], [enddate], [type], [textDescp] FROM [leave_details] WHERE (([facid] = @facid) AND ([confirmflag] = @confirmflag))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label2" Name="facid" PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="3" Name="confirmflag" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                        </td>
                                    </tr>
        </table>
    </form>
</body>
</html>
