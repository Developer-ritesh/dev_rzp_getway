part of dev_rzp_getway;

class Apis extends DevRzpGetway {
  Apis({
    required Function(PaymentSuccessResponse) onPaymentSuccess,
    required Function(PaymentFailureResponse) onPaymentError,
    required Function(ExternalWalletResponse) onExternalWallet,
  }) : super(
          onPaymentSuccess: onPaymentSuccess,
          onPaymentError: onPaymentError,
          onExternalWallet: onExternalWallet,
        );

  @override
  Future<void> openCheckout({
    required String name,
    required String email,
    required String desc,
    required String phone,
    required double amount,
    required String key,
    required String secret,
  }) async {
    final orderId =
        await OrderId().createRazorpayOrder(amount, email, key, secret);

    var options = {
      'key': key,
      'order_id': orderId,
      'amount': amount * 100,
      'name': name,
      'description': desc,
      'prefill': {
        'contact': phone,
        'email': email,
      },
      'reminder_enable': true,
      'timeout': 60,
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      log('Error initializing Razorpay: $e');
    }
  }
}
