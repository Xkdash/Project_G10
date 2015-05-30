<%@ Page Language="C#" AutoEventWireup="true" CodeFile="grading1.aspx.cs" Inherits="grading1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 986px;
        }
        .auto-style2 {
            width: 152px;
            background:linear-gradient(WHITE);
        }
        #hypdiv{
            float:left;
            padding-right:20px;
        }
        #head{
            background:linear-gradient(white);
        }
        #cont{
            background:linear-gradient(white);
        }
        #Image1{
            padding-right:180px;
        }
        
        .auto-style3 {
            font-size: larger;
        }
        
        .auto-style4 {
            width: 388px;
        }
        
    </style>
</head>
<body style="background-color: white">
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="3" id="head"style="font-size: xx-large; background-color: #F0F0F0;">
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
                <td id="cont" class="auto-style4">Add new Marks :&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add new" CssClass="btn btn-primary" />
        <br />
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Maximum Marks :" Visible="False"></asp:Label>
&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Weightage :" Visible="False"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
&nbsp;<asp:Label ID="Label3" runat="server" Text="Exam Name :" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Confirm" Visible="False" CssClass="btn btn-info" />
                    <br />
                    <br />
                    <br />
                    <br />
        <br />
                </td>
                <td id="cont">&nbsp; Update Marks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
        <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" CssClass="btn btn-info" Height="32px" Width="66px" />
        <br />
                    <br />
                    &nbsp;Show Performance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Show" CssClass="btn btn-success" Height="31px" Width="68px" />
                    <br />
                    <br />
                    &nbsp;Import Data From .xlsx File&nbsp; :
                    <asp:Button ID="Button6" runat="server" Text="Add" OnClick="Button6_Click" CssClass="btn btn-warning" Height="34px" Width="68px" />
                    <br />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="examid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Visible="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-bordered table-striped" Height="16px" Width="448px">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="max_marks" HeaderText="max_marks" SortExpression="max_marks" />
                            <asp:BoundField DataField="weightage" HeaderText="weightage" SortExpression="weightage" />
                            <asp:BoundField DataField="exam_name" HeaderText="exam_name" SortExpression="exam_name" />
                            <asp:BoundField DataField="examid" HeaderText="examid" InsertVisible="False" ReadOnly="True" SortExpression="examid" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#e0e0e0"/>
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [max_marks], [weightage], [exam_name], [examid] FROM [exam] WHERE (([facid] = @facid) AND ([groupid] = @groupid) AND ([courseid] = @courseid))">
                        <SelectParameters>
                            <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                            <asp:SessionParameter Name="groupid" SessionField="groupid" Type="String" />
                            <asp:SessionParameter Name="courseid" SessionField="courseid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Visible="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-bordered table-striped" Height="16px">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                            <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
                            <asp:BoundField DataField="examid" HeaderText="examid" SortExpression="examid" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentid], [marks], [examid] FROM [marks] WHERE ([examid] = @examid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="examid" SessionField="examid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
        <br />
                    <asp:Label ID="Label4" runat="server" Text="Enter Updated Marks :" Visible="False"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server" style="margin-left: 15px" Visible="False"></asp:TextBox>
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Update" Visible="False" CssClass="btn btn-success" />
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
