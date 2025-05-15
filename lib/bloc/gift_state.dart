part of 'gift_bloc.dart';

@immutable
abstract class GiftState {}

class GiftSuggestionLoadingState extends GiftState {}

class GiftSuggestionLoadedState extends GiftState {
  final String suggestion;

  GiftSuggestionLoadedState(this.suggestion);
}

class GiftSuggestionErrorState extends GiftState {
  final String error;

  GiftSuggestionErrorState(this.error);
}
