# ByteMarket — Digital Products Marketplace Website

A modern, responsive web application for exploring and showcasing digital assets such as website templates, UI kits, vector icon sets, 3D illustrations, and developer themes. Built with **ASP.NET Web Forms (.NET Framework 4.7.2)** using a clean, light-mode interface.

---

## 📌 Technology Stack

- **Platform:** ASP.NET Web Forms (.NET Framework 4.7.2)
- **Language:** C# (Code-Behind)
- **Frontend:** HTML5, CSS3 (Custom Light-Mode Design System), JavaScript (ES6+)
- **Icons:** Pure Vector SVG library (`ByteIcons`) for cross-browser consistency
- **IDE:** Visual Studio 2022
- **Web Server:** IIS Express

---

## 🗂️ Project Structure

The project separates role-based dashboards while keeping shared core pages at the root level:

```text
ByteMarket/
│
├── Default.aspx                 # Home page (Hero, Categories, Featured & Trending)
├── Products.aspx                # Catalog with instant search, category filtering & sorting
├── ProductDetails.aspx          # Product preview, specifications & license options
├── Login.aspx                   # Sign in & registration portal with quick demo profiles
├── Site.Master                  # Master layout with responsive header, nav & footer
├── Web.config                   # ASP.NET configuration
├── ByteMarket.csproj            # Visual Studio project file
│
├── User/                        # Buyer Portal
│   ├── BuyerDashboard.aspx      # Purchases, downloads, order receipts & profile settings
│   ├── Cart.aspx                # Shopping cart demonstration & order summary
│   └── Wishlist.aspx            # Saved items showcase
│
├── Seller/                      # Creator / Vendor Hub
│   └── SellerDashboard.aspx     # Earnings overview, Add Product form & sales log
│
├── Admin/                       # Administration Portal
│   └── AdminDashboard.aspx      # System metrics, product approvals & user management
│
├── css/
│   └── style.css                # Light-mode design system & responsive styling
│
└── js/
    ├── icons.js                 # Vector SVG icon library
    ├── products-data.js         # Curated catalog dataset & preview generator
    └── main.js                  # Frontend store & interactive components
```

---

## ✨ Key Features

- **Clean Light Mode Interface:** Designed with white surfaces, subtle slate backgrounds, violet and teal accents, and accessible contrast.
- **Dynamic Catalog Filtering:** Real-time keyword search, category filtering, price sliders, and sorting (popularity, rating, price, newest).
- **Multi-Column Product Grid:** Balanced card presentation inspired by e-commerce marketplaces (Amazon, Flipkart, Envato).
- **Interactive Demonstrations:** Client-side cart notifications, wishlist toggling, license selection, and simulated checkout flow.
- **Three Dedicated Dashboards:**
  - **Buyer:** Order history, digital resource downloads, license keys.
  - **Seller:** Revenue metrics, add product workflow, inventory listing.
  - **Admin:** Platform health, pending product review, category & user management.

---

## 🚀 How to Run in Visual Studio 2022

1. Clone or download this repository.
2. Double-click `ByteMarket.sln` to open the solution in **Visual Studio 2022**.
3. In Solution Explorer, right-click `Default.aspx` and select **Set As Start Page**.
4. Press **F5** (or click the green **IIS Express** run button).
5. The project will compile and launch in your default web browser at `http://localhost:50143/Default.aspx`.

---

## 👨‍💻 Author

- **Name:** Anand Makwana
- **Institution:** RK University
- **Email:** amakwana969@rku.ac.in
- **Repository:** [github.com/Anand-Makwana/ByteMarket](https://github.com/Anand-Makwana/ByteMarket)
