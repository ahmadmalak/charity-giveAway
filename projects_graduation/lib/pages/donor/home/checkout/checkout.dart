import 'dart:io';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final int price;
  final String title;
  const CheckoutScreen({Key? key, required this.price, required this.title}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  /// Build a list of what the user is buying

  @override
  Widget build(BuildContext context) {
    final List<PriceItem> _priceItems = [
      PriceItem(name: widget.title, quantity: 1, totalPriceCents: widget.price * 100),
    ];
    return Scaffold(
      body: CheckoutPage(
        priceItems: _priceItems,
        payToName: 'Payment',
        displayNativePay: true,
        onNativePay: () => print('Native Pay Clicked'),
        isApple: Platform.isIOS,
        onCardPay: (results) => print('Credit card form submitted with results: $results'),
        onBack: () => Navigator.of(context).pop(),
      ),
    );
  }
}
