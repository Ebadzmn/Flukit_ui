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
      title: 'FluKit UI Showcase',
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
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Box(
              padding: 8,
              radius: 8,
              color: Color(0xFF4F46E5),
              child: Icon(Icons.flash_on, size: 20, color: Colors.white),
            ),
            12.width,
            const Text('FluKit UI Showcase')
                .size(18)
                .bold()
                .color(Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: 16.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Banner Card
            Box(
              padding: 20,
              radius: 16,
              gradient: const LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shadow: [
                dropShadow(
                  color: const Color(0xFF4F46E5).op(0.3),
                  blur: 16,
                  offset: const Offset(0, 8),
                )
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Clean UI with Fluent Extensions')
                      .size(22)
                      .bold()
                      .color(Colors.white),
                  8.height,
                  const Text(
                    'Zero learning curve. Write pure Flutter widgets with powerful method chaining.',
                  )
                      .size(14)
                      .color(Colors.white.op(0.85))
                      .lineHeight(1.4),
                  16.height,
                  Row(
                    children: [
                      Box(
                        padding: 8,
                        radius: 20,
                        color: Colors.white.op(0.2),
                        child: const Text('Text().bold()')
                            .size(12)
                            .bold()
                            .color(Colors.white),
                      ),
                      8.width,
                      Box(
                        padding: 8,
                        radius: 20,
                        color: Colors.white.op(0.2),
                        child: const Text('16.height')
                            .size(12)
                            .bold()
                            .color(Colors.white),
                      ),
                      8.width,
                      Box(
                        padding: 8,
                        radius: 20,
                        color: Colors.white.op(0.2),
                        child: const Text('.onTap()')
                            .size(12)
                            .bold()
                            .color(Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            24.height,

            // Section: Comparison Card
            const Text('Before vs After').size(18).bold().color(Colors.black),
            12.height,
            _buildComparisonCard(),

            24.height,

            // Section: Interactive Counter
            const Text('Interactive Counter Demo')
                .size(18)
                .bold()
                .color(Colors.black),
            12.height,
            Box(
              padding: 20,
              radius: 14,
              color: Colors.white,
              borderColor: const Color(0xFFE2E8F0),
              child: Column(
                children: [
                  const Text('Fluent Extension Interactivity')
                      .size(16)
                      .semiBold(),
                  12.height,
                  Text('$_counter')
                      .size(36)
                      .bold()
                      .color(const Color(0xFF4F46E5)),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => setState(() => _counter--),
                        icon: const Icon(Icons.remove, size: 18),
                        label: const Text('Decrease').medium(),
                      ),
                      16.width,
                      ElevatedButton.icon(
                        onPressed: () => setState(() => _counter++),
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('Increase').medium(),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            24.height,

            // Section: Extensions Showcase
            const Text('Text & Widget Extensions')
                .size(18)
                .bold()
                .color(Colors.black),
            12.height,
            Box(
              padding: 16,
              radius: 12,
              color: Colors.white,
              borderColor: const Color(0xFFE2E8F0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Fluent chained text example')
                      .size(16)
                      .bold()
                      .color(const Color(0xFF0F172A)),
                  8.height,
                  const Text('Secondary caption with medium weight and italic')
                      .size(13)
                      .italic()
                      .color(Colors.grey),
                  12.height,
                  Row(
                    children: [
                      const Text('Tag 1')
                          .paddingSymmetric(horizontal: 10, vertical: 6)
                          .center(),
                      12.width,
                      const Text('Tap me!')
                          .paddingSymmetric(horizontal: 12, vertical: 6)
                          .rounded(8)
                          .onTap(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Tapped Tag!')),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),

            32.height,
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonCard() {
    return Box(
      padding: 16,
      radius: 12,
      color: Colors.white,
      borderColor: const Color(0xFFE2E8F0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Standard Flutter:')
              .size(13)
              .bold()
              .color(const Color(0xFF334155)),
          6.height,
          Box(
            padding: 10,
            radius: 8,
            color: const Color(0xFFF1F5F9),
            child: const Text(
              'Text(\n  "Hello",\n  style: TextStyle(\n    fontSize: 18,\n    fontWeight: FontWeight.bold,\n    color: Colors.blue,\n  ),\n)',
            ).size(12).fontFamily('monospace').color(const Color(0xFF334155)),
          ),
          14.height,
          const Text('With FluKit UI:')
              .size(13)
              .bold()
              .color(const Color(0xFF4F46E5)),
          6.height,
          Box(
            padding: 10,
            radius: 8,
            color: const Color(0xFFEEF2FF),
            child: const Text(
              'Text("Hello")\n  .size(18)\n  .bold()\n  .color(Colors.blue)',
            )
                .size(12)
                .fontFamily('monospace')
                .color(const Color(0xFF4338CA))
                .semiBold(),
          ),
        ],
      ),
    );
  }
}
