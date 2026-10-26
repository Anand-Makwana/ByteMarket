<%@ Page Title="Sign In & Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ByteMarket.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Breadcrumb & Header -->
    <div style="background-color: var(--bg-subtle); border-bottom: 1px solid var(--border-color); padding: 28px 0;">
        <div class="container" style="text-align: center;">
            <h1 style="font-size: 2.2rem; margin-bottom: 6px;">Welcome to ByteMarket</h1>
            <p style="color: var(--text-muted); font-size: 1rem; margin-bottom: 0;">
                Sign in to manage your digital purchases, licenses, or creator earnings.
            </p>
        </div>
    </div>

    <div class="container section-py-sm">
        <div class="auth-wrapper">
            <!-- Tabs: Sign In / Create Account -->
            <div class="auth-tabs">
                <div class="auth-tab active" id="tabLoginBtn" onclick="switchAuthTab('login')">
                    Sign In
                </div>
                <div class="auth-tab" id="tabRegisterBtn" onclick="switchAuthTab('register')">
                    Create Account
                </div>
            </div>

            <!-- Form: Sign In -->
            <div id="loginFormPanel">
                <div class="form-group">
                    <label class="form-label" for="<%= txteml.ClientID %>">Email Address</label>
                    <asp:TextBox ID="txteml" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter your email address"></asp:TextBox>
                </div>

                <div class="form-group">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 6px;">
                        <label class="form-label" for="<%= txtpass.ClientID %>" style="margin-bottom: 0;">Password</label>
                        <a href="#" onclick="alert('Password reset link sent to your email.'); return false;" style="font-size: 0.82rem;">Forgot password?</a>
                    </div>
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                </div>

                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px;">
                    <label style="display: flex; align-items: center; gap: 8px; font-size: 0.88rem; cursor: pointer; color: var(--text-secondary);">
                        <input type="checkbox" id="rememberMe" checked="checked" style="accent-color: var(--primary);" />
                        <span>Remember this device</span>
                    </label>
                </div>

                <asp:Button ID="btnlogin" runat="server" Text="Sign In to ByteMarket" CssClass="btn btn-primary btn-block btn-lg" OnClick="btnlogin_Click" />
            </div>

            <!-- Form: Create Account -->
            <div id="registerFormPanel" style="display: none;">
                <div class="form-group">
                    <label class="form-label" for="<%= txtregname.ClientID %>">Full Name</label>
                    <asp:TextBox ID="txtregname" runat="server" CssClass="form-control" placeholder="e.g. John Doe"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label" for="<%= txtregemail.ClientID %>">Email Address</label>
                    <asp:TextBox ID="txtregemail" runat="server" TextMode="Email" CssClass="form-control" placeholder="name@example.com"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label" for="<%= ddlrole.ClientID %>">I want to:</label>
                    <asp:DropDownList ID="ddlrole" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Buyer">Buy digital assets &amp; templates (Buyer)</asp:ListItem>
                        <asp:ListItem Value="Seller">Sell my templates &amp; digital products (Seller)</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label" for="<%= txtregmobile.ClientID %>">Mobile Number</label>
                    <asp:TextBox ID="txtregmobile" runat="server" CssClass="form-control" placeholder="e.g. 9876543210"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label" for="<%= txtregcity.ClientID %>">City</label>
                    <asp:TextBox ID="txtregcity" runat="server" CssClass="form-control" placeholder="e.g. Rajkot"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label" for="<%= txtregpass.ClientID %>">Password</label>
                    <asp:TextBox ID="txtregpass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Minimum 6 characters"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label style="display: flex; align-items: flex-start; gap: 8px; font-size: 0.82rem; cursor: pointer; color: var(--text-secondary);">
                        <input type="checkbox" id="regAgree" checked="checked" style="margin-top: 3px; accent-color: var(--primary);" />
                        <span>I agree to ByteMarket's Terms of Service and Privacy Policy.</span>
                    </label>
                </div>

                <asp:Button ID="btnreg" runat="server" Text="Create Free Account" CssClass="btn btn-teal btn-block btn-lg" OnClick="btnreg_Click" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        function switchAuthTab(tab) {
            const loginBtn = document.getElementById('tabLoginBtn');
            const regBtn = document.getElementById('tabRegisterBtn');
            const loginPanel = document.getElementById('loginFormPanel');
            const regPanel = document.getElementById('registerFormPanel');

            if (tab === 'login') {
                loginBtn.classList.add('active');
                regBtn.classList.remove('active');
                loginPanel.style.display = 'block';
                regPanel.style.display = 'none';
            } else {
                regBtn.classList.add('active');
                loginBtn.classList.remove('active');
                regPanel.style.display = 'block';
                loginPanel.style.display = 'none';
            }
        }
    </script>
</asp:Content>
