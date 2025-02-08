import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/payment_controller.dart';
import '../../core/utils/constants/text_constants.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          TextConstants.checkout,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => paymentController.openCheckout(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary),
          child: Text(
            TextConstants.pay,
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
