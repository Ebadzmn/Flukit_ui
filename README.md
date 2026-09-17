<div align="center">
  <h1>⚡ flukit_ui</h1>
  <p><strong>A fluent, lightweight productivity toolkit for Flutter developers.</strong></p>
  <p>Write standard Flutter widgets with expressive method chaining. Zero boilerplate, zero learning curve.</p>

  <p>
    <a href="https://pub.dev/packages/flukit_ui"><img src="https://img.shields.io/pub/v/flukit_ui.svg" alt="Pub Version"></a>
    <a href="https://github.com/Ebadzmn/Flukit_ui"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  </p>
</div>

---

## 📑 Table of Contents
- [🌟 Why FluKit UI?](#-why-flukit-ui)
- [📦 Installation](#-installation)
- [📱 Real-Life UI Components Examples](#-real-life-ui-components-examples)
  - [1. Modern Login & Auth Form](#1-modern-login--auth-form)
  - [2. E-Commerce Product Card](#2-e-commerce-product-card)
  - [3. User Profile Header with Badges](#3-user-profile-header-with-badges)
  - [4. Transaction / Activity History Tile](#4-transaction--activity-history-tile)
- [🚀 Comprehensive API Reference & Usage](#-comprehensive-api-reference--usage)
  - [1. 📝 Text & Typography Extensions](#1--text--typography-extensions)
  - [2. 📐 Widget Layout & Styling Extensions](#2--widget-layout--styling-extensions)
  - [3. 📱 BuildContext (Navigation, Dimensions & SnackBar)](#3--buildcontext-navigation-dimensions--snackbar)
  - [4. 🔢 Spacing, Radius & Duration Extensions](#4--spacing-radius--duration-extensions)
  - [5. 📜 List Extensions & Easy Columns/Rows](#5--list-extensions--easy-columnsrows)
  - [6. 🔤 String Extensions & Utilities](#6--string-extensions--utilities)
  - [7. 📦 Smart Box Widget (Boilerplate-free Container)](#7--smart-box-widget-boilerplate-free-container)
  - [8. 🎨 Color & Helper Functions](#8--color--helper-functions)
- [⚡ Complete Before vs After Comparison](#-complete-before-vs-after-comparison)
- [🤝 Contributing & License](#-contributing--license)

---

## 🌟 Why FluKit UI?

Writing standard Flutter UI usually requires heavy boilerplate like deeply nested `TextStyle(...)`, `BoxDecoration(...)`, `EdgeInsets.all(...)`, `MediaQuery.of(context)` and `Navigator.push(...)`.

**FluKit UI doesn't force you to memorize strange 3-letter shorthand widget names.** Instead, you use standard Flutter widgets and properties with fluent chained methods:

- ✅ **Zero Learning Curve:** Keep writing standard Flutter `Text`, `Container`, `Row`, `Column`.
- ✅ **Auto-complete Friendly:** Type a dot (`.`) in VS Code or Android Studio to instantly see all available styling options.
- ✅ **Up to 60% Less Code:** Dramatically reduces nesting brackets and boilerplate.
- ✅ **Fast & Lightweight:** Pure Dart extension wrappers with zero performance overhead.

---

## 📦 Installation

Add `flukit_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  flukit_ui: ^1.0.1
```

Or run:
```bash
flutter pub add flukit_ui
```

Then import it wherever needed:
```dart
import 'package:flukit_ui/flukit_ui.dart';
```

---

## 📱 Real-Life UI Components Examples

Here are real-life Flutter components built cleanly using `flukit_ui`:

### 1. Modern Login & Auth Form
```dart
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Box(
      padding: 24,
      radius: 20,
      color: Colors.white,
      shadow: [dropShadow(color: Colors.black.op(0.06), blur: 20, offset: const Offset(0, 10))],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title & Subtitle
          const Text('Welcome Back!').size(24).bold().color(const Color(0xFF0F172A)),
          6.height,
          const Text('Enter your credentials to continue').size(14).color(Colors.grey),
          
          24.height,
          
          // Input Fields
          TextField(
            decoration: InputDecoration(
              hintText: 'Email Address',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(borderRadius: 12.radius),
            ),
          ),
          16.height,
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              border: OutlineInputBorder(borderRadius: 12.radius),
            ),
          ),
          
          12.height,
          
          // Forgot Password Link
          const Text('Forgot Password?')
              .size(13)
              .semiBold()
              .color(const Color(0xFF4F46E5))
              .alignRight()
              .onTap(() => context.showSnackBar('Reset link sent!')),
          
          24.height,
          
          // Submit Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F46E5),
              foregroundColor: Colors.white,
              padding: 16.padY,
              shape: RoundedRectangleBorder(borderRadius: 12.radius),
            ),
            onPressed: () {
              context.hideKeyboard();
              context.showSnackBar('Logging in...');
            },
            child: const Text('Sign In').size(16).bold(),
          ),
        ],
      ),
    );
  }
}
```

---

### 2. E-Commerce Product Card
```dart
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final double rating;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Box(
      width: 200,
      padding: 12,
      radius: 16,
      color: Colors.white,
      borderColor: const Color(0xFFF1F5F9),
      shadow: [dropShadow(color: Colors.black.op(0.04), blur: 12)],
      onTap: () => print('Product clicked'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image with Favorite Button overlay
          Stack(
            children: [
              Image.network(imageUrl, height: 140, width: double.infinity, fit: BoxFit.cover)
                  .rounded(12),
              Positioned(
                top: 8,
                right: 8,
                child: Box(
                  padding: 6,
                  color: Colors.white.op(0.9),
                  radius: 20,
                  onTap: () => context.showSnackBar('Added to favorites!'),
                  child: const Icon(Icons.favorite_border, size: 16, color: Colors.red),
                ),
              ),
            ],
          ),
          
          10.height,
          
          // Product Title
          Text(title)
              .size(15)
              .semiBold()
              .color(const Color(0xFF1E293B))
              .maxLine(1, overflow: TextOverflow.ellipsis),
          
          4.height,
          
          // Rating & Reviews
          Row(
            children: [
              const Icon(Icons.star, size: 14, color: Colors.amber),
              4.width,
              Text('$rating').size(12).semiBold(),
              4.width,
              const Text('(120 reviews)').size(11).color(Colors.grey),
            ],
          ),
          
          12.height,
          
          // Price and Add to Cart Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price).size(18).bold().color(const Color(0xFF4F46E5)),
              Box(
                padding: 8,
                radius: 8,
                color: const Color(0xFF4F46E5),
                onTap: () => context.showSnackBar('$title added to cart!'),
                child: const Icon(Icons.add_shopping_cart, size: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

---

### 3. User Profile Header with Badges
```dart
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Box(
      padding: 20,
      radius: 16,
      gradient: const LinearGradient(
        colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Row(
        children: [
          // Avatar with border
          Box(
            padding: 3,
            radius: 35,
            color: Colors.white,
            child: Image.network('https://i.pravatar.cc/150?img=11')
                .square(64)
                .circle(),
          ),
          
          16.width,
          
          // User Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Sophia Williams')
                      .size(18)
                      .bold()
                      .color(Colors.white),
                  6.width,
                  const Icon(Icons.verified, size: 18, color: Colors.amber),
                ],
              ),
              4.height,
              const Text('Senior UI/UX Engineer')
                  .size(13)
                  .color(Colors.white.op(0.85)),
              8.height,
              
              // Status Badge
              Box(
                padding: insetsSymmetric(horizontal: 10, vertical: 4),
                radius: 20,
                color: Colors.white.op(0.2),
                child: const Text('PRO MEMBER')
                    .size(10)
                    .bold()
                    .color(Colors.white)
                    .letterSpacing(0.8),
              ),
            ],
          ).expanded(),
        ],
      ),
    );
  }
}
```

---

### 4. Transaction / Activity History Tile
```dart
class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final bool isIncome;

  const TransactionTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Box(
      padding: 14,
      radius: 12,
      color: Colors.white,
      borderColor: const Color(0xFFF1F5F9),
      onTap: () => print('Transaction details: $title'),
      child: Row(
        children: [
          // Category Icon Box
          Box(
            padding: 10,
            radius: 10,
            color: (isIncome ? Colors.green : Colors.red).op(0.1),
            child: Icon(
              isIncome ? Icons.arrow_downward : Icons.arrow_upward,
              color: isIncome ? Colors.green : Colors.red,
              size: 20,
            ),
          ),
          
          12.width,
          
          // Title & Timestamp
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title).size(15).semiBold().color(const Color(0xFF0F172A)),
              2.height,
              Text(date).size(12).color(Colors.grey),
            ],
          ).expanded(),
          
          // Amount
          Text('${isIncome ? "+" : "-"}$amount')
              .size(15)
              .bold()
              .color(isIncome ? Colors.green : const Color(0xFF0F172A)),
        ],
      ),
    );
  }
}
```

---

## 🚀 Comprehensive API Reference & Usage

### 1. 📝 Text & Typography Extensions
Never write `style: TextStyle(...)` again for common styling. Simply chain methods directly on `Text`:

```dart
// Basic typography
Text('Welcome Back')
  .size(24)
  .bold()
  .color(Colors.blue)
  .alignCenter()

// Font weights
Text('Heading').semiBold()
Text('Subheading').medium()
Text('Body text').normal()
Text('Caption').light()

// Formatting & decorations
Text('Important notice')
  .italic()
  .underline(color: Colors.red, thickness: 2)
  .letterSpacing(1.2)
  .lineHeight(1.5)
  .fontFamily('Poppins')

// Shadows & ellipsis limits
Text('Long description text here...')
  .maxLine(2, overflow: TextOverflow.ellipsis)
  .shadow(color: Colors.black26, blurRadius: 4, offset: const Offset(0, 2))
```

---

### 2. 📐 Widget Layout & Styling Extensions
Apply padding, alignment, sizing, border radius, gestures, or conditional visibility to **any Flutter widget**:

```dart
// 1. Padding
MyWidget().paddingAll(16)
MyWidget().paddingSymmetric(horizontal: 20, vertical: 10)
MyWidget().paddingOnly(top: 12, left: 8)

// 2. Alignment & Center
MyWidget().center()
MyWidget().alignTopRight()
MyWidget().alignBottomLeft()
MyWidget().align(Alignment.centerRight)

// 3. Expanded & Flexible
MyWidget().expanded(2) // flex: 2
MyWidget().flexible()

// 4. Sizing constraints
MyWidget().width(120)
MyWidget().height(60)
MyWidget().square(80) // 80x80 size

// 5. Rounded corners & Shapes
MyWidget().rounded(16) // ClipRRect with radius 16
MyWidget().circle()    // ClipOval

// 6. Clicks & Gestures (Instant ripple effect)
MyWidget().onTap(() {
  print('Widget Clicked!');
}, radius: 12)

// 7. Conditional Visibility
MyWidget().visible(isLoggedIn, replacement: Text('Please log in'))

// 8. Scrolling & SafeArea
MyWidget().scrollable() // Wraps in SingleChildScrollView
MyWidget().safeArea()
```

---

### 3. 📱 BuildContext (Navigation, Dimensions & SnackBar)
Access screen size, theme data, navigation, and overlays directly from `context` in a single line:

```dart
// Navigation
context.push(const ProfileScreen());
context.pushReplacement(const DashboardScreen());
context.pushAndRemoveUntil(const LoginScreen());
context.pop();

// Screen Dimensions & Orientation
double screenWidth = context.width;
double screenHeight = context.height;
bool isLandscape = context.isLandscape;
double statusBarHeight = context.topPadding;

// Theme & ColorScheme
ThemeData currentTheme = context.theme;
Color primaryColor = context.primaryColor;
bool isDark = context.isDarkMode;

// SnackBar & Overlays
context.showSnackBar('Profile saved successfully!');
context.showSnackBar(
  'Error occurred',
  backgroundColor: Colors.red,
  duration: 4.seconds,
);

// Dismiss keyboard
context.hideKeyboard();
```

---

### 4. 🔢 Spacing, Radius & Duration Extensions
Use clean number extensions for spacing, insets, and time durations:

```dart
// Vertical and Horizontal Spacing in Column/Row
Column(
  children: [
    Text('Title').bold(),
    8.height, // SizedBox(height: 8) - or 8.h
    Text('Subtitle'),
    16.height,
    Row(
      children: [
        Icon(Icons.star),
        6.width, // SizedBox(width: 6) - or 6.w
        Text('4.9'),
      ],
    ),
  ],
)

// Square gap
20.gap // SizedBox(width: 20, height: 20)

// Quick Insets & Radius
final padding = 16.padAll; // EdgeInsets.all(16)
final horizontalPadding = 12.padX; // EdgeInsets.symmetric(horizontal: 12)
final borderRadius = 12.radius; // BorderRadius.circular(12)

// Expressive Durations
300.ms       // Duration(milliseconds: 300)
2.seconds    // Duration(seconds: 2)
5.minutes    // Duration(minutes: 5)
```

---

### 5. 📜 List Extensions & Easy Columns/Rows
Never repeat `SizedBox(height: ...)` between list items again:

```dart
// Automatically add gap between all children
Column(
  children: [
    WidgetA(),
    WidgetB(),
    WidgetC(),
  ].gap(12), // Inserts 12px gap between every widget automatically!
)

// Convert a List directly to a Column or Row with gaps
[
  Text('Item 1'),
  Text('Item 2'),
  Text('Item 3'),
].toColumn(gap: 16, crossAxisAlignment: CrossAxisAlignment.start)

[
  Icon(Icons.home),
  Text('Home'),
].toRow(gap: 8)

// Add custom separator
[WidgetA(), WidgetB()].separatedBy(const Divider())
```

---

### 6. 🔤 String Extensions & Utilities
Convert strings directly into Text widgets or format strings cleanly:

```dart
// Direct Text creation & chaining
'Hello World'.text().size(18).bold().color(Colors.purple)

// Formatting helpers
'john doe'.capitalizeFirst   // 'John doe'
'flutter developer'.titleCase // 'Flutter Developer'

// Validations
'test@domain.com'.isValidEmail // true
'12345'.isNumeric              // true
```

---

### 7. 📦 Smart Box Widget (Boilerplate-free Container)
The `Box` widget replaces verbose `Container(decoration: BoxDecoration(...))` with clean, direct properties:

```dart
Box(
  width: double.infinity,
  padding: 16, // Accepts double, int, or EdgeInsets
  margin: 12,
  radius: 16,  // Clean border radius
  color: Colors.white,
  borderColor: Colors.grey.shade200,
  borderWidth: 1.5,
  shadow: [
    dropShadow(color: Colors.black12, blur: 10, offset: const Offset(0, 4)),
  ],
  onTap: () => print('Box tapped!'),
  child: Column(
    children: [
      Text('Inside Smart Box').bold(),
      8.height,
      Text('No BoxDecoration boilerplate needed!'),
    ],
  ),
)
```

---

### 8. 🎨 Color & Helper Functions
```dart
// Hex color parsing
Color brandColor = hex('#4F46E5');
Color transparentBrand = hex('#4F46E5', alpha: 0.5);

// Color adjustments
Colors.blue.op(0.4)       // Smooth opacity
Colors.blue.darken(0.15)  // Darken by 15%
Colors.blue.lighten(0.15) // Lighten by 15%

// Drop shadow helper
BoxShadow shadow = dropShadow(
  color: Colors.black.op(0.08),
  blur: 12,
  offset: const Offset(0, 6),
);
```

---

## ⚡ Complete Before vs After Comparison

### Example: Building a Profile Card

#### ❌ Standard Flutter (Verbose & Nested):
```dart
Material(
  color: Colors.transparent,
  child: InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () => Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ProfilePage()),
    ),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset('assets/avatar.png', width: 48, height: 48),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Alex Turner',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 4),
              Text(
                'Product Designer',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
)
```

#### ✅ With `flukit_ui` (Clean, Readable & Fluent):
```dart
Box(
  padding: 16,
  radius: 16,
  color: Colors.white,
  borderColor: hex('#E2E8F0'),
  shadow: [dropShadow()],
  onTap: () => context.push(const ProfilePage()),
  child: Row(
    children: [
      Image.asset('assets/avatar.png').square(48).circle(),
      12.width,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Alex Turner').size(16).bold().color(Colors.black),
          4.height,
          const Text('Product Designer').size(13).color(Colors.grey),
        ],
      ),
    ],
  ),
)
```

---

## 🤝 Contributing & License

Contributions, issues, and feature requests are welcome!
Feel free to open an issue or pull request on the [GitHub repository](https://github.com/Ebadzmn/Flukit_ui).

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
