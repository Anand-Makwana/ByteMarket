/**
 * ByteMarket — Sample Products Dataset
 * Provides rich mock digital marketplace items for templates, UI kits, graphics, icons & themes.
 * Uses clean SVG icons and standard ASCII strings to guarantee zero character-encoding corruption.
 */

const ByteMarketData = {
  categories: [
    { id: 'templates', name: 'Website Templates', icon: 'template', count: 142, desc: 'Responsive HTML, ASP.NET, Next.js & React templates' },
    { id: 'uikits', name: 'UI Kits & Design', icon: 'palette', count: 98, desc: 'Figma, Sketch & Adobe XD ready component libraries' },
    { id: 'icons', name: 'Icon Packs', icon: 'sparkles', count: 76, desc: 'Clean vector SVG, Fluent & line icon sets' },
    { id: 'graphics', name: '3D & Graphics', icon: 'cube', count: 115, desc: 'Rendered 3D assets, textures, illustrations & mockups' },
    { id: 'themes', name: 'CMS & Themes', icon: 'bolt', count: 64, desc: 'Custom themes, dashboard skins & ecommerce boilerplates' }
  ],

  // Generator for clean, modern SVG digital asset preview mockups
  generatePlaceholderSvg: function(title, category, color1, color2, label) {
    const cleanTitle = title.replace(/[^a-zA-Z0-9 —]/g, '').substring(0, 30);
    const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 500" width="100%" height="100%">
      <defs>
        <linearGradient id="g_${color1.replace(/[^a-zA-Z0-9]/g,'')}" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stop-color="${color1}" />
          <stop offset="100%" stop-color="${color2}" />
        </linearGradient>
      </defs>
      <rect width="800" height="500" fill="url(#g_${color1.replace(/[^a-zA-Z0-9]/g,'')})" />
      
      <!-- Mock Window / Card Frame -->
      <g transform="translate(100, 60)">
        <rect width="600" height="380" rx="16" fill="#ffffff" fill-opacity="0.95" />
        <!-- Top bar dots -->
        <circle cx="30" cy="28" r="6" fill="#ef4444" />
        <circle cx="50" cy="28" r="6" fill="#f59e0b" />
        <circle cx="70" cy="28" r="6" fill="#10b981" />
        <rect x="100" y="20" width="220" height="16" rx="8" fill="#e2e8f0" />
        
        <!-- Left Sidebar Preview -->
        <rect x="30" y="60" width="160" height="280" rx="10" fill="#f8fafc" />
        <rect x="50" y="90" width="120" height="14" rx="4" fill="#cbd5e1" />
        <rect x="50" y="120" width="90" height="10" rx="4" fill="#e2e8f0" />
        <rect x="50" y="140" width="100" height="10" rx="4" fill="#e2e8f0" />
        
        <!-- Banner box -->
        <rect x="210" y="60" width="360" height="140" rx="10" fill="${color1}" fill-opacity="0.15" />
        <text x="390" y="140" font-family="'Segoe UI', Roboto, sans-serif" font-weight="900" font-size="28" fill="${color1}" text-anchor="middle">${label || category}</text>
        
        <!-- Bottom cards -->
        <rect x="210" y="220" width="170" height="120" rx="10" fill="#f1f5f9" />
        <rect x="400" y="220" width="170" height="120" rx="10" fill="#f1f5f9" />
        
        <text x="390" y="325" font-family="'Segoe UI', Roboto, sans-serif" font-weight="700" font-size="16" fill="#0f172a" text-anchor="middle">${cleanTitle}</text>
      </g>
    </svg>`;
    return 'data:image/svg+xml;utf8,' + encodeURIComponent(svg);
  },

  products: [
    {
      id: 1,
      title: "Nova Admin — Modern SaaS Dashboard UI Kit",
      category: "UI Kits",
      categorySlug: "uikits",
      price: 29.00,
      originalPrice: 49.00,
      rating: 4.9,
      reviewsCount: 124,
      author: "ApexStudio",
      sales: 1420,
      downloads: 3200,
      badge: "Featured",
      color1: "#6366f1",
      color2: "#4338ca",
      label: "UI KIT",
      description: "Nova Admin is an ultra-clean, pixel-perfect dashboard UI kit crafted for high-performance SaaS applications, analytics portals, and CRM systems. Includes 120+ pre-built screens, light design tokens, 45+ charts, and atomic components.",
      features: [
        "120+ Premade Figma & HTML Dashboard Screens",
        "Light theme optimized with WCAG AAA contrast",
        "Design tokens for colors, typography & elevation",
        "Complete responsive layouts (Desktop, Tablet, Mobile)",
        "Lifetime free updates & priority support"
      ],
      filesIncluded: ["Figma (.fig)", "HTML5 / CSS3 files", "Documentation PDF", "SVG Assets"],
      version: "v2.4.0",
      lastUpdate: "Oct 2026"
    },
    {
      id: 2,
      title: "DevForge — Developer Portfolio & Resume Template",
      category: "Templates",
      categorySlug: "templates",
      price: 19.00,
      originalPrice: 35.00,
      rating: 4.8,
      reviewsCount: 89,
      author: "CodeCrafted",
      sales: 890,
      downloads: 1940,
      badge: "Bestseller",
      color1: "#0d9488",
      color2: "#047857",
      label: "TEMPLATE",
      description: "High converting portfolio template for software engineers, designers, and tech consultants. Features dark/light compatibility, animated project showcases, dynamic filtering, and interactive contact forms.",
      features: [
        "Built with clean semantic HTML5, CSS3, & JS",
        "ASP.NET Web Forms & static HTML versions included",
        "Filterable project portfolio grid",
        "Interactive experience timeline",
        "SEO friendly structured markup"
      ],
      filesIncluded: ["ASP.NET .aspx pages", "Clean CSS / JS", "Source Graphics", "Setup Guide"],
      version: "v1.8.2",
      lastUpdate: "Sep 2026"
    },
    {
      id: 3,
      title: "PixelGlyph — 1,500+ Minimal Line & Solid Icons",
      category: "Icons",
      categorySlug: "icons",
      price: 15.00,
      originalPrice: 24.00,
      rating: 5.0,
      reviewsCount: 210,
      author: "IconForge",
      sales: 3450,
      downloads: 8100,
      badge: "Trending",
      color1: "#7c3aed",
      color2: "#5b21b6",
      label: "ICONS",
      description: "A comprehensive library of over 1,500 scalable vector icons organized across 28 categories including eCommerce, Finance, Tech, AI, and Social. Supplied in SVG, PNG, EPS, and React/Web Font formats.",
      features: [
        "1,500+ Unique icons in 2 styles (Line & Solid)",
        "24x24 px grid aligned with optical balance",
        "SVGs optimized with SVGO for smallest file size",
        "Web font kit (WOFF2/TTF) ready to drop in",
        "Includes Figma library with component variants"
      ],
      filesIncluded: ["SVG Vector Files", "WebFont Package", "Figma File", "AI Source"],
      version: "v3.1.0",
      lastUpdate: "Oct 2026"
    },
    {
      id: 4,
      title: "Aura 3D — Futuristic Tech & Finance 3D Illustrations",
      category: "Graphics",
      categorySlug: "graphics",
      price: 34.00,
      originalPrice: 59.00,
      rating: 4.9,
      reviewsCount: 67,
      author: "RenderLab",
      sales: 620,
      downloads: 1400,
      badge: "Hot",
      color1: "#ec4899",
      color2: "#be185d",
      label: "3D ASSETS",
      description: "Elevate your landing pages and pitch decks with 65 premium 3D illustrations. Rendered in high-resolution 4K with transparent backgrounds, customizable Blender source scenes, and trendy clay textures.",
      features: [
        "65 High-res 4K PNGs with transparent alpha",
        "Fully textured Blender (.blend) project files",
        "Trendy clay and metallic material variants",
        "Light-mode optimized reflections and lighting",
        "Commercial extended usage license"
      ],
      filesIncluded: ["PNG 4000x4000px", "Blender .blend files", "FBX / OBJ 3D models", "License PDF"],
      version: "v1.2.0",
      lastUpdate: "Oct 2026"
    },
    {
      id: 5,
      title: "ShopSphere — Ultra Fast eCommerce Storefront",
      category: "Themes",
      categorySlug: "themes",
      price: 39.00,
      originalPrice: 69.00,
      rating: 4.7,
      reviewsCount: 153,
      author: "WebNexus",
      sales: 1100,
      downloads: 2700,
      badge: "Featured",
      color1: "#2563eb",
      color2: "#1d4ed8",
      label: "THEME",
      description: "Complete modern eCommerce template designed for digital goods and physical storefronts. Includes product quick-view modals, interactive cart drawer, checkout stepper, and customer account portals.",
      features: [
        "Complete shopping cart & wishlist UI flow",
        "Instant search with autocomplete preview",
        "Product variation selectors (Color, Size, License)",
        "Mobile-first responsive architecture",
        "Cross-browser tested in Chrome, Edge, Safari, Firefox"
      ],
      filesIncluded: ["HTML5/CSS3/JS", "Figma Design System", "Sample Assets", "Quick Start PDF"],
      version: "v2.0.1",
      lastUpdate: "Aug 2026"
    },
    {
      id: 6,
      title: "SaaS Launchpad — Startup Landing Page System",
      category: "Templates",
      categorySlug: "templates",
      price: 24.00,
      originalPrice: 45.00,
      rating: 4.9,
      reviewsCount: 180,
      author: "CodeCrafted",
      sales: 2190,
      downloads: 4800,
      badge: "Bestseller",
      color1: "#059669",
      color2: "#047857",
      label: "STARTUP",
      description: "The ultimate converting landing page system for SaaS products, AI startups, and digital apps. Features sticky navigation, pricing calculator, feature comparison grid, testimonial carousels, and FAQ accordions.",
      features: [
        "8 Diverse Hero section variations",
        "Interactive pricing tiers with monthly/yearly toggle",
        "Light clean aesthetic with soft violet/teal accents",
        "Vanilla JS components — zero heavy dependencies",
        "Ready to plug into ASP.NET Web Forms backend"
      ],
      filesIncluded: ["HTML5 / ASP.NET files", "Sass & CSS", "Vector Icons", "User Guide"],
      version: "v3.0.0",
      lastUpdate: "Oct 2026"
    },
    {
      id: 7,
      title: "FinFlow — Banking & Crypto Dashboard UI System",
      category: "UI Kits",
      categorySlug: "uikits",
      price: 32.00,
      originalPrice: 55.00,
      rating: 4.8,
      reviewsCount: 78,
      author: "ApexStudio",
      sales: 750,
      downloads: 1600,
      badge: "Trending",
      color1: "#0284c7",
      color2: "#0369a1",
      label: "FINTECH",
      description: "Modern fintech UI kit designed for personal banking apps, cryptocurrency wallets, and investment portfolios. Built with clean light colors, card components, transaction lists, and financial charts.",
      features: [
        "95+ Figma components with auto-layout v5",
        "Light theme optimized for clarity and trust",
        "Includes transaction receipt and invoice templates",
        "Vector debit/credit card mockup generators",
        "Production-ready CSS variables"
      ],
      filesIncluded: ["Figma Design Kit", "Interactive Prototype", "UI Icon Library", "Font Assets"],
      version: "v1.4.0",
      lastUpdate: "Aug 2026"
    },
    {
      id: 8,
      title: "MonoFont — Clean Geometric Sans-Serif Typeface",
      category: "Graphics",
      categorySlug: "graphics",
      price: 22.00,
      originalPrice: 38.00,
      rating: 5.0,
      reviewsCount: 94,
      author: "TypoFoundry",
      sales: 1340,
      downloads: 3100,
      badge: "New",
      color1: "#d97706",
      color2: "#b45309",
      label: "FONT",
      description: "A geometric sans-serif font family with 9 weights ranging from Thin to Black, complete with true italics and 450+ glyphs supporting extended Latin character sets.",
      features: [
        "9 Weights (Thin, Light, Regular, Medium, SemiBold, Bold, ExtraBold, Black)",
        "Includes matching italic cuts for all weights",
        "OTF, TTF, WOFF, and WOFF2 formats included",
        "Extensive OpenType features: ligatures, tabular numbers",
        "Unlimited web and desktop usage license"
      ],
      filesIncluded: ["Desktop OTF/TTF", "Web WOFF/WOFF2", "Glyph Specimen Sheet", "EULA"],
      version: "v1.0.0",
      lastUpdate: "Oct 2026"
    }
  ],

  init: function() {
    this.products.forEach(p => {
      if (!p.image) {
        p.image = this.generatePlaceholderSvg(p.title, p.category, p.color1, p.color2, p.label);
      }
    });
  }
};

ByteMarketData.init();
