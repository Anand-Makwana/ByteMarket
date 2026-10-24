<%@ Page Title="Explore Digital Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ByteMarket.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Breadcrumb & Header -->
    <div style="background-color: var(--bg-subtle); border-bottom: 1px solid var(--border-color); padding: 32px 0;">
        <div class="container container-wide">
            <div style="display: flex; align-items: center; gap: 8px; font-size: 0.88rem; color: var(--text-muted); margin-bottom: 8px;">
                <a href='<%= ResolveUrl("~/Default.aspx") %>'>Home</a>
                <span>/</span>
                <span style="color: var(--text-main); font-weight: 600;">Products Catalog</span>
            </div>
            <h1 style="font-size: 2.2rem; margin-bottom: 6px;">Browse All Digital Products</h1>
            <p style="color: var(--text-muted); font-size: 1rem; margin-bottom: 0;">
                Find top-tier templates, UI kits, vector icons, 3D graphics, and fonts crafted by world-class creators.
            </p>
        </div>
    </div>

    <!-- Main Catalog Content -->
    <div class="container container-wide section-py-sm">
        <div class="catalog-layout">
            <!-- Sidebar Filters -->
            <aside class="filters-sidebar">
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
                    <h3 style="font-size: 1.15rem; font-weight: 800;">Filters</h3>
                    <button type="button" class="btn btn-outline btn-sm" id="resetFiltersBtn" style="padding: 4px 10px; font-size: 0.78rem;">Reset</button>
                </div>

                <!-- Filter: Search Keyword -->
                <div class="filter-group">
                    <label class="filter-title" for="filterSearchInput">Search Keyword</label>
                    <div style="position: relative;">
                        <input type="text" id="filterSearchInput" class="form-control" placeholder="Search keywords..." style="padding-left: 36px; font-size: 0.88rem;" />
                        <span style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%); color: var(--text-muted); display: flex; align-items: center;">
                            <script>document.write(ByteIcons.search);</script>
                        </span>
                    </div>
                </div>

                <!-- Filter: Categories -->
                <div class="filter-group">
                    <div class="filter-title">
                        <span>Categories</span>
                    </div>
                    <ul class="filter-options-list" id="categoryFilterList">
                        <li class="filter-checkbox-item">
                            <label>
                                <input type="radio" name="catFilter" value="all" checked />
                                <span>All Categories</span>
                            </label>
                            <span class="filter-count" id="totalItemsCount">8</span>
                        </li>
                        <li class="filter-checkbox-item">
                            <label>
                                <input type="radio" name="catFilter" value="templates" />
                                <span>Website Templates</span>
                            </label>
                            <span class="filter-count">2</span>
                        </li>
                        <li class="filter-checkbox-item">
                            <label>
                                <input type="radio" name="catFilter" value="uikits" />
                                <span>UI Kits &amp; Design</span>
                            </label>
                            <span class="filter-count">2</span>
                        </li>
                        <li class="filter-checkbox-item">
                            <label>
                                <input type="radio" name="catFilter" value="icons" />
                                <span>Icon Packs</span>
                            </label>
                            <span class="filter-count">1</span>
                        </li>
                        <li class="filter-checkbox-item">
                            <label>
                                <input type="radio" name="catFilter" value="graphics" />
                                <span>3D &amp; Graphics</span>
                            </label>
                            <span class="filter-count">2</span>
                        </li>
                        <li class="filter-checkbox-item">
                            <label>
                                <input type="radio" name="catFilter" value="themes" />
                                <span>Themes &amp; Stores</span>
                            </label>
                            <span class="filter-count">1</span>
                        </li>
                    </ul>
                </div>

                <!-- Filter: Price Range -->
                <div class="filter-group">
                    <div class="filter-title">
                        <span>Max Price: $<span id="priceDisplay">60</span></span>
                    </div>
                    <input type="range" id="priceRange" min="10" max="60" step="5" value="60" style="width: 100%; accent-color: var(--primary); cursor: pointer;" />
                    <div style="display: flex; justify-content: space-between; font-size: 0.8rem; color: var(--text-muted); margin-top: 6px;">
                        <span>$10</span>
                        <span>$35</span>
                        <span>$60+</span>
                    </div>
                </div>

                <!-- Filter: Badges -->
                <div class="filter-group">
                    <div class="filter-title">Tags &amp; Badges</div>
                    <ul class="filter-options-list">
                        <li class="filter-checkbox-item">
                            <label>
                                <input type="checkbox" class="badge-filter" value="Featured" />
                                <span>Featured</span>
                            </label>
                        </li>
                        <li class="filter-checkbox-item">
                            <label>
                                <input type="checkbox" class="badge-filter" value="Bestseller" />
                                <span>Bestsellers</span>
                            </label>
                        </li>
                        <li class="filter-checkbox-item">
                            <label>
                                <input type="checkbox" class="badge-filter" value="Trending" />
                                <span>Trending</span>
                            </label>
                        </li>
                    </ul>
                </div>
            </aside>

            <!-- Main Products List Area -->
            <main>
                <!-- Catalog Toolbar -->
                <div class="catalog-toolbar">
                    <div class="toolbar-results-count">
                        Showing <strong id="catalogResultsCount">0</strong> products found
                    </div>

                    <div class="toolbar-controls">
                        <label for="catalogSortSelect" style="font-size: 0.88rem; color: var(--text-muted); font-weight: 500;">Sort By:</label>
                        <select id="catalogSortSelect" class="sort-select">
                            <option value="popular">Most Popular (Sales)</option>
                            <option value="rating">Highest Rated</option>
                            <option value="price-asc">Price: Low to High</option>
                            <option value="price-desc">Price: High to Low</option>
                            <option value="newest">Newest Releases</option>
                        </select>
                    </div>
                </div>

                <!-- Active Filter Tags Strip -->
                <div id="activeFilterPills" style="display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 20px;"></div>

                <!-- Products Grid -->
                <div class="products-grid" id="catalogProductsGrid">
                    <!-- Cards populated via script -->
                </div>

                <!-- Empty State -->
                <div id="emptyResultsState" style="display: none; text-align: center; padding: 60px 20px; background: #ffffff; border: 1px dashed var(--border-color); border-radius: var(--radius-xl);">
                    <div style="width: 72px; height: 72px; margin: 0 auto 16px auto; background: var(--bg-subtle); color: var(--text-muted); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                        <script>document.write(ByteIcons.search);</script>
                    </div>
                    <h3 style="margin-bottom: 8px;">No matching products found</h3>
                    <p style="color: var(--text-muted); max-width: 420px; margin: 0 auto 20px auto;">
                        We couldn't find any digital assets matching your current search or filter combination. Try adjusting your search term or resetting filters.
                    </p>
                    <button type="button" class="btn btn-primary" onclick="resetAllFilters()">Reset All Filters</button>
                </div>
            </main>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        let allProducts = [];

        document.addEventListener('DOMContentLoaded', function () {
            allProducts = ByteMarketStore.getAllProducts();

            const urlParams = new URLSearchParams(window.location.search);
            const searchParam = urlParams.get('search');
            const catParam = urlParams.get('cat');
            const sortParam = urlParams.get('sort');

            if (searchParam) {
                document.getElementById('filterSearchInput').value = searchParam;
            }

            if (catParam) {
                const radio = document.querySelector(`input[name="catFilter"][value="${catParam}"]`);
                if (radio) radio.checked = true;
            }

            if (sortParam) {
                const sortSelect = document.getElementById('catalogSortSelect');
                if (sortSelect) sortSelect.value = sortParam;
            }

            document.getElementById('filterSearchInput').addEventListener('input', applyFiltersAndRender);
            document.getElementById('catalogSortSelect').addEventListener('change', applyFiltersAndRender);
            document.getElementById('priceRange').addEventListener('input', function (e) {
                document.getElementById('priceDisplay').textContent = e.target.value;
                applyFiltersAndRender();
            });

            document.querySelectorAll('input[name="catFilter"]').forEach(el => {
                el.addEventListener('change', applyFiltersAndRender);
            });

            document.querySelectorAll('.badge-filter').forEach(el => {
                el.addEventListener('change', applyFiltersAndRender);
            });

            document.getElementById('resetFiltersBtn').addEventListener('click', resetAllFilters);

            applyFiltersAndRender();
        });

        function resetAllFilters() {
            document.getElementById('filterSearchInput').value = '';
            document.querySelector('input[name="catFilter"][value="all"]').checked = true;
            document.getElementById('priceRange').value = 60;
            document.getElementById('priceDisplay').textContent = '60';
            document.querySelectorAll('.badge-filter').forEach(el => el.checked = false);
            document.getElementById('catalogSortSelect').value = 'popular';
            applyFiltersAndRender();
        }

        function applyFiltersAndRender() {
            const query = (document.getElementById('filterSearchInput').value || '').toLowerCase().trim();
            const selectedCat = document.querySelector('input[name="catFilter"]:checked').value;
            const maxPrice = parseFloat(document.getElementById('priceRange').value);
            const sortBy = document.getElementById('catalogSortSelect').value;
            const selectedBadges = Array.from(document.querySelectorAll('.badge-filter:checked')).map(cb => cb.value);

            let filtered = allProducts.filter(p => {
                if (query) {
                    const matchTitle = p.title.toLowerCase().includes(query);
                    const matchCategory = p.category.toLowerCase().includes(query);
                    const matchDesc = (p.description || '').toLowerCase().includes(query);
                    const matchAuthor = (p.author || '').toLowerCase().includes(query);
                    if (!matchTitle && !matchCategory && !matchDesc && !matchAuthor) return false;
                }

                if (selectedCat !== 'all') {
                    if (p.categorySlug !== selectedCat) return false;
                }

                if (p.price > maxPrice) return false;

                if (selectedBadges.length > 0) {
                    if (!selectedBadges.includes(p.badge)) return false;
                }

                return true;
            });

            if (sortBy === 'price-asc') {
                filtered.sort((a, b) => a.price - b.price);
            } else if (sortBy === 'price-desc') {
                filtered.sort((a, b) => b.price - a.price);
            } else if (sortBy === 'rating') {
                filtered.sort((a, b) => (b.rating || 0) - (a.rating || 0));
            } else if (sortBy === 'newest') {
                filtered.sort((a, b) => b.id - a.id);
            } else {
                filtered.sort((a, b) => (b.sales || 0) - (a.sales || 0));
            }

            const countEl = document.getElementById('catalogResultsCount');
            if (countEl) countEl.textContent = filtered.length;

            const grid = document.getElementById('catalogProductsGrid');
            const emptyState = document.getElementById('emptyResultsState');

            if (filtered.length === 0) {
                grid.innerHTML = '';
                emptyState.style.display = 'block';
            } else {
                emptyState.style.display = 'none';
                grid.innerHTML = filtered.map(p => ByteMarketStore.renderProductCard(p)).join('');
            }
        }
    </script>
</asp:Content>
