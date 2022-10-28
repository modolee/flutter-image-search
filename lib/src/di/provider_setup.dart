import 'package:image_search/src/data/data_sources/pixabay_api.dart';
import 'package:image_search/src/data/repositories/photo_api_repository_pixabay.dart';
import 'package:image_search/src/domain/repositories/photo_api_repository.dart';
import 'package:image_search/src/domain/use_cases/get_photos_usecase.dart';
import 'package:image_search/src/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;

// 1. Provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];

// 2. 다른 클래스에 의존하지 않는 Model
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  ),
];

// 3. 2에 등록 된 클래스에 의존하는 Model
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, PixabayApi>(
    update: (context, client, _) => PixabayApi(client: client),
  ),
  ProxyProvider<PixabayApi, PhotoApiRepository>(
    update: (context, api, _) => PhotoApiRepositoryPixabay(api: api),
  ),
  ProxyProvider<PhotoApiRepository, GetPhotosUseCase>(
    update: (context, repository, _) =>
        GetPhotosUseCase(repository: repository),
  ),
];

// 4. viewModels
// View가 사용. 2, 3에 등록한 클래스를 사용할 수 있음
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(
      getPhotosUseCase: context.read<GetPhotosUseCase>(),
    ),
  ),
];
