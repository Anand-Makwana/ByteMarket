/**
 * ByteMarket — Main Frontend Script
 * Pure frontend demonstration mode: All cart, order, and download functions are display-only UI.
 * No file downloads to disk, no backend processing.
 */

const ByteMarketStore = {
  getBaseUrl: function() {
    return (window.ByteMarketConfig && window.ByteMarketConfig.baseUrl) ? window.ByteMarketConfig.baseUrl : '/';
  },

  // Static demo user
  getUser: function() {
    return {
      isLoggedIn: true,
      name: 'Alex Rivera',
      email: 'alex.rivera@example.com',
      role: 'buyer',
      avatarText: 'AR'
    };
  },

  setUser: function(user) {},

  switchRole: function(role, event = null) {
    if (event) event.preventDefault();
    const base = this.getBaseUrl();
    if (role === 'seller') window.location.href = base + 'Seller/SellerDashboard.aspx';
    else if (role === 'admin') window.location.href = base + 'Admin/AdminDashboard.aspx';
    else window.location.href = base + 'User/BuyerDashboard.aspx';
  },

  logout: function(event = null) {
    if (event) event.preventDefault();
    window.location.href = this.getBaseUrl() + 'Login.aspx';
  },

  // Static products retrieval
  getAllProducts: function() {
    return (typeof ByteMarketData !== 'undefined' && ByteMarketData.products) ? ByteMarketData.products : [];
  },

  getProductById: function(id) {
    const products = this.getAllProducts();
    return products.find(p => Number(p.id) === Number(id)) || products[0];
  },

  // Turn off active cart modifications — frontend demo only
  addToCart: function(productId, license = 'Standard License', qty = 1, event = null) {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.showToast('Frontend Demo: Product added to cart view', 'teal');
  },

  removeFromCart: function(productId, license = null, event = null) {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.showToast('Frontend Demo: Item removed', 'info');
  },

  updateCartQty: function(productId, license, newQty, event = null) {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
  },

  clearCart: function() {
    this.showToast('Frontend Demo: Cart cleared', 'info');
  },

  // Turn off real file downloads — frontend demo notice only
  downloadAsset: function(title, filename = null, event = null) {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.showToast('Frontend Demonstration: File download simulation', 'info');
  },

  // Wishlist visual demonstration methods
  getWishlist: function() {
    return [1, 3];
  },

  isInWishlist: function(productId) {
    return [1, 3].includes(Number(productId));
  },

  toggleWishlist: function(productId, event = null) {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.showToast('Frontend Demo: Wishlist updated', 'teal');
    return true;
  },

  handleWishlistClick: function(event, productId) {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    const btn = event.currentTarget;
    if (btn) {
      btn.classList.toggle('active');
    }
    this.showToast('Frontend Demo: Saved to wishlist', 'teal');
  },

  // Universal Product Card Renderer
  renderProductCard: function(product) {
    const isWished = this.isInWishlist(product.id);
    const heartSvg = isWished ? ByteIcons.heartFilled : ByteIcons.heart;
    const starSvg = ByteIcons.star;
    const base = this.getBaseUrl();

    return `
      <div class="product-card" data-product-id="${product.id}" data-category="${product.categorySlug || ''}">
        <div class="product-thumb">
          <img src="${product.image}" alt="${product.title}" loading="lazy" />
          <div class="thumb-actions">
            <button type="button" class="action-icon-btn ${isWished ? 'active' : ''}" 
                    title="Wishlist" 
                    onclick="ByteMarketStore.handleWishlistClick(event, ${product.id})">
              ${heartSvg}
            </button>
          </div>
          <span class="category-tag-badge">${product.badge || product.category}</span>
        </div>
        <div class="product-content">
          <div class="product-author">
            <span>By ${product.author || 'ByteMarket Creator'}</span>
            <span>&bull;</span>
            <span>${product.sales || 0} sales</span>
          </div>
          <h3 class="product-title">
            <a href="${base}ProductDetails.aspx?id=${product.id}">${product.title}</a>
          </h3>
          <div class="product-rating">
            <span style="display: inline-flex; align-items: center;">${starSvg}</span>
            <span class="rating-score">${product.rating || '4.9'}</span>
            <span class="rating-count">(${product.reviewsCount || 42})</span>
          </div>
          <div class="product-footer">
            <div class="product-price">
              $${Number(product.price).toFixed(2)}
              ${product.originalPrice ? `<span class="original-price">$${Number(product.originalPrice).toFixed(2)}</span>` : ''}
            </div>
            <a href="${base}User/Cart.aspx" class="cart-add-btn">
              <span style="display: inline-flex; align-items: center; gap: 4px;">${ByteIcons.cart} Add to Cart</span>
            </a>
          </div>
        </div>
      </div>
    `;
  },

  // Toast Alerts
  showToast: function(message, type = 'primary') {
    let container = document.getElementById('byteToastContainer');
    if (!container) {
      container = document.createElement('div');
      container.id = 'byteToastContainer';
      container.className = 'toast-container';
      document.body.appendChild(container);
    }

    const toast = document.createElement('div');
    toast.className = `toast toast-${type}`;
    
    let iconSvg = ByteIcons.check;
    if (type === 'teal') iconSvg = ByteIcons.heartFilled;
    if (type === 'danger') iconSvg = ByteIcons.trash;
    if (type === 'info') iconSvg = ByteIcons.file;

    toast.innerHTML = `
      <span style="display: inline-flex; align-items: center;">${iconSvg}</span>
      <div style="flex: 1; font-weight: 600;">${message}</div>
    `;

    container.appendChild(toast);

    setTimeout(() => {
      toast.style.opacity = '0';
      toast.style.transform = 'translateX(50px)';
      setTimeout(() => toast.remove(), 300);
    }, 2800);
  },

  init: function() {
    document.addEventListener('DOMContentLoaded', () => {
      // Static header badges
      const cartBadge = document.getElementById('headerCartBadge');
      if (cartBadge) {
        cartBadge.textContent = '2';
        cartBadge.style.display = 'flex';
      }

      const wishBadge = document.getElementById('headerWishlistBadge');
      if (wishBadge) {
        wishBadge.textContent = '2';
        wishBadge.style.display = 'flex';
      }

      // Mobile nav
      const mobileBtn = document.getElementById('mobileNavToggle');
      const mainNav = document.getElementById('mainNavLinks');
      if (mobileBtn && mainNav) {
        mobileBtn.addEventListener('click', (e) => {
          e.preventDefault();
          mainNav.classList.toggle('show');
        });
      }

      // User dropdown
      const userBtn = document.getElementById('userMenuTrigger');
      const userDropdown = document.getElementById('userDropdownMenu');
      if (userBtn && userDropdown) {
        userBtn.addEventListener('click', (e) => {
          e.preventDefault();
          e.stopPropagation();
          userDropdown.classList.toggle('show');
        });
        document.addEventListener('click', () => {
          userDropdown.classList.remove('show');
        });
      }

      // Header search
      const headerSearch = document.getElementById('headerSearchInput');
      if (headerSearch) {
        headerSearch.addEventListener('keypress', (e) => {
          if (e.key === 'Enter') {
            e.preventDefault();
            const q = headerSearch.value.trim();
            window.location.href = `${ByteMarketStore.getBaseUrl()}Products.aspx?search=${encodeURIComponent(q)}`;
          }
        });
      }
    });
  }
};

ByteMarketStore.init();
