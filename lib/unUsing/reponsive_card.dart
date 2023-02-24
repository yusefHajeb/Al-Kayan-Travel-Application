import 'package:flutter/material.dart';

class ReponsiveCard extends StatelessWidget {
  const ReponsiveCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Color(0xff12239),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "al-Kaian",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            Expanded(
                child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: orientation == Orientation.portrait
                  ? ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return _CardItem(
                            color: Colors
                                .primaries[index % Colors.primaries.length]);
                        // Colors.primaries[index + Colors.primaries.length]);
                      })
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return _CardItem(
                            color: Colors
                                .primaries[index % Colors.primaries.length]);
                        // Colors.primaries[index + Colors.primaries.length]);
                      }),
            )),
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final Color color;
  const _CardItem({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withOpacity(0.3),
                    color,
                  ],
                ),
                borderRadius: BorderRadius.circular(20.8)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("الكيان لخدمات الحج والعمرة",
                      style: TextStyle(color: Colors.white)),
                  Spacer(),
                  Text("HHHHHHHHHHHH"),
                ],
              ),
            )),
      ),
    );
  }
}
