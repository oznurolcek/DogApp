import 'package:dog_app/bloc/dog_event.dart';
import 'package:dog_app/bloc/dog_state.dart';
import 'package:dog_app/service/dog_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class DogDataBloc extends Bloc<DogDataEvent, DogDataState> {
  final DogApiService _dogApiService = DogApiService();

  DogDataBloc() : super(InitialState()) {
    on<FetchDataEvent>(_onFetchDataEvent);
  }

  void _onFetchDataEvent(
      FetchDataEvent event, Emitter<DogDataState> emit) async {
    emit(LoadingState());

    try {
      final dogsData = await _dogApiService.getDogList();
      final dogList = dogsData;

      final dogsImageUrls = <String, String>{};
      final cache = DefaultCacheManager();

      for (final dog in dogList) {
        String url = await _dogApiService.getRandomBreedImage(dog.breed);
        dogsImageUrls[dog.breed] = url;

        try {
          await cache.downloadFile(url);
          // ignore: empty_catches
        } catch (e) {}
      }

      emit(LoadedState(dogList, dogsImageUrls));
    } catch (e) {
      emit(FailedState('Error loading dogs: $e'));
    }
  }
}
