<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JSMaturski.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="loginstil.css"/>
    <title>E-dinar Log in</title>
</head>
    <script type="text/javascript">  function preventBack() { window.history.forward(); } setTimeout("preventBack()", 0); window.onunload = function () { null };</script>

<body>
    <form id="form1" runat="server" class="form" >
        <div class="title">Dobrodosli</div>
        <div class="subtitle">Unesite trazene podatke kako biste nastavili!</div>
        <div  class="input-container ic1">
        <asp:TextBox ID="txt_email" cssClass="input" TextMode="Email" runat="server"></asp:TextBox>
              <div class="cut"></div>
            <label for="firstname" class="placeholder">E-mail</label>
            </div>
        <div class="input-container ic2">
            <asp:TextBox ID="txt_passw" cssClass="input" TextMode="Password" runat="server"></asp:TextBox>
   <div class="cut"></div>
        <label for="lastname" class="placeholder">Password</label>
      </div>
            <asp:Button ID="prijava" CssClass="submit" runat="server" Text="Prijava" OnClick="prijava_Click" />
     
    </form>
</body>
</html>
