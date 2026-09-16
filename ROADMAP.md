# flukit_ui Roadmap

This document outlines the vision and technical roadmap for future iterations of `flukit_ui`.

---

## 🎯 V1: Production Baseline (Completed)
- [x] Short, readable widget aliases (`cont`, `txt`, `col`, `row`, `stk`, `ctr`, `pad`, `ali`, `exp`, `flx`, `box`, `safe`, `scaf`, `ico`, `img`).
- [x] Predictable property shorthands (`w`, `h`, `pad`, `mar`, `rad`, `cl`, `bor`, `bc`, `fs`, `fw`, `ta`, `ovf`).
- [x] Zero-magic spacing utilities (`gap`, `vgap`, `hgap`, and `.gap` on numbers).
- [x] Hex color parser and curated color & weight tokens.
- [x] Fluent chaining on `txt` and comprehensive extensions on `Widget` & `num`.
- [x] 100% test coverage for widget trees, styling, and geometry resolution.
- [x] Verified zero analyzer warnings, zero lint issues, and formatted Dart code.

---

## 🚀 V2: Interactive & Form Shorthands
- **Button Aliases**:
  - `btn.elevated(...)`, `btn.outlined(...)`, `btn.text(...)`, `btn.icon(...)` with concise padding, radius, and color parameters.
- **Input Shorthands**:
  - `inp(...)`: Concise `TextField` alias with preset borders, label, placeholder, prefix/suffix icons, and controller binding.
- **Scroll & List Helpers**:
  - `list(...)`: Sane wrapper around `ListView.builder` and `ListView.separated` with automatic item spacing.
  - `grid(...)`: Responsive grid shorthand with column counts and aspect ratios.
- **Card & Surface Helpers**:
  - `card(...)`: Surface widget pre-configured with Material 3 elevation and rounded corners.
- **Theme Awareness**:
  - Automatic context lookups for primary, secondary, and background colors when left unspecified.

---

## 🔮 V3: Optional DSL & Code Generation Architecture

### Concept
Allow developers to optionally author layout definitions in an ultra-concise DSL format:
```text
Cont.pad:16.mar:8.rad:12.cl:white[
  Txt.fs:20.fw:bold["Hello World"]
]
```

### Planned Pipeline:
```text
      Custom DSL Source Code (.fxd)
                   │
                   ▼
      Lexer & Recursive-Descent Parser
                   │
                   ▼
       Abstract Syntax Tree (AST)
                   │
                   ▼
    Code Generator (build_runner / macro)
                   │
                   ▼
 Standard flukit_ui / Flutter Widget Code (.g.dart)
```

### Design Guarantees:
- The core `flukit_ui` runtime package will **always remain independent** and lightweight, with **zero required code-generation dependencies**.
- The DSL compiler will exist as an optional companion package (e.g., `flukit_ui_builder`).
- Developers can seamlessly mix standard Flutter widgets, `flukit_ui` Dart aliases, and generated DSL components in the same application.
