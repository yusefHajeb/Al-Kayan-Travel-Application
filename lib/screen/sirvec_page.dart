import 'package:flutter/material.dart';

import 'dealetes.dart';

class PageService extends StatefulWidget {
  static const routeName = 'show_servece_index';
  @override
  State<PageService> createState() => _PageService();
}

class _PageService extends State<PageService> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //عند الا
    final int sectionIndex = ModalRoute.of(context)?.settings.arguments as int;
    print(sectionIndex);
    // final selectedMeal =
    // DUMMY_MEALS.firstWhere((meal) => sectionIndex == meal.id);
    return Scaffold(
      body: Column(children: [
        Stack(children: <Widget>[
          Container(
            height: size.height / 3,
            width: double.infinity,

            child: Image.asset(
              DUMMY_MEALS[sectionIndex].imageUrl,
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
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ]),
        // Transform.translate(
        //     offset: Offset(0, -35),
        //     child: Container(
        //       margin: EdgeInsets.symmetric(horizontal: 20),
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //         boxShadow: [
        //           BoxShadow(
        //             offset: Offset(0, 10.0),
        //             blurRadius: 20.0,
        //             color: Color.fromARGB(255, 158, 158, 158),
        //           ),
        //         ],
        //       ),
        //       height: 60,
        //     )),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تاشيرات عمل ",
                style: TextStyle(
                    color: Color.fromARGB(98, 90, 90, 0),
                    fontSize: 15,
                    height: 1.4),
              ),
              SizedBox(height: 40),
              Text(
                "تاشيرات عمل ",
                style: TextStyle(
                    color: Color.fromARGB(98, 90, 90, 0),
                    fontSize: 15,
                    height: 1.4),
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(width: 30, color: Colors.red)),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 0, 26, 112)),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 158, 27, 27)),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 158, 27, 27)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "مزيد من الخدمات",
                style: TextStyle(
                    color: Color.fromARGB(98, 90, 90, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.4),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    AspectRatio(
                      aspectRatio: 3.2 / 1,
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(children: [
                          Container(
                            width: 56,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 237, 180, 38)),
                          )
                        ]),
                      ),
                    ),
                    SizedBox(width: 10),
                    AspectRatio(
                      aspectRatio: 3 / 1,
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.web,
                                size: 50,
                              ),
                              Text("الحج والعمرة"),
                              // Container(
                              //   width: 56,
                              //   padding: EdgeInsets.all(20),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(5),
                              //       color: Color.fromARGB(255, 237, 180, 38)),
                              // ),
                            ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
