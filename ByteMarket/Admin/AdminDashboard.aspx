<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ByteMarket.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header -->
    <div style="background-color: var(--bg-subtle); border-bottom: 1px solid var(--border-color); padding: 32px 0;">
        <div class="container">
            <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px;">
                <div>
                    <div style="font-size: 0.88rem; color: var(--text-muted); margin-bottom: 4px;">System Administration</div>
                    <h1 style="font-size: 2.2rem; margin-bottom: 0;">Admin Management Portal</h1>
                </div>
                <div style="display: flex; gap: 10px;">
                    <span class="badge badge-purple" style="font-size: 0.85rem; padding: 6px 14px;">Platform Health: 100% Operational</span>
                    <a href='<%= ResolveUrl("~/Default.aspx") %>' class="btn btn-outline btn-sm">Visit Public Store</a>
                </div>
            </div>
        </div>
    </div>

    <div class="container section-py-sm">
        <div class="dashboard-layout">
            <!-- Left Sidebar Navigation -->
            <aside class="dashboard-nav-card">
                <div class="dash-user-header">
                    <div class="dash-avatar-lg" style="background: linear-gradient(135deg, var(--danger), var(--primary));">SC</div>
                    <div>
                        <div style="font-weight: 800; color: var(--text-main); font-size: 1.1rem;">Sarah Connor</div>
                        <div style="font-size: 0.82rem; color: var(--text-muted);">sarah.admin@bytemarket.io</div>
                        <span class="badge badge-danger" style="margin-top: 6px;">Super Admin</span>
                    </div>
                </div>

                <ul class="dash-nav-links">
                    <li class="dash-nav-item active" onclick="switchAdminTab('overview', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.template);</script></span> System Overview
                    </li>
                    <li class="dash-nav-item" onclick="switchAdminTab('products', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.cube);</script></span> Product Approvals (<span id="pendingCountBadge" style="color: var(--warning); font-weight: bold;">2</span>)
                    </li>
                    <li class="dash-nav-item" onclick="switchAdminTab('categories', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.folder);</script></span> Categories (5)
                    </li>
                    <li class="dash-nav-item" onclick="switchAdminTab('users', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.sparkles);</script></span> User Management
                    </li>
                    <li class="dash-nav-item" onclick="switchAdminTab('orders', this)">
                        <span style="display: inline-flex; align-items: center;"><script>document.write(ByteIcons.file);</script></span> Platform Orders Log
                    </li>
                </ul>
            </aside>

            <!-- Main Admin Panels -->
            <main>
                <!-- Platform Metrics -->
                <div class="dash-stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon green"><script>document.write(ByteIcons.bolt);</script></div>
                        <div>
                            <div class="stat-info-title">Platform GMV (Monthly)</div>
                            <div class="stat-info-val">$64,320</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon purple"><script>document.write(ByteIcons.bolt);</script></div>
                        <div>
                            <div class="stat-info-title">Platform Fee (15%)</div>
                            <div class="stat-info-val">$9,648</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon teal"><script>document.write(ByteIcons.sparkles);</script></div>
                        <div>
                            <div class="stat-info-title">Registered Users</div>
                            <div class="stat-info-val">4,812</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon orange"><script>document.write(ByteIcons.cube);</script></div>
                        <div>
                            <div class="stat-info-title">Live Products</div>
                            <div class="stat-info-val">348</div>
                        </div>
                    </div>
                </div>

                <!-- Tab 1: Overview -->
                <div id="admin-overview" class="admin-tab-panel">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.25rem;">Pending Product Submissions</h3>
                            <button type="button" class="btn btn-outline btn-sm" onclick="switchAdminTab('products')">View Moderation Queue</button>
                        </div>
                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Product Title</th>
                                    <th>Creator</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="overviewQueueTbody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>

                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.25rem;">Latest Platform Transactions</h3>
                            <button type="button" class="btn btn-outline btn-sm" onclick="switchAdminTab('orders')">All Orders</button>
                        </div>
                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Transaction ID</th>
                                    <th>Buyer</th>
                                    <th>Seller</th>
                                    <th>Amount</th>
                                    <th>Platform Fee</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody id="overviewTransactionsTbody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tab 2: Product Approvals & Moderation -->
                <div id="admin-products" class="admin-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <div>
                                <h3 style="font-size: 1.3rem;">Product Catalog Moderation</h3>
                                <p style="font-size: 0.9rem; color: var(--text-muted); margin-bottom: 0;">Approve or reject community product submissions before they hit the marketplace.</p>
                            </div>
                        </div>

                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Creator</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Moderation Action</th>
                                </tr>
                            </thead>
                            <tbody id="fullQueueTbody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tab 3: Category Management -->
                <div id="admin-categories" class="admin-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <div>
                                <h3 style="font-size: 1.3rem;">Marketplace Categories</h3>
                                <p style="font-size: 0.9rem; color: var(--text-muted); margin-bottom: 0;">Organize and add new departments to ByteMarket.</p>
                            </div>
                            <button type="button" class="btn btn-primary btn-sm" onclick="showAddCategoryPrompt()">+ Add New Category</button>
                        </div>

                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Icon</th>
                                    <th>Category Name</th>
                                    <th>Slug</th>
                                    <th>Total Products</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="categoriesTbody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tab 4: User Management -->
                <div id="admin-users" class="admin-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.3rem;">User Accounts &amp; Access Control</h3>
                        </div>

                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>User</th>
                                    <th>Email</th>
                                    <th>Current Role</th>
                                    <th>Status</th>
                                    <th>Joined</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="usersTbody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tab 5: Platform Orders Log -->
                <div id="admin-orders" class="admin-tab-panel" style="display: none;">
                    <div class="dash-card">
                        <div class="dash-card-header">
                            <h3 style="font-size: 1.3rem;">Global Platform Orders</h3>
                        </div>

                        <table class="dash-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Buyer</th>
                                    <th>Product Purchased</th>
                                    <th>Total GMV</th>
                                    <th>Fee (15%)</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody id="fullOrdersTbody">
                                <!-- Injected by script -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        let moderationQueue = [
            { id: 101, title: "CloudMatrix — Cloud Architecture Icons", author: "Marcus Vance", category: "Icon Packs", price: 24.00, status: "Pending" },
            { id: 102, title: "SleekMotion — 3D Cybernetic Headsets", author: "RenderLab", category: "3D & Graphics", price: 35.00, status: "Pending" },
            { id: 103, title: "VoxelKit — Game Ready Low Poly Pack", author: "PixelDev", category: "3D & Graphics", price: 18.00, status: "Approved" },
            { id: 104, title: "AeroUI — Flight Booking System React", author: "AeroThemes", category: "Website Templates", price: 42.00, status: "Approved" }
        ];

        let adminUsers = [
            { name: "Alex Rivera", email: "alex.rivera@example.com", role: "Buyer", roleClass: "badge-teal", status: "Active", joined: "Jan 2026" },
            { name: "Marcus Vance", email: "marcus.vance@example.com", role: "Seller", roleClass: "badge-purple", status: "Active", joined: "Feb 2026" },
            { name: "Sarah Connor", email: "sarah.admin@bytemarket.io", role: "Admin", roleClass: "badge-danger", status: "Active", joined: "Dec 2025" },
            { name: "Robert Taylor", email: "robert.t@example.com", role: "Buyer", roleClass: "badge-teal", status: "Active", joined: "Mar 2026" }
        ];

        const globalOrders = [
            { id: "BM-ORD-9814", buyer: "Alex Rivera", seller: "ApexStudio", item: "Nova Admin SaaS UI Kit", amount: 29.00, fee: 4.35, date: "Oct 16, 2026" },
            { id: "BM-ORD-8742", buyer: "Elena Rostova", seller: "IconForge", item: "PixelGlyph Vector Icons", amount: 48.00, fee: 7.20, date: "Sep 28, 2026" },
            { id: "BM-ORD-7601", buyer: "David Chen", seller: "CodeCrafted", item: "DevForge Portfolio Template", amount: 19.00, fee: 2.85, date: "Aug 14, 2026" },
            { id: "BM-ORD-6540", buyer: "Sophia Loren", seller: "RenderLab", item: "Aura 3D Illustrations", amount: 34.00, fee: 5.10, date: "Jul 02, 2026" }
        ];

        document.addEventListener('DOMContentLoaded', function () {
            renderAdminData();
        });

        function renderAdminData() {
            const pending = moderationQueue.filter(m => m.status === 'Pending').length;
            document.getElementById('pendingCountBadge').textContent = pending;

            const queueRow = (m) => `
                <tr>
                    <td><strong>${m.title}</strong></td>
                    <td>${m.author}</td>
                    <td><span class="badge badge-purple">${m.category}</span></td>
                    <td style="font-weight: 700;">$${m.price.toFixed(2)}</td>
                    <td>
                        ${m.status === 'Pending' ? `
                            <div style="display: flex; gap: 6px;">
                                <button type="button" class="btn btn-teal btn-sm" onclick="approveProduct(${m.id})" style="padding: 4px 8px; font-size: 0.75rem;">Approve</button>
                                <button type="button" class="btn btn-secondary btn-sm" onclick="rejectProduct(${m.id})" style="padding: 4px 8px; font-size: 0.75rem; color: var(--danger);">Reject</button>
                            </div>
                        ` : `<span class="badge badge-success">Approved</span>`}
                    </td>
                </tr>
            `;

            document.getElementById('overviewQueueTbody').innerHTML = moderationQueue.slice(0, 3).map(queueRow).join('');
            document.getElementById('fullQueueTbody').innerHTML = moderationQueue.map(queueRow).join('');

            const txRow = (tx) => `
                <tr>
                    <td style="font-weight: 700; color: var(--text-main);">${tx.id}</td>
                    <td>${tx.buyer}</td>
                    <td>${tx.seller}</td>
                    <td style="font-weight: 700;">$${tx.amount.toFixed(2)}</td>
                    <td style="color: var(--success); font-weight: 700;">+$${tx.fee.toFixed(2)}</td>
                    <td><span class="badge badge-success">Completed</span></td>
                </tr>
            `;

            const fullOrderRow = (tx) => `
                <tr>
                    <td style="font-weight: 700;">${tx.id}</td>
                    <td>${tx.buyer}</td>
                    <td><strong>${tx.item}</strong></td>
                    <td style="font-weight: 700;">$${tx.amount.toFixed(2)}</td>
                    <td style="color: var(--success); font-weight: 700;">+$${tx.fee.toFixed(2)}</td>
                    <td style="color: var(--text-muted); font-size: 0.85rem;">${tx.date}</td>
                </tr>
            `;

            document.getElementById('overviewTransactionsTbody').innerHTML = globalOrders.map(txRow).join('');
            document.getElementById('fullOrdersTbody').innerHTML = globalOrders.map(fullOrderRow).join('');

            const catTbody = document.getElementById('categoriesTbody');
            catTbody.innerHTML = ByteMarketData.categories.map(c => `
                <tr>
                    <td><span style="display: inline-flex; align-items: center; color: var(--primary);">${ByteIcons[c.icon] || ByteIcons.folder}</span></td>
                    <td><strong>${c.name}</strong></td>
                    <td><code>${c.id}</code></td>
                    <td>${c.count} Items</td>
                    <td>
                        <button type="button" class="btn btn-outline btn-sm" onclick="ByteMarketStore.showToast('Edit Category prompt simulated', 'info')" style="padding: 4px 8px; font-size: 0.75rem;">Edit</button>
                    </td>
                </tr>
            `).join('');

            const userTbody = document.getElementById('usersTbody');
            userTbody.innerHTML = adminUsers.map((u, i) => `
                <tr>
                    <td><strong>${u.name}</strong></td>
                    <td>${u.email}</td>
                    <td><span class="badge ${u.roleClass}">${u.role}</span></td>
                    <td><span class="badge badge-success">${u.status}</span></td>
                    <td style="color: var(--text-muted); font-size: 0.85rem;">${u.joined}</td>
                    <td>
                        <button type="button" class="btn btn-outline btn-sm" onclick="toggleUserStatus(${i})" style="padding: 4px 8px; font-size: 0.75rem;">Toggle Status</button>
                    </td>
                </tr>
            `).join('');
        }

        function switchAdminTab(tabName, itemEl) {
            document.querySelectorAll('.admin-tab-panel').forEach(p => p.style.display = 'none');
            const target = document.getElementById('admin-' + tabName);
            if (target) target.style.display = 'block';

            if (itemEl) {
                document.querySelectorAll('.dash-nav-item').forEach(i => i.classList.remove('active'));
                itemEl.classList.add('active');
            }
        }

        function approveProduct(id) {
            const item = moderationQueue.find(m => m.id === id);
            if (item) {
                item.status = 'Approved';
                ByteMarketStore.showToast(`Product "${item.title}" approved for live store!`, 'success');
                renderAdminData();
            }
        }

        function rejectProduct(id) {
            moderationQueue = moderationQueue.filter(m => m.id !== id);
            ByteMarketStore.showToast('Product submission rejected', 'info');
            renderAdminData();
        }

        function showAddCategoryPrompt() {
            const catName = prompt("Enter new category name:");
            if (catName) {
                ByteMarketData.categories.push({
                    id: catName.toLowerCase().replace(/[^a-z0-9]/g, ''),
                    name: catName,
                    icon: "folder",
                    count: 0,
                    desc: "Community submitted assets"
                });
                ByteMarketStore.showToast(`Category "${catName}" added!`, 'success');
                renderAdminData();
            }
        }

        function toggleUserStatus(index) {
            const u = adminUsers[index];
            u.status = u.status === 'Active' ? 'Suspended' : 'Active';
            ByteMarketStore.showToast(`User status for ${u.name} set to ${u.status}`, 'teal');
            renderAdminData();
        }
    </script>
</asp:Content>
