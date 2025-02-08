import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/stock_controller.dart';
import '../../core/utils/constants/text_constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final StockController stockController = Get.put(StockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          TextConstants.homeScreen,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: Obx(() {
        if (stockController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (stockController.errorMessage.isNotEmpty) {
          return Center(child: Text(stockController.errorMessage.value));
        }

        return ListView.builder(
          itemCount: stockController.stockList.length,
          itemBuilder: (context, index) {
            final stock = stockController.stockList[index];
            return Card(
              color: Theme.of(context).colorScheme.primary,
              margin: const EdgeInsets.all(10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  child: Text(
                    stock.symbol,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                ),
                title: Text(stock.companyName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price: \$${stock.price.toStringAsFixed(2)}"),
                    Text("Volume: ${stock.volume.toString()}"),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${stock.change > 0 ? '+' : ''}${stock.change}",
                      style: TextStyle(
                        color: stock.change >= 0
                            ? Colors.green.shade900
                            : Colors.red.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "${stock.percentageChange.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontSize: 12,
                        color: stock.percentageChange >= 0
                            ? Colors.green.shade900
                            : Colors.red.shade800,
                      ),
                    ),
                  ],
                ),
                onTap: () => Get.toNamed(
                  '/detailScreen',
                  arguments: stock,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
