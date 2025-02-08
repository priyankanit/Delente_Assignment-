import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data/models/stock_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'http://jsonblob.com/1336749022408531968';

  Future<List<Stock>> fetchStocks() async {
    try {
      final response = await _dio.get(baseUrl,
          options: Options(
            headers: {
              "Accept": "application/json", // Force API to return JSON
              "Content-Type": "application/json"
            },
            followRedirects: true,
            maxRedirects: 5, // Prevent unwanted redirects
            validateStatus: (status) => status! < 500,
          ));

      final rawData = response.data.toString();

// Regex to extract JSON inside HTML
      final jsonPattern = RegExp(r'(\{.*\})');
      final match = jsonPattern.firstMatch(rawData);

      if (match != null) {
        final jsonData = json.decode(match.group(0)!); // Extracted JSON
        print(jsonData);
      } else {
        throw Exception("No JSON found in response");
      }
      print('Status Code: ${response.statusCode}');
      print('Response Headers: ${response.headers}');
      print('Response Body: ${response.data}');
      print('Redirect Location: ${response.headers['location']}');

      print('Requesting URL: $baseUrl');
      if (response.statusCode == 200) {
        var data = response.data;
        print('API Response: ${response.data}');
        // Check if the response is a Map and contains 'stocks'
        if (data is Map<String, dynamic> && data.containsKey('stocks')) {
          return (data['stocks'] as List)
              .map((json) => Stock.fromJson(json))
              .toList();
        } else {
          throw Exception('Unexpected API response structure');
        }
      } else {
        throw Exception('Failed to load stocks: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load stocks: $e');
    }
  }
  //        var data = response.data['stocks'];
  //        return (data as List).map((json) => Stock.fromJson(json)).toList();

  //     }else{
  //       throw Exception('Failed to load stocks: ${response.statusCode}');
  //     }

  //   } catch (e) {
  //     throw Exception('Failed to load stocks: $e');
  //   }
}
