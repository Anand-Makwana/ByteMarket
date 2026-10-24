<%@ Page Title="Seller Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SellerDashboard.aspx.cs" Inherits="ByteMarket.SellerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header -->
    <div style="background-color: var(--bg-subtle); border-bottom: 1px solid var(--border-color); padding: 32px 0;">
        <div class="container">
            <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px;">
                <div>
                    <div style="font-size: 0.88rem; color: var(--text-muted); margin-bottom: 4px;">Creator &amp; Vendor Hub</div>
                    <h1 style="font-size: 2.2rem; margin-bottom: 0;">Seller Dashboard</h1>
                </div>
                <div style="display: flex; gap: 10px;">
                    <button type="button" class="btn btn-primary btn-sm" onclick="switchSellerTab('add-product')">
                        + Add New Product
                    </button>
                    <a href='<%= ResolveUrl("~/User/BuyerDashboard.aspx") %>' class="btn btn-outline btn-sm" onclick="ByteMarketStore.switchRole('buyer', event)">
                        Switch to Buyer Mode
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="container section-py-sm">
        <div class="dashboard-layout">
            <!-- Left Sidebar Navigation -->
            <aside class="dashboard-nav-card">
                <div class="dash-user-header">
                    <div class="dash-avatar-lg" style="background: linear-gradient(135deg, var(--accent-purple), var(--primary));">MV</div>
                    <div>
                        <div style="font-weight: 800; color: var(--text-main); font-size: 1.1rem;">Marcus Vance</div>
                        <div style="font-size: 0.82rem; color: var(--text-muted);">marcus.vance@example.com</div>
                        <span class="badge badge-purple" style="margin-top: 6px;">Elite Author</span>
                    </div>
                </div>

                <ul class="dash-nav-links">
                    <li class="dash-nav-item active" onclick="switchSellerTab('overview', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.template);</script></span> Earnings Overview
                    </li>
                    <li class="dash-nav-item" onclick="switchSellerTab('add-product', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.plus);</script></span> Add New Product
                    </li>
                    <li class="dash-nav-item" onclick="switchSellerTab('products', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.cube);</script></span> My Products (<span id="myProductsNavCount">3</span>)
                    </li>
                    <li class="dash-nav-item" onclick="switchSellerTab('orders', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.file);</script></span> Sales &amp; Orders
                    </li>
                    <li class="dash-nav-item" onclick="switchSellerTab('payouts', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.bolt);</script></span> Payouts &amp; Balance
                    </li>
                </ul>
            </aside>

            <!-- Main Dashboard Area -->
            <main>
                <!-- Key Creator Metrics -->
                <div class="dash-stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon green"><script>document.write(ByteIcons.bolt);</script></div>
                        <div>
                            <div class="stat-info-title">Total Revenue</div>
                            <div class="stat-info-val">$4,820.00</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon purple"><script>document.write(ByteIcons.cube);</script></div>
                        <div>
                            <div class="stat-info-title">Units Sold</div>
                            <div class="stat-info-val">342</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon teal"><script>document.write(ByteIcons.star);</script></div>
                        <div>
                            <div class="stat-info-title">Author Rating</div>
                            <div class="stat-info-val">4.92 / 5</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon orange"><script>document.write(ByteIcons.key);</script></div>
                        <div>
                            <div class="stat-info-title">Pending Payout</div>
                            <div class="stat-info-val">$735.50</div>
                        </div>
                    </div>
                </div>

                <!-- Tab 1: Overview -->
                <div id="seller-overview" class="seller-tab-panel">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.25rem;">Active Marketplace Listings</h3>
                            <button type="button" class="btn btn-outline btn-sm" onclick="switchSellerTab('products')">Manage All</button>
                        </div>
                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Sales</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="overviewProductsTbody">
                                <!-- Script injected -->
                            </tbody>
                        </table>
                    </div>

                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.25rem;">Recent Customer Purchases</h3>
                            <button type="button" class="btn btn-outline btn-sm" onclick="switchSellerTab('orders')">View All Sales</button>
                        </div>
                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Order #</th>
                                    <th>Customer</th>
                                    <th>Product Item</th>
                                    <th>Earnings</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody id="overviewSalesTbody">
                                <!-- Script injected -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tab 2: Add Product Form -->
                <div id="seller-add-product" class="seller-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <div>
                                <h3 style="font-size: 1.3rem;">Upload &amp; Publish New Digital Product</h3>
                                <p style="font-size: 0.9rem; color: var(--text-muted); margin-bottom: 0;">Fill in the product details. Once submitted, it immediately appears in the live catalog.</p>
                            </div>
                        </div>

                        <div id="newProductForm">
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                                <div class="form-group" style="grid-column: 1 / -1;">
                                    <label class="form-label" for="prodTitleInput">Product Title *</label>
                                    <input type="text" id="prodTitleInput" class="form-control" placeholder="e.g. HyperFlow — SaaS Dashboard UI Kit" required />
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="prodCategoryInput">Category *</label>
                                    <select id="prodCategoryInput" class="form-control">
                                        <option value="templates">Website Templates</option>
                                        <option value="uikits" selected>UI Kits &amp; Design</option>
                                        <option value="icons">Icon Packs</option>
                                        <option value="graphics">3D &amp; Graphics</option>
                                        <option value="themes">CMS &amp; Themes</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="prodPriceInput">Selling Price (USD $) *</label>
                                    <input type="number" id="prodPriceInput" class="form-control" placeholder="29.00" step="0.5" min="5" value="29.00" required />
                                </div>

                                <div class="form-group" style="grid-column: 1 / -1;">
                                    <label class="form-label" for="prodDescInput">Product Description *</label>
                                    <textarea id="prodDescInput" class="form-control" rows="4" placeholder="Describe the features, compatibility, screen count, and technologies..." required>HyperFlow is an ultra-modern SaaS design kit with 90+ responsive screens, custom widgets, and full Figma autolayout tokens.</textarea>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Digital Deliverable ZIP (Simulation)</label>
                                    <input type="file" class="form-control" />
                                    <small style="color: var(--text-muted);">Simulated ZIP/RAR archive upload (Max 500MB)</small>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Thumbnail Preview Cover</label>
                                    <input type="file" class="form-control" />
                                    <small style="color: var(--text-muted);">Recommended 1600x1000px light background</small>
                                </div>
                            </div>

                            <div style="margin-top: 24px; padding-top: 20px; border-top: 1px solid var(--border-color); display: flex; justify-content: flex-end; gap: 12px;">
                                <button type="button" class="btn btn-secondary" onclick="switchSellerTab('products')">Cancel</button>
                                <button type="button" class="btn btn-primary btn-lg" onclick="handleProductSubmit(event)">Publish Product Now</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tab 3: My Products -->
                <div id="seller-products" class="seller-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <div>
                                <h3 style="font-size: 1.3rem;">All My Digital Products</h3>
                                <p style="font-size: 0.9rem; color: var(--text-muted); margin-bottom: 0;">Real-time management of your catalog inventory and status.</p>
                            </div>
                            <button type="button" class="btn btn-primary btn-sm" onclick="switchSellerTab('add-product')">+ Add Product</button>
                        </div>

                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Thumbnail &amp; Title</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Sales</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="fullProductsTbody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tab 4: Sales & Orders -->
                <div id="seller-orders" class="seller-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.3rem;">Customer Order Stream</h3>
                        </div>
                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer</th>
                                    <th>Item Purchased</th>
                                    <th>Gross Price</th>
                                    <th>Your Royalty (85%)</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody id="fullSalesTbody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tab 5: Payouts -->
                <div id="seller-payouts" class="seller-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.3rem;">Earnings &amp; Payout Information</h3>
                        </div>
                        <div style="background: var(--bg-subtle); border: 1px solid var(--border-color); border-radius: var(--radius-lg); padding: 24px; margin-bottom: 24px;">
                            <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 16px;">
                                <div>
                                    <div style="font-size: 0.88rem; color: var(--text-muted);">Available for Withdrawal</div>
                                    <div style="font-size: 2.2rem; font-weight: 800; color: var(--text-main);">$735.50</div>
                                </div>
                                <button type="button" class="btn btn-teal btn-lg" onclick="ByteMarketStore.showToast('Simulated payout request sent! Processed within 24h.', 'success')">
                                    Request Payout Transfer
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        let sellerProducts = [
            {
                id: 1,
                title: "Nova Admin — Modern SaaS Dashboard UI Kit",
                category: "UI Kits",
                categorySlug: "uikits",
                price: 29.00,
                sales: 1420,
                status: "Active",
                statusClass: "badge-success"
            },
            {
                id: 7,
                title: "FinFlow — Banking & Crypto Dashboard UI System",
                category: "UI Kits",
                categorySlug: "uikits",
                price: 32.00,
                sales: 750,
                status: "Active",
                statusClass: "badge-success"
            },
            {
                id: 99,
                title: "CloudMatrix — AWS & Azure Cloud Architecture Icons",
                category: "Icon Packs",
                categorySlug: "icons",
                price: 24.00,
                sales: 45,
                status: "Under Review",
                statusClass: "badge-warning"
            }
        ];

        const sampleSales = [
            { id: "BM-ORD-4491", buyer: "Sarah Jenkins", item: "Nova Admin UI Kit", price: 29.00, royalty: 24.65, date: "Today, 10:24 AM" },
            { id: "BM-ORD-4490", buyer: "Felix Schmidt", item: "FinFlow Dashboard", price: 32.00, royalty: 27.20, date: "Yesterday, 3:15 PM" },
            { id: "BM-ORD-4488", buyer: "Lucas Moreau", item: "Nova Admin UI Kit", price: 29.00, royalty: 24.65, date: "Oct 15, 2026" },
            { id: "BM-ORD-4485", buyer: "Amina Al-Mansoor", item: "Nova Admin UI Kit", price: 29.00, royalty: 24.65, date: "Oct 14, 2026" }
        ];

        document.addEventListener('DOMContentLoaded', function () {
            renderSellerTables();
        });

        function renderSellerTables() {
            document.getElementById('myProductsNavCount').textContent = sellerProducts.length;

            const productRowHtml = (p) => `
                <tr>
                    <td>
                        <div style="font-weight: 700; color: var(--text-main);">${p.title}</div>
                        <div style="font-size: 0.78rem; color: var(--text-muted);">ID: #${p.id}</div>
                    </td>
                    <td><span class="badge badge-purple">${p.category}</span></td>
                    <td style="font-weight: 700;">$${p.price.toFixed(2)}</td>
                    <td>${p.sales}</td>
                    <td><span class="badge ${p.statusClass}">${p.status}</span></td>
                    <td>
                        <div style="display: flex; gap: 6px;">
                            <a href="${ByteMarketStore.getBaseUrl()}ProductDetails.aspx?id=${p.id}" class="btn btn-outline btn-sm" style="padding: 4px 8px; font-size: 0.75rem;">View</a>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="deleteProduct(${p.id})" style="padding: 4px 8px; font-size: 0.75rem; color: var(--danger);">Delete</button>
                        </div>
                    </td>
                </tr>
            `;

            document.getElementById('overviewProductsTbody').innerHTML = sellerProducts.map(productRowHtml).join('');
            document.getElementById('fullProductsTbody').innerHTML = sellerProducts.map(productRowHtml).join('');

            const salesRowHtml = (s) => `
                <tr>
                    <td style="font-weight: 700; color: var(--text-main);">${s.id}</td>
                    <td>${s.buyer}</td>
                    <td>${s.item}</td>
                    <td style="color: var(--success); font-weight: 700;">+$${s.royalty.toFixed(2)}</td>
                    <td style="font-size: 0.85rem; color: var(--text-muted);">${s.date}</td>
                </tr>
            `;

            const fullSalesRowHtml = (s) => `
                <tr>
                    <td style="font-weight: 700;">${s.id}</td>
                    <td>${s.buyer}</td>
                    <td>${s.item}</td>
                    <td>$${s.price.toFixed(2)}</td>
                    <td style="color: var(--success); font-weight: 700;">+$${s.royalty.toFixed(2)}</td>
                    <td style="font-size: 0.85rem; color: var(--text-muted);">${s.date}</td>
                </tr>
            `;

            document.getElementById('overviewSalesTbody').innerHTML = sampleSales.map(salesRowHtml).join('');
            document.getElementById('fullSalesTbody').innerHTML = sampleSales.map(fullSalesRowHtml).join('');
        }

        function switchSellerTab(tabName, itemEl) {
            document.querySelectorAll('.seller-tab-panel').forEach(p => p.style.display = 'none');
            const target = document.getElementById('seller-' + tabName);
            if (target) target.style.display = 'block';

            if (itemEl) {
                document.querySelectorAll('.dash-nav-item').forEach(i => i.classList.remove('active'));
                itemEl.classList.add('active');
            }
        }

        function handleProductSubmit(e) {
            if (e) e.preventDefault();
            const title = document.getElementById('prodTitleInput').value.trim();
            const catSlug = document.getElementById('prodCategoryInput').value;
            const price = parseFloat(document.getElementById('prodPriceInput').value);
            const desc = document.getElementById('prodDescInput').value.trim();

            if (!title) {
                ByteMarketStore.showToast('Please enter a product title', 'danger');
                return;
            }

            const catMap = {
                templates: 'Website Templates',
                uikits: 'UI Kits',
                icons: 'Icon Packs',
                graphics: '3D Graphics',
                themes: 'Themes'
            };

            const newProd = {
                id: Date.now(),
                title: title,
                category: catMap[catSlug] || 'Digital Asset',
                categorySlug: catSlug,
                price: isNaN(price) ? 29.00 : price,
                sales: 0,
                status: "Active",
                statusClass: "badge-success",
                description: desc,
                author: "Marcus Vance",
                rating: 5.0,
                reviewsCount: 1,
                badge: "New",
                image: ByteMarketData.generatePlaceholderSvg(title, catMap[catSlug] || 'Digital Asset', '#6366f1', '#4338ca', 'NEW')
            };

            sellerProducts.unshift(newProd);

            try {
                let custom = [];
                const stored = localStorage.getItem(ByteMarketStore.KEYS.PRODUCTS);
                if (stored) custom = JSON.parse(stored);
                custom.unshift(newProd);
                localStorage.setItem(ByteMarketStore.KEYS.PRODUCTS, JSON.stringify(custom));
            } catch (err) {}

            ByteMarketStore.showToast('Product published successfully to ByteMarket catalog!', 'success');
            renderSellerTables();
            switchSellerTab('products');
        }

        function deleteProduct(id) {
            if (confirm('Are you sure you want to remove this product listing?')) {
                sellerProducts = sellerProducts.filter(p => p.id !== id);
                renderSellerTables();
                ByteMarketStore.showToast('Product listing removed', 'info');
            }
        }
    </script>
</asp:Content>
