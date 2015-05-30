<%@ Page Language="C#" AutoEventWireup="true" CodeFile="grading2.aspx.cs" Inherits="grading2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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
            width: 93px;
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
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View All" />
                    <br />
                    <asp:GridView ID="GridView2" runat="server">
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Search" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Enter Roll no OF particular student  :    " Visible="False"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Submit" Visible="False" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="exam_name" HeaderText="exam_name" SortExpression="exam_name" />
                            <asp:BoundField DataField="weightage" HeaderText="weightage" SortExpression="weightage" />
                            <asp:BoundField DataField="max_marks" HeaderText="max_marks" SortExpression="max_marks" />
                            <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT exam.exam_name, exam.weightage, exam.max_marks, marks.marks FROM exam INNER JOIN marks ON exam.examid = marks.examid WHERE (exam.facid = @fid) AND (exam.courseid = @cid) AND (exam.groupid = @gid) AND (marks.studentid = @sid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="fid" SessionField="id" />
                            <asp:SessionParameter Name="cid" SessionField="courseid" />
                            <asp:SessionParameter Name="gid" SessionField="groupid" />
                            <asp:ControlParameter ControlID="TextBox1" Name="sid" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
