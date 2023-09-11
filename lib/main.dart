import 'package:flutter/material.dart';
import 'home_widget.dart';

/// Flutter code sample for [Scaffold].

void main() => runApp(
      const MaterialApp(
        home: App(),
      ),
    );

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
