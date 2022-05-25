<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="JSMaturski.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Main.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td class="baner" rowspan="2">a</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="id_dinara" PageSize="5" DataSourceID="Popuniracune">
                        <Columns>
                            <asp:BoundField DataField="id_dinara" HeaderText="id_dinara" InsertVisible="False" ReadOnly="True" SortExpression="id_dinara" />
                            <asp:BoundField DataField="ime" HeaderText="ime" SortExpression="ime" />
                            <asp:BoundField DataField="prezime" HeaderText="prezime" SortExpression="prezime" />
                            <asp:BoundField DataField="ime1" HeaderText="ime1" SortExpression="ime1" />
                            <asp:BoundField DataField="prezime1" HeaderText="prezime1" SortExpression="prezime1" />
                            <asp:BoundField DataField="datum" HeaderText="datum" SortExpression="datum" />
                            <asp:BoundField DataField="iznos" HeaderText="iznos" SortExpression="iznos" />
                            <asp:BoundField DataField="uplacen" HeaderText="uplacen" SortExpression="uplacen" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="Popuniracune" runat="server" ConnectionString="<%$ ConnectionStrings:Djacki %>" SelectCommand="Popunirac" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                <td >a</td>
                <td>a</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView2" runat="server"></asp:GridView>
                </td>
                <td >a</td>
                <td>a</td>

            </tr>

        </table>
    </form>
        
</body>
</html>
