import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Adventure> currentAdventures = <Adventure>[
    Adventure('Cyprus Christmas Villages', 3, 5),
    Adventure('Hand Made Markets Larnaca', 4, 10),
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
      appBar: AppBar(title: const Text('Home')),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                "Hello! Ready for adventure?",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                "Total points: 5000",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                "Current Adventures",
                style: Theme.of(context).textTheme.titleMedium,
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
              padding: EdgeInsets.all(16),
              child: Text(
                "Other Adventures",
                style: Theme.of(context).textTheme.titleMedium,
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

  Adventure(this.name, this.progress, this.length);

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
    return Card(
      shape: LinearBorder(),
      elevation: 0,
      color: Colors.white,
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
                      backgroundColor: Theme.of(context).disabledColor,
                      progressColor: Theme.of(context).primaryColor,
                    ),
                    Text("${adventure.progress}/${adventure.length}"),
                  ],
                ),
              ],
            ),
            IconButton(onPressed: onPressed, icon: Icon(Icons.play_circle)),
          ],
        ),
      ),
    );
  }
}
