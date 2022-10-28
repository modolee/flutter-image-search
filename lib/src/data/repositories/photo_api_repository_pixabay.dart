import 'package:image_search/src/data/data_sources/pixabay_api.dart';
import 'package:image_search/src/data/data_sources/result.dart';
import 'package:image_search/src/domain/repositories/photo_api_repository.dart';
import 'package:image_search/src/domain/models/photo.dart';

class PhotoApiRepositoryPixabay implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryPixabay({required this.api});

  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);

    return result.when(
      success: (iterable) {
        return Result.success(
          iterable.map((hit) => Photo.fromJson(hit)).toList(),
        );
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
