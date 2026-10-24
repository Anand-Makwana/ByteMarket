<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ByteMarket.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <section class="hero-wrapper">
        <div class="hero-glow-1"></div>
        <div class="hero-glow-2"></div>
        <div class="container">
            <div class="hero-content">
                <div class="hero-pill">
                    <span>Curated Digital Marketplace</span>
                    <span>&bull;</span>
                    <span style="color: var(--accent-teal);">100% Verified Quality</span>
                </div>



                <h1 class="hero-headline">
                    Discover High-Quality <br />
                    <span class="gradient-text">Digital Assets &amp; Templates</span>
                </h1>

                <p class="hero-subhead">
                    Explore pixel-perfect website templates, UI kits, vector icon sets, 3D illustrations, and developer themes to ship your next big project faster.
                </p>

                <!-- Big Hero Search Bar -->
                <div class="hero-search-box">
                    <span style="color: var(--text-muted); display: flex; align-items: center; margin-right: 8px;">
                        <script>document.write(ByteIcons.search);</script>
                    </span>
                    <input type="text" id="heroSearchInput" placeholder="Search templates, UI kits, icons, 3D..." autocomplete="off" />
                    <select id="heroCategorySelect">
                        <option value="">All Categories</option>
                        <option value="templates">Website Templates</option>
                        <option value="uikits">UI Kits</option>
                        <option value="icons">Icon Packs</option>
                        <option value="graphics">3D Graphics</option>
                        <option value="themes">CMS &amp; Themes</option>
                    </select>
                    <button type="button" class="btn btn-primary btn-pill" id="heroSearchBtn">Search</button>
                </div>

                <!-- Popular Tags -->
                <div class="popular-tags">
                    <span>Popular Searches:</span>
                    <a href="Products.aspx?search=Dashboard">SaaS Dashboard</a>
                    <a href="Products.aspx?cat=templates">Portfolio</a>
                    <a href="Products.aspx?cat=icons">Vector Icons</a>
                    <a href="Products.aspx?cat=graphics">3D Tech</a>
                    <a href="Products.aspx?search=Figma">Figma Kit</a>
                </div>

                <!-- Trust Stats Strip -->
                <div class="trust-stats">
                    <div class="stat-item">
                        <div class="stat-number">12,500<span>+</span></div>
                        <div class="stat-label">Digital Products</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">48,000<span>+</span></div>
                        <div class="stat-label">Happy Creators &amp; Buyers</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">99.8<span>%</span></div>
                        <div class="stat-label">Satisfaction Rating</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">24/7</div>
                        <div class="stat-label">Instant Digital Downloads</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Popular Categories Section -->
    <section class="section-py bg-subtle-section">
        <div class="container">
            <div class="section-header">
                <div>
                    <span class="section-tag">Browse by Category</span>
                    <h2 class="section-title">Explore Popular Categories</h2>
                    <p class="section-desc">Hand-crafted digital assets organized across core creative categories.</p>
                </div>
                <a href="Products.aspx" class="btn btn-outline btn-sm">View All Categories &rarr;</a>
            </div>

            <div class="categories-grid" id="popularCategoriesGrid">
                <!-- Dynamically populated with SVG icons -->
            </div>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section class="section-py">
        <div class="container">
            <div class="section-header">
                <div>
                    <span class="section-tag">Editor's Choice</span>
                    <h2 class="section-title">Featured Products</h2>
                    <p class="section-desc">Hand-picked by our curators for exceptional quality and design integrity.</p>
                </div>
                <a href="Products.aspx" class="btn btn-outline-primary btn-sm">Browse All Products &rarr;</a>
            </div>

            <div class="products-grid" id="featuredProductsGrid">
                <!-- Injected via JavaScript -->
            </div>
        </div>
    </section>

    <!-- Promotional Discount Banner -->
    <section class="container" style="margin-bottom: 72px;">
        <div class="promo-card">
            <div class="promo-content">
                <span class="promo-badge">Limited Time Offer</span>
                <h2 class="promo-title">Supercharge Your Workflow with 30% Off</h2>
                <p class="promo-desc">
                    Upgrade your design and developer stack with our best-selling templates and icon packs. Use code <strong>BYTE30</strong> at checkout for instant savings.
                </p>
                <div class="promo-actions">
                    <a href="Products.aspx" class="btn btn-white">Claim 30% Discount</a>
                    <a href="Products.aspx?cat=templates" class="btn btn-outline" style="color: #ffffff; border-color: rgba(255,255,255,0.4);">Browse Templates</a>
                </div>
            </div>
            <div style="width: 110px; height: 110px; border-radius: 50%; background: rgba(255,255,255,0.18); display: flex; align-items: center; justify-content: center; color: #ffffff;" class="d-none-mobile">
                <script>document.write(ByteIcons.sparkles);</script>
            </div>
        </div>
    </section>

    <!-- Trending & Latest Products Section -->
    <section class="section-py bg-subtle-section">
        <div class="container">
            <div class="section-header">
                <div>
                    <span class="section-tag">Fresh Releases</span>
                    <h2 class="section-title">Trending &amp; Latest Additions</h2>
                    <p class="section-desc">The newest templates, 3D graphics, and design resources uploaded this month.</p>
                </div>
                <div style="display: flex; gap: 8px;">
                    <a href="Products.aspx?sort=popular" class="btn btn-sm btn-teal">Top Trending</a>
                    <a href="Products.aspx?sort=newest" class="btn btn-sm btn-outline">New Releases</a>
                </div>
            </div>

            <div class="products-grid" id="trendingProductsGrid">
                <!-- Injected via JavaScript -->
            </div>
        </div>
    </section>

    <!-- Become a Creator Callout -->
    <section class="section-py">
        <div class="container">
            <div style="background: #ffffff; border: 1px solid var(--border-color); border-radius: var(--radius-xl); padding: 48px; display: flex; align-items: center; justify-content: space-between; gap: 36px; box-shadow: var(--shadow-sm); flex-wrap: wrap;">
                <div style="max-width: 600px;">
                    <span class="badge badge-purple" style="margin-bottom: 12px;">Creator Community</span>
                    <h3 style="font-size: 1.8rem; margin-bottom: 12px; color: var(--text-main);">Earn Money Selling Your Digital Products on ByteMarket</h3>
                    <p style="color: var(--text-secondary); font-size: 1rem; margin-bottom: 0;">
                        Join thousands of designers, developers, and 3D artists. Keep up to 85% of your sales with transparent payouts and instant global customer reach.
                    </p>
                </div>
                <div style="display: flex; gap: 14px;">
                    <a href='<%= ResolveUrl("~/Seller/SellerDashboard.aspx") %>' class="btn btn-primary btn-lg" onclick="ByteMarketStore.switchRole('seller', event)">Start Selling Today</a>
                    <a href='<%= ResolveUrl("~/Login.aspx") %>' class="btn btn-secondary btn-lg">Creator Login</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Render Categories with SVG icons
            const catContainer = document.getElementById('popularCategoriesGrid');
            if (catContainer && ByteMarketData.categories) {
                catContainer.innerHTML = ByteMarketData.categories.map(cat => {
                    const iconSvg = ByteIcons[cat.icon] || ByteIcons.folder;
                    return `
                        <a href="Products.aspx?cat=${cat.id}" class="category-card">
                            <div class="category-icon-box" style="display: flex; align-items: center; justify-content: center;">${iconSvg}</div>
                            <div class="category-name">${cat.name}</div>
                            <div class="category-count">${cat.count} Items</div>
                        </a>
                    `;
                }).join('');
            }

            // Render Featured Products (first 4)
            const featContainer = document.getElementById('featuredProductsGrid');
            if (featContainer) {
                const featured = ByteMarketData.products.slice(0, 4);
                featContainer.innerHTML = featured.map(p => ByteMarketStore.renderProductCard(p)).join('');
            }

            // Render Trending Products (next 4)
            const trendContainer = document.getElementById('trendingProductsGrid');
            if (trendContainer) {
                const trending = ByteMarketData.products.slice(4, 8);
                trendContainer.innerHTML = trending.map(p => ByteMarketStore.renderProductCard(p)).join('');
            }

            // Hero Search Button logic
            const searchBtn = document.getElementById('heroSearchBtn');
            const searchInput = document.getElementById('heroSearchInput');
            const catSelect = document.getElementById('heroCategorySelect');

            function doSearch() {
                const q = searchInput.value.trim();
                const cat = catSelect.value;
                let url = 'Products.aspx?';
                if (q) url += 'search=' + encodeURIComponent(q) + '&';
                if (cat) url += 'cat=' + encodeURIComponent(cat);
                window.location.href = url;
            }

            if (searchBtn) searchBtn.addEventListener('click', doSearch);
            if (searchInput) {
                searchInput.addEventListener('keypress', function (e) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        doSearch();
                    }
                });
            }
        });
    </script>
</asp:Content>
