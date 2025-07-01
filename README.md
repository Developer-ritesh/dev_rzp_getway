# dev_rzp_getway

A Flutter package for seamless integration with the Razorpay payment gateway, featuring automatic order ID generation and advanced configuration options. This package simplifies payment processing by providing easy-to-use methods for creating orders, handling payment events, and customizing the checkout experience.

![dev_rzp_getway](https://github.com/Developer-ritesh/dev_rzp_getway/assets/116947363/551312b1-64be-4eca-b9d6-ca0645c5205b)## Features

- **Automatic Order ID Generation**: Seamlessly create Razorpay order IDs via server-side API calls.
- **Customizable Checkout**: Configure currency, theme color, logos, and external wallets for a tailored payment experience.
- **Multi-Currency Support**: Use the `CurrencyCode` enum to support a wide range of currencies (e.g., INR, USD, EUR).
- **Retry Mechanism**: Enable/disable retry options and set maximum retry attempts for failed payments.
- **External Wallet Support**: Integrate popular wallets like Paytm, PhonePe, and more.
- **Event Handling**: Handle payment success, error, and external wallet selection with callback functions.
- **Secure Integration**: Supports secure API key and secret management for test and live modes.
- **Custom Notes**: Add metadata to orders for better tracking and integration with your backend.

## Installation

Add `dev_rzp_getway` to your `pubspec.yaml`:

```yaml
dependencies:
  dev_rzp_getway: ^latest_version
```

Run the following command in your terminal:

```bash
flutter pub get
```

### Additional Setup

- **Android**: Ensure the minimum API level is 19 or higher in `android/app/build.gradle`. If using ProGuard, add the following rules to `android/app/proguard-rules.pro`:

```proguard
-keepattributes *Annotation*
-dontwarn com.razorpay.**
-keep class com.razorpay.** {*;}
-optimizations !method/inlining/
-keepclasseswithmembers class * {
    public void onPayment*(...);
}
```

- **iOS**: Set the minimum deployment target to iOS 10.0 or higher in `ios/Podfile` and enable bitcode:

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'YES'
    end
  end
end
```

- **Razorpay Account**: Sign up on the Razorpay Dashboard and generate test API keys (Key ID and Secret) in Test Mode. For live mode, complete KYC and generate live keys. Store keys securely using a `.env` file with `flutter_dotenv` for best practices.

## Usage

### Step 1: Import the Package

```dart
import 'package:dev_rzp_getway/dev_rzp_getway.dart';
import 'package:dev_rzp_getway/api/apis.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
```

### Step 2: Initialize and Use the Package

Create an instance of the `Apis` class, provide callback functions for payment events, and call `openCheckout` with the required and optional parameters.

```dart
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:dev_rzp_getway/dev_rzp_getway.dart';
import 'package:dev_rzp_getway/api/apis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DevRzpGetway gateway = Apis(
      onPaymentSuccess: (PaymentSuccessResponse response) {
        print('Payment Success: ${response.paymentId}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment Successful: ${response.paymentId}')),
        );
      },
      onPaymentError: (PaymentFailureResponse response) {
        print('Payment Error: ${response.code} - ${response.message}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment Failed: ${response.message}')),
        );
      },
      onExternalWallet: (ExternalWalletResponse response) {
        print('External Wallet: ${response.walletName}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wallet Selected: ${response.walletName}')),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Gateway Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await gateway.openCheckout(
              name: 'John Doe',
              email: 'john.doe@example.com',
              desc: 'Event Payment',
              phone: '1234567890',
              amount: 100.0,
              key: 'your_api_key', // Replace with your Razorpay Key ID
              secret: 'your_api_secret', // Replace with your Razorpay Secret
              timeout: 300,
              currency: CurrencyCode.usd, // Use CurrencyCode enum
              themeColor: '#FF5722', // Custom theme color
              externalWallets: ['paytm', 'phonepe'], // Supported wallets
              notes: {
                'order_id': 'ORDER123',
                'customer_id': 'CUST001',
              },
              retryEnabled: true,
              retryMaxCount: 3,
              image: 'https://example.com/logo.png', // Custom logo
            );
          },
          child: const Text('Start Payment'),
        ),
      ),
    );
  }
}
```

### Step 3: Handle Payment Events

The `Apis` class requires callback functions to handle payment outcomes:

```dart
final DevRzpGetway gateway = Apis(
  onPaymentSuccess: (PaymentSuccessResponse response) {
    print('Payment Success: ${response.paymentId}');
    print('Order ID: ${response.orderId}');
    print('Signature: ${response.signature}');
  },
  onPaymentError: (PaymentFailureResponse response) {
    print('Payment Error: ${response.code} - ${response.message}');
  },
  onExternalWallet: (ExternalWalletResponse response) {
    print('External Wallet: ${response.walletName}');
  },
);
```

### Step 4: Currency Support

The package uses the `CurrencyCode` enum to support multiple currencies. Example:

```dart
await gateway.openCheckout(
  // ... other parameters
  currency: CurrencyCode.inr, // Indian Rupee
  // or
  currency: CurrencyCode.usd, // United States Dollar
);
```

To retrieve a currency code:

```dart
String code = CurrencyCode.inr.code; // Returns 'INR'
CurrencyCode? currency = CurrencyCode.fromCode('USD'); // Returns CurrencyCode.usd
```

### Step 5: Customizing Checkout

Customize the Razorpay checkout UI and behavior with optional parameters:

- **Theme Color**: Set a hex color code (e.g., `#FF5722`) for the checkout UI.
- **Logo**: Provide a URL or asset path for a custom logo (max 1MB, 256x256px minimum).
- **External Wallets**: Specify supported wallets like `['paytm', 'phonepe']`.
- **Retry Options**: Enable retries with `retryEnabled` and set `retryMaxCount`.
- **Notes**: Add metadata for tracking (e.g., `{'order_id': 'ORDER123'}`).

