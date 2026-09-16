import 'package:flutter/material.dart';
import 'package:flukit_ui/flukit_ui.dart';

void main() {
  runApp(const FluKitExampleApp());
}

class FluKitExampleApp extends StatelessWidget {
  const FluKitExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluKit UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return scaf(
      bg: hex('#F8FAFC'),
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: row(
          ch: [
            cont(
              pad: 8,
              rad: 8,
              cl: hex('#4F46E5'),
              ch: const ico(Icons.flash_on, sz: 20, cl: white),
            ),
            hgap(12),
            const txt('flutterx_ui Showcase', fs: 18, fw: bold, cl: black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: pad(
          16,
          ch: col(
            cross: CrossAxisAlignment.stretch,
            ch: [
              // Hero Banner Card
              cont(
                pad: 20,
                rad: 16,
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shadow: [
                  dropShadow(color: hex('#4F46E5', alpha: 0.3), blur: 16, offset: const Offset(0, 8))
                ],
                ch: col(
                  cross: CrossAxisAlignment.start,
                  ch: [
                    const txt('Clean UI with Zero Boilerplate', fs: 22, fw: bold, cl: white),
                    vgap(8),
                    txt(
                      'Build high-performance Flutter interfaces up to 40% faster using intuitive aliases and expressive extension chaining.',
                      fs: 14,
                      cl: white.withOpacity(0.85),
                      lh: 1.4,
                    ),
                    vgap(16),
                    row(
                      ch: [
                        cont(
                          pad: 8,
                          rad: 20,
                          cl: white.withOpacity(0.2),
                          ch: const txt('cont', fs: 12, fw: bold, cl: white),
                        ),
                        hgap(8),
                        cont(
                          pad: 8,
                          rad: 20,
                          cl: white.withOpacity(0.2),
                          ch: const txt('txt', fs: 12, fw: bold, cl: white),
                        ),
                        hgap(8),
                        cont(
                          pad: 8,
                          rad: 20,
                          cl: white.withOpacity(0.2),
                          ch: const txt('col / row', fs: 12, fw: bold, cl: white),
                        ),
                        hgap(8),
                        cont(
                          pad: 8,
                          rad: 20,
                          cl: white.withOpacity(0.2),
                          ch: const txt('gap()', fs: 12, fw: bold, cl: white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              vgap(24),

              // Section: Before vs After Comparison Card
              const txt('Before vs After', fs: 18, fw: bold, cl: black),
              vgap(12),
              _buildComparisonCard(),

              vgap(24),

              // Section: Interactive Counter Demonstration
              const txt('Interactive Widget Aliases', fs: 18, fw: bold, cl: black),
              vgap(12),
              cont(
                pad: 20,
                rad: 14,
                cl: white,
                bor: 1,
                bc: hex('#E2E8F0'),
                ch: col(
                  ch: [
                    const txt('Counter Demo with Shorthand', fs: 16, fw: semiBold),
                    vgap(12),
                    txt('$_counter', fs: 36, fw: bold, cl: hex('#4F46E5')),
                    vgap(16),
                    row(
                      main: MainAxisAlignment.center,
                      ch: [
                        ElevatedButton.icon(
                          onPressed: () => setState(() => _counter--),
                          icon: const ico(Icons.remove, sz: 18),
                          label: const txt('Decrease', fw: medium),
                        ),
                        hgap(16),
                        ElevatedButton.icon(
                          onPressed: () => setState(() => _counter++),
                          icon: const ico(Icons.add, sz: 18),
                          label: const txt('Increase', fw: medium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              vgap(24),

              // Section: Extensions Showcase
              const txt('Chaining & Extensions', fs: 18, fw: bold, cl: black),
              vgap(12),
              cont(
                pad: 16,
                rad: 12,
                cl: white,
                bor: 1,
                bc: hex('#E2E8F0'),
                ch: col(
                  cross: CrossAxisAlignment.start,
                  ch: [
                    const txt('Fluent chained text example')
                        .fs(16)
                        .bold()
                        .cl(const Color(0xFF0F172A)),
                    vgap(8),
                    const txt('Secondary caption with medium weight and italic')
                        .fs(13)
                        .italic()
                        .cl(grey600),
                    vgap(12),
                    row(
                      ch: [
                        const txt('Tag 1').pad(6).px(10).center(),
                        12.hgap,
                        const txt('Tag 2 with num extension').pad(6).px(10).center(),
                      ],
                    ),
                  ],
                ),
              ),

              vgap(32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComparisonCard() {
    return cont(
      pad: 16,
      rad: 12,
      cl: white,
      bor: 1,
      bc: hex('#E2E8F0'),
      ch: col(
        cross: CrossAxisAlignment.start,
        ch: [
          const txt('Standard Flutter (Boilerplate):', fs: 13, fw: bold, cl: grey700),
          vgap(6),
          cont(
            pad: 10,
            rad: 8,
            cl: hex('#F1F5F9'),
            ch: txt(
              'Container(\n  padding: const EdgeInsets.all(16),\n  margin: const EdgeInsets.all(8),\n  decoration: BoxDecoration(\n    color: Colors.white,\n    borderRadius: BorderRadius.circular(12),\n  ),\n)',
              fs: 12,
              font: 'monospace',
              cl: hex('#334155'),
            ),
          ),
          vgap(14),
          txt('flutterx_ui Syntax:', fs: 13, fw: bold, cl: hex('#4F46E5')),
          vgap(6),
          cont(
            pad: 10,
            rad: 8,
            cl: hex('#EEF2FF'),
            ch: txt(
              'cont(\n  pad: 16,\n  mar: 8,\n  rad: 12,\n  cl: white,\n)',
              fs: 12,
              font: 'monospace',
              cl: hex('#4338CA'),
              fw: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
