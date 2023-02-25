import 'package:flutter/material.dart';
import 'package:yah_app/dataBase/dealetes.dart';
// import 'package:yah_app/Widget/widget_tools/dealetes.dart';
import 'package:yah_app/screen/servis/sirvece_screen.dart';
import 'package:yah_app/screen/kaian__screen.dart';

import '../../Widget/AnimaiWidget/BouncingButton.dart';
// import '../../Widget/widget_tools/dealetes.dart';
import 'package:yah_app/styles/style.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          child: Column(
            children: [
              Stack(children: <Widget>[
                Container(
                  height: size.height / 3.5,
                  width: double.infinity,
                  child: Image.asset(
                    DUMMY_MEALS[sectionIndex].imageUrl,
                    fit: BoxFit.fill,
                  ),
                  // margin: EdgeInsets.all(20),
                  decoration: const BoxDecoration(
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
                      Navigator.popAndPushNamed(
                          context, SrvessScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
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
                )
              ]),

              //=------------------------------------
              Transform.translate(
                offset: Offset(0, -50),
                child: Container(
                  width: size.width / 1.50,
                  padding: EdgeInsets.all(10),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 6),
                          blurRadius: 17,
                          spreadRadius: -6,
                          color: Colors.black,
                        )
                      ]),
                  child: Text(
                    DUMMY_MEALS[sectionIndex].title,
                    textAlign: TextAlign.center,
                    style: header2,
                  ),
                ),
              ),
            ],
          ),
        ),
//-=============================================
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    DUMMY_MEALS[sectionIndex].paragraph,
                    style: paragraph2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "مزيد من الخدمات",
                  style: header,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 80.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Bouncing(
                            onPress: () {},
                            child: (CardBottom(sectionIndex: index)));
                      },
                      itemCount: DUMMY_MEALS.length,
                    )),
              ],
            ),
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
      },
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 10, bottom: 10),
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 6),
                  blurRadius: 3,
                  spreadRadius: -7,
                  color: Colors.black,
                )
              ]),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                width: 60,
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
              style: paragraph,
              //  TextStyle(
              //     color: Color.fromARGB(255, 54, 52, 52), fontSize: 13),
            ),
          ]),
        ),
      ),
    );
  }
}