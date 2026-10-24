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

            <!-- Demo Fast-Login Strip -->
            <div style="background: var(--bg-subtle); border: 1px solid var(--border-color); border-radius: var(--radius-md); padding: 14px; margin-bottom: 24px;">
                <div style="font-size: 0.78rem; font-weight: 700; color: var(--text-muted); text-transform: uppercase; margin-bottom: 8px;">
                    Fast Demo One-Click Sign In:
                </div>
                <div class="demo-account-pills">
                    <span class="demo-pill" onclick="quickFill('alex.rivera@example.com', 'buyer')">Buyer Account</span>
                    <span class="demo-pill" onclick="quickFill('marcus.vance@example.com', 'seller')">Creator / Seller</span>
                    <span class="demo-pill" onclick="quickFill('sarah.admin@bytemarket.io', 'admin')">Admin Account</span>
                </div>
            </div>

            <!-- Form: Sign In -->
            <div id="loginFormPanel">
                <div class="form-group">
                    <label class="form-label" for="loginEmail">Email Address</label>
                    <input type="email" id="loginEmail" class="form-control" placeholder="name@example.com" value="alex.rivera@example.com" />
                    <div class="invalid-feedback" id="loginEmailErr">Please enter a valid email address.</div>
                </div>

                <div class="form-group">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 6px;">
                        <label class="form-label" for="loginPassword" style="margin-bottom: 0;">Password</label>
                        <a href="#" onclick="alert('Password reset link simulated sent to your email.'); return false;" style="font-size: 0.82rem;">Forgot password?</a>
                    </div>
                    <input type="password" id="loginPassword" class="form-control" placeholder="••••••••" value="demo12345" />
                    <div class="invalid-feedback" id="loginPasswordErr">Password must be at least 6 characters.</div>
                </div>

                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px;">
                    <label style="display: flex; align-items: center; gap: 8px; font-size: 0.88rem; cursor: pointer; color: var(--text-secondary);">
                        <input type="checkbox" id="rememberMe" checked style="accent-color: var(--primary);" />
                        <span>Remember this device</span>
                    </label>
                </div>

                <button type="button" class="btn btn-primary btn-block btn-lg" id="btnSubmitLogin">
                    Sign In to ByteMarket
                </button>
            </div>

            <!-- Form: Create Account -->
            <div id="registerFormPanel" style="display: none;">
                <div class="form-group">
                    <label class="form-label" for="regName">Full Name</label>
                    <input type="text" id="regName" class="form-control" placeholder="e.g. Jordan Miller" />
                    <div class="invalid-feedback" id="regNameErr">Please enter your full name.</div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="regEmail">Email Address</label>
                    <input type="email" id="regEmail" class="form-control" placeholder="name@example.com" />
                    <div class="invalid-feedback" id="regEmailErr">Please enter a valid email address.</div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="regAccountType">I want to:</label>
                    <select id="regAccountType" class="form-control">
                        <option value="buyer">Buy digital assets &amp; templates</option>
                        <option value="seller">Sell my templates &amp; digital products</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label" for="regPassword">Password</label>
                    <input type="password" id="regPassword" class="form-control" placeholder="Minimum 6 characters" />
                    <div class="invalid-feedback" id="regPasswordErr">Password must be at least 6 characters.</div>
                </div>

                <div class="form-group">
                    <label style="display: flex; align-items: flex-start; gap: 8px; font-size: 0.82rem; cursor: pointer; color: var(--text-secondary);">
                        <input type="checkbox" id="regAgree" checked style="margin-top: 3px; accent-color: var(--primary);" />
                        <span>I agree to ByteMarket's Terms of Service and Privacy Policy.</span>
                    </label>
                </div>

                <button type="button" class="btn btn-teal btn-block btn-lg" id="btnSubmitRegister">
                    Create Free Account
                </button>
            </div>

            <div style="text-align: center; margin-top: 24px; font-size: 0.85rem; color: var(--text-muted);">
                Frontend demonstration only. No database connectivity required.
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        let selectedRole = 'buyer';

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

        function quickFill(email, role) {
            document.getElementById('loginEmail').value = email;
            document.getElementById('loginPassword').value = 'demo12345';
            selectedRole = role;
            ByteMarketStore.showToast(`Selected ${role.toUpperCase()} demo profile`, 'teal');
        }

        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('btnSubmitLogin').addEventListener('click', function (e) {
                e.preventDefault();
                const emailEl = document.getElementById('loginEmail');
                const passEl = document.getElementById('loginPassword');
                let valid = true;

                if (!emailEl.value.includes('@') || !emailEl.value.includes('.')) {
                    emailEl.classList.add('is-invalid');
                    valid = false;
                } else {
                    emailEl.classList.remove('is-invalid');
                }

                if (passEl.value.length < 6) {
                    passEl.classList.add('is-invalid');
                    valid = false;
                } else {
                    passEl.classList.remove('is-invalid');
                }

                if (!valid) return;

                const emailVal = emailEl.value.toLowerCase();
                let role = selectedRole;
                let name = 'Alex Rivera';
                if (emailVal.includes('seller') || emailVal.includes('marcus')) {
                    role = 'seller';
                    name = 'Marcus Vance';
                } else if (emailVal.includes('admin') || emailVal.includes('sarah')) {
                    role = 'admin';
                    name = 'Sarah Connor';
                }

                ByteMarketStore.setUser({
                    isLoggedIn: true,
                    name: name,
                    email: emailVal,
                    role: role,
                    avatarText: name.split(' ').map(n => n[0]).join('')
                });

                ByteMarketStore.showToast(`Welcome back, ${name}! Redirecting...`, 'success');
                setTimeout(() => {
                    const base = ByteMarketStore.getBaseUrl();
                    if (role === 'seller') window.location.href = base + 'Seller/SellerDashboard.aspx';
                    else if (role === 'admin') window.location.href = base + 'Admin/AdminDashboard.aspx';
                    else window.location.href = base + 'User/BuyerDashboard.aspx';
                }, 600);
            });

            document.getElementById('btnSubmitRegister').addEventListener('click', function (e) {
                e.preventDefault();
                const nameEl = document.getElementById('regName');
                const emailEl = document.getElementById('regEmail');
                const passEl = document.getElementById('regPassword');
                let valid = true;

                if (nameEl.value.trim().length < 2) {
                    nameEl.classList.add('is-invalid');
                    valid = false;
                } else {
                    nameEl.classList.remove('is-invalid');
                }

                if (!emailEl.value.includes('@') || !emailEl.value.includes('.')) {
                    emailEl.classList.add('is-invalid');
                    valid = false;
                } else {
                    emailEl.classList.remove('is-invalid');
                }

                if (passEl.value.length < 6) {
                    passEl.classList.add('is-invalid');
                    valid = false;
                } else {
                    passEl.classList.remove('is-invalid');
                }

                if (!valid) return;

                const role = document.getElementById('regAccountType').value;
                const name = nameEl.value.trim();

                ByteMarketStore.setUser({
                    isLoggedIn: true,
                    name: name,
                    email: emailEl.value.trim(),
                    role: role,
                    avatarText: name.split(' ').map(n => n[0]).join('').substring(0, 2)
                });

                ByteMarketStore.showToast('Account registered successfully! Redirecting...', 'success');
                setTimeout(() => {
                    const base = ByteMarketStore.getBaseUrl();
                    if (role === 'seller') window.location.href = base + 'Seller/SellerDashboard.aspx';
                    else window.location.href = base + 'User/BuyerDashboard.aspx';
                }, 600);
            });
        });
    </script>
</asp:Content>
