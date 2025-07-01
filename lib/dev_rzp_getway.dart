library dev_rzp_getway;

import 'dart:developer';

import 'package:dev_rzp_getway/api/order_id.dart';
import 'package:dev_rzp_getway/api/src/currency_code.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'api/checkout.dart';

/// Abstract base class for Razorpay payment gateway integration.
///
/// Provides the foundation for initializing Razorpay and handling payment events.
/// Subclasses must implement the [openCheckout] method to start the payment process.
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

  /// Opens Razorpay checkout with advanced configuration options.
  ///
  /// ### Required Parameters:
  /// - [name]: Customer or company name shown in the Razorpay UI.
  /// - [email]: User email for prefill and billing.
  /// - [desc]: Description for the payment/order.
  /// - [phone]: Phone number for prefill.
  /// - [amount]: Amount in major currency unit (e.g., 500.0 for ₹500).
  /// - [key]: Razorpay API key.
  /// - [secret]: Razorpay API secret used for order ID creation.
  /// - [timeout]: Time (in seconds) to auto-close the checkout screen.
  ///
  /// ### Optional Parameters:
  /// - [currency]: Currency to use for payment (default: INR). See [CurrencyCode] enum.
  /// - [image]: URL or asset path of logo/image to display in checkout.
  /// - [notes]: Map of additional metadata to associate with the order.
  /// - [retryEnabled]: Enable retry in case of payment failure.
  /// - [retryMaxCount]: Maximum number of retry attempts allowed.
  /// - [themeColor]: Color of the Razorpay UI theme (hex format).
  /// - [externalWallets]: List of supported external wallets (e.g., ['paytm', 'phonepe']).
  Future<void> openCheckout({
    required String name,
    required String email,
    required String desc,
    required String phone,
    required double amount,
    required String key,
    required String secret,
    required int timeout,
    CurrencyCode currency = CurrencyCode.inr,
    String? image,
    Map<String, String>? notes,
    bool retryEnabled = true,
    int retryMaxCount = 1,
    String? themeColor,
    List<String>? externalWallets,
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