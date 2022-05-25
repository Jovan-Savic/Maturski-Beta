<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Racunovodja.aspx.cs" Inherits="JSMaturski.Racunovodja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Racun.css" />
    <title>Edinar - Racunovodjstvo</title>
</head>
    <script type="text/javascript">  function preventBack() { window.history.forward(); } setTimeout("preventBack()", 0); window.onunload = function () { null };</script>

<body>
    <form id="form1" runat="server" class="forma">
        <div class="logout">
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Ime" runat="server" CssClass="title" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
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
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br/>
            <br />
            </div> 
        <asp:GridView ID="GridView1" runat="server" CssClass="gridic" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="id_dinara" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="270px" DataSourceID="SqlDataSource3" PageSize="5">
             <Columns>
                 <asp:BoundField DataField="id_dinara" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_dinara" />
                 <asp:BoundField DataField="ime" HeaderText="Ime" SortExpression="ime" />
                 <asp:BoundField DataField="prezime" HeaderText="Prezime" SortExpression="prezime" />
                 <asp:BoundField DataField="ime1" HeaderText="Ime profesora" SortExpression="ime1" />
                 <asp:BoundField DataField="prezime1" HeaderText="Prezime profesora" SortExpression="prezime1" />
                 <asp:BoundField DataField="datum" HeaderText="Datum" SortExpression="datum" />
                 <asp:BoundField DataField="iznos" HeaderText="Iznos" SortExpression="iznos" />
                 <asp:BoundField DataField="uplacen" HeaderText="Uplacen" SortExpression="uplacen" />
                 <asp:TemplateField HeaderText="Kontrole">
                    <ItemTemplate>
                        <asp:LinkButton ID="Selsect" CssClass="linkic" runat="server" Text="Izmeni" CommandArgument='<% #Eval("id_dinara")%>' OnClick="Selsect_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="Kontrole">
                    <ItemTemplate>
                        <asp:LinkButton ID="Selssect" CssClass="linkic" runat="server" Text="Obrisi" CommandArgument='<% #Eval("id_dinara")%>' OnClick="Obrisi_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
             </Columns>
              <FooterStyle CssClass="headerr" />
            <HeaderStyle BorderStyle="None" CssClass="headerr" />
            <PagerStyle CssClass="headerr" />
        </asp:GridView>
           
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Djacki %>" SelectCommand="Popunirac" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        
        <asp:Button ID="Button1" CssClass="submit" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 990px; top: 488px; position: absolute; width: 96px" Text="Potvrdi" />
        
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Djacki %>" SelectCommand="SELECT [id], [prezime] FROM [Profesor]"></asp:SqlDataSource>
        <asp:GridView ID="GridView3" class="gridic3" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dinara" style="z-index: 1; left: 1140px; top: 311px; position: absolute; height: 372px; width: 187px; margin-top: 0px;" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="id_dinara" HeaderText="id_dinara" InsertVisible="False" ReadOnly="True" SortExpression="id_dinara" />
                <asp:BoundField DataField="ime" HeaderText="ime" SortExpression="ime" />
                <asp:BoundField DataField="prezime" HeaderText="prezime" SortExpression="prezime" />
                <asp:BoundField DataField="datum" HeaderText="datum" SortExpression="datum" />
                <asp:BoundField DataField="iznos" HeaderText="iznos" SortExpression="iznos" />
                <asp:BoundField DataField="uplacen" HeaderText="uplacen" SortExpression="uplacen" />
            </Columns>
             <FooterStyle CssClass="headerr" />
            <HeaderStyle BorderStyle="None" CssClass="headerr" />
            <PagerStyle CssClass="headerr" />
        </asp:GridView>
  

        
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="prezime" DataValueField="id" style="z-index: 1; left: 994px; top: 460px; position: absolute">
        </asp:DropDownList>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 842px; top: 429px; position: absolute; height: 19px; width: 271px" Text="Izaberite profesora za pojedinacan pregled"></asp:Label>
        
        <asp:GridView ID="GridView2" runat="server" CssClass="gridic2" Height="270px" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" Width="442px"  AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="ime" HeaderText="ime" SortExpression="ime" />
                    <asp:BoundField DataField="prezime" HeaderText="prezime" SortExpression="prezime" />
                    <asp:BoundField DataField="jmbg" HeaderText="jmbg" SortExpression="jmbg" />
                </Columns>
            <FooterStyle CssClass="headerr" />
            <HeaderStyle BorderStyle="None" CssClass="headerr" />
            <PagerStyle CssClass="headerr" />
            </asp:GridView>
            
        <asp:Panel ID="Dodajdinar" CssClass="paneldd" runat="server" GroupingText="Dodaj uplatu" Width="276px" style="margin-left: 0px">
            Ime i prezime ucenika:
            <br />
            <asp:TextBox ID="txt_imeuc" runat="server"/>
            <asp:TextBox ID="txt_prezimeuc" runat="server"/>

            <br />
            Izaberite Profesora<br />

            <asp:DropDownList ID="Prof" runat="server" DataSourceID="SqlDataSource1" DataTextField="prezime" DataValueField="id" Height="20px" Width="169px">
            </asp:DropDownList>
            <br/>
            Izaberite datum<br />
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
            Izaberite iznos<br />
            <asp:TextBox ID="txt_iznos" runat="server"></asp:TextBox>
            <br />
            <asp:CheckBox ID="Chuplacen" runat="server" Text="Vec uplacen" />
            <br />
            <asp:Button ID="dodaj" runat="server" Height="40px"  CssClass="submit" OnClick="dodaj_Click" Text="Dodaj" Width="132px" />
        </asp:Panel>


        
        <asp:Panel ID="Dodajucenika" CssClass="paneldu" runat="server" GroupingText="Dodaj ucenika" Width="276px">
            Ime i prezime ucenika:
            <br />
            <asp:TextBox ID="txt_imeucd" runat="server"/>
            <asp:TextBox ID="txt_prezimeucd" runat="server"/>

            <br />
            Jmbg ucenika:<br />
            <asp:TextBox ID="txt_jmbg" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="dodajuc" runat="server" Height="40px"  CssClass="submit" OnClick="dodajuc_Click" Text="Potvrdi" Width="132px" />
            <br />
        </asp:Panel>

      
        
        <asp:Panel ID="Obrisiucenika" CssClass="panelou" runat="server" GroupingText="Obrisi ucenika" Width="276px">
            Ime i prezime ucenika:
            <br />
            <asp:TextBox ID="txt_imeucobr" runat="server"/>
            <asp:TextBox ID="txt_prezimeucobr" runat="server"/>

            <br />
            Jmbg ucenika:<br />
            <asp:TextBox ID="txt_jmbgo" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Obrisi_uc" runat="server" CssClass="submit" OnClick="Obrisi_uc_Click" style="margin-top: 11px" Text="Potvrdi" Width="132px" Height="40px" />
        </asp:Panel>

             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Djacki %>" SelectCommand="SELECT [id], [ime], [prezime], [jmbg] FROM [Ucenik]"></asp:SqlDataSource>
      
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Djacki %>" SelectCommand="SELECT [prezime], [id] FROM [Profesor]"></asp:SqlDataSource>

        

        
        </form>
        <footer class="futer"> Jovan Savic Prva beogradska gimnazija</footer>
</body>
</html>
