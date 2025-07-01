/// Part of Razorpay Gateway implementation.
part of dev_rzp_getway;

/// A class to handle Razorpay payments with extended options and configurations.
/// 
/// Use this class to open Razorpay Checkout with full control over:
/// - Currency
/// - Theme
/// - Wallets
/// - Retry behavior
/// - Custom branding
/// 
/// Extends [DevRzpGetway] to register callbacks for success, error, and external wallet.
class Apis extends DevRzpGetway {
  /// Constructor for [Apis].
  /// 
  /// Requires [onPaymentSuccess], [onPaymentError], and [onExternalWallet] callbacks.
  Apis({
    required Function(PaymentSuccessResponse) onPaymentSuccess,
    required Function(PaymentFailureResponse) onPaymentError,
    required Function(ExternalWalletResponse) onExternalWallet,
  }) : super(
          onPaymentSuccess: onPaymentSuccess,
          onPaymentError: onPaymentError,
          onExternalWallet: onExternalWallet,
        );

  /// Opens Razorpay checkout with advanced options.
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
  /// - [notes]: Map of additional metadata you want to associate with the order.
  /// - [retryEnabled]: Enable retry in case of payment failure.
  /// - [retryMaxCount]: Maximum number of retry attempts allowed.
  /// - [themeColor]: Color of the Razorpay UI theme (hex format).
  /// - [externalWallets]: List of supported external wallets (e.g., ['paytm', 'phonepe']).
  /// 
  /// #### Example:
  /// ```dart
  /// Apis(
  ///   onPaymentSuccess: handleSuccess,
  ///   onPaymentError: handleError,
  ///   onExternalWallet: handleWallet,
  /// ).openCheckout(
  ///   name: "John Doe",
  ///   email: "john@example.com",
  ///   desc: "Payment for subscription",
  ///   phone: "9876543210",
  ///   amount: 999.0,
  ///   key: "rzp_test_key",
  ///   secret: "secret",
  ///   timeout: 300,
  ///   currency: CurrencyCode.usd,
  ///   themeColor: "#FF5722",
  ///   externalWallets: ["paytm"],
  ///   notes: {
  ///     "order_id": "123ABC",
  ///     "customer_id": "001",
  ///   },
  /// );
  /// ```
  @override
  Future<void> openCheckout({
    required String name,
    required String email,
    required String desc,
    required String phone,
    required double amount,
    required String key,
    required String secret,
    required int timeout,

    // Optional fields
    CurrencyCode currency = CurrencyCode.inr,
    String? image,
    Map<String, String>? notes,
    bool retryEnabled = true,
    int retryMaxCount = 1,
    String? themeColor,
    List<String>? externalWallets,
  }) async {
    final orderId = await OrderId().createRazorpayOrder(amount, email, key, secret);

    final options = {
      'key': key,
      'order_id': orderId,
      'amount': (amount * 100).toInt(), // Convert to subunits like paise
      'currency': currency.code,
      'name': name,
      'description': desc,
      'image': image ?? '',
      'prefill': {
        'contact': phone,
        'email': email,
      },
      'notes': notes ?? {},
      'retry': {
        'enabled': retryEnabled,
        'max_count': retryMaxCount,
      },
      'theme': {
        'color': themeColor ?? '#3399cc',
      },
      'reminder_enable': true,
      'timeout': timeout,
      if (externalWallets != null && externalWallets.isNotEmpty)
        'external': {
          'wallets': externalWallets,
        },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      log('Error initializing Razorpay: $e');
    }
  }
}
