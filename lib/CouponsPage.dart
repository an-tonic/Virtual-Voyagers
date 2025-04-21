import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  final List<String> coupons = <String>[
    'Coupon A',
    'Coupon B',
    'Coupon C',
    'Coupon D',
    'Coupon E',
    'Coupon F',
  ];

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coupons')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: coupons.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50,
                    child: Center(child: Text(coupons[index])),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
