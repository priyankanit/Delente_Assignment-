import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  late Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout() {
    var options = {
      'key': '', // Replace with your Razorpay key
      'amount': 5000, // Amount in paise (e.g., 50000 = ₹500)
      'name': '',
      'description': 'Test Payment',
      'prefill': {'contact': 'contact No', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.offNamed('/paymentScreen', arguments: {
      'isSuccess': true,
      'message': 'Payment ID: ${response.paymentId}',
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.offNamed(
      '/paymentScreen',
      arguments: {
        'isSuccess': false,
        'message': response.message ?? 'Payment Failed',
      },
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar('External Wallet', 'Wallet Name: ${response.walletName}');
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}
