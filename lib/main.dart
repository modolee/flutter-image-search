import 'package:flutter/material.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'data/repository/photo_api_repository_pixabay.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image search',
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(
          PhotoApiRepositoryPixabay(
            api: PixabayApi(
              client: http.Client(),
            ),
          ),
        ),
        child: const HomeScreen(),
      ),
    );
  }
}
