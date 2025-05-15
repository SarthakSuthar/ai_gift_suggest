import 'package:ai_gift_suggest/apiKey.dart';
import 'package:flutter/material.dart';
import 'package:groq/groq.dart';

/*class GroqApiRepo {
  late final Groq _groq;

  GroqApiRepo({String? customApiKey}) {
    _groq = Groq(
      apiKey: customApiKey ?? ApiKey.groqAiKey,
      model: "gemma-7b-it", // Updated to use a valid model name
    );

    // Initialize custom instructions
    _groq.setCustomInstructionsWith(
        'You are a helpful assistant who always responds in a single word. '
        'Provide a clear, direct gift suggestion within the specified budget.');
  }

  Future<String> suggestGift({
    required String occasion,
    required double fromBudget,
    required double toBudget,
  }) async {
    try {
      if (fromBudget > toBudget) {
        throw ArgumentError(
            'fromBudget must be less than or equal to toBudget');
      }

      if (fromBudget < 0 || toBudget < 0) {
        throw ArgumentError('Budget values cannot be negative');
      }

      final prompt = '''
        Suggest a single-word gift for a $occasion with budget ₹$fromBudget to ₹$toBudget.
        The gift should be:
        - Thoughtful and appropriate
        - Commonly available
        - Within budget
        Respond with only the gift name, no explanation.
      ''';

      final response = await _groq.sendMessage(prompt);

      if (response.choices.isEmpty) {
        throw StateError('No suggestion received from API');
      }

      final suggestion = response.choices.first.message.content.trim();
      debugPrint('Gift suggestion: $suggestion');

      return suggestion;
    } catch (e) {
      debugPrint('Error suggesting gift: $e');
      rethrow;
    }
  }
}
*/

class GroqApiRepo {
  Future suggestGift({
    required String occasion,
    required double fromBudget,
    required double toBudget,
  }) async {
    final groq = Groq(
      apiKey: ApiKey.groqAiKey,
      model: "llama-3.2-3b-preview", // Optional: specify a model
    );

// Start a chat session
    groq.startChat();

    // final prompt = '''
    //     Suggest a single-word gift for a $occasion with budget ₹$fromBudget to ₹$toBudget.
    //     The gift should be:
    //     - Thoughtful and appropriate
    //     - Commonly available
    //     - Within budget
    //     Respond with only the gift name, no explanation.
    //   ''';

    final prompt = '''
        Suggest a single-word gift for a $occasion with budget ₹$fromBudget to ₹$toBudget.
        The gift should be:
        - Within budget
        Respond with only the gift name, no explanation.
      ''';
// Send a message
    GroqResponse response = await groq.sendMessage(prompt);
    print(response.choices.first.message.content);
    return response.choices.first.message.content;
  }
}
