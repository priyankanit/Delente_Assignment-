import 'dart:convert';

import 'package:flutter/services.dart';

import '../../data/models/stock_model.dart';

class LocalStockService {
  Future<List<Stock>> loadStocksFromJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/stock_data.json');
      final data = json.decode(response);
      final List<dynamic> stockList = data['stocks'];

      return stockList.map((json) => Stock.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load stocks: $e");
    }
  }
}
