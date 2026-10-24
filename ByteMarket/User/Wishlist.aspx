<%@ Page Title="My Wishlist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="ByteMarket.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Breadcrumb & Header -->
    <div style="background-color: var(--bg-subtle); border-bottom: 1px solid var(--border-color); padding: 32px 0;">
        <div class="container">
            <div style="display: flex; align-items: center; gap: 8px; font-size: 0.88rem; color: var(--text-muted); margin-bottom: 8px;">
                <a href='<%= ResolveUrl("~/Default.aspx") %>'>Home</a>
                <span>/</span>
                <span style="color: var(--text-main); font-weight: 600;">Saved Wishlist</span>
            </div>
            <h1 style="font-size: 2.2rem; margin-bottom: 6px;">Your Saved Wishlist</h1>
            <p style="color: var(--text-muted); font-size: 1rem; margin-bottom: 0;">
                Keep track of templates, UI kits, and design assets you want to purchase later.
            </p>
        </div>
    </div>

    <div class="container section-py-sm">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; flex-wrap: wrap; gap: 14px;">
            <div>
                You have <strong id="wishlistCountDisplay" style="color: var(--text-main);">0</strong> items saved.
            </div>
            <div style="display: flex; gap: 10px;">
                <a href='<%= ResolveUrl("~/Products.aspx") %>' class="btn btn-outline btn-sm">Explore More Products</a>
                <button type="button" class="btn btn-teal btn-sm" id="addAllToCartBtn">
                    <span style="display: inline-flex; align-items: center; gap: 6px;">
                        <script>document.write(ByteIcons.cart);</script> Add All to Cart
                    </span>
                </button>
            </div>
        </div>

        <!-- Wishlist Grid -->
        <div class="products-grid" id="wishlistProductsGrid">
            <!-- Dynamic Cards -->
        </div>

        <!-- Empty Wishlist State -->
        <div id="emptyWishlistState" style="display: none; text-align: center; padding: 70px 20px; background: #ffffff; border: 1px dashed var(--border-color); border-radius: var(--radius-xl); max-width: 680px; margin: 0 auto;">
            <div style="width: 80px; height: 80px; margin: 0 auto 20px auto; background: var(--danger-light); color: var(--danger); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                <script>document.write(ByteIcons.heart);</script>
            </div>
            <h2 style="margin-bottom: 10px;">Your Wishlist is Empty</h2>
            <p style="color: var(--text-muted); max-width: 440px; margin: 0 auto 28px auto;">
                Explore thousands of website templates, 3D graphics, and icon packs, and click the heart icon on any card to save it here.
            </p>
            <a href='<%= ResolveUrl("~/Products.aspx") %>' class="btn btn-primary btn-lg">Browse Trending Products</a>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            renderWishlist();

            document.getElementById('addAllToCartBtn').addEventListener('click', function (e) {
                e.preventDefault();
                const ids = ByteMarketStore.getWishlist();
                if (ids.length === 0) {
                    ByteMarketStore.showToast('Your wishlist is empty!', 'warning');
                    return;
                }
                ids.forEach(id => {
                    ByteMarketStore.addToCart(id, 'Standard License', 1);
                });
                ByteMarketStore.showToast('All items added to your cart!', 'success');
            });

            window.addEventListener('bytemarket:wishlistUpdated', renderWishlist);
        });

        function renderWishlist() {
            const ids = ByteMarketStore.getWishlist();
            const grid = document.getElementById('wishlistProductsGrid');
            const empty = document.getElementById('emptyWishlistState');
            const countDisplay = document.getElementById('wishlistCountDisplay');
            const base = ByteMarketStore.getBaseUrl();

            countDisplay.textContent = ids.length;

            if (ids.length === 0) {
                grid.innerHTML = '';
                empty.style.display = 'block';
                return;
            }

            empty.style.display = 'none';

            const products = ids.map(id => ByteMarketStore.getProductById(id)).filter(p => p !== undefined);

            grid.innerHTML = products.map(p => {
                return `
                    <div class="product-card" id="wishcard-${p.id}">
                        <div class="product-thumb">
                            <img src="${p.image}" alt="${p.title}" />
                            <div class="thumb-actions">
                                <button type="button" class="action-icon-btn active" title="Remove from Wishlist" onclick="removeWishItem(${p.id}, event)">
                                    ${ByteIcons.heartFilled}
                                </button>
                            </div>
                            <span class="category-tag-badge">${p.category}</span>
                        </div>
                        <div class="product-content">
                            <div class="product-author">By ${p.author}</div>
                            <h3 class="product-title">
                                <a href="${base}ProductDetails.aspx?id=${p.id}">${p.title}</a>
                            </h3>
                            <div class="product-rating">
                                <span style="display: inline-flex; align-items: center;">${ByteIcons.star}</span>
                                <span class="rating-score">${p.rating || '4.9'}</span>
                                <span class="rating-count">(${p.reviewsCount || 50})</span>
                            </div>
                            <div class="product-footer">
                                <div class="product-price">
                                    $${p.price.toFixed(2)}
                                </div>
                                <button type="button" class="cart-add-btn" onclick="ByteMarketStore.addToCart(${p.id}, 'Standard License', 1, event)">
                                    <span style="display: inline-flex; align-items: center; gap: 4px;">${ByteIcons.cart} Add</span>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');
        }

        function removeWishItem(id, event) {
            if (event) {
                event.preventDefault();
                event.stopPropagation();
            }
            ByteMarketStore.toggleWishlist(id, event);
            renderWishlist();
        }
    </script>
</asp:Content>
