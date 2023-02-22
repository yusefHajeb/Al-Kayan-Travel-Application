import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:yah_app/screen/first_screen.dart';
import 'package:yah_app/screen/sirvec_page.dart';
import 'package:yah_app/styles/style.dart';
import '../styles/tolls.dart';
import 'dealetes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'first_screen.dart';
// import 'package:yah_app/styles/style.dart';

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
            // Container(
            //   width: double.infinity,
            //   height: 100,
            //   color: Color.fromARGB(255, 44, 33, 13),
            //   child: Text(
            //     "خدماتنا",
            //     style: TextStyle(color: Colors.white, fontSize: 14),
            //   ),
            // ),
            Stack(children: <Widget>[
              Container(
                height: size.height / 4.5,
                width: double.infinity,
                // child: SvgPicture.asset(
                //   "assest/image/WorldMap.svg",
                //   fit: BoxFit.fill,
                // ),
                child: Image.asset(
                  "assest/image/airplane1.jpg",
                  fit: BoxFit.fill,
                ),
                // margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(255, 189, 0, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
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
                height: 30,
                child: Container(
                  child: Text(
                    "خدماتنا",
                    textAlign: TextAlign.center,
                    style: header,
                    //  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
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
              // scrollDirection: Axis.vertical,
              height: MediaQuery.of(context).size.height / 1.3,
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
                                height: size.height / 4,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(DUMMY_MEALS[index].title, style: header2
                                    //  TextStyle(
                                    //   fontSize: 20,
                                    //   fontFamily: 'ReadexPro',
                                    // ),
                                    ),
                                Text(
                                  DUMMY_MEALS[index].paragraph.split("_")[0] +
                                      "...",
                                  style: paragraph,
                                ),
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
