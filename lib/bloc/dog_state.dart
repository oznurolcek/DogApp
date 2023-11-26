import 'package:dog_app/models/dog.dart';

abstract class DogDataState {}

class InitialState extends DogDataState {}

class LoadingState extends DogDataState {}

class LoadedState extends DogDataState {
  final List<Dog> dogList;
  final Map<String, String> dogImageUrls;

  LoadedState(this.dogList, this.dogImageUrls);
}

class FailedState extends DogDataState {
  final String error;

  FailedState(this.error);
}