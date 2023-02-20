import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:yah_app/screen/first_screen.dart';
import 'package:yah_app/screen/sirvec_page.dart';
import 'dealetes.dart';
import 'first_screen.dart';

class SrvessScreen extends StatelessWidget {
  static const routeName = 'servece_screen';

  Widget buildSectionTile(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  void showService(BuildContext ctx, int index) {
    Navigator.of(ctx).pushNamed(
      PageService.routeName,
      arguments: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final mealId = ModalRoute.of(context)?.settings.arguments;
    // final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(children: <Widget>[
              Container(
                height: size.height / 4,
                width: double.infinity,
                child: Image.asset(
                  "assest/image/airplane1.jpg",
                  fit: BoxFit.fill,
                ),
                // margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    // color: Color.fromRGBO(255, 189, 0, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/');
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: DUMMY_MEALS.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      showService(ctx, index);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 4,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: DUMMY_MEALS[index].id,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                DUMMY_MEALS[index].imageUrl,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DUMMY_MEALS[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                    DUMMY_MEALS[index].paragraph.split("_")[0] +
                                        "..."),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
