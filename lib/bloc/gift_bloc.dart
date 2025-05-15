import 'package:ai_gift_suggest/gift_repo.dart';
import 'package:ai_gift_suggest/groq_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gift_event.dart';
part 'gift_state.dart';

class GiftBloc extends Bloc<GiftEvent, GiftState> {
  final GiftRepo _giftRepo;
  final GroqApiRepo _groqApiRepo;

  GiftBloc({
    GiftRepo? giftRepo,
    GroqApiRepo? groqApiRepo,
  })  : _giftRepo = giftRepo ?? GiftRepo(),
        _groqApiRepo = groqApiRepo ?? GroqApiRepo(),
        super(GiftSuggestionLoadingState()) {
    on<GetGiftEvent>(_handleGetGiftEvent);
  }

  Future<void> _handleGetGiftEvent(
    GetGiftEvent event,
    Emitter<GiftState> emit,
  ) async {
    emit(GiftSuggestionLoadingState());

    try {
      // Input validation
      if (event.fromBudget < 0 || event.toBudget < 0) {
        throw ArgumentError('Budget values cannot be negative');
      }
      if (event.fromBudget > event.toBudget) {
        throw ArgumentError(
            'Minimum budget cannot be greater than maximum budget');
      }
      if (event.occasion.trim().isEmpty) {
        throw ArgumentError('Occasion cannot be empty');
      }

      final suggestion = await _groqApiRepo.suggestGift(
        occasion: event.occasion,
        fromBudget: event.fromBudget,
        toBudget: event.toBudget,
      );

      if (suggestion.trim().isEmpty) {
        throw StateError('Received empty suggestion from API');
      }

      emit(GiftSuggestionLoadedState(suggestion));
    } catch (e) {
      final errorMessage = _formatErrorMessage(e);
      emit(GiftSuggestionErrorState(errorMessage));
    }
  }

  String _formatErrorMessage(dynamic error) {
    if (error is ArgumentError) {
      return 'Invalid input: ${error.message}';
    } else if (error is StateError) {
      return 'Processing error: ${error.message}';
    } else {
      return 'Unexpected error: ${error.toString()}';
    }
  }

  @override
  Future<void> close() {
    // Clean up any resources if needed
    return super.close();
  }
}
