# dev_rzp_getway

A Flutter package for integrating Razorpay payment gateway with automatic order ID generation. This package simplifies the process of making payments using Razorpay by providing easy-to-use methods for creating orders and handling payment events.

## Features

- Automatic order ID generation
- Easy integration with Razorpay
- Handles payment success, error, and external wallet events

## Installation

Add `dev_rzp_getway` to your `pubspec.yaml`:

```yaml
dependencies:
  dev_rzp_getway:
```

Run command in terminal: 
```
flutter pub get dev_rzp_getway
```


## Usage
- Step 1: Import the package
```
import 'package:dev_rzp_getway/dev_rzp_getway.dart';
import 'package:dev_rzp_getway/api/apis.dart';
```

- Step 2: Initialize and use the package
```
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:dev_rzp_getway/dev_rzp_getway.dart';
import 'package:dev_rzp_getway/api/apis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DevRzpGetway gateway = Apis(
      onPaymentSuccess: (response) {
        // Handle payment success
        print('Payment Success: ${response.paymentId}');
      },
      onPaymentError: (response) {
        // Handle payment error
        print('Payment Error: ${response.code} - ${response.message}');
      },
      onExternalWallet: (response) {
        // Handle external wallet
        print('External Wallet: ${response.walletName}');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Gateway Example'),
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
              key: 'your_api_key',
              secret: 'your_api_secret',
            );
          },
          child: Text('Start Payment'),
        ),
      ),
    );
  }
}
```
- Step 3: Handle payment events
You can handle payment success, error, and external wallet events by providing callback functions when initializing the Apis class.
```
final DevRzpGetway gateway = Apis(
  onPaymentSuccess: (response) {
    // Handle payment success
    print('Payment Success: ${response.paymentId}');
  },
  onPaymentError: (response) {
    // Handle payment error
    print('Payment Error: ${response.code} - ${response.message}');
  },
  onExternalWallet: (response) {
    // Handle external wallet
    print('External Wallet: ${response.walletName}');
  },
);
```
## Example
See the complete example in the example directory for a full implementation.


# Contributing
Contributions are welcome! Please open an issue or submit a pull request with any improvements or bug fixes.

# GitHub
For more details, visit the GitHub repository.