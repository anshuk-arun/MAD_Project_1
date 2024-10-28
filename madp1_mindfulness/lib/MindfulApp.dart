import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class MindfulApp extends StatelessWidget {
  const MindfulApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData swatchColor = ThemeData(
      primarySwatch: Colors.green,
      useMaterial3: true,
    );

    return MaterialApp(
      title: "Mindful App",
      theme: swatchColor,
      home: const EntryScreen(title: 'Mindfulness Entry'),
    );
  }
}

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key, required this.title});
  final String title;

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to navigate to HomeScreen
  void openHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen(title: 'Home')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'G1_Madp1_Mindfulness App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ScaleTransition(
              scale: _animation,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                  });
                },
                onLongPress: openHomeScreen,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Long Press to Enter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
