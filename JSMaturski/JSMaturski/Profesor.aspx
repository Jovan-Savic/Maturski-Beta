<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profesor.aspx.cs" Inherits="JSMaturski.Profesor" EnableEventValidation="true" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="profesor.css" />
    <title>Pregled ucenika</title>
</head>
    <script type="text/javascript">  function preventBack() { window.history.forward(); } setTimeout("preventBack()", 0); window.onunload = function () { null };</script>

<body>
    <form id="form1" runat="server" class="forma">
        <div class="logout">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Ime" runat="server" CssClass="title" Text="Label"></asp:Label>
            <asp:GridView ID="GridView1" CssClass="gridic" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dinara" DataSourceID="SqlDataSource1" style="z-index: 1; left: 300px; top: 41px; position: absolute; height: 565px; width: 1184px">
                <Columns>
                    <asp:BoundField DataField="id_dinara" HeaderText="id_dinara" InsertVisible="False" ReadOnly="True" SortExpression="id_dinara" />
                    <asp:BoundField DataField="ime" HeaderText="ime" SortExpression="ime" />
                    <asp:BoundField DataField="prezime" HeaderText="prezime" SortExpression="prezime" />
                    <asp:BoundField DataField="datum" HeaderText="datum" SortExpression="datum" />
                    <asp:BoundField DataField="iznos" HeaderText="iznos" SortExpression="iznos" />
                    <asp:BoundField DataField="uplacen" HeaderText="uplacen" SortExpression="uplacen" />
                    <asp:TemplateField HeaderText="Kontrole">
                    <ItemTemplate>
                        <asp:LinkButton ID="Selsect" CssClass="linkic" runat="server" Text="Izmeni" CommandArgument='<% #Eval("id_dinara")%>' OnClick="Selsect_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="headerr" />
            <HeaderStyle BorderStyle="None" CssClass="headerr" />
            <PagerStyle CssClass="headerr" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Djacki %>" SelectCommand="Popuni" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="profesor_id" SessionField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
           <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            Uplacen iznos<br />
        <asp:Label ID="Label1" CssClass="Iznosi1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            Neuplacen iznos<br />
        <asp:Label ID="Label2" CssClass="Iznosi2" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />


          
            <asp:LinkButton ID="LinkButton1" CssClass="link" runat="server" OnClick="LinkButton1_Click" asp-action="Logout" >Izloguj se</asp:LinkButton>
            <br/>
               <br/>
               <br />
               <br />
            </div> 
        <div class ="gridd"> 
            </div>
        
             <footer class="futer"> Jovan Savic Prva beogradska gimnazija</footer>
    </form>
   
</body>
</html>
