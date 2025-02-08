import 'package:get/get.dart';

import '../core/services/stock_service.dart';
import '../data/models/stock_model.dart';

class StockController extends GetxController {
  var isLoading = true.obs;
  var stockList = <Stock>[].obs;
  var errorMessage = ''.obs;

  final LocalStockService _stockService = LocalStockService();

  @override
  void onInit() {
    super.onInit();
    fetchStockData();
  }

  void fetchStockData() async {
    try {
      isLoading(true);
      var stocks = await _stockService.loadStocksFromJson();
      stockList.assignAll(stocks);
      errorMessage(''); // clear previous errors
    } catch (e) {
      errorMessage(e.toString());
      print('Fetch Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
