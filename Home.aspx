<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: left;
            background-color: #666699;
            margin-left: 0px;
            height: 610px;
            margin-bottom: 4px;
        }
        .auto-style4 {
            width: 100%;
            height: 486px;
            margin-bottom: 0px;
            margin-left: 0px;
        }
        .auto-style7 {
            height: 402px;
            background-color: #FFFFFF;
        }
        .auto-style9 {
            text-align: center;
        }
        #LabEmpUserName{
            position:fixed;
        }
        #LabEmpPwd{
            position:fixed;
        }
        
        .auto-style30 {
            font-weight: 700;
            font-size: x-large;
            text-align: center;
            color: #FFFFFF;
            background-color: #33CC33;
            height: 26px;
        }
        .auto-style36 {
            font-weight: 700;
            font-size: xx-large;
            text-align: center;
            color: #FFFFFF;
            background-color: #388DAD;
            }
                
        .auto-style11 {
            width: 100%;
            height: 472px;
        }
                        
        .auto-style22 {
            width: 237px;
            }
        .auto-style23 {
            width: 583px;
            text-align: left;
            height: 1px;
        }
        .auto-style27 {
            width: 237px;
            height: 1px;
        }
        .auto-style38 {
            width: 237px;
            height: 193px;
        }
        .auto-style39 {
            height: 193px;
        }
        .auto-style40 {
            width: 237px;
            height: 74px;
        }
        .auto-style42 {
            width: 194px;
            background-color: #FFFFFF;
        }
                        
        .auto-style45 {
            width: 583px;
            text-align: left;
            height: 74px;
            background-color: #F0F0F0;
        }
                        
        </style>
