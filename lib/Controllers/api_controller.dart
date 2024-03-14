import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class QuoteController extends GetxController {
  var quotes = [].obs;

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/quotes?page=1'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      quotes.assignAll(jsonData['results']);
    }
  }

  void likeQuote(int index) {}

  void refreshQuotes() {
    fetchQuotes();
  }
}
