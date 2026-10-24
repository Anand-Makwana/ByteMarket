<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ByteMarket.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Breadcrumb -->
    <div style="background-color: var(--bg-subtle); border-bottom: 1px solid var(--border-color); padding: 20px 0;">
        <div class="container">
            <div style="display: flex; align-items: center; gap: 8px; font-size: 0.88rem; color: var(--text-muted);">
                <a href="Default.aspx">Home</a>
                <span>/</span>
                <a href="Products.aspx">Products</a>
                <span>/</span>
                <span id="detailBreadcrumbCat">UI Kits</span>
                <span>/</span>
                <span id="detailBreadcrumbTitle" style="color: var(--text-main); font-weight: 600;">Product Details</span>
            </div>
        </div>
    </div>

    <!-- Product Details Main Area -->
    <div class="container section-py-sm">
        <div class="product-details-grid">
            <!-- Left: Gallery & Previews -->
            <div class="preview-gallery">
                <div class="main-preview-box">
                    <img id="mainPreviewImg" src="" alt="Product Preview" />
                </div>
                <div class="thumbnail-row">
                    <div class="thumb-preview-item active" onclick="changePreview(0)">
                        <img id="thumb0" src="" alt="Thumbnail 1" />
                    </div>
                    <div class="thumb-preview-item" onclick="changePreview(1)">
                        <img id="thumb1" src="" alt="Thumbnail 2" />
                    </div>
                    <div class="thumb-preview-item" onclick="changePreview(2)">
                        <img id="thumb2" src="" alt="Thumbnail 3" />
                    </div>
                    <div class="thumb-preview-item" onclick="changePreview(3)">
                        <img id="thumb3" src="" alt="Thumbnail 4" />
                    </div>
                </div>

                <!-- Tabs Section -->
                <div style="margin-top: 48px;">
                    <div class="details-tabs">
                        <button type="button" class="tab-btn active" onclick="switchTab('tab-overview', this)">Overview</button>
                        <button type="button" class="tab-btn" onclick="switchTab('tab-features', this)">Features</button>
                        <button type="button" class="tab-btn" onclick="switchTab('tab-files', this)">Included Files</button>
                        <button type="button" class="tab-btn" onclick="switchTab('tab-reviews', this)">Reviews</button>
                    </div>

                    <!-- Tab 1: Overview -->
                    <div id="tab-overview" class="tab-content-panel active">
                        <h4 style="margin-bottom: 12px;">Product Summary</h4>
                        <p id="tabDescText" style="line-height: 1.8; color: var(--text-secondary);"></p>
                        <div style="margin-top: 24px; padding: 20px; background: var(--bg-subtle); border-radius: var(--radius-md); border: 1px solid var(--border-color);">
                            <h5 style="margin-bottom: 8px;">Demonstration Notice</h5>
                            <p style="font-size: 0.88rem; color: var(--text-muted); margin-bottom: 0;">
                                This is a frontend demonstration of ByteMarket. Clicking "Buy Now" or "Add to Cart" operates seamlessly with browser local storage and simulates the full user checkout journey.
                            </p>
                        </div>
                    </div>

                    <!-- Tab 2: Features -->
                    <div id="tab-features" class="tab-content-panel">
                        <h4 style="margin-bottom: 14px;">Key Specifications &amp; Highlights</h4>
                        <ul id="featuresList" style="list-style: none; display: flex; flex-direction: column; gap: 12px;"></ul>
                    </div>

                    <!-- Tab 3: Included Files -->
                    <div id="tab-files" class="tab-content-panel">
                        <h4 style="margin-bottom: 14px;">Deliverables &amp; File Formats</h4>
                        <div id="filesList" style="display: grid; grid-template-columns: 1fr 1fr; gap: 14px;"></div>
                    </div>

                    <!-- Tab 4: Reviews -->
                    <div id="tab-reviews" class="tab-content-panel">
                        <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px;">
                            <h4>Customer Feedback</h4>
                            <span class="badge badge-teal">Verified Buyers</span>
                        </div>
                        <div style="display: flex; flex-direction: column; gap: 16px;">
                            <div style="background: var(--bg-subtle); border: 1px solid var(--border-color); border-radius: var(--radius-md); padding: 18px;">
                                <div style="display: flex; justify-content: space-between; margin-bottom: 6px;">
                                    <strong>David K. (Senior UI Designer)</strong>
                                    <span style="color: var(--warning);">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                                </div>
                                <p style="font-size: 0.92rem; color: var(--text-secondary); margin-bottom: 0;">
                                    "Saved us at least 3 weeks of sprint work. The clean light-mode tokens and responsive layouts made it painless to integrate into our workflow."
                                </p>
                            </div>
                            <div style="background: var(--bg-subtle); border: 1px solid var(--border-color); border-radius: var(--radius-md); padding: 18px;">
                                <div style="display: flex; justify-content: space-between; margin-bottom: 6px;">
                                    <strong>Elena Rostova (Frontend Engineer)</strong>
                                    <span style="color: var(--warning);">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                                </div>
                                <p style="font-size: 0.92rem; color: var(--text-secondary); margin-bottom: 0;">
                                    "Extremely well structured. Files are cleanly named and the code quality is top-notch."
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: Product Purchase Box -->
            <div class="product-info-box">
                <div class="product-info-header">
                    <div class="product-badges-row">
                        <span class="badge badge-purple" id="detailCatBadge">UI Kits</span>
                        <span class="badge badge-teal" id="detailPromoBadge">Featured</span>
                    </div>
                    <h1 class="detail-title" id="detailTitle">Loading...</h1>
                    <div class="detail-meta-row">
                        <span>By <strong id="detailAuthor">ApexStudio</strong></span>
                        <span>&bull;</span>
                        <span style="color: var(--warning); display: inline-flex; align-items: center; gap: 4px;">
                            <script>document.write(ByteIcons.star);</script>
                            <strong id="detailRating">4.9</strong>
                        </span>
                        <span>&bull;</span>
                        <span id="detailSales">1,420 sales</span>
                    </div>
                </div>

                <!-- License Selection Box -->
                <div class="price-card-box">
                    <div style="font-size: 0.85rem; font-weight: 700; color: var(--text-muted); text-transform: uppercase; margin-bottom: 12px; letter-spacing: 0.05em;">
                        Choose License Tier
                    </div>

                    <div class="license-options">
                        <label class="license-choice selected" id="licenseStandardChoice" onclick="selectLicense('standard')">
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <input type="radio" name="licenseType" value="standard" checked style="accent-color: var(--primary);" />
                                <div>
                                    <div style="font-weight: 700; color: var(--text-main);">Standard License</div>
                                    <div style="font-size: 0.78rem; color: var(--text-muted);">Use for 1 single end product or website</div>
                                </div>
                            </div>
                            <div style="font-size: 1.25rem; font-weight: 800; color: var(--text-main);" id="standardPriceLabel">$29.00</div>
                        </label>

                        <label class="license-choice" id="licenseExtendedChoice" onclick="selectLicense('extended')">
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <input type="radio" name="licenseType" value="extended" style="accent-color: var(--primary);" />
                                <div>
                                    <div style="font-weight: 700; color: var(--text-main);">Extended License</div>
                                    <div style="font-size: 0.78rem; color: var(--text-muted);">Unlimited client &amp; commercial SaaS products</div>
                                </div>
                            </div>
                            <div style="font-size: 1.25rem; font-weight: 800; color: var(--text-main);" id="extendedPriceLabel">$89.00</div>
                        </label>
                    </div>

                    <!-- Current Price Display -->
                    <div style="display: flex; align-items: baseline; justify-content: space-between; margin-bottom: 20px;">
                        <div>
                            <span style="font-size: 2.2rem; font-weight: 900; color: var(--text-main);" id="activePriceDisplay">$29.00</span>
                            <span style="text-decoration: line-through; color: var(--text-muted); font-size: 1.1rem; margin-left: 8px;" id="activeOrigPriceDisplay">$49.00</span>
                        </div>
                        <span class="badge badge-success">Instant Delivery</span>
                    </div>

                    <!-- Action Buttons -->
                    <div class="action-buttons-stack">
                        <button type="button" class="btn btn-primary btn-lg btn-block" id="btnAddToCart">
                            <span style="display: inline-flex; align-items: center; gap: 6px;">
                                <script>document.write(ByteIcons.cart);</script> Add to Cart
                            </span>
                        </button>
                        <button type="button" class="btn btn-teal btn-lg btn-block" id="btnBuyNow">
                            <span style="display: inline-flex; align-items: center; gap: 6px;">
                                <script>document.write(ByteIcons.bolt);</script> Buy Now (Instant Checkout)
                            </span>
                        </button>
                        <button type="button" class="btn btn-outline btn-block" id="btnWishlistToggle">
                            <span id="wishlistBtnContent" style="display: inline-flex; align-items: center; gap: 6px;">
                                Save to Wishlist
                            </span>
                        </button>
                    </div>

                    <!-- Trust Guarantees -->
                    <div class="product-guarantees">
                        <div class="guarantee-item">
                            <span style="display: inline-flex; align-items: center; color: var(--accent-teal);"><script>document.write(ByteIcons.shield);</script></span>
                            <span>30-Day Quality Guarantee &amp; Refund Policy</span>
                        </div>
                        <div class="guarantee-item">
                            <span style="display: inline-flex; align-items: center; color: var(--accent-teal);"><script>document.write(ByteIcons.download);</script></span>
                            <span>Direct high-speed instant download package</span>
                        </div>
                        <div class="guarantee-item">
                            <span style="display: inline-flex; align-items: center; color: var(--accent-teal);"><script>document.write(ByteIcons.check);</script></span>
                            <span>Free future version updates included</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Related Products Section -->
        <div style="margin-top: 60px; padding-top: 48px; border-top: 1px solid var(--border-color);">
            <div class="section-header">
                <div>
                    <span class="section-tag">Similar Creations</span>
                    <h2 class="section-title">You Might Also Like</h2>
                </div>
                <a href="Products.aspx" class="btn btn-outline btn-sm">Explore More &rarr;</a>
            </div>
            <div class="products-grid" id="relatedProductsGrid"></div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        let currentProduct = null;
        let selectedLicense = 'Standard License';
        let currentBasePrice = 29.00;

        document.addEventListener('DOMContentLoaded', function () {
            const urlParams = new URLSearchParams(window.location.search);
            const id = urlParams.get('id') || 1;
            currentProduct = ByteMarketStore.getProductById(id) || ByteMarketData.products[0];

            loadProductData(currentProduct);

            // Button Event Handlers
            document.getElementById('btnAddToCart').addEventListener('click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                const licenseName = selectedLicense;
                ByteMarketStore.addToCart(currentProduct.id, licenseName, 1, e);
            });

            document.getElementById('btnBuyNow').addEventListener('click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                const licenseName = selectedLicense;
                ByteMarketStore.addToCart(currentProduct.id, licenseName, 1, e);
                window.location.href = ByteMarketStore.getBaseUrl() + 'User/Cart.aspx';
            });

            const wishBtn = document.getElementById('btnWishlistToggle');
            updateWishlistButton(wishBtn, currentProduct.id);
            wishBtn.addEventListener('click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                ByteMarketStore.toggleWishlist(currentProduct.id, e);
                updateWishlistButton(wishBtn, currentProduct.id);
            });
        });

        function updateWishlistButton(btn, prodId) {
            const inList = ByteMarketStore.isInWishlist(prodId);
            const content = document.getElementById('wishlistBtnContent');
            if (inList) {
                content.innerHTML = `${ByteIcons.heartFilled} In Wishlist (Click to remove)`;
                btn.style.color = 'var(--danger)';
                btn.style.borderColor = 'rgba(239,68,68,0.4)';
            } else {
                content.innerHTML = `${ByteIcons.heart} Save to Wishlist`;
                btn.style.color = 'var(--text-main)';
                btn.style.borderColor = 'var(--border-color)';
            }
        }

        function loadProductData(p) {
            document.title = `${p.title} - ByteMarket`;
            document.getElementById('detailBreadcrumbCat').textContent = p.category;
            document.getElementById('detailBreadcrumbTitle').textContent = p.title;

            document.getElementById('mainPreviewImg').src = p.image;
            document.getElementById('thumb0').src = p.image;
            document.getElementById('thumb1').src = p.image;
            document.getElementById('thumb2').src = p.image;
            document.getElementById('thumb3').src = p.image;

            document.getElementById('detailCatBadge').textContent = p.category;
            document.getElementById('detailPromoBadge').textContent = p.badge || 'Verified';
            document.getElementById('detailTitle').textContent = p.title;
            document.getElementById('detailAuthor').textContent = p.author;
            document.getElementById('detailRating').textContent = p.rating || '4.9';
            document.getElementById('detailSales').textContent = `${p.sales || 200} sales`;

            currentBasePrice = p.price;
            document.getElementById('standardPriceLabel').textContent = `$${p.price.toFixed(2)}`;
            const extPrice = p.price * 3.2;
            document.getElementById('extendedPriceLabel').textContent = `$${extPrice.toFixed(2)}`;

            selectLicense('standard');

            document.getElementById('tabDescText').textContent = p.description;

            // Features List
            const fList = document.getElementById('featuresList');
            if (p.features && p.features.length) {
                fList.innerHTML = p.features.map(f => `
                    <li style="display: flex; align-items: center; gap: 10px; font-size: 0.95rem;">
                        <span style="color: var(--accent-teal); display: inline-flex; align-items: center;">${ByteIcons.check}</span>
                        <span>${f}</span>
                    </li>
                `).join('');
            }

            // Files List — Clean SVG icon instead of broken emojis!
            const filesBox = document.getElementById('filesList');
            if (p.filesIncluded && p.filesIncluded.length) {
                filesBox.innerHTML = p.filesIncluded.map(file => `
                    <div style="display: flex; align-items: center; gap: 10px; background: var(--bg-subtle); padding: 12px 16px; border-radius: var(--radius-sm); border: 1px solid var(--border-color);">
                        <span style="display: inline-flex; align-items: center; color: var(--primary);">${ByteIcons.folder}</span>
                        <span style="font-size: 0.92rem; font-weight: 600; color: var(--text-main);">${file}</span>
                    </div>
                `).join('');
            }

            // Related Products
            const relatedGrid = document.getElementById('relatedProductsGrid');
            const related = ByteMarketData.products.filter(item => item.id !== p.id).slice(0, 4);
            relatedGrid.innerHTML = related.map(item => ByteMarketStore.renderProductCard(item)).join('');
        }

        function selectLicense(type) {
            const stdCard = document.getElementById('licenseStandardChoice');
            const extCard = document.getElementById('licenseExtendedChoice');
            const priceDisp = document.getElementById('activePriceDisplay');
            const origDisp = document.getElementById('activeOrigPriceDisplay');

            if (type === 'standard') {
                selectedLicense = 'Standard License';
                stdCard.classList.add('selected');
                extCard.classList.remove('selected');
                stdCard.querySelector('input').checked = true;
                priceDisp.textContent = `$${currentBasePrice.toFixed(2)}`;
                origDisp.textContent = currentProduct.originalPrice ? `$${currentProduct.originalPrice.toFixed(2)}` : '';
            } else {
                selectedLicense = 'Extended License';
                extCard.classList.add('selected');
                stdCard.classList.remove('selected');
                extCard.querySelector('input').checked = true;
                const extVal = currentBasePrice * 3.2;
                priceDisp.textContent = `$${extVal.toFixed(2)}`;
                origDisp.textContent = `$${(extVal * 1.4).toFixed(2)}`;
            }
        }

        function switchTab(tabId, btn) {
            document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
            document.querySelectorAll('.tab-content-panel').forEach(p => p.classList.remove('active'));
            btn.classList.add('active');
            document.getElementById(tabId).classList.add('active');
        }

        function changePreview(index) {
            document.querySelectorAll('.thumb-preview-item').forEach((item, i) => {
                if (i === index) item.classList.add('active');
                else item.classList.remove('active');
            });
        }
    </script>
</asp:Content>
