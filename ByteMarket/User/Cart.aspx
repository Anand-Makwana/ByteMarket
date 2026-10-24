<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ByteMarket.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Breadcrumb & Header -->
    <div style="background-color: var(--bg-subtle); border-bottom: 1px solid var(--border-color); padding: 32px 0;">
        <div class="container">
            <div style="display: flex; align-items: center; gap: 8px; font-size: 0.88rem; color: var(--text-muted); margin-bottom: 8px;">
                <a href='<%= ResolveUrl("~/Default.aspx") %>'>Home</a>
                <span>/</span>
                <span style="color: var(--text-main); font-weight: 600;">Shopping Cart</span>
            </div>
            <h1 style="font-size: 2.2rem; margin-bottom: 6px;">Your Shopping Cart</h1>
            <p style="color: var(--text-muted); font-size: 1rem; margin-bottom: 0;">
                Review selected digital products and order summary (Frontend Demonstration).
            </p>
        </div>
    </div>

    <div class="container section-py-sm">
        <div class="cart-layout">
            <!-- Left: Items Table -->
            <div>
                <div class="cart-table-card">
                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>Product Details</th>
                                <th>Unit Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Item 1 -->
                            <tr>
                                <td>
                                    <div class="cart-item-info">
                                        <div style="width: 70px; height: 50px; border-radius: var(--radius-sm); background: linear-gradient(135deg, #6366f1, #4338ca); display: flex; align-items: center; justify-content: center; color: #ffffff; font-weight: bold; font-size: 0.8rem;">
                                            UI KIT
                                        </div>
                                        <div>
                                            <div class="cart-item-title">
                                                <a href='<%= ResolveUrl("~/ProductDetails.aspx?id=1") %>'>Nova Admin — Modern SaaS Dashboard UI Kit</a>
                                            </div>
                                            <div class="cart-item-meta">UI Kits &bull; <span class="badge badge-purple" style="font-size: 0.72rem;">Standard License</span></div>
                                        </div>
                                    </div>
                                </td>
                                <td style="font-weight: 700; color: var(--text-main);">$29.00</td>
                                <td>
                                    <div class="qty-control">
                                        <button type="button" class="qty-btn" onclick="ByteMarketStore.showToast('Quantity control (Demo)', 'info')">-</button>
                                        <span class="qty-input" style="display: inline-block; line-height: 32px;">1</span>
                                        <button type="button" class="qty-btn" onclick="ByteMarketStore.showToast('Quantity control (Demo)', 'info')">+</button>
                                    </div>
                                </td>
                                <td style="font-weight: 800; color: var(--text-main); font-size: 1.05rem;">$29.00</td>
                                <td>
                                    <button type="button" class="remove-btn" title="Remove Item (Demo)" onclick="ByteMarketStore.showToast('Remove item (Frontend Demo)', 'info')">
                                        <span style="display: inline-flex; align-items: center; color: var(--danger);"><script>document.write(ByteIcons.trash);</script></span>
                                    </button>
                                </td>
                            </tr>

                            <!-- Item 2 -->
                            <tr>
                                <td>
                                    <div class="cart-item-info">
                                        <div style="width: 70px; height: 50px; border-radius: var(--radius-sm); background: linear-gradient(135deg, #7c3aed, #5b21b6); display: flex; align-items: center; justify-content: center; color: #ffffff; font-weight: bold; font-size: 0.8rem;">
                                            ICONS
                                        </div>
                                        <div>
                                            <div class="cart-item-title">
                                                <a href='<%= ResolveUrl("~/ProductDetails.aspx?id=3") %>'>PixelGlyph — 1,500+ Minimal Line &amp; Solid Icons</a>
                                            </div>
                                            <div class="cart-item-meta">Icons &bull; <span class="badge badge-purple" style="font-size: 0.72rem;">Standard License</span></div>
                                        </div>
                                    </div>
                                </td>
                                <td style="font-weight: 700; color: var(--text-main);">$15.00</td>
                                <td>
                                    <div class="qty-control">
                                        <button type="button" class="qty-btn" onclick="ByteMarketStore.showToast('Quantity control (Demo)', 'info')">-</button>
                                        <span class="qty-input" style="display: inline-block; line-height: 32px;">1</span>
                                        <button type="button" class="qty-btn" onclick="ByteMarketStore.showToast('Quantity control (Demo)', 'info')">+</button>
                                    </div>
                                </td>
                                <td style="font-weight: 800; color: var(--text-main); font-size: 1.05rem;">$15.00</td>
                                <td>
                                    <button type="button" class="remove-btn" title="Remove Item (Demo)" onclick="ByteMarketStore.showToast('Remove item (Frontend Demo)', 'info')">
                                        <span style="display: inline-flex; align-items: center; color: var(--danger);"><script>document.write(ByteIcons.trash);</script></span>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px; flex-wrap: wrap; gap: 12px;">
                    <a href='<%= ResolveUrl("~/Products.aspx") %>' class="btn btn-outline btn-sm">
                        &larr; Continue Exploring Products
                    </a>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="ByteMarketStore.showToast('Cart cleared (Frontend Demo)', 'info')">
                        Empty Cart
                    </button>
                </div>
            </div>

            <!-- Right: Order Summary -->
            <div>
                <div class="summary-card">
                    <h3 class="summary-title">Order Summary</h3>

                    <div class="summary-row">
                        <span>Items Subtotal (2 items)</span>
                        <strong>$44.00</strong>
                    </div>

                    <div class="summary-row" style="color: var(--success);">
                        <span>Coupon Discount (BYTE30)</span>
                        <strong>-$13.20</strong>
                    </div>

                    <div class="summary-row">
                        <span>Digital Delivery</span>
                        <span style="color: var(--accent-teal); font-weight: 600;">FREE (Instant Access)</span>
                    </div>

                    <div class="summary-row">
                        <span>Estimated Taxes</span>
                        <span>$0.00</span>
                    </div>

                    <div class="summary-row total">
                        <span>Estimated Total</span>
                        <span style="color: var(--primary); font-weight: 800; font-size: 1.5rem;">$30.80</span>
                    </div>

                    <!-- Promo Code Box -->
                    <div style="margin-top: 24px;">
                        <label style="font-size: 0.85rem; font-weight: 600; color: var(--text-main); margin-bottom: 6px; display: block;">Promo Code Applied</label>
                        <div class="coupon-group">
                            <input type="text" value="BYTE30" readonly style="text-transform: uppercase; background: var(--bg-subtle);" />
                            <button type="button" class="btn btn-secondary btn-sm" onclick="ByteMarketStore.showToast('Coupon BYTE30 applied', 'success')">Applied</button>
                        </div>
                        <span style="font-size: 0.8rem; color: var(--success); display: block; margin-top: 4px;">&#10003; 30% Promo discount active</span>
                    </div>

                    <!-- Checkout Button -->
                    <div style="margin-top: 24px;">
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="openDemoCheckoutModal()">
                            Proceed to Demo Checkout &rarr;
                        </button>
                        <p style="font-size: 0.78rem; text-align: center; color: var(--text-muted); margin-top: 10px; margin-bottom: 0;">
                            Frontend demonstration only. No real payment is charged.
                        </p>
                    </div>
                </div>

                <!-- Trust Badges -->
                <div style="background: var(--bg-subtle); border: 1px solid var(--border-color); border-radius: var(--radius-lg); padding: 20px; margin-top: 20px;">
                    <div style="font-size: 0.9rem; font-weight: 700; color: var(--text-main); margin-bottom: 8px;">ByteMarket Guarantee</div>
                    <ul style="list-style: none; font-size: 0.82rem; color: var(--text-muted); display: flex; flex-direction: column; gap: 6px;">
                        <li>&#10003; 30-day money-back satisfaction guarantee</li>
                        <li>&#10003; Commercial Developer License included</li>
                        <li>&#10003; Verified digital assets</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Demonstration Checkout Modal -->
    <div id="checkoutSuccessModal" style="display: none; position: fixed; inset: 0; background: rgba(15,23,42,0.6); z-index: 10000; align-items: center; justify-content: center;">
        <div style="background: #ffffff; border-radius: var(--radius-xl); padding: 40px; max-width: 480px; width: 90%; text-align: center; box-shadow: var(--shadow-lg);">
            <div style="width: 72px; height: 72px; background: var(--success-light); color: var(--success); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px auto;">
                <script>document.write(ByteIcons.check);</script>
            </div>
            <h2 style="font-size: 1.8rem; margin-bottom: 8px;">Order Confirmed (Demo)</h2>
            <p style="color: var(--text-muted); font-size: 0.95rem; margin-bottom: 20px;">
                Thank you! Your frontend simulated order was generated successfully.
            </p>
            <div style="background: var(--bg-subtle); border: 1px solid var(--border-color); border-radius: var(--radius-md); padding: 14px; margin-bottom: 24px; font-size: 0.88rem; color: var(--text-secondary); text-align: left;">
                <div><strong>Order ID:</strong> #BM-2026-9814</div>
                <div><strong>License:</strong> Commercial Developer License</div>
                <div><strong>Delivery:</strong> Digital License Key Generated</div>
            </div>
            <div style="display: flex; gap: 12px; flex-direction: column;">
                <a href='<%= ResolveUrl("~/User/BuyerDashboard.aspx") %>' class="btn btn-primary btn-block btn-lg">Go to Buyer Dashboard</a>
                <button type="button" class="btn btn-outline btn-block" onclick="closeDemoModal()">Close</button>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        function openDemoCheckoutModal() {
            document.getElementById('checkoutSuccessModal').style.display = 'flex';
        }
        function closeDemoModal() {
            document.getElementById('checkoutSuccessModal').style.display = 'none';
        }
    </script>
</asp:Content>
