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
      Icon(Icons.store, color: Colors.indigo.shade900, size: 30),
    ),
    Coupon(
      "5% discount",
      "5% discount for 1 purchase at the hand made market",
      1500,
      Icon(Icons.percent, color: Colors.indigo.shade900, size: 30),
    ),
    Coupon(
      "1 + 1 for drinks",
      "Buy 1 drink at the cafeteria and get 1 more as a gift",
      2000,
      Icon(Icons.coffee, color: Colors.indigo.shade900, size: 30),
    ),
  ];

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coupons', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: coupons.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 3,
              color: Colors.deepOrange.shade200,
              child: ListTile(
                title: Text(
                  coupons[index].title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.indigo.shade900),
                ),
                subtitle: Text(coupons[index].description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                leading: coupons[index].icon,
                trailing: OutlinedButton(
                  onPressed: onPressed,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.indigo.shade900, width: 3),
                    backgroundColor: Colors.deepOrange.shade400,
                  ),
                  child: Text("Redeem", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo.shade900, fontSize: 16)),
                ),
              )
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
