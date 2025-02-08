import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  //final Stock stock;
  const DetailScreen({
    super.key,
    //required this.stock
  });

  @override
  Widget build(BuildContext context) {
    final stock = Get.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(stock.companyName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Colors.lightBlueAccent
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stock.symbol,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$${stock.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "Change: ${stock.change.toStringAsFixed(2)} (${stock.percentageChange.toStringAsFixed(2)}%)",
                    style: TextStyle(
                      fontSize: 16,
                      color: stock.change >= 0
                          ? Colors.green.shade700
                          : Colors.redAccent.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  detailCard("1-Day Return",
                      "${stock.oneDayReturn.toStringAsFixed(2)}%"),
                  detailCard("1-Week Return",
                      "${stock.oneWeekReturn.toStringAsFixed(2)}%"),
                  detailCard("1-Month Return",
                      "${stock.oneMonthReturn.toStringAsFixed(2)}%"),
                  detailCard("1-Year Return",
                      "${stock.oneYearReturn.toStringAsFixed(2)}%"),
                  detailCard("Opening Price",
                      "\$${stock.openingPrice.toStringAsFixed(2)}"),
                  detailCard("Previous Close",
                      "\$${stock.previousClose.toStringAsFixed(2)}"),
                  detailCard(
                      "Market Cap", "\$${stock.marketCap.toStringAsFixed(2)}B"),
                  detailCard("ROE", "${stock.roe.toStringAsFixed(2)}%"),
                  detailCard(
                      "Book Value", "\$${stock.bookValue.toStringAsFixed(2)}"),
                  detailCard(
                      "Face Value", "\$${stock.faceValue.toStringAsFixed(2)}"),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed('/checkoutScreen');
                },
                icon: const Icon(Icons.shopping_cart_checkout,
                    color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                label: const Text(
                  "Buy Now",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      shadowColor: Colors.blueGrey.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
