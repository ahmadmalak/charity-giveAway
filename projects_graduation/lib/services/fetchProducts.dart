import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Campaign.dart';

// Fetch our Products from API
Future<List<Campaigns>> fetchProducts() async {
  const String apiUrl = "https://5f210aa9daa42f001666535e.mockapi.io/api/productss";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Campaigns> products = (json.decode(response.body) as List).map((data) => Campaigns.fromJson(data)).toList();
    // Return list of products
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
