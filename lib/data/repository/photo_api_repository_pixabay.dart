import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';

class PhotoApiRepositoryPixabay implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryPixabay({required this.api});

  Future<List<Photo>> fetch(String query) async {
    final photoJsonList = await api.fetch(query);
    return photoJsonList.map((hit) => Photo.fromJson(hit)).toList();
  }
}
