import 'dart:math';
import 'package:image_search/src/data/data_sources/result.dart';
import 'package:image_search/src/domain/models/photo.dart';
import 'package:image_search/src/domain/repositories/photo_api_repository.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase({required this.repository});

  Future<Result<List<Photo>>> call(String query) async {
    final result = await repository.fetch(query);

    return result.when(
      success: (photos) {
        return Result.success(photos.sublist(0, min(3, photos.length)));
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
