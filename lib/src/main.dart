import 'package:flutter/material.dart';
import 'package:image_search/src/data/data_sources/pixabay_api.dart';
import 'package:image_search/src/data/repositories/photo_api_repository_pixabay.dart';
import 'package:image_search/src/domain/use_cases/get_photos_usecase.dart';
import 'package:image_search/src/presentation/home/home_screen.dart';
import 'package:image_search/src/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image search',
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(
          getPhotosUseCase: GetPhotosUseCase(
            repository: PhotoApiRepositoryPixabay(
              api: PixabayApi(
                client: http.Client(),
              ),
            ),
          ),
        ),
        child: const HomeScreen(),
      ),
    );
  }
}
