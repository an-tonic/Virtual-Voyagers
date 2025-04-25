import 'package:flutter/material.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  final List<Coupon> coupons = <Coupon>[
    Coupon(
      "20% discount",
      "20% off in your next purchase",
      1000,
      'assets/images/4.png',
    ),
    Coupon(
      "1 + 1 drinks",
      "Buy 1 drink and get 1 more as a gift",
      1500,
      'assets/images/5.jpg',
    ),
    Coupon("Free mcBurger", "Get a free mcBurger", 2000, 'assets/images/6.png'),
    Coupon(
      "10% discount",
      "10% off in your next purchase",
      2000,
      'assets/images/7.jpg',
    ),
  ];

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coupons',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: coupons.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 3,
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text(
                coupons[index].title,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                coupons[index].description,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              leading: Image(
                image: AssetImage(coupons[index].image_path),
                width: 60,
              ),
              trailing: OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black, width: 3),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "Redeem",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
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

  String image_path;

  Coupon(this.title, this.description, this.value, this.image_path);
}
