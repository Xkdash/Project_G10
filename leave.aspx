<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="leave.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
           #tleave{
            height:383px;
        }
           #tleave select{
               border-radius:7px;
               
           }
           #lhistory{
               border-radius:7px;
           }
         .mlc{
               color:#170B3B;
               
               font-size:20px;
           }
       .auto-style17 {
           color: #000066;
           font-weight: bold;
           font-size: medium;
       }
       #lcon{
           padding:20px;
       }
       #tleave{
           padding:20px;
       }
    .auto-style25 {
            width: 601px;
        }
           #tleave0{
            background:linear-gradient(#D8CEF6,white);
            height:300px;
        }
           #lhistory0{
               border-radius:7px;
           }
         #tleave0{
           padding:20px;
       }
        .auto-style26 {
            width: 100%;
        }
        .auto-style27 {
            width: 181px;
        }
        .auto-style28 {
            width: 299px;
        }
        .auto-style29 {
            width: 299px;
        }
        .auto-style30 {
            width: 181px;
        }
    </style>
    <div id="lcon">
  <div id="lhistory">
      <p class="auto-style17">Remaing Leaves<asp:Button ID="Button4" runat="server" OnClick="Button4_Click1" style="margin-left: 27px" Text="Show" />
      </p>
      <p class="auto-style17">
          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Visible="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
              <AlternatingRowStyle BackColor="#CCCCCC" />
              <Columns>
                  <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                  <asp:BoundField DataField="remain" HeaderText="remain" SortExpression="remain" />
              </Columns>
              <FooterStyle BackColor="#CCCCCC" />
              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#808080" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#383838" />
          </asp:GridView>
      </p>
      <div id="tleave">
          <form >
              <table>
                  <tr>
                      <td>
                          <label class="mlc">
                          TAKE LEAVE<br />
                          <br />
                          Leave type</label><br /></td>
                  </tr>
              </table>
