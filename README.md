# flukit_ui

<p align="center">
  <img src="https://raw.githubusercontent.com/Ebadzmn/Flukit_ui/main/assets/banner.png" alt="FluKit UI Banner" width="100%" />
</p>

<p align="center">
  <a href="https://pub.dev/packages/flukit_ui"><img src="https://img.shields.io/badge/pub-v1.0.0-blue.svg" alt="pub package" /></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT" /></a>
  <img src="https://img.shields.io/badge/tests-passing-brightgreen.svg" alt="Flutter Tests" />
</p>

> **Flutter, but with less boilerplate.**  
> A lightweight, productivity-focused Flutter package providing short, readable, and consistent aliases for commonly used widgets, properties, and UI utilities.

---

## ⚡ Why flukit_ui?

Flutter’s declarative widget tree is expressive, but building modern UI often results in deep nesting and excessive boilerplate for basic attributes:

- Multiple nested objects (`Container`, `BoxDecoration`, `BorderRadius`, `Border.all`, `BoxShadow`) just to style a card.
- Verbose and repetitive `EdgeInsets.all(...)` and `EdgeInsets.symmetric(...)`.
- Lengthy `ElevatedButton.styleFrom(backgroundColor: ..., shape: RoundedRectangleBorder(...))`.
- Cumbersome `MainAxisAlignment.spaceBetween` and `CrossAxisAlignment.center` declarations.
- Deprecated/verbose color opacity methods (`color.withValues(alpha: 0.2)`).

`flukit_ui` solves this by introducing **concise, predictable aliases** and **fluent chaining**, while preserving 100% of standard Flutter behavior and performance.

---

## ⚖️ Before vs After

### 1. Card & Container
#### Standard Flutter:
```dart
Container(
  width: 200,
  height: 100,
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  margin: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey.shade300, width: 1),
  ),
  child: Text(
    'Hello World',
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
)
```

#### With flukit_ui:
```dart
cont(
  w: 200,
  h: 100,
  px: 16,
  py: 12,
  mar: 8,
  rad: 12,
  cl: white,
  bor: 1,
  bc: grey300,
  ch: txt('Hello World', fs: 20, fw: bold, cl: black),
)
```

---

### 2. Buttons
#### Standard Flutter:
```dart
ElevatedButton.icon(
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF4F46E5),
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  onPressed: () => print('Created'),
  icon: const Icon(Icons.add, size: 18, color: Colors.white),
  label: const Text('Create Task', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
)
```

#### With flukit_ui:
```dart
btn.icon(
  icon: Icons.add,
  label: 'Create Task',
  onTap: () => print('Created'),
  bg: hex('#4F46E5'),
  fg: white,
  rad: 10,
  px: 20,
  py: 12,
)
```

---

### 3. Linear Progress Indicator
#### Standard Flutter:
```dart
ClipRRect(
  borderRadius: BorderRadius.circular(8),
  child: LinearProgressIndicator(
    value: 0.65,
    minHeight: 8,
    backgroundColor: Colors.white.withValues(alpha: 0.25),
    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
  ),
)
```

#### With flukit_ui:
```dart
lprog(0.65, h: 8, bg: white.op(0.25), cl: white, rad: 8)
```

---

## 📦 Installation

Add `flukit_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  flukit_ui: ^1.0.0
```

Import the package in your Dart code:

```dart
import 'package:flukit_ui/flukit_ui.dart';
```

---

## 🚀 Complete API Reference & Cheatsheet

### 1. Widget Aliases Comparison Table