Example:

```dart
await gateway.openCheckout(
  name: 'Jane Smith',
  email: 'jane.smith@example.com',
  desc: 'Subscription Payment',
  phone: '9876543210',
  amount: 999.0,
  key: 'your_api_key',
  secret: 'your_api_secret',
  timeout: 300,
  currency: CurrencyCode.eur,
  themeColor: '#4CAF50',
  image: 'https://example.com/logo.png',
  externalWallets: ['paytm', 'gpay'],
  notes: {
    'transaction_type': 'subscription',
    'user_id': 'USER002',
  },
  retryEnabled: true,
  retryMaxCount: 3,
);
```

## Example

A complete example is available in the `example` directory of the GitHub repository. It demonstrates initializing the package, opening the checkout, and handling payment events.

## Configuration Tips

- **Secure API Keys**: Store your Razorpay Key ID and Secret in a `.env` file using `flutter_dotenv` to prevent exposing sensitive data. Example:

```yaml
dependencies:
  flutter_dotenv: ^5.1.0
```

```env
RAZORPAY_KEY=your_api_key
RAZORPAY_SECRET=your_api_secret
```

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Load .env file
await dotenv.load(fileName: '.env');
final key = dotenv.env['RAZORPAY_KEY'];
final secret = dotenv.env['RAZORPAY_SECRET'];
```

- **Test Mode**: Use test keys (`rzp_test_`) from the Razorpay Dashboard for development. Switch to live keys after completing KYC for production.
- **Order ID Generation**: The package automatically generates order IDs via the `OrderId.createRazorpayOrder` method, which makes a secure server-side API call.
- **Error Handling**: Check the Razorpay documentation for error codes (e.g., `NETWORK_ERROR`, `PAYMENT_CANCELLED`) to handle specific failure scenarios.

## Troubleshooting

- **Error: "Failed to find entry 'classes.dex'"**: Ensure `multiDexEnabled = true` in `android/app/build.gradle` and update dependencies with `flutter pub get`.
- **Checkout Fails to Open**: Verify that the Razorpay Key ID is correct and starts with `rzp_test_` for test mode. Ensure internet connectivity.
- **Currency Issues**: Confirm the `CurrencyCode` enum is correctly imported and the selected currency is supported by Razorpay.
- **Payment Verification**: For successful payments, verify the signature on your backend using:

```dart
generated_signature = hmac_sha256(order_id + "|" + razorpay_payment_id, secret);
if (generated_signature == razorpay_signature) {
  // Payment is successful
}
```

See Razorpay Documentation for more details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with improvements or bug fixes on the GitHub repository.

## License

Copyright (c) 2024 Developer Ritesh. Licensed under the MIT License.

## Resources

- Razorpay Official Documentation
- Razorpay Flutter SDK

GitHub Repository