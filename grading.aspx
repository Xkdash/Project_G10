<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="grading.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style7 {
        color: #0000CC;
    }
    .auto-style8 {
        color: #000066;
        font-weight: bold;
    }
    .auto-style10 {
        color: #000066;
        font-weight: bold;
        width: 56px;
    }
    .auto-style11 {
        width: 56px;
    }
    .auto-style13 {
        color: #FF0000;
        font-size: large;
    }
        .auto-style14 {
            color: #000066;
            font-weight: bold;
            width: 114px;
        }
        .auto-style15 {
            width: 114px;
        }
        .auto-style20 {
            color: #000066;
            font-weight: bold;
            width: 40px;
        }
        .auto-style21 {
            width: 40px;
        }
        .auto-style22 {
            width: 56px;
            height: 23px;
        }
        .auto-style23 {
            width: 40px;
            height: 23px;
        }
        .auto-style24 {
            width: 114px;
            height: 23px;
        }
        .auto-style25 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style13">
        <strong>GRADING</strong></p>
    <p class="auto-style13">
        SELECT COURSE</p>
<table class="auto-style7">
    <tr>
        <td class="auto-style10">&nbsp;&nbsp;&nbsp; &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="courseid" HeaderText="courseid" SortExpression="courseid" />
                <asp:BoundField DataField="groupid" HeaderText="groupid" SortExpression="groupid" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [courseid], [groupid] FROM [course_fac] WHERE ([facid] = @facid)">
                <SelectParameters>
                    <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td class="auto-style20">&nbsp;</td>
        <td class="auto-style14">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style11">&nbsp;</td>
        <td class="auto-style21">&nbsp;</td>
        <td class="auto-style15">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style11">&nbsp;</td>
        <td class="auto-style21">&nbsp;</td>
        <td class="auto-style15">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style11">&nbsp;</td>
        <td class="auto-style21">&nbsp;</td>
        <td class="auto-style15">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style22"></td>
        <td class="auto-style23"></td>
        <td class="auto-style24"></td>
        <td class="auto-style25"></td>
    </tr>
</table>
</asp:Content>

