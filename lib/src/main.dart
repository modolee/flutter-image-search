import 'package:flutter/material.dart';
import 'package:image_search/src/di/provider_setup.dart';
import 'package:image_search/src/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image search',
      home: HomeScreen(),
    );
  }
}