| Category / Target | Standard Flutter (Before) | flukit_ui (Now) | Live Example / Usage |
|---|---|---|---|
| **Container & Decoration** | `Container(decoration: BoxDecoration(...))` | `cont` | `cont(w: 120, h: 50, pad: 16, rad: 12, cl: white, bor: 1, bc: grey200, ch: ...)` |
| **Container with Tap** | `InkWell(borderRadius: ..., child: Container(...))` | `cont(onTap: ...)` | `cont(pad: 12, rad: 8, cl: blue, onTap: () => print('tapped'), ch: txt('Tap'))` |
| **Text & Styling** | `Text('...', style: TextStyle(...))` | `txt` | `txt('Welcome', fs: 18, fw: bold, cl: black, ta: TextAlign.center)` |
| **Elevated Button** | `ElevatedButton(style: ElevatedButton.styleFrom(...))` | `btn` | `btn('Submit', onTap: () {}, bg: blue, fg: white, rad: 10, px: 20, py: 12)` |
| **Button with Icon** | `ElevatedButton.icon(style: ..., icon: ..., label: ...)` | `btn.icon` | `btn.icon(icon: Icons.add, label: 'Add Task', onTap: () {}, bg: blue, rad: 10)` |
| **Outlined Button** | `OutlinedButton(style: OutlinedButton.styleFrom(...))` | `btn.outline` | `btn.outline('Cancel', onTap: () {}, bc: grey300, fg: black, rad: 8)` |
| **Text Button** | `TextButton(child: Text('...'))` | `btn.text` | `btn.text('Forgot Password?', onTap: () {}, fg: blue)` |
| **Progress Indicator** | `ClipRRect(child: LinearProgressIndicator(...))` | `lprog` | `lprog(0.75, h: 8, bg: white.op(0.2), cl: white, rad: 8)` |
| **Column** | `Column(mainAxisAlignment: ..., children: [...])` | `col` | `col(ch: [txt('Item 1'), txt('Item 2')], cross: caa.start, main: maa.between)` |
| **Row** | `Row(crossAxisAlignment: ..., children: [...])` | `row` | `row(ch: [ico(Icons.star), hgap(8), txt('Rating')], main: maa.center)` |
| **Stack** | `Stack(alignment: ..., children: [...])` | `stk` | `stk(ch: [cont(...), txt('Overlaid')])` |
| **Center** | `Center(child: ...)` | `ctr` | `ctr(ch: txt('Centered text'))` |
| **Padding** | `Padding(padding: EdgeInsets.all(16), child: ...)` | `pad` | `pad(16, ch: txt('Padded'))` or `pad.sym(h: 16, v: 8, ch: ...)` |
| **Expanded** | `Expanded(flex: 1, child: ...)` | `exp` | `exp(ch: txt('Fills remaining space'))` |
| **Flexible** | `Flexible(flex: 1, child: ...)` | `flx` | `flx(ch: cont(...))` |
| **SizedBox** | `SizedBox(width: 100, height: 50, child: ...)` | `box` | `box(w: 100, h: 50, ch: ...)` or `box.shrink()` |
| **Scaffold** | `Scaffold(appBar: ..., body: ..., floatingActionButton: ...)` | `scaf` | `scaf(appBar: AppBar(...), body: ..., fab: FloatingActionButton(...), bg: grey100)` |
| **Icon** | `Icon(Icons.add, size: 20, color: Colors.white)` | `ico` | `ico(Icons.add, sz: 20, cl: white)` |
| **Image** | `Image.network(...)` / `Image.asset(...)` | `img` | `img.net('https://...', w: 80, h: 80, rad: 12)` |
| **SafeArea** | `SafeArea(child: ...)` | `safe` | `safe(ch: txt('Safe Content'))` |
| **Align** | `Align(alignment: Alignment.centerRight, child: ...)` | `ali` | `ali(ali: Alignment.centerRight, ch: ...)` |

---

### 2. Alignment Shortcuts Table

| Alignment Target | Standard Flutter (Before) | flukit_ui (Now) | Live Example / Usage |
|---|---|---|---|
| **Space Between** | `MainAxisAlignment.spaceBetween` | `maa.between` or `spaceBetween` | `row(main: maa.between, ch: [...])` |
| **Center (Main)** | `MainAxisAlignment.center` | `maa.center` | `row(main: maa.center, ch: [...])` |
| **Start / End (Main)**| `MainAxisAlignment.start` / `.end` | `maa.start` / `maa.end` | `col(main: maa.start, ch: [...])` |
| **Space Around** | `MainAxisAlignment.spaceAround` | `maa.around` or `spaceAround` | `row(main: maa.around, ch: [...])` |
| **Space Evenly** | `MainAxisAlignment.spaceEvenly` | `maa.evenly` or `spaceEvenly` | `row(main: maa.evenly, ch: [...])` |
| **Stretch (Cross)**| `CrossAxisAlignment.stretch` | `caa.stretch` or `stretch` | `col(cross: caa.stretch, ch: [...])` |
| **Start / Center (Cross)**| `CrossAxisAlignment.start` / `.center` | `caa.start` / `caa.center` | `col(cross: caa.start, ch: [...])` |

---

### 3. Spacing & Gap Utilities Table

