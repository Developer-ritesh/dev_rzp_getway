import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class OrderId {
  Future<String?> createRazorpayOrder(
      double amount, String custEmail, String key, String secret) async {
    try {
      log('Generating order');
      Dio dioClient = Dio();

      // Concatenate key and secret with a colon
      String credentials = '$key:$secret';

      // Encode the credentials using Base64
      String encodedCredentials = base64.encode(utf8.encode(credentials));
      log('Encoded credentials: $encodedCredentials');

      // Set the headers
      dioClient.options.headers['Authorization'] = 'Basic $encodedCredentials';
      dioClient.options.headers['Content-Type'] = 'application/json';

      // Prepare the request data
      Map<String, dynamic> data = {
        "amount":
            (amount * 100).toInt(), // Razorpay expects the amount in paise
        "currency": "INR",
        "receipt": "receipt#1",
        "notes": {"key1": "value3", "key2": "value2"}
      };

      log('Request data: ${json.encode(data)}');

      // Make the POST request
      Response response = await dioClient
          .post('https://api.razorpay.com/v1/orders', data: json.encode(data));

      log('Response status: ${response.statusCode}');
      log('Response data: ${response.data}');

      if (response.statusCode == 200) {
        var orderId = response.data['id'];
        log('Order created successfully: $orderId');
        return orderId; // Get the order_id from the response
      } else {
        log('Failed to create order: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error creating order: $e');
      return null;
    }
  }
}
