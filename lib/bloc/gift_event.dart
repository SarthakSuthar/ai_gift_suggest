part of 'gift_bloc.dart';

@immutable
abstract class GiftEvent {}

class GetGiftEvent extends GiftEvent {
  final String occasion;
  final double fromBudget;
  final double toBudget;

  GetGiftEvent({
    required this.occasion,
    required this.fromBudget,
    required this.toBudget,
  });
}
