import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_search/src/data/data_sources/result.dart';
import 'package:image_search/src/domain/models/photo.dart';
import 'package:image_search/src/domain/use_cases/get_photos_usecase.dart';
import 'package:image_search/src/presentation/home/home_state.dart';
import 'package:image_search/src/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;
  HomeState _state = HomeState(photos: [], isLoading: false);

  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel({required this.getPhotosUseCase});

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> result = await getPhotosUseCase(query);

    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
