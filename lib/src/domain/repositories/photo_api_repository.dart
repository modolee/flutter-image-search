import 'package:image_search/src/data/data_sources/result.dart';
import 'package:image_search/src/domain/models/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}