| Requirement | Standard Flutter (Before) | flukit_ui (Now) | Live Example / Usage |
|---|---|---|---|
| **Vertical Space** | `SizedBox(height: 16)` | `vgap(16)` or `16.vgap` | `col(ch: [txt('Title'), vgap(16), txt('Body')])` |
| **Horizontal Space**| `SizedBox(width: 12)` | `hgap(12)` or `12.hgap` | `row(ch: [ico(Icons.add), 12.hgap, txt('Add')])` |
| **Square Gap** | `SizedBox(width: 16, height: 16)` | `gap(16)` or `16.gap` | `gap(16)` |

---

### 4. Color, Opacity & Radius Helpers Table

| Feature | Standard Flutter (Before) | flukit_ui (Now) | Live Example / Usage |
|---|---|---|---|
| **Hex Color Parsing** | `Color(int.parse('0xFF4F46E5'))` | `hex('#4F46E5')` | `cl: hex('#4F46E5')` |
| **Color with Opacity**| `color.withValues(alpha: 0.25)` | `color.op(0.25)` | `white.op(0.25)` or `black.op(0.5)` |
| **Circular Radius** | `BorderRadius.circular(12)` | `circular(12)` or `12.rad` | `rad: 12.rad` or `circular(12)` |
| **Symmetric Insets** | `EdgeInsets.symmetric(horizontal: 16, vertical: 8)` | `16.px` / `8.py` | `pad: [16.px, 8.py]` or `cont(px: 16, py: 8)` |
| **Drop Shadow** | `BoxShadow(color: ..., blurRadius: 10, offset: Offset(0, 4))` | `dropShadow(...)` | `shadow: [dropShadow(color: black.op(0.05), blur: 10)]` |

---

### 5. Fluent Modifiers & Extensions Table

| Extension | Standard Flutter (Before) | flukit_ui (Now) | Live Example / Usage |
|---|---|---|---|
| **Clickable / Ripple**| `InkWell(borderRadius: ..., onTap: ..., child: ...)` | `.onTap(..., rad: ...)` | `myWidget.onTap(() => print('tapped'), rad: 12)` |
| **All Padding** | `Padding(padding: EdgeInsets.all(16), child: ...)` | `.pad(16)` | `myWidget.pad(16)` |
| **Horizontal Padding**| `Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: ...)` | `.px(12)` | `myWidget.px(12)` |
| **Vertical Padding** | `Padding(padding: EdgeInsets.symmetric(vertical: 8), child: ...)` | `.py(8)` | `myWidget.py(8)` |
| **Clip Corner Radius**| `ClipRRect(borderRadius: BorderRadius.circular(12), child: ...)` | `.clipR(12)` | `myWidget.clipR(12)` |
| **Center Widget** | `Center(child: ...)` | `.center()` | `myWidget.center()` |
| **Expand Widget** | `Expanded(child: ...)` | `.expanded()` | `myWidget.expanded()` |
| **Opacity** | `Opacity(opacity: 0.8, child: ...)` | `.opacity(0.8)` | `myWidget.opacity(0.8)` |

#### On `txt`:
```dart
txt('Build Faster')
    .fs(22)
    .bold()
    .cl(white)
    .ta(TextAlign.center);

// Available weight helpers:
.bold(), .semiBold(), .medium(), .light()
```

#### On `num`:
```dart
16.vgap     // SizedBox(height: 16)
8.hgap      // SizedBox(width: 8)
12.rad      // BorderRadius.circular(12)
16.pad      // EdgeInsets.all(16)
12.px       // EdgeInsets.symmetric(horizontal: 12)
8.py        // EdgeInsets.symmetric(vertical: 8)
```

---

## 🏛️ Design Philosophy

1. **100% Flutter Native**: Under the hood, every alias is directly mapped to canonical Flutter widgets. Zero performance overhead.
2. **Intuitive & Predictable**: Abbreviations follow standard developer conventions (`pad` = padding, `rad` = borderRadius, `cl` = color, `fs` = fontSize, `bg` = backgroundColor).
3. **Full Interoperability**: Mix and match freely with existing Flutter code and third-party libraries.

---

## 🤝 Contributing

Contributions, feedback, and pull requests are welcome!
1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/amazing-feature`).
3. Ensure all tests pass (`flutter test`) and `flutter analyze` has zero issues.
4. Open a Pull Request.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
