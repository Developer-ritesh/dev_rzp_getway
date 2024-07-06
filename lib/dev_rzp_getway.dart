library dev_rzp_getway;

import 'dart:developer';

import 'package:dev_rzp_getway/api/order_id.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'api/checkout.dart';

/// Dev
abstract class DevRzpGetway {
  late Razorpay _razorpay;
  late Function(PaymentSuccessResponse) onPaymentSuccess;
  late Function(PaymentFailureResponse) onPaymentError;
  late Function(ExternalWalletResponse) onExternalWallet;

  DevRzpGetway({
    required this.onPaymentSuccess,
    required this.onPaymentError,
    required this.onExternalWallet,
  }) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  // Start payment
  Future<void> openCheckout({
    required String name,
    required String email,
    required String desc,
    required String phone,
    required double amount,
    required String key,
    required String secret,
  });

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onPaymentSuccess(response);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    onPaymentError(response);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    onExternalWallet(response);
  }
}
