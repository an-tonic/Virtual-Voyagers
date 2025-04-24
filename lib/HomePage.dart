import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:virtual_voyagers/ScavengerHunt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Adventure> currentAdventures = <Adventure>[
    Adventure('Cyprus Christmas Villages', 3, 5, "987 Limassol, Cyprus", "https://maps.app.goo.gl/V2KHK6wAYqjhqzjE6"),
    Adventure('Hand Made Markets Larnaca', 4, 10, "987 Larnaca, Cyprus", "https://maps.app.goo.gl/V2KHK6wAYqjhqzjE6"),
  ];

  final List<Adventure> otherAdventures = <Adventure>[
    Adventure.name('Coffee Shops in Limassol'),
    Adventure.name('The Best Souvlaki'),
    Adventure.name('Bubble Tea in Limassol'),
  ];

  get onPressed => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold))),
      body: SafeArea(
        child: Column(
          children: [
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.deepOrange.shade200,
              child: Container(
                width: 390,
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text(
                    "Hello! Ready for adventure?",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
            SizedBox(height: 5),
            Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.deepOrange.shade200,
                child: Container(
                  width: 390,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  child: Text(
                      "Total points: 5000",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                )
            ),
            SizedBox(height: 16),
            Divider(thickness: 2),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                  "Current Adventures",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  )
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: currentAdventures.length,
                itemBuilder: (BuildContext context, int index) {
                  return AdventureCard(adventure: currentAdventures[index]);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                  "Other Adventures",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  )
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: otherAdventures.length,
                itemBuilder: (BuildContext context, int index) {
                  return AdventureCard(adventure: otherAdventures[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Adventure {
  String name;
  int length = 10;
  int progress = 0;
  String address = "";
  String google_point = "";

  Adventure(this.name, this.progress, this.length, this.address, this.google_point);

  Adventure.name(this.name);

  double percent() {
    return progress / length;
  }
}

class AdventureCard extends StatelessWidget {
  const AdventureCard({super.key, required this.adventure});

  final Adventure adventure;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScavengerHuntPage(adventure: adventure,),
          ),
        );
      },
      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      color: Colors.deepOrange.shade200,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    adventure.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Row(
                  children: [
                    LinearPercentIndicator(
                      width: 140.0,
                      lineHeight: 14.0,
                      percent: adventure.percent(),
                      backgroundColor: Colors.deepOrange.shade300,
                      progressColor: Colors.deepOrange.shade700,
                    ),
                    Text("${adventure.progress}/${adventure.length}"),
                  ],
                ),
              ],
            ),
            IconButton(onPressed: onPressed, icon: Icon(Icons.play_circle, color: Colors.indigo.shade900, size: 30)),
          ],
          ),
        ),
      ),
    );
  }
}
