import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/constants/text_constants.dart';

class PaymentScreen extends StatelessWidget {
  // final bool isSuccess;
  // final String message;
  const PaymentScreen({
    super.key,
    //required this.isSuccess,
    //required this.message
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final bool isSuccess = args[TextConstants.isSuccess] ?? false;
    final String message = args[TextConstants.message] ?? TextConstants.noMsgProvided;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          isSuccess
              ? TextConstants.paymentSuccess
              : TextConstants.paymentFailed,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: isSuccess ? Colors.green : Colors.red,
              size: 100,
            ),
            const SizedBox(height: 20),
            Text(message, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (isSuccess) {
                  // Navigate to Home Screen on Successful Payment
                  Get.offAllNamed('/homeScreen');
                } else {
                  // Navigate back to Checkout Screen on Payment Failure
                  Get.offAllNamed('/checkoutScreen');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                isSuccess ? TextConstants.backToHome : TextConstants.tryAgain,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
