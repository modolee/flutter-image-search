import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다.', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch('apple');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.photos, result);
  });
}

class FakePhotoApiRepository implements PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 7525456,
    "pageURL":
        "https://pixabay.com/photos/squirrel-wildlife-mammal-animal-7525456/",
    "type": "photo",
    "tags": "squirrel, wildlife, mammal",
    "previewURL":
        "https://cdn.pixabay.com/photo/2022/10/16/16/13/squirrel-7525456_150.jpg",
    "previewWidth": 150,
    "previewHeight": 100,
    "webformatURL":
        "https://pixabay.com/get/g8ce2072495394f335a11f3f08f4acc715e5d0d3a37ae9abe8d2acf0c5529cef52824dbb3459bff54f30ad903d8baa2824ee5c2f81a3900404f4a17cc11e989f5_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 427,
    "largeImageURL":
        "https://pixabay.com/get/g022dd64db6bfc1c77ef155653c4feaf60e84a4ecb8ed37fbd1730ca2aed7df5e023a829fb1d383bc42f1b7b135605544b754af1cda71544eae3dfe1b518803fa_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3342691,
    "views": 7987,
    "downloads": 7843,
    "collections": 2,
    "likes": 76,
    "comments": 0,
    "user_id": 1767157,
    "user": "Ralphs_Fotos",
    "userImageURL":
        "https://cdn.pixabay.com/user/2022/10/22/05-16-16-200_250x250.jpg"
  },
  {
    "id": 7535373,
    "pageURL":
        "https://pixabay.com/photos/buildings-panoramic-alhambra-7535373/",
    "type": "photo",
    "tags": "buildings, panoramic, alhambra",
    "previewURL":
        "https://cdn.pixabay.com/photo/2022/10/20/17/27/buildings-7535373_150.jpg",
    "previewWidth": 150,
    "previewHeight": 36,
    "webformatURL":
        "https://pixabay.com/get/g481e3a61fabf986639a0c122fa3e896a211ddee496d24b8463f37afb98cdc1b98610d80d5d9e22dd13a43ec11926e3c297664322fecf3bf1e87ad04656246b59_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 153,
    "largeImageURL":
        "https://pixabay.com/get/g1780e00fdceeaf2a6358fdf60f5ab71fd3a7beec79bd58958c41ffdaefb2dc1a322d71436c62ff755e709805118444284b7eadff0fd54fc1b6a06ffdfd6bf23a_1280.jpg",
    "imageWidth": 17717,
    "imageHeight": 4248,
    "imageSize": 13504559,
    "views": 15536,
    "downloads": 15121,
    "collections": 7,
    "likes": 100,
    "comments": 59,
    "user_id": 3764790,
    "user": "ELG21",
    "userImageURL":
        "https://cdn.pixabay.com/user/2022/04/07/18-24-56-559_250x250.jpg"
  },
  {
    "id": 7535359,
    "pageURL":
        "https://pixabay.com/photos/sunset-sea-church-port-people-7535359/",
    "type": "photo",
    "tags": "sunset, sea, church",
    "previewURL":
        "https://cdn.pixabay.com/photo/2022/10/20/17/21/sunset-7535359_150.jpg",
    "previewWidth": 150,
    "previewHeight": 100,
    "webformatURL":
        "https://pixabay.com/get/gacd387481ad112b550caf2b99c7164c506822f517ddb303967df0c6a73fbbe7ba8309db3e8a20950284f52b63190bbe561013610b728f5efad68c38e1b9914c1_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 427,
    "largeImageURL":
        "https://pixabay.com/get/g06735d2f4521d22d301988472edf2a77248951be3d214c55915abfcfa3b3467c1ad9acbab7612bc0c424b508f835e9c5de2d6ac9fdc4a2d0c877ca4d1a4dff87_1280.jpg",
    "imageWidth": 5568,
    "imageHeight": 3712,
    "imageSize": 3584422,
    "views": 13438,
    "downloads": 13108,
    "collections": 3,
    "likes": 97,
    "comments": 50,
    "user_id": 3764790,
    "user": "ELG21",
    "userImageURL":
        "https://cdn.pixabay.com/user/2022/04/07/18-24-56-559_250x250.jpg"
  }
];
