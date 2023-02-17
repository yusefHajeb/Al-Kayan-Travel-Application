import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:yah_app/screen/first_screen.dart';
import 'package:yah_app/screen/sirvec_page.dart';
import 'dealetes.dart';

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

  // Widget buildContent(Widget child) {
  //   return Container(
  //       padding: EdgeInsets.all(20),
  //       decoration: BoxDecoration(
  //         color: Colors.white10,
  //         borderRadius: BorderRadius.circular(12),
  //         border:
  //             BoxBorder.lerp(Border.all(width: 1.0), Border.all(width: 1.0), 3),
  //       ),
  //       margin: EdgeInsets.all(10),
  //       height: 200,
  //       width: 300,
  //       child: child);
  // }

  @override
  Widget build(BuildContext context) {
    // final mealId = ModalRoute.of(context)?.settings.arguments;
    // final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: DUMMY_MEALS.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: PageService(),
                      settings: RouteSettings(
                        arguments: index,
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
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
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "الحج والعمرة",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text("sdfa sdfsdfa sdfs dfklsdf llkjf l"),
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
      ),
    );
  }
}
