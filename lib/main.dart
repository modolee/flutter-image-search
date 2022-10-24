import 'package:flutter/material.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/ui/home_screen.dart';
import 'package:image_search/ui/home_view_model.dart';

import 'data/api.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image search',
      home: PhotoProvider(
        viewModel: HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
