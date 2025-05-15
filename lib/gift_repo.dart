import 'package:ai_gift_suggest/apiKey.dart';
import 'package:flutter_cohere/flutter_cohere.dart';

class GiftRepo {
  final CohereClient co = CohereClient(apiKey: ApiKey.cohereAiKey);

  Future<String> suggestGift(
      String occasion, double fromBudget, double toBudget) async {
    try {
      final response = await co.generate(
        prompt:
            "no need to explain anything.only give single word answer. only give me the name of product to give as a gift for a {$occasion} within a budget range of ₹{fromBudget} to ₹{toBudget}. The gift should be thoughtful, appropriate for the occasion, and commonly available. (only give me single word answer)",
        maxTokens: 10, // Limits the response to avoid long outputs
        temperature: 0.5, // Controls randomness
      );

      final suggestion = response.values.first.trim();

      return suggestion.isNotEmpty ? suggestion : "No suggestion found.";
    } catch (e) {
      return "Error: Failed to fetch gift suggestion. $e";
    }
  }
}