</head>
<body style="height: 609px;">
    <form id="form1" runat="server">
        <table class="auto-style4" style="margin-left: 0px; height: 72px;">
            <tr>
                <td class="auto-style36" style="background:linear-gradient(90deg,white)">
                    Welcome to G-10 Portal<br />
                    User Login
                </td>
            </tr>
            <tr>
                <td class="auto-style30" style="linear-gradient(90deg, white); background-color: #388DAD;">
                     <marquee behaviour="slide" style="color: #0099FF; font-size: medium; background-color: #FFFFFF;">
                        <strong><asp:Label ID="LabNoti" runat="server" ></asp:Label></strong></marquee></td>
            </tr>
        </table>
        <table class="auto-style4">
            <tr>
                <td class="auto-style7">
                    <div class="auto-style9">
                        <asp:Panel ID="Panel4" runat="server" Height="471px" style="margin-top: 0px">
                            <table class="auto-style11">
                                <tr>
                                    <td class="auto-style42" rowspan="4">
                                        <asp:Panel ID="Panel5" runat="server" Height="482px" Width="172px" style="text-align: left; background-color: #388DAD;padding-left:2px;">
                                            <br />
                                            <br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <br />
                                            <br />
                                            &nbsp;&nbsp;<asp:Panel ID="Panel6" runat="server" Height="237px" style="margin-left: 0px; background-color: #388DAD;" Width="168px">
                                                &nbsp;
                                                <asp:Menu ID="NavigationMenu" runat="server" BackColor="#666699" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="White" staticsubmenuindent="10px" style="color: #FFFFFF; background-color: #388DAD" target="_self">
                                                    <dynamichoverstyle backcolor="#284E98" BorderStyle="Solid" Font-Size="Small" forecolor="White" />
                                                    <DynamicMenuItemStyle BackColor="#666699" BorderColor="#666699" BorderStyle="Solid" HorizontalPadding="5px" VerticalPadding="2px" />
                                                    <DynamicMenuStyle BackColor="#666699" />
                                                    <DynamicSelectedStyle BackColor="#507CD1" />
                                                    <items>
                                                        <asp:menuitem navigateurl="~/Home.aspx" text="Home" tooltip="Home"></asp:menuitem>
                                                        <asp:menuitem navigateurl="https://172.16.1.1" text="Employee Webmail" tooltip="Employee webmail" Value="Employee webmail"></asp:menuitem>
                                                        <asp:menuitem navigateurl="https://172.16.1.11/src/login.php?secure_login=yes" text="Student Webmail" tooltip="Student Webmail" Value="Student Webmail"></asp:menuitem>
                                                        <asp:menuitem navigateurl="http://172.16.1.6/index.php/2015-02-12-04-35-25/academics-calender" text="Academic Calendar" tooltip="Academic Calendar" Value="Academic calendar"></asp:menuitem>
                                                        <asp:menuitem navigateurl="http://172.16.1.230" text="Course Feedback" tooltip="Course Feedback" Value="Course Feedback"></asp:menuitem>
                                                        <asp:menuitem navigateurl="Admin_Courses.aspx" text="Course Pages" tooltip="Course Pages" Value="Course Pages"></asp:menuitem>
                                                        <asp:menuitem navigateurl="http://172.16.1.6/index.php/2015-02-12-04-35-25/list-of-holidays" text="List of Holidays" tooltip="List of Holidays" Value="List of Holiddays"></asp:menuitem>
                                                    </items>
                                                    <StaticHoverStyle BackColor="#EAEAEA" ForeColor="#388DAD" />
                                                    <StaticMenuItemStyle Font-Size="Medium" HorizontalPadding="5px" VerticalPadding="2px" />
                                                    <StaticSelectedStyle BackColor="#64D9FF" Font-Size="Small" />
                                                </asp:Menu>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <cc1:RoundedCornersExtender ID="Panel5_RoundedCornersExtender" runat="server" BehaviorID="Panel5_RoundedCornersExtender" TargetControlID="Panel5" />
                                    </td>
                                    <td class="auto-style22"></td>
                                    <td class="auto-style23">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Panel ID="Panel3" runat="server" Height="85px">
                                            <asp:Image ID="Image1" runat="server" Height="81px" ImageUrl="~/images/logo.jpg" style="margin-left: 0px" Width="552px" />
                                        </asp:Panel>
                                    </td>
                                    <td class="auto-style23">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style40">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
  
                                    </td>
                                    <td class="auto-style45" style="border-bottom-left-radius:10px;border-bottom-right-radius:10px;border-top-left-radius:10px;border-top-right-radius:10px;padding-bottom:12px;padding-top:12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        &nbsp;
                                        <asp:Label ID="LabEmpUserName" runat="server" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                        &nbsp;
                                        <asp:Label ID="LabEmpPwd" runat="server" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="Button1" runat="server" Text="Login"  OnClick="Button1_Click" style="margin-left: 0px;" CssClass="btn btn-info" Height="34px" />
                                        <br />
                                    </td>
                                    <td class="auto-style45" style="background-color:white"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style27"></td>
                                    <td class="auto-style23">
                                        <h3 style="text-align: center; height: 25px; color: #FFFFFF; width: 679px; margin-bottom: 0px; ">News Portal</h3>
                                    </td>
                                    <td class="auto-style23"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style38">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [loginDB]"></asp:SqlDataSource>
                                    </td>
                                    <td style="text-align: left" class="auto-style39" >
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                        <asp:Panel ID="Panel2" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" Height="177px" style="color: #66FF99; background:linear-gradient(#CCCCFF,white)">
                                            
                                            <marquee direction="up" style="color: #388DAD; text-align: center; height: 176px; margin-top: 0px;"1" align="left" onmouseover="this.stop();" onmouseout="this.start() "><strong><asp:Label ID="LabNews" runat="server" Text="LabNews"></asp:Label></strong></marquee></asp:Panel>
                                        <cc1:RoundedCornersExtender ID="Panel2_RoundedCornersExtender" runat="server" BehaviorID="Panel2_RoundedCornersExtender" TargetControlID="Panel2" Radius="10" />
                                    </td>
                                    <td style="text-align: left" class="auto-style39" ></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
