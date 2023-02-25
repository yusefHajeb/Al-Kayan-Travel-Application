import 'package:flutter/material.dart';

import 'package:yah_app/screen/servis/sirvec_page.dart';
import 'package:yah_app/styles/style.dart';
import '../../styles/tolls.dart';
import 'package:yah_app/dataBase/dealetes.dart';

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
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

                decoration: BoxDecoration(
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
              height: MediaQuery.of(context).size.height / 1.3,
              child: ListView.builder(
                itemCount: DUMMY_MEALS.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 7),
                    child: InkWell(
                      onTap: () {
                        showService(ctx, index);
                      },
                      borderRadius: BorderRadius.circular(15),
                      splashColor: primary,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
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
                                  Text(
                                    DUMMY_MEALS[index].title,
                                    style: header2,
                                    textAlign: TextAlign.center,
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