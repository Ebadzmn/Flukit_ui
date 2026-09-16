# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-09-16

### Added
- **Core Widget Aliases**:
  - `cont`: Concise, powerful wrapper around `Container` and `BoxDecoration`.
  - `txt`: Expressive `Text` wrapper with shorthand properties and fluent modifiers (`.fs()`, `.bold()`, `.cl()`, etc.).
  - `col` & `row`: Sane wrappers for `Column` and `Row` using `ch: [...]`.
  - `stk`: Lightweight `Stack` alias.
  - `ctr`: Rapid `Center` alias.
  - `pad`: Clean `Padding` helper with named constructors (`pad.all`, `pad.sym`, `pad.only`).
  - `ali`: `Align` alias.
  - `exp` & `flx`: Shorthand for `Expanded` and `Flexible`.
  - `box`: `SizedBox` alias with `box.square`, `box.shrink`, and `box.expand`.
  - `safe`: `SafeArea` alias.
  - `scaf`: `Scaffold` alias.
  - `ico`: Concise `Icon` wrapper.
  - `img`: High-level `Image` helper supporting network, assets, providers, and auto-clipping border radius.
- **Utilities & Helpers**:
  - `gap(size)`, `vgap(height)`, `hgap(width)` for effortless spacing.
  - `hex(code, {alpha})` color parser supporting `#RGB`, `#RRGGBB`, and `#AARRGGBB`.
  - Semantic color palette (`white`, `black`, `transparent`, `grey100`–`grey900`, `red`, `blue`, etc.).
  - Font weight constants (`thin`, `regular`, `medium`, `semiBold`, `bold`, etc.).
- **Extensions**:
  - `Widget` extensions: `.pad()`, `.px()`, `.py()`, `.pt()`, `.pb()`, `.pl()`, `.pr()`, `.center()`, `.expanded()`, `.flexible()`, `.opacity()`, `.clipR()`.
  - `num` extensions: `16.gap`, `16.vgap`, `16.hgap`, `12.rad`, `16.pad`, `16.px`, `16.py`.
  - Standard `Text` styling extensions: `.fs()`, `.bold()`, `.cl()`.
- **Testing & Documentation**:
  - Complete test suite covering widget trees, property mappings, edge cases, and extensions.
  - Interactive example app demonstrating all core capabilities and before-vs-after comparisons.