&nbsp;<table>
                  <tr>
                      <td class="auto-style25">
                          <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="type">
                          </asp:DropDownList>
                          <br />
                          <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [leave_type]"></asp:SqlDataSource>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style25">
                          <label class="mlc">
                          Leave Date Range</label>
                          <br />
                          <label>
                          From</label>&nbsp;
                          <asp:TextBox ID="date1" runat="server"></asp:TextBox>
                          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="cal" Width="57px" />
                          <label>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Label ID="Label1" runat="server" style="color: #FF0000"></asp:Label>
                          <br />
                          <br />To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          </label>
                          <asp:TextBox ID="date2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="cal" Width="53px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Label ID="Label2" runat="server" ForeColor="#FF3300"></asp:Label>
                          <br />
                          <br /></td>
                  </tr>
                  <tr>
                      <td class="auto-style25">
                          <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" VisibleDate="2015-03-01">
                              <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                              <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                              <OtherMonthDayStyle ForeColor="#CC9966" />
                              <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                              <SelectorStyle BackColor="#FFCC66" />
                              <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                              <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                          </asp:Calendar>
                          <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged" Visible="False" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" style="margin-right: 238px">
                              <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                              <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                              <OtherMonthDayStyle ForeColor="#CC9966" />
                              <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                              <SelectorStyle BackColor="#FFCC66" />
                              <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                              <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                          </asp:Calendar>
                          <br />
                          <br />
                          <asp:TextBox ID="TextBox1" runat="server" Height="60px" Width="386px"></asp:TextBox>
                          (maximum 500 charectar)</td>
                  </tr>
              </table>
           
            &nbsp;</form>
          <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="apply" />
          <br />
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [leave_details]"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [startdate], [enddate], [type] FROM [leave_details] WHERE (([facid] = @facid) AND ([enddate] &gt; @enddate)) ORDER BY [startdate] DESC">
              <SelectParameters>
                  <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                  <asp:SessionParameter DbType="Date" Name="enddate" SessionField="today" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [leave_type]"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [type], [remain] FROM [leave_remain] WHERE (([facid] = @facid) AND ([year] = @year))">
              <SelectParameters>
                  <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                  <asp:SessionParameter Name="year" SessionField="date" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>
          <br />
          <br />
          <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [startdate], [enddate], [type] FROM [leave_details] WHERE (([facid] = @facid) AND ([startdate] &gt; @startdate) AND ([confirmflag] = @confirmflag)) ORDER BY [startdate] DESC">
              <SelectParameters>
                  <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                  <asp:SessionParameter DbType="Date" Name="startdate" SessionField="today" />
                  <asp:Parameter DefaultValue="3" Name="confirmflag" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>
          <table align="right" class="auto-style26">
              <tr>
                  <td align="left" style="vertical-align: top ">Cancel&nbsp; Leave&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Select Leave" />
          <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" Visible="False">
              <Columns>
                  <asp:CommandField ShowSelectButton="True" />
                  <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                  <asp:BoundField DataField="enddate" HeaderText="enddate" SortExpression="enddate" />
                  <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
              </Columns>
          </asp:GridView>
                  </td>
                  <td align="left" style="vertical-align: top ">
                      <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Pending Leaves" />
                      <br />
                      <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="margin-left: 0px" Visible="False">
                          <Columns>
                              <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                              <asp:BoundField DataField="enddate" HeaderText="enddate" SortExpression="enddate" />
                              <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                              <asp:BoundField DataField="textDescp" HeaderText="textDescp" SortExpression="textDescp" />
                          </Columns>
                      </asp:GridView>
                  </td>
              </tr>
              <tr>
                  <td align="left" style="vertical-align: top ">
                      <br />
                      <br />
                      LEAVE HISTORY<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" style="margin-left: 24px" Text="Show" />
                      <br />
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource9" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" Visible="False">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
              <asp:BoundField DataField="enddate" HeaderText="enddate" SortExpression="enddate" />
              <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
              <asp:BoundField DataField="textDescp" HeaderText="textDescp" SortExpression="textDescp" />
          </Columns>
          <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
          <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
          <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
          <SortedAscendingCellStyle BackColor="#FDF5AC" />
          <SortedAscendingHeaderStyle BackColor="#4D0000" />
          <SortedDescendingCellStyle BackColor="#FCF6C0" />
          <SortedDescendingHeaderStyle BackColor="#820000" />
          </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [startdate], [enddate], [type], [textDescp] FROM [leave_details] WHERE (([facid] = @facid) AND ([confirmflag] = @confirmflag))">
                          <SelectParameters>
                              <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                              <asp:Parameter DefaultValue="3" Name="confirmflag" Type="Int32" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                  </td>
                  <td align="left" style="vertical-align: top ">
                      <br />
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [startdate], [enddate], [type], [textDescp] FROM [leave_details] WHERE (([facid] = @facid) AND ([confirmflag] &lt; @confirmflag3) AND ([confirmflag] &gt; @confirmflag))">
                          <SelectParameters>
                              <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                              <asp:Parameter DefaultValue="3" Name="confirmflag3" Type="Int32" />
                              <asp:Parameter DefaultValue="0" Name="confirmflag" Type="Int32" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                      <br />
                      <br />
                      <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Rejected Leaves" />
                      <br />
                      <br />
                      <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8" Visible="False">
                          <Columns>
                              <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                              <asp:BoundField DataField="enddate" HeaderText="enddate" SortExpression="enddate" />
                              <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                              <asp:BoundField DataField="textDescp" HeaderText="textDescp" SortExpression="textDescp" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [startdate], [enddate], [type], [textDescp] FROM [leave_details] WHERE (([facid] = @facid) AND ([confirmflag] &lt; @confirmflag))">
                          <SelectParameters>
                              <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                              <asp:Parameter DefaultValue="0" Name="confirmflag" Type="Int32" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                  </td>
              </tr>
          </table>
          <br />
        </div>
    
  </div>
        </div>

</asp:Content>

