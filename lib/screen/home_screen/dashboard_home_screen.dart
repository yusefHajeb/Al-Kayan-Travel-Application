import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yah_app/Widget/dahboard/dashboard_card_animation.dart';
import 'package:yah_app/Widget/dahboard/travel_path.dart';
import 'package:yah_app/dataBase/dashboard_card_data.dart';
import 'package:yah_app/styles/style.dart';

class DashboardHomeScreen extends StatelessWidget {
  const DashboardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(children: [
              SizedBox(
                // height: mediaQuerySize.height / 3,
                child: ClipPath(
                  child: ClipPath(
                      clipper: TravelClipper(),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 40, top: 50, right: 20),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [bBackDark, Color.fromARGB(255, 56, 24, 2)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Image.asset(
                            "assest/image/imageKaian.png",
                            color: primary,
                          ),
                        ),
                      )),
                ),
              ),
              Positioned(
                  right: widthSize / 5,
                  bottom: 10,
                  child: const Text(
                    'الكيان الدولي ',
                    style: header2,
                  )),
            ]),
          ),
          Expanded(
            flex: 2,
            child: AnimationLimiter(
              child: GridView.count(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 60),
                crossAxisCount: 3,
                children: List.generate(
                  DashboardCardData.dashboardData(context).length,
                  (int index) {
                    final cardsData = DashboardCardData.dashboardData(context);
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      columnCount: 2,
                      child: DashboardCardAnimation(
                          index: index,
                          cardsData: cardsData,
                          widthSize: widthSize),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// الرئيسية
// العملاء
// الخدمات
// لوحة تخكم
//  استعلام
//
