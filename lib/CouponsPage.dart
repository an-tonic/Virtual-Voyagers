import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  final List<Coupon> coupons = <Coupon>[
    Coupon(
      "Free entry to the market",
      "1 free entry for an adult to any market before 1 July 2025",
      1000,
      Icon(Icons.store),
    ),
    Coupon(
      "5% discount",
      "5% discount for 1 purchase at the hand made market",
      1500,
      Icon(Icons.percent),
    ),
    Coupon(
      "1 + 1 for drinks",
      "Buy 1 drink at the cafeteria and get 1 more as a gift",
      2000,
      Icon(Icons.coffee),
    ),
  ];

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coupons')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: coupons.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              coupons[index].title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(coupons[index].description),
            leading: coupons[index].icon,
            trailing: OutlinedButton(
              onPressed: onPressed,
              style: Theme.of(context).outlinedButtonTheme.style,
              child: Text("Redeem"),
            ),
          );
        },
      ),
    );
  }
}

class Coupon {
  String title;

  String description;

  int value;

  Icon icon;

  Coupon(this.title, this.description, this.value, this.icon);
}
