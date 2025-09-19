# 🛍️ Product Listing App — Flutter Skill Test

A Flutter-based eCommerce-style product listing application developed as part of a technical skill assessment. The app integrates with a REST API to handle authentication, product listing, search, wishlist, and banners — all managed using the BLoC architecture.

---

## 📱 Screens Implemented

✅ Login Screen  
✅ OTP Screen  
✅ Home Screen (Search + Banner Slider + Product Grid)  
✅ Product Tab (Full product list)  
✅ Wishlist Page  
✅ Profile Page  

---

## 🧠 State Management

- [x] **Flutter BLoC**  
Used for managing UI and API states across the app including:
  - Auth
  - Product Listing
  - Banner Fetching
  - Search
  - Wishlist

---

## 🚀 Features

| Feature              | Status | Description |
|----------------------|--------|-------------|
| Authentication       | ✅     | Phone number login with conditional register |
| OTP Flow             | ✅     | OTP screen (mocked) |
| Banner Slider        | ✅     | Carousel fetched via API |
| Product Listing      | ✅     | GridView with dynamic API data |
| Wishlist             | ✅     | Toggle wishlist items via API |
| Search               | ✅     | Real-time search with API integration |
| Profile Page         | ✅     | User info fetched with JWT |
| Responsive UI        | ✅     | Scales well on various screen sizes |
| Clean Architecture   | ✅     | Separated logic, repository, and BLoC layers |

---

## 🔗 APIs Used

All APIs are from: `http://skilltestflutter.zybotechlab.com`

| API Feature   | Method | Endpoint |
|---------------|--------|----------|
| Verify User   | `POST` | `/api/verify/` |
| Login/Register| `POST` | `/api/login-register/` |
| Product List  | `GET`  | `/api/products/` |
| Banners       | `GET`  | `/api/banners/` |
| Wishlist      | `GET` / `POST` | `/api/wishlist/` |
| Profile Info  | `GET`  | `/api/user-data/` |
| Product Search| `POST` | `/api/search/?query=your_query` |

---

## 🧪 Tech Stack

- ✅ **Flutter 3.10+**
- ✅ **Flutter BLoC**
- ✅ **Dio** (for HTTP)
- ✅ **GoRouter** (for navigation)
- ✅ **flutter_secure_storage** (for token storage)
- ✅ **card_swiper**, **Equatable**, etc.

---

## 🛠️ Setup Instructions


git clone https://github.com/arunjoshuaa/product_listing_app.git
cd product-listing-app
flutter pub get
flutter run

### 📦 Folder Structure (Simplified)

lib/
│
├── blocs/ # BLoC logic (auth, product, wishlist, search, etc.)
│
├── config/ # Routing (GoRouter), constants
│
├── core/ # App-level setup, themes, utilities
│
├── models/ # Data models (Product, User, Banner, etc.)
│
├── repositories/ # API service classes (abstracted API calls)
│
├── screens/ # UI screens (Login, Home, Wishlist, Profile)
│
├── utils/ # Helper functions, token management, error handling
│
└── main.dart

