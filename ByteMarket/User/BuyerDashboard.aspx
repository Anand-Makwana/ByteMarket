<%@ Page Title="Buyer Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuyerDashboard.aspx.cs" Inherits="ByteMarket.BuyerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header -->
    <div style="background-color: var(--bg-subtle); border-bottom: 1px solid var(--border-color); padding: 32px 0;">
        <div class="container">
            <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px;">
                <div>
                    <div style="font-size: 0.88rem; color: var(--text-muted); margin-bottom: 4px;">Account Portal</div>
                    <h1 style="font-size: 2.2rem; margin-bottom: 0;">Buyer Dashboard</h1>
                </div>
                <div style="display: flex; gap: 10px;">
                    <a href='<%= ResolveUrl("~/Products.aspx") %>' class="btn btn-outline btn-sm">Explore Marketplace</a>
                    <a href='<%= ResolveUrl("~/Seller/SellerDashboard.aspx") %>' class="btn btn-secondary btn-sm" onclick="ByteMarketStore.switchRole('seller', event)">Switch to Seller Mode</a>
                </div>
            </div>
        </div>
    </div>

    <div class="container section-py-sm">
        <div class="dashboard-layout">
            <!-- Left Sidebar Navigation -->
            <aside class="dashboard-nav-card">
                <div class="dash-user-header">
                    <div class="dash-avatar-lg" id="dashAvatar">AR</div>
                    <div>
                        <div style="font-weight: 800; color: var(--text-main); font-size: 1.1rem;" id="dashUserName">Alex Rivera</div>
                        <div style="font-size: 0.82rem; color: var(--text-muted);" id="dashUserEmail">alex.rivera@example.com</div>
                        <span class="badge badge-teal" style="margin-top: 6px;">Verified Buyer</span>
                    </div>
                </div>

                <ul class="dash-nav-links">
                    <li class="dash-nav-item active" onclick="switchBuyerTab('overview', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.template);</script></span> Overview
                    </li>
                    <li class="dash-nav-item" onclick="switchBuyerTab('downloads', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.download);</script></span> Digital Downloads
                    </li>
                    <li class="dash-nav-item" onclick="switchBuyerTab('orders', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.file);</script></span> Order History
                    </li>
                    <li class="dash-nav-item" onclick="switchBuyerTab('profile', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.folder);</script></span> Profile Settings
                    </li>
                    <li class="dash-nav-item" onclick="window.location.href=ByteMarketStore.getBaseUrl() + 'User/Wishlist.aspx'">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.heart);</script></span> Saved Wishlist
                    </li>
                </ul>
            </aside>

            <!-- Main Dashboard Panels -->
            <main>
                <!-- Key Stats -->
                <div class="dash-stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon purple"><script>document.write(ByteIcons.download);</script></div>
                        <div>
                            <div class="stat-info-title">Active Downloads</div>
                            <div class="stat-info-val" id="statDownloads">3</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon teal"><script>document.write(ByteIcons.file);</script></div>
                        <div>
                            <div class="stat-info-title">Completed Orders</div>
                            <div class="stat-info-val" id="statOrders">3</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon green"><script>document.write(ByteIcons.bolt);</script></div>
                        <div>
                            <div class="stat-info-title">Total Invested</div>
                            <div class="stat-info-val">$96.00</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon orange"><script>document.write(ByteIcons.key);</script></div>
                        <div>
                            <div class="stat-info-title">License Keys</div>
                            <div class="stat-info-val">3 Active</div>
                        </div>
                    </div>
                </div>

                <!-- Tab Panel: Overview & Recent Downloads -->
                <div id="buyer-overview" class="buyer-tab-panel">
                    <!-- Downloads Card -->
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <div>
                                <h3 style="font-size: 1.25rem;">My Digital Assets &amp; Downloads</h3>
                                <p style="font-size: 0.88rem; color: var(--text-muted); margin-bottom: 0;">Instant access to purchased templates, licenses, and files. Click 'Download Package' to save to your device.</p>
                            </div>
                            <button type="button" class="btn btn-outline btn-sm" onclick="switchBuyerTab('downloads')">View All Files</button>
                        </div>

                        <div style="display: flex; flex-direction: column; gap: 14px;" id="overviewDownloadsList">
                            <!-- Injected by script -->
                        </div>
                    </div>

                    <!-- Recent Orders Card -->
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.25rem;">Recent Order Receipts</h3>
                            <button type="button" class="btn btn-outline btn-sm" onclick="switchBuyerTab('orders')">Full History</button>
                        </div>

                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Order #</th>
                                    <th>Date</th>
                                    <th>Product Details</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                    <th>Invoice</th>
                                </tr>
                            </thead>
                            <tbody id="overviewOrdersTableBody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tab Panel: Downloads -->
                <div id="buyer-downloads" class="buyer-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <div>
                                <h3 style="font-size: 1.3rem;">Downloadable Resources &amp; Files</h3>
                                <p style="font-size: 0.9rem; color: var(--text-muted); margin-bottom: 0;">Click 'Download Package' on any product below to download the verified resource bundle immediately.</p>
                            </div>
                        </div>

                        <div style="display: flex; flex-direction: column; gap: 16px;" id="fullDownloadsList">
                            <!-- Injected by script -->
                        </div>
                    </div>
                </div>

                <!-- Tab Panel: Orders -->
                <div id="buyer-orders" class="buyer-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.3rem;">All Orders &amp; Invoices</h3>
                        </div>

                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Purchased Date</th>
                                    <th>Items</th>
                                    <th>License</th>
                                    <th>Total Paid</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="fullOrdersTableBody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tab Panel: Profile -->
                <div id="buyer-profile" class="buyer-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.3rem;">Buyer Profile Settings</h3>
                        </div>

                        <div style="max-width: 600px;">
                            <div class="form-group">
                                <label class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="profileNameInput" value="Alex Rivera" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="profileEmailInput" value="alex.rivera@example.com" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Country / Region</label>
                                <input type="text" class="form-control" value="United States" />
                            </div>
                            <button type="button" class="btn btn-primary" onclick="saveProfileChanges(event)">Save Changes</button>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        const samplePurchases = [
            {
                orderId: "BM-2026-9814",
                date: "Oct 16, 2026",
                title: "Nova Admin — Modern SaaS Dashboard UI Kit",
                category: "UI Kits",
                license: "Standard License",
                price: 29.00,
                status: "Completed",
                licenseKey: "NOVA-STD-9481-2201-BYTE",
                fileSize: "84.2 MB",
                version: "v2.4.0",
                fileSlug: "nova_admin_ui_kit"
            },
            {
                orderId: "BM-2026-8742",
                date: "Sep 28, 2026",
                title: "PixelGlyph — 1,500+ Minimal Line & Solid Icons",
                category: "Icons",
                license: "Extended License",
                price: 48.00,
                status: "Completed",
                licenseKey: "GLYPH-EXT-8812-4019-BYTE",
                fileSize: "22.5 MB",
                version: "v3.1.0",
                fileSlug: "pixelglyph_icons"
            },
            {
                orderId: "BM-2026-7601",
                date: "Aug 14, 2026",
                title: "DevForge — Developer Portfolio Template",
                category: "Templates",
                license: "Standard License",
                price: 19.00,
                status: "Completed",
                licenseKey: "FORGE-STD-1049-7731-BYTE",
                fileSize: "14.8 MB",
                version: "v1.8.2",
                fileSlug: "devforge_template"
            }
        ];

        document.addEventListener('DOMContentLoaded', function () {
            const user = ByteMarketStore.getUser();
            document.getElementById('dashUserName').textContent = user.name;
            document.getElementById('dashUserEmail').textContent = user.email || 'alex.rivera@example.com';
            document.getElementById('dashAvatar').textContent = user.avatarText || 'AR';
            document.getElementById('profileNameInput').value = user.name;
            document.getElementById('profileEmailInput').value = user.email || 'alex.rivera@example.com';

            renderPurchases();

            const urlParams = new URLSearchParams(window.location.search);
            const tabParam = urlParams.get('tab');
            if (tabParam) {
                switchBuyerTab(tabParam);
            }
        });

        function renderPurchases() {
            const overDown = document.getElementById('overviewDownloadsList');
            const fullDown = document.getElementById('fullDownloadsList');

            const downloadCardHtml = (p) => `
                <div style="background: var(--bg-subtle); border: 1px solid var(--border-color); border-radius: var(--radius-lg); padding: 18px 22px; display: flex; align-items: center; justify-content: space-between; gap: 16px; flex-wrap: wrap;">
                    <div>
                        <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px;">
                            <span class="badge badge-purple" style="font-size: 0.72rem;">${p.category}</span>
                            <span style="font-size: 0.8rem; color: var(--text-muted);">${p.version} &bull; ${p.fileSize}</span>
                        </div>
                        <h4 style="font-size: 1.05rem; margin-bottom: 4px;">${p.title}</h4>
                        <div style="font-size: 0.82rem; color: var(--text-muted); display: flex; align-items: center; gap: 10px;">
                            <span>License Key: <code style="background: #ffffff; padding: 2px 6px; border: 1px solid var(--border-color); border-radius: 4px;">${p.licenseKey}</code></span>
                            <button type="button" class="btn btn-outline btn-sm" onclick="copyKey('${p.licenseKey}', event)" style="padding: 2px 8px; font-size: 0.75rem;">
                                Copy Key
                            </button>
                        </div>
                    </div>
                    <div style="display: flex; gap: 10px;">
                        <button type="button" class="btn btn-teal btn-sm" onclick="executeRealDownload('${p.title}', '${p.fileSlug}', event)">
                            <span style="display: inline-flex; align-items: center; gap: 6px;">
                                ${ByteIcons.download} Download Package
                            </span>
                        </button>
                    </div>
                </div>
            `;

            overDown.innerHTML = samplePurchases.slice(0, 2).map(downloadCardHtml).join('');
            fullDown.innerHTML = samplePurchases.map(downloadCardHtml).join('');

            const overOrders = document.getElementById('overviewOrdersTableBody');
            const fullOrders = document.getElementById('fullOrdersTableBody');

            const orderRowHtml = (p) => `
                <tr>
                    <td style="font-weight: 700; color: var(--text-main);">${p.orderId}</td>
                    <td>${p.date}</td>
                    <td><strong>${p.title}</strong></td>
                    <td>$${p.price.toFixed(2)}</td>
                    <td><span class="badge badge-success">${p.status}</span></td>
                    <td>
                        <button type="button" class="btn btn-outline btn-sm" onclick="downloadInvoice('${p.orderId}', '${p.title}', ${p.price}, event)" style="padding: 4px 10px; font-size: 0.78rem;">
                            PDF Receipt
                        </button>
                    </td>
                </tr>
            `;

            const fullOrderRowHtml = (p) => `
                <tr>
                    <td style="font-weight: 700; color: var(--text-main);">${p.orderId}</td>
                    <td>${p.date}</td>
                    <td><strong>${p.title}</strong></td>
                    <td><span class="badge badge-neutral">${p.license}</span></td>
                    <td style="font-weight: 700;">$${p.price.toFixed(2)}</td>
                    <td><span class="badge badge-success">${p.status}</span></td>
                    <td>
                        <button type="button" class="btn btn-outline btn-sm" onclick="downloadInvoice('${p.orderId}', '${p.title}', ${p.price}, event)">
                            Download Receipt
                        </button>
                    </td>
                </tr>
            `;

            overOrders.innerHTML = samplePurchases.slice(0, 2).map(orderRowHtml).join('');
            fullOrders.innerHTML = samplePurchases.map(fullOrderRowHtml).join('');
        }

        function switchBuyerTab(tabName, itemEl) {
            document.querySelectorAll('.buyer-tab-panel').forEach(p => p.style.display = 'none');
            const target = document.getElementById('buyer-' + tabName);
            if (target) target.style.display = 'block';

            if (itemEl) {
                document.querySelectorAll('.dash-nav-item').forEach(i => i.classList.remove('active'));
                itemEl.classList.add('active');
            }
        }

        function executeRealDownload(title, fileSlug, event) {
            if (event) {
                event.preventDefault();
                event.stopPropagation();
            }
            ByteMarketStore.showToast(`Frontend Demo: Download package for "${title.substring(0, 24)}..."`, 'info');
        }

        function downloadInvoice(orderId, title, amount, event) {
            if (event) {
                event.preventDefault();
                event.stopPropagation();
            }
            ByteMarketStore.showToast(`Frontend Demo: Invoice receipt generated for ${orderId}`, 'info');
        }

        function copyKey(key, event) {
            if (event) {
                event.preventDefault();
                event.stopPropagation();
            }
            navigator.clipboard.writeText(key).then(() => {
                ByteMarketStore.showToast('License key copied to clipboard!', 'teal');
            }).catch(() => {
                ByteMarketStore.showToast('License key: ' + key, 'teal');
            });
        }

        function saveProfileChanges(event) {
            if (event) event.preventDefault();
            const user = ByteMarketStore.getUser();
            user.name = document.getElementById('profileNameInput').value;
            user.email = document.getElementById('profileEmailInput').value;
            ByteMarketStore.setUser(user);
            ByteMarketStore.showToast('Profile information saved!', 'success');
        }
    </script>
</asp:Content>
