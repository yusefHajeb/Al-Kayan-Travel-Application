import 'package:flutter/material.dart';
import 'package:yah_app/screen/why_kaian.dart';

import 'dealetes.dart';

class PageService extends StatefulWidget {
  static const routeName = 'show_servece_index';
  @override
  State<PageService> createState() => _PageService();
}

@override
void showService(BuildContext ctx, int index) {
  Navigator.of(ctx).pushNamed(
    PageService.routeName,
    arguments: index,
  );
}

class _PageService extends State<PageService> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //عند الا
    final int sectionIndex = ModalRoute.of(context)?.settings.arguments as int;
    print(sectionIndex);

    return Scaffold(
      body: Column(children: [
        Stack(children: <Widget>[
          Expanded(
            flex: 1,
            child: Hero(
              tag: (DUMMY_MEALS[sectionIndex].id),
              child: Container(
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
            ),
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  DUMMY_MEALS[sectionIndex].title,
                  style: TextStyle(
                    color: Color.fromARGB(230, 25, 25, 18),
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  DUMMY_MEALS[sectionIndex].paragraph,
                  style: TextStyle(
                      color: Color.fromARGB(219, 0, 0, 0),
                      fontSize: 22,
                      height: 1.4),
                ),
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
                    color: Color.fromARGB(255, 38, 38, 34),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.4),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 80.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return (CardBottom(sectionIndex: index));
                      // SizedBox(width: 10),
                      // CardBottom(sectionIndex: sectionIndex),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // CardBottom(sectionIndex: 2),
                    },
                    itemCount: DUMMY_MEALS.length,
                  )),
              // scrollDirection: Axis.horizontal,
              // children: [
            ],
          ),
        )
      ]),
    );
  }
}

class CardBottom extends StatelessWidget {
  const CardBottom({
    Key? key,
    required this.sectionIndex,
  }) : super(key: key);

  final int sectionIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showService(context, sectionIndex);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Container(child: PageService()),
        //     settings: RouteSettings(
        //       arguments: sectionIndex,
        //     ),
        //   ),
        // );
      },
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 10),
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                width: 56,
                height: 40,
                // padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 40, 39, 37)),
                child: Image.asset(
                  DUMMY_MEALS[sectionIndex].imageUrl,
                  fit: BoxFit.cover,
                )),
            Text(
              DUMMY_MEALS[sectionIndex].title,
              style: TextStyle(
                  color: Color.fromARGB(255, 54, 52, 52), fontSize: 13),
            ),
          ]),
        ),
      ),
    );
  }
}
