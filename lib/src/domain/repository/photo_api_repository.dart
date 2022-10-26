import 'package:image_search/src/data/data_source/result.dart';
import 'package:image_search/src/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}
