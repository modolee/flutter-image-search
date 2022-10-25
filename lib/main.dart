import 'package:flutter/material.dart';
import 'package:image_search/ui/home_screen.dart';
import 'package:image_search/ui/home_view_model.dart';
import 'package:provider/provider.dart';
import 'data/pixabay_api.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image search',
      home: Provider(
        create: (context) => HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
